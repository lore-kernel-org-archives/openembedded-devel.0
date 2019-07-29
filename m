Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7807F291
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 14:40:59 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id v22so44293750qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DT6vThhioLuZ8WZRx3bGwyIES1mq8rsTmzlpnNV3COg=;
	b=EwXSJB62wo9yEZfx3f4PT9u1bCRCmkTjtfZLaqUo7v0krQyK7Kk3RnpiP8d8IW6fDX
	CLYXPwdxEYKGKeSW13RghY1aS1xtIAbp2W6j1oy728LFKJV9JdixTRc7HXuxUeRhlXMN
	UTaaPv6eQMSV8RVvhlInkpyhK+w5Bdrf5jDNM375Vw7YtHJZvlsGuOUD/joIYcNe62EJ
	QmT43AazaM17LG/IReEXO3zd5VAYWOG+LXTkWEjZShrD9MJ5fr2yLZdxLxxKNjpN2K0W
	DBE47OgqGJBs057Ax4iX+iBST7EGGfVtXufFokTojh3PkHlmO7EN2gezAZJ+JOd1WIB3
	z1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DT6vThhioLuZ8WZRx3bGwyIES1mq8rsTmzlpnNV3COg=;
	b=iDJlWn44QS+0MDVMHh982IpeXO6HUG96E9PtmRdM7nx+vb4nvzaeQ5Ir0pn6tBghFd
	j8l2XAb93sQi6vE/6RGm4m8cxqzlb/ncsJRqllYr7tbmOkAHHN+toGRrHeKavuJYILs0
	oyl/P79IKZgwTPu44ITNw6j9+lEL/NlKkFEjDA8pfwtJFwvG8udE/i4WGJUqH37HGX1u
	cniz7GzkkIAC6pzgMlyNMynMxMObXvIByP2ledqtFpfqmHlTk//epZ7YtOiA3Ox9vi/r
	27EY1h8q8cLpZ+iKz7vHxZyOFFQAikeZ50hZhK5mL6PH6/7o3/06lhNr65AbjBwG9jOo
	5rnA==
X-Gm-Message-State: APjAAAXHB1BK9XHdeTjl48YENp9s3NUxd/hf+q0fRF6mlUJX6Zyc68Ll
	uVp/KlF89HY1WgbEQFiP+e1L4nrx14IAOfXo1S4moJ3ZEsc=
X-Google-Smtp-Source: APXvYqwYmYG7m+R2x/uep86O43BY4vFwHG1ES0vi+fXNy5zfgxFgGr6rpwurs9nm5Y+JM9Xkmx62OPFKEzybZgfAKBA=
X-Received: by 2002:a37:c81:: with SMTP id 123mr75481574qkm.474.1564411259751; 
	Mon, 29 Jul 2019 07:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190729080432.20866-1-ayoub.zaki@embexus.com>
	<CAMKF1sqUeboVgvtsuo5GR+VrvtPfO_Z9xS2cSzkgYT813LbG2g@mail.gmail.com>
In-Reply-To: <CAMKF1sqUeboVgvtsuo5GR+VrvtPfO_Z9xS2cSzkgYT813LbG2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2019 07:40:43 -0700
Message-ID: <CAMKF1so-GUvD7pJ9Btq3Pge1Eoe6EaLvFEEz5DL4D0vQfM+SHg@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Jul 2019 14:40:59 -0000
Content-Type: text/plain; charset="UTF-8"

there are build failures still

https://errors.yoctoproject.org/Errors/Details/255457/

On Mon, Jul 29, 2019 at 7:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jul 29, 2019 at 1:04 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
> >
> > Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> > by implementing basic whitelisting and blacklisting capabilities based on device attributes.
> > ---
> >  ...kgconfig-instead-of-libgcrypt-config.patch | 25 +++++++++++++
> >  .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
> >  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> >
> > diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
> > new file mode 100644
> > index 000000000..022320b40
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Use-pkgconfig-instead-of-libgcrypt-config.patch
> > @@ -0,0 +1,25 @@
> > +From 85a3c46fa0bcf05d824b86b7e5412ec65924e86a Mon Sep 17 00:00:00 2001
> > +From: Ayoub Zaki <ayoub.zaki@embexus.com>
> > +Date: Mon, 29 Jul 2019 09:46:56 +0200
> > +Subject: [PATCH 1/1] Use pkgconfig instead of libgcrypt-config
> > +
> > +---
> > + m4/libgcrypt.m4 | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
> > +index 6cf482f..d674eae 100644
> > +--- a/m4/libgcrypt.m4
> > ++++ b/m4/libgcrypt.m4
> > +@@ -28,7 +28,7 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> > +      libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
> > +   if test x$libgcrypt_config_prefix != x ; then
> > +      if test x${LIBGCRYPT_CONFIG+set} != xset ; then
> > +-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
> > ++        LIBGCRYPT_CONFIG=$(shell pkg-config libgcrypt)
> > +      fi
> > +   fi
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> > new file mode 100644
> > index 000000000..75ab62c3a
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> > @@ -0,0 +1,37 @@
> > +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> > +HOMEPAGE="https://github.com/dkopecek/usbguard"
> > +LICENSE="GPLv2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> > +
> > +SRCREV = "0ab32d7fa092067030fcbef530968b5cc237b08c"
> > +SRC_URI = "git://git@github.com/USBGuard/usbguard.git;protocol=https;branch=master \
> > +           file://0001-Use-pkgconfig-instead-of-libgcrypt-config.patch \
> > +          "
> > +
> > +inherit autotools pkgconfig systemd bash-completion
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> > +       dbus dbus-glib libqb libcap-ng libgcrypt libsodium protobuf pegtl"
> > +
>
> make it +=
>
> > +EXTRA_OECONF += "--with-bundled-catch"
> > +
>
> we do have catch package recipe, have you considered using that
>
> > +PACKAGECONFIG ??= "libsodium \
> > +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > +       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
> > +
> > +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
> > +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
> > +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
> > +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
> > +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
> > +
>
> I think the dependencies added unconditionally above should be added
> via packageconfigs.
>
> > +SYSTEMD_SERVICE_${PN} = "${PN}.service"
> > +SYSTEMD_PACKAGES += "${PN}"
>
> Using PN on right hand side will fail for multilib builds. May be use BPN
>
> > +
> > +do_install_append(){
> > +
> > +       sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
> > +                                               ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
> > +}
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

