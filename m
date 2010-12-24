Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVzpX-0000j4-Pw
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 06:04:39 +0100
Received: by gxk20 with SMTP id 20so3284101gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 21:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=So72m0fHo4XzEphu8DJCn4RmgV+kh/vLEniaONpdggI=;
	b=nFD8e3tTsItCfn/uEJ2CWTqjeoF63Yb6kiN2soYpnvUa7ZzqFyMfUXpE04E2j01skZ
	zu9R/P9sccldVlc5H0pgCReGI8GDHZRK8YC7nmnuSwlcourUWaMKrtc7ytzyWqrAvdsL
	YYLIP46UTXuU9o80aJDhDVjVkzT66HjhCui0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LKlccPUNYJ0ZqU0/h8AzM2ZleqX27TjNi7h9Ekn/2rtlXHF0Yc5cybK/+/TJe2YFis
	ljUKiv2FqnHHZ2EhSuP3TZ6CeyGw6VRuuhlqjL8bZSHOp04oD8+UR1ztiuqT+ed2afrs
	o0rpaXUQvDFFXb+9sFvAXJNuyOZvi+V1+vMr4=
Received: by 10.90.120.17 with SMTP id s17mr344750agc.193.1293167069436; Thu,
	23 Dec 2010 21:04:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 23 Dec 2010 21:04:09 -0800 (PST)
In-Reply-To: <4D13F3B4.2050104@gmail.com>
References: <4D13F3B4.2050104@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2010 21:04:09 -0800
Message-ID: <AANLkTinc5x29hTUzP2Nzt5eNHU6HOQz+-+ukRdyd+y3p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ublibc.inc, micro-uclibc.conf: Avoid gettext in uclibc systems.
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
X-List-Received-Date: Fri, 24 Dec 2010 05:04:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2010 at 5:13 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Looks ok
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/distro/include/uclibc.inc | =C2=A0 =C2=A02 +-
> =C2=A0conf/distro/micro-uclibc.conf =C2=A0| =C2=A0 =C2=A02 ++
> =C2=A02 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.=
inc
> index dd00647..200fac2 100644
> --- a/conf/distro/include/uclibc.inc
> +++ b/conf/distro/include/uclibc.inc
> @@ -3,7 +3,7 @@ OVERRIDES =3D. "libc-uclibc:"
>
> =C2=A0# The things uclibc can provide. =C2=A0We default to wanting uclibc=
 to provide them.
> =C2=A0PREFERRED_PROVIDER_virtual/libiconv ?=3D "libiconv"
> -PREFERRED_PROVIDER_virtual/libintl ?=3D "gettext"
> +PREFERRED_PROVIDER_virtual/libintl ?=3D "proxy-libintl"
> =C2=A0#fix some iconv issues, needs to be adjusted when doing uclibc buil=
ds
> =C2=A0PREFERRED_PROVIDER_virtual/libintl_avr32 =3D "proxy-libintl"
> =C2=A0PREFERRED_PROVIDER_virtual/libc =3D "uclibc"
> diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.con=
f
> index fb1887c..85ea9b3 100644
> --- a/conf/distro/micro-uclibc.conf
> +++ b/conf/distro/micro-uclibc.conf
> @@ -24,3 +24,5 @@ require conf/distro/micro.conf
> =C2=A0# Use overrides for micro as well
> =C2=A0OVERRIDES .=3D ":micro"
>
> +# Don't let glib-2.0 pull in gettext
> +USE_NLS_glib-2.0 =3D "no"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


