Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVpnC-0004ES-V0
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 19:49:20 +0200
Received: by iwn34 with SMTP id 34so5694216iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YTNyvo8TZnNNZPA6RXOshG5S/ZG+h0T39xMqkOSgzBg=;
	b=OluTASViyag+IGI0zRT5OG+5W/jZmr6wAA1Oh8nSwUYwaMBguhkMhVPXnyxQkYNiCJ
	Qz987dO3G+qRl0PB2wyPtOjv7P+eOU9/XNVRkxCRgtmx3TN5RO4tPeHKrhFwmD6r/R0H
	cKwmigR2+K6ceUgQa7xuFg9NpKXROu4XRzY4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=of6AsZhWspKpm1VkRptcQKX+omgyJ3EAGE452DrC/WqYXyTK0wnDobcsDap0MrKiFI
	Ebgj/rZ+vPQlTG8HuZnUcQb1MDUV3b2uzOJa4G21h4POEOrXUt9Y4AWYLetefq9NSOKU
	J7Mcda7aWFd50RxT+F9koAjUO3RKuvalZC+As=
Received: by 10.42.0.195 with SMTP id 3mr995562icd.83.1278351870269; Mon, 05 
	Jul 2010 10:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Mon, 5 Jul 2010 10:44:10 -0700 (PDT)
In-Reply-To: <4C3137CF.8090503@gmail.com>
References: <4C3137CF.8090503@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Jul 2010 10:44:10 -0700
Message-ID: <AANLkTikDi2Vkkrn1cQQZHVbyjoObG1lv7-qm0M4eDjei@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gpsd_2.94.bb: fix CROSS COMPILE badness
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
X-List-Received-Date: Mon, 05 Jul 2010 17:49:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 6:39 PM, Graham Gower <graham.gower@gmail.com> wrote=
:
> configure.ac shouldn't check the host system for includes/libraries,
> disable checking for libusb.

while disabling is ok better would be to make this test
run in cross environment as they are trying to find out
which libusb is installed may be use libusb-config ?



>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0.../gpsd/files/2.94-remove-libusb-badness.patch =A0 =A0| =A0 32 ++++++=
++++++++++++++
> =A0recipes/gpsd/gpsd_2.94.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A05 ++-
> =A02 files changed, 35 insertions(+), 2 deletions(-)
> =A0create mode 100644 recipes/gpsd/files/2.94-remove-libusb-badness.patch
>
> diff --git a/recipes/gpsd/files/2.94-remove-libusb-badness.patch b/recipe=
s/gpsd/files/2.94-remove-libusb-badness.patch
> new file mode 100644
> index 0000000..1517ede
> --- /dev/null
> +++ b/recipes/gpsd/files/2.94-remove-libusb-badness.patch
> @@ -0,0 +1,32 @@
> +--- gpsd-2.94/configure.ac.orig =A0 =A0 =A0 =A02010-07-05 11:01:08.00000=
0000 +0930
> ++++ gpsd-2.94/configure.ac =A0 =A0 2010-07-05 11:01:44.000000000 +0930
> +@@ -243,18 +243,18 @@
> + # /usr/include/libusb-*/libusb.h
> + #
> + AC_MSG_CHECKING([for libusb version >=3D 1.0.0])
> +-if test -f /usr/include/libusb-*/libusb.h ;
> +-then
> +- =A0 =A0usb=3D$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^l=
ib//)
> +- =A0 =A0AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
> +- =A0 =A0LIBUSB=3D-l${usb}
> +- =A0 =A0INCUSB=3D-I/usr/include/lib${usb}
> +- =A0 =A0ac_libusb=3Dyes
> +- =A0 =A0AC_MSG_RESULT([found.])
> +-else
> +- =A0 =A0ac_libusb=3Dyes
> ++#if test -f /usr/include/libusb-*/libusb.h ;
> ++#then
> ++# =A0 =A0usb=3D$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^=
lib//)
> ++# =A0 =A0AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
> ++# =A0 =A0LIBUSB=3D-l${usb}
> ++# =A0 =A0INCUSB=3D-I/usr/include/lib${usb}
> ++# =A0 =A0ac_libusb=3Dyes
> ++# =A0 =A0AC_MSG_RESULT([found.])
> ++#else
> ++ =A0 =A0ac_libusb=3Dno
> + =A0 =A0 AC_MSG_RESULT([not found.])
> +-fi
> ++#fi
> + AC_SUBST(LIBUSB)
> + AC_SUBST(INCUSB)
> +
> diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
> index 5cf8b2e..2d63b32 100644
> --- a/recipes/gpsd/gpsd_2.94.bb
> +++ b/recipes/gpsd/gpsd_2.94.bb
> @@ -1,9 +1,10 @@
> =A0require gpsd.inc
>
> -SRC_URI +=3D "file://libtool.patch"
> +SRC_URI +=3D "file://libtool.patch \
> + =A0 =A0 =A0 =A0 =A0 file://2.94-remove-libusb-badness.patch"
> =A0SRC_URI[gpsd.md5sum] =3D "ce70bcd707ac1df861d4c72f503c09d1"
> =A0SRC_URI[gpsd.sha256sum] =3D "1520b87d106d198aa42137db4b230615dbd0d06b0=
4e6fcc84e010172fba2da41"
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =A0PARALLEL_MAKE =3D ""
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


