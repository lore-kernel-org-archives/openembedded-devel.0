Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PeyF3-0002xz-A1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 00:12:05 +0100
Received: by yxd5 with SMTP id 5so2168292yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 15:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=snSTzU94ywbH0v2PHdobP+VtfnQpM45bLlEauoFqOl0=;
	b=fxsvL3ZkK9MC2HXfLDR2RVVnIxdaS1Zttd/JDMq+IfZd5Z/LAymH/Y96vC8RUJHlLy
	l3VUuIswOcDJRDkkpJL14ITxn/xehh1ExCO0RpwmT6Ves1d71TldCmAotvszz8cT6oTN
	s+A/xZk22p00rydfH+uZ++5aGpz0oTGXMtLts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=RnLD4g3NFBUgMD7tAVeQtmJv2Ozui3wtkZMjJk9Z5XRkgCfES1JSlcJv9cGo9jTI2i
	jP7wkAAnwWZL87yIuh2GHvP3+Y12STBeOXbhCDiK6y+ttfB/PGXM1qai0wb9B9xz5F/M
	1mxFJ+L6Jrgo6LQbANrdcNagyTFUZsDpIy5no=
Received: by 10.90.10.21 with SMTP id 21mr5267004agj.112.1295305886943; Mon,
	17 Jan 2011 15:11:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Mon, 17 Jan 2011 15:11:05 -0800 (PST)
In-Reply-To: <1295295157-20506-1-git-send-email-eric@eukrea.com>
References: <1295295157-20506-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jan 2011 15:11:05 -0800
Message-ID: <AANLkTikPh8nGerX3-om_qADKb2YbRar6EBw6q-4pGyhn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox-1.18.2: add fix
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
X-List-Received-Date: Mon, 17 Jan 2011 23:12:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2011 at 12:12 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> - insmod: check for module read errors
> bb's commit id : 094cc51e50bdb877fa4c245dbde47e4dfbf94387
>
> - following Bernhard Reutner-Fisher's request, busybox patches
> don't have anymore timestamp inside which should make them fetchable
> instead of integrating them in OE so I try this way.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox_1.18.2.bb | =C2=A0 =C2=A09 +++++++--
> =C2=A01 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_=
1.18.2.bb
> index ca36a52..71b50c8 100644
> --- a/recipes/busybox/busybox_1.18.2.bb
> +++ b/recipes/busybox/busybox_1.18.2.bb
> @@ -1,6 +1,11 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 http://busybox.net/downloads/fixes-1.18.2/busybox-=
1.18.2-modprobe-small.patch;name=3Dpatch01 \
> + =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0SRC_URI[md5sum] =3D "69a82091e5710b72db5ce0e14e7c0cd7"
> =C2=A0SRC_URI[sha256sum] =3D "aa7e1cec8cd9c7f4e56098b9e4bb2ab5d593d5a35f7=
66ad9e6a312289bf57080"
> -
> +SRC_URI[patch01.md5sum] =3D "dda72eaf33d19d6a0ac78e46e9411cfd"
> +SRC_URI[patch01.sha256sum] =3D "ed5d83040414d035138bf484ccd514817342b143=
baff43ffff6ba556952de7ed"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


