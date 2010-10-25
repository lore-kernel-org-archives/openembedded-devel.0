Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAIBk-0007NN-UU
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:13:56 +0200
Received: by yxe42 with SMTP id 42so1956698yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=28KBjEsMqg8kCnyn7jUp8l1lzkm/xOnDvfdufDWin3Y=;
	b=v+WoaRSb8LNpc6ESmfNTc6q8qMNR2XIKm4+CdxrKFkkCCvvnk5XOF5PFSHx9Pbgqti
	PvOJ4M/lC3nElUFvXJriFiMLYTUEF1s9JBqY6TWKXTODyQtWNjHDHLVN9qNELWgsLyQS
	tsPyYBjzYk1IOTk94E4vzDP7PFHqjhCsrGXo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=sFlAEleh5EXx9ypJ3Y7Lrq0CR7VWQLktPbspQSc3eViXFOdBNZ8sR6IJ66PIGtBxku
	QLxobFXyXXEF9ulpPmJk9J9rqBlA3ggU9QrFF6K8qmsgNpygeAtxNtSTfgZUKRNiytWP
	b+8AzvUbP8gZZT8TMrAy8wSqNLKvSE0CAvvhQ=
Received: by 10.42.23.84 with SMTP id r20mr962015icb.487.1287994372225; Mon,
	25 Oct 2010 01:12:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 01:12:31 -0700 (PDT)
In-Reply-To: <1287991236-22304-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287991236-22304-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 01:12:31 -0700
Message-ID: <AANLkTimZYpUS20619dpEAr=No2eoLniQMGonifTohE3R@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev_15*: fix FILES_libudev
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
X-List-Received-Date: Mon, 25 Oct 2010 08:13:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2010 at 12:20 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> * udev is built with --with-libdir-name=3D and there is /lib/libudev.*, b=
ut
> =C2=A0FILES point aonly to {libdir} add
> * all recipes which now RDEPENDS on whole udev package should be PR bumpe=
d to pick libudev only
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/udev/udev_151.bb | =C2=A0 =C2=A04 ++--
> =C2=A0recipes/udev/udev_154.bb | =C2=A0 =C2=A04 ++--
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
> index fc33592..554f86b 100644
> --- a/recipes/udev/udev_151.bb
> +++ b/recipes/udev/udev_151.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "udev is a daemon which dynamically creat=
es and removes device nod
> =C2=A0the hotplug package and requires a kernel not older than 2.6.12."
> =C2=A0LICENSE =3D "GPLv2+"
>
> -PR =3D "r18"
> +PR =3D "r19"
>
> =C2=A0# Untested
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> @@ -61,7 +61,7 @@ INITSCRIPT_PARAMS =3D "start 03 S ."
>
> =C2=A0PACKAGES =3D+ "libudev libgudev udev-utils"
>
> -FILES_libudev =3D "${libdir}/libudev.so.*"
> +FILES_libudev =3D "${libdir}/libudev.so.* ${base_libdir}/libudev.so.*"
> =C2=A0FILES_libgudev =3D "${libdir}/libgudev*.so.*"
>
> =C2=A0FILES_udev-utils =3D "${bindir}/udevinfo ${bindir}/udevtest ${base_=
sbindir}/udevadm"
> diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
> index 9c76184..d7740a6 100644
> --- a/recipes/udev/udev_154.bb
> +++ b/recipes/udev/udev_154.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "udev is a daemon which dynamically creat=
es and removes device nod
> =C2=A0the hotplug package and requires a kernel not older than 2.6.12."
> =C2=A0LICENSE =3D "GPLv2+"
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> =C2=A0# Untested
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> @@ -62,7 +62,7 @@ INITSCRIPT_PARAMS =3D "start 03 S ."
>
> =C2=A0PACKAGES =3D+ "libudev libgudev udev-utils"
>
> -FILES_libudev =3D "${libdir}/libudev.so.*"
> +FILES_libudev =3D "${libdir}/libudev.so.* ${base_libdir}/libudev.so.*"
> =C2=A0FILES_libgudev =3D "${libdir}/libgudev*.so.*"
>
> =C2=A0FILES_udev-utils =3D "${bindir}/udevinfo ${bindir}/udevtest ${base_=
sbindir}/udevadm"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


