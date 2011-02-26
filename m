Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PtOYw-0007eD-Lu
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 19:08:14 +0100
Received: by fxm8 with SMTP id 8so2493667fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Liq8f9nnNkra4O6U1VqpWDbeBPoP5NE/zglD3ooVF+g=;
	b=FEcpAD3CLv+GiuvIGuiKqVXyx8qT0eDZ+X/+xsg1hO33vuEh4InU8944oDgupIA091
	8qzVxSlQcumAeILmnIG+pAS8oJUQDhC/gcKKqaN/ROxhxtPxGIwWGmiOYYhf6Sdfg1C7
	dqUlGrlBRIfA47HVkkbqdan62aHHKdXDz8s2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YR18nDA+0uOKMtIDV//CbbGdLk2k99KnQgJmieMyEMIcPQZNeiNRsv5y7zO8wLGYut
	XFix+dq2YIBG6RIwGPw9ZH7uRybUIUicUYiLzy3+RCIL4ftsAKm/tzVnRnhRNLNT4roa
	XX3c1Ds3/iA7++jB94p6vwgS5h3iOEk18Nxa4=
Received: by 10.223.95.199 with SMTP id e7mr4276168fan.39.1298743611243; Sat,
	26 Feb 2011 10:06:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Sat, 26 Feb 2011 10:06:31 -0800 (PST)
In-Reply-To: <1298742255-23389-1-git-send-email-ynezz@true.cz>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2011 10:06:31 -0800
Message-ID: <AANLkTimdkiR3Kf_1980OZ5tn9SfDVCnz0=tzkQvpwxw8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Feb 2011 18:08:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 26, 2011 at 9:44 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>


looks good although I dont know if enabling this is intended as micro
should be small

> ---
> =C2=A0conf/distro/micro-uclibc.conf | =C2=A0 =C2=A01 +
> =C2=A0conf/distro/micro.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 =
+-
> =C2=A02 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.con=
f
> index 85ea9b3..55b4ebd 100644
> --- a/conf/distro/micro-uclibc.conf
> +++ b/conf/distro/micro-uclibc.conf
> @@ -12,6 +12,7 @@
> =C2=A0###################################################################=
##########
>
> =C2=A0DISTRO_NAME =3D "micro-uclibc"
> +DISTRO_FEATURES =3D "xattr"
>
> =C2=A0###################################################################=
##########
> =C2=A0# TOOLCHAIN
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index b1f8f1e..bb417b1 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -19,7 +19,7 @@ DISTRO_VERSION =3D "${SRCDATE}"
> =C2=A0# DISTRO FEATURE SELECTION
> =C2=A0###################################################################=
##########
> =C2=A0# No features selected
> -DISTRO_FEATURES =3D "eabi"
> +DISTRO_FEATURES +=3D "eabi"
>
> =C2=A0###################################################################=
##########
> =C2=A0# LIBRARY NAMES
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


