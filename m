Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A36D2C56C
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:48:06 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.11933.1729766884335580834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoFcAWUT;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so6856851fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766882; x=1730371682; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL4uzzO41dUypGldV6A4W2/myw6UQy2JesYfebFGJEE=;
        b=CoFcAWUTUybJnCbAs8nRw9oP90PqlwRgzf8HzUcgIdWjru7EejRrOFG0jFCQPXLKc3
         zGUbHdqDsNRb9LipPdKCOL7qUi+mfhNd4WQ2LYkt2RWHqeP53HV4av0I5lemQtW/T/7B
         uC4/6fb5jdPXH/JNGxvbj8Vlbyp7+VTMRYTzFy/pKTo9TSsHfOymSHuZvfwmj4kcF4Sy
         Mt8WHihUmfcFkf4cwjG05HdeWrZnDvz0aebePctAC5EIt6BLkGv+iWPdhD2fFmyWXh6c
         /0Z50eoDWQfwqFLKpDGiuNyjfE7x5OfogVNIJVJwPpE4ceeLtNgO1w4CghvPy2czDIZF
         vq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766882; x=1730371682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL4uzzO41dUypGldV6A4W2/myw6UQy2JesYfebFGJEE=;
        b=eLbRLfqW0h/QZ5/EJcbcsFexGDWZtHlX0EuQLMdlH1BNpqOVBF5igehnNftWl3XPg+
         yFUSgpJmX+HiQmvl2HBZVF2ROOWyr4zZDdbHLvxHsL/KxzLU+Zl99XasiqWSyuUsLJSu
         lCOE6JMmq1tYqO8QoPeZfXlNwYQCZzQsgyU6KXc1eZarazZcQ0afS+crxFwinfej5eja
         ga9mc/obZpJQ5ceHRyr+c7cqJRqMGUkU0fZdazMrZckQTZHLj/VgGrduAeytqWg6gOeo
         OBtUgclC5zPxJc+RtIsio0LTYooBemdv9ukL1/J2qNTNdfkrOPF+seIsjFLDzuRTtbGA
         ELcw==
X-Gm-Message-State: AOJu0YzBaz/bvynSe6UDo+kUDqGIHDZxuRzwslj9hrl8p7v23gocWrwa
	e3ZWtivNodQ9VsPnLa/5AzJmDRimjW9f1xLrfTJYPjLM9Atu947d3gP1D7Uc62Z3O2PIJhMIo7Y
	C1u+nmHWyhlKlenMy48q/W4lMJv8=
X-Google-Smtp-Source: AGHT+IGBCHBqd8Drg+CnKjP/4VU2KCiZREHwZCDWTnvTnt4/pa5H8G0bjIY4fHxPVOACJIIW+6sF1F+ZxQRP72N3vF8=
X-Received: by 2002:a05:651c:210f:b0:2fa:cc50:3f2 with SMTP id
 38308e7fff4ca-2fc9d316348mr31562831fa.5.1729766882067; Thu, 24 Oct 2024
 03:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241020150843.1068181-1-raj.khem@gmail.com>
In-Reply-To: <20241020150843.1068181-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Oct 2024 12:47:46 +0200
Message-ID: <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 10:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113164

Hi Markus,

this fails with installed-vs-shipped when libdir isn't /usr/lib:

ERROR: lib32-snapper-0.11.2-r0 do_package: QA Issue: lib32-snapper:
Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/snapper-timeline.timer
  /usr/lib/systemd/system/snapper-timeline.service
  /usr/lib/systemd/system/snapper-boot.timer
  /usr/lib/systemd/system/snapper-cleanup.timer
  /usr/lib/systemd/system/snapperd.service
  /usr/lib/systemd/system/snapper-boot.service
  /usr/lib/systemd/system/snapper-cleanup.service
  /usr/lib/snapper/systemd-helper
  /usr/lib/snapper/installation-helper
  /usr/lib/snapper/plugins
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
lib32-snapper: 12 installed and not shipped files. [installed-vs-shipped]

I've started to modify
https://github.com/openSUSE/snapper/blob/master/data/Makefile.am to
respect configured libdir (and datadir and systemd paths), but it's
not that simple as /usr/lib is also hardcoded for the plugins:
snapper/Hooks.cc:#define GRUB_SCRIPT "/usr/lib/snapper/plugins/grub"
snapper/Hooks.cc:#define ROLLBACK_SCRIPT "/usr/lib/snapper/plugins/rollback=
"
snapper/PluginsImpl.cc:#define GRUB_SCRIPT "/usr/lib/snapper/plugins/grub"
snapper/PluginsImpl.cc:#define ROLLBACK_SCRIPT
"/usr/lib/snapper/plugins/rollback"
snapper/SnapperDefines.h:#define PLUGINS_DIR "/usr/lib/snapper/plugins"

should the packaging be changed to use nonarch_libdir and let
lib32-snapper and snapper conflict with each other? Or is there some
better way to resolve this?

I'm not planning to use snapper, this was just new failure detected in
my world builds.

Regards,

On Sun, Oct 20, 2024 at 5:08=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Markus Volk <f_l_k@t-online.de>
>
> Snapper is a tool for Linux file system snapshot management. Apart from
> the obvious creation and deletion of snapshots it can compare snapshots
> and revert differences between them. In simple terms, this allows root
> and non-root users to view older versions of files and revert changes.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v3: More fixes for musl
>
>  ...x-types.h-for-__u16-__u32-__u64-type.patch | 30 ++++++++++++++
>  ...002-Use-statvfs-instead-of-statvfs64.patch | 37 +++++++++++++++++
>  .../recipes-support/snapper/snapper_0.11.2.bb | 41 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Include-=
linux-types.h-for-__u16-__u32-__u64-type.patch
>  create mode 100644 meta-oe/recipes-support/snapper/snapper/0002-Use-stat=
vfs-instead-of-statvfs64.patch
>  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>
> diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-t=
ypes.h-for-__u16-__u32-__u64-type.patch b/meta-oe/recipes-support/snapper/s=
napper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
> new file mode 100644
> index 0000000000..ec8594629e
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-=
for-__u16-__u32-__u64-type.patch
> @@ -0,0 +1,30 @@
> +From d103eaeae169708ca567f092182a89b79e5ab9db Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 20 Oct 2024 07:52:33 -0700
> +Subject: [PATCH 1/2] Include linux/types.h for __u16/__u32/__u64 type
> +
> +This header is included indirectly with glibc but when using musl
> +it ends up with compilation failure
> +
> +BcachefsUtils.cc:85:20: error: use of undeclared identifier '__u32'
> +   85 |             args.dirfd =3D (__u32) fddst;
> +      |                           ^
> +
> +Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945=
]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + snapper/BcachefsUtils.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/snapper/BcachefsUtils.cc b/snapper/BcachefsUtils.cc
> +index e9163ffb..1d328a78 100644
> +--- a/snapper/BcachefsUtils.cc
> ++++ b/snapper/BcachefsUtils.cc
> +@@ -24,6 +24,7 @@
> +
> + #include <cstring>
> + #include <cerrno>
> ++#include <linux/types.h>
> + #include <sys/stat.h>
> + #include <sys/ioctl.h>
> +
> diff --git a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-ins=
tead-of-statvfs64.patch b/meta-oe/recipes-support/snapper/snapper/0002-Use-=
statvfs-instead-of-statvfs64.patch
> new file mode 100644
> index 0000000000..b915fda257
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of=
-statvfs64.patch
> @@ -0,0 +1,37 @@
> +From 0b39f4484553c796cb300fb4933ea314e91d913b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 20 Oct 2024 07:55:23 -0700
> +Subject: [PATCH 2/2] Use statvfs instead of statvfs64
> +
> +when using LFS64 these functions are same and also
> +on 64bit systems they are same. musl is using 64bit off_t
> +by default and does not define LFS64 variants of these functions
> +and it ends up in build errors
> +
> +Taken from Alpine Linux: [https://gitlab.alpinelinux.org/alpine/aports/-=
/blob/master/testing/snapper/statvfs64.patch]
> +
> +Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945=
]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + snapper/FileUtils.cc | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/snapper/FileUtils.cc b/snapper/FileUtils.cc
> +index d4034279..4c8578a1 100644
> +--- a/snapper/FileUtils.cc
> ++++ b/snapper/FileUtils.cc
> +@@ -387,9 +387,9 @@ namespace snapper
> +     std::pair<unsigned long long, unsigned long long>
> +     SDir::statvfs() const
> +     {
> +-      struct statvfs64 fsbuf;
> +-      if (fstatvfs64(dirfd, &fsbuf) !=3D 0)
> +-          SN_THROW(IOErrorException(sformat("statvfs64 failed path:%s e=
rrno:%d (%s)", base_path.c_str(),
> ++      struct statvfs fsbuf;
> ++      if (fstatvfs(dirfd, &fsbuf) !=3D 0)
> ++          SN_THROW(IOErrorException(sformat("statvfs failed path:%s err=
no:%d (%s)", base_path.c_str(),
> +                                             errno, stringerror(errno).c=
_str())));
> +
> +       // f_bavail is used (not f_bfree) since df seems to do the
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
> new file mode 100644
> index 0000000000..840c607309
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "Snapper is a tool for Linux file system snapshot management=
"
> +HOMEPAGE =3D "https://github.com/openSUSE/snapper"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 nc=
urses zlib"
> +
> +# Build separation is slightly broken
> +inherit autotools-brokensep pkgconfig gettext
> +
> +SRC_URI =3D " \
> +    git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmast=
er \
> +    file://0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch \
> +    file://0002-Use-statvfs-instead-of-statvfs64.patch \
> +"
> +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF +=3D "--disable-zypp"
> +
> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documenta=
tion systemd pam', d)}"
> +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt=
-native docbook-xsl-stylesheets-native"
> +
> +# Avoid HOSTTOOLS path in binaries
> +export DIFFBIN =3D "${bindir}/diff"
> +export RMBIN =3D "${bindir}/rm"
> +export TOUCHBIN =3D "${bindir}/touch"
> +export CPBIN =3D "${bindir}/cp"
> +
> +
> +do_install:append() {
> +       install -d ${D}${sysconfdir}/sysconfig
> +       install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconf=
ig/snapper
> +}
> +
> +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/secu=
rity ${datadir}"
> +# bash is needed for the testsuite
> +RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113067): https://lists.openembedded.org/g/openembedde=
d-devel/message/113067
> Mute This Topic: https://lists.openembedded.org/mt/109116183/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

