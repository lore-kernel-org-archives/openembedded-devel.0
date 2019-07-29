Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD12B7C5FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 14:14:32 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l9so59748983qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+JQGKi3Tcfe6KttPLO2HS22U+x37h72dZ/AW2y6LvKs=;
	b=ksBBtqjwTPJRT0gQAEQ832HRkmauLgkl7o7ddBhTq44zvp1JzPOLuOPtWcuY+WTLT1
	s+2kBdmOGpc1A/VUylJ6Qi4EaOU+SLnLNQznwpGBxbSCkntQS7AG/IB1PjyRmLPwOwPA
	WoT0V4Wms2V8Fcf0vA0ejP+HTpCmPO2fHnir5OHUDU5g3SeJuoM1AmERmNkkd3GJ9gcv
	46XtWKIUzZ2KPVeed1p9Ysn6xMJcbSmNBkDTB+3K5n9ZxTRT0X91+IsKzBaZPGpFXtzY
	ybE2K+VzA/cBWK5wYV0a3gZUsEXOSeS1O3OB+uYUUIDa3MUSKxHD0SmrRuoWkSsTjLBM
	7FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+JQGKi3Tcfe6KttPLO2HS22U+x37h72dZ/AW2y6LvKs=;
	b=CTOBefBdIJW/swrda5WjfOaXzWW5fTsvp0oknB+XJ3rdcpsYPIDhvUbQlC9MxeC6wo
	mjEMFVKhIYAL50jqQlLmc9EkRAdp4w6l9FbR31/uw9YhpCkooh3JJFgoDkPYjNr5fdiH
	yec/NgOBe0+sVUOs6/owQPX4/xsPqvaQB7p47zMk3u4qswYfjwwgCKnBMTf+Xkn6k9iX
	Xa6IJwgoFNXaTMrW9Pj/YxnBXCblMO368qT4TDWuv+vyX1JX7zclZVtHFurNVIX7iM6/
	Cocz0R8h1H+8XeT3vWqN+P6++nmS9RtYT8FUAiVZ3U0SwKl51LR4n92I1LbzzlnwuDbr
	I+BQ==
X-Gm-Message-State: APjAAAXwRRxBqHb89inCztskGfIo4Y3QkIWDxb/bfB6ZlPKxrPdRyfAs
	wczTQGkmK3ZIzwR9uR+MtrUcgby5ASjIxylkGXWReD4J
X-Google-Smtp-Source: APXvYqy2zY2Sp1f2b9eNWqql+/6tpZ0rysY89oAdm3hhE6SCCM5X3XjHPz5YUoXH9ZEVzrmhIcBmfdNp045c5FBO0b4=
X-Received: by 2002:aed:3644:: with SMTP id e62mr75730606qtb.80.1564409673393; 
	Mon, 29 Jul 2019 07:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190729080432.20866-1-ayoub.zaki@embexus.com>
In-Reply-To: <20190729080432.20866-1-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2019 07:14:17 -0700
Message-ID: <CAMKF1sqUeboVgvtsuo5GR+VrvtPfO_Z9xS2cSzkgYT813LbG2g@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] usbguard: Initial recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jul 2019 14:14:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 29, 2019 at 1:04 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
> ---
>  ...kgconfig-instead-of-libgcrypt-config.patch | 25 +++++++++++++
>  .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
> new file mode 100644
> index 000000000..022320b40
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
> @@ -0,0 +1,25 @@
> +From 85a3c46fa0bcf05d824b86b7e5412ec65924e86a Mon Sep 17 00:00:00 2001
> +From: Ayoub Zaki <ayoub.zaki@embexus.com>
> +Date: Mon, 29 Jul 2019 09:46:56 +0200
> +Subject: [PATCH 1/1] Use pkgconfig instead of libgcrypt-config
> +
> +---
> + m4/libgcrypt.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
> +index 6cf482f..d674eae 100644
> +--- a/m4/libgcrypt.m4
> ++++ b/m4/libgcrypt.m4
> +@@ -28,7 +28,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> +      libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
> +   if test x$libgcrypt_config_prefix != x ; then
> +      if test x${LIBGCRYPT_CONFIG+set} != xset ; then
> +-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
> ++        LIBGCRYPT_CONFIG=$(shell pkg-config libgcrypt)
> +      fi
> +   fi
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> new file mode 100644
> index 000000000..75ab62c3a
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> +HOMEPAGE="https://github.com/dkopecek/usbguard"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +
> +SRCREV = "0ab32d7fa092067030fcbef530968b5cc237b08c"
> +SRC_URI = "git://git@github.com/USBGuard/usbguard.git;protocol=https;branch=master \
> +           file://0001-Use-pkgconfig-instead-of-libgcrypt-config.patch \
> +          "
> +
> +inherit autotools pkgconfig systemd bash-completion
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> +       dbus dbus-glib libqb libcap-ng libgcrypt libsodium protobuf pegtl"
> +

make it +=

> +EXTRA_OECONF += "--with-bundled-catch"
> +

we do have catch package recipe, have you considered using that

> +PACKAGECONFIG ??= "libsodium \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
> +
> +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
> +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
> +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
> +

I think the dependencies added unconditionally above should be added
via packageconfigs.

> +SYSTEMD_SERVICE_${PN} = "${PN}.service"
> +SYSTEMD_PACKAGES += "${PN}"

Using PN on right hand side will fail for multilib builds. May be use BPN

> +
> +do_install_append(){
> +
> +       sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
> +                                               ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

