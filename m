Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F4E7E361
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 10:00:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8607.1775210434212084485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 03:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Br7IhWG9;
 spf=pass (domain: snapchat.com, ip: 209.85.221.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1701729f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 03:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210432; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+igOPm9YDP7UV7BrD8rx/NJSDZPkRMUSY+UHjcox5G3Uw53xsozTNdoI2CYknTJSF
         V3CJXX2h1r5nddTR2oXimQc9UmBmYMRElA+Vh8Ab1J6PsYlkOQtume5EiuvLXKTyVkiz
         GNi7YInU4UOtsjrhISWtcOAT9kJ+kZzjV3kK8JXY78cyyjrv+HWTTat9hrpzTV4Cg+wF
         15jUu5d6wcNLBqMolCp6pbcpH/rVzWH3PqMB3LGI5kF57wv3sy5fftPI9tym3qKpsa9x
         iVwSYUQFS7QvV19mYqwCMj/Q4I3j4uUkJijOI2Gzw0pZVW4pZZLkpfQcvJ+qoNNn5sXl
         /2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zjWajqBplgrIl9oRSCdrQus1iO1+sDZy/ehy5qu/Tm8=;
        fh=iZ55I8GCaeN6mLjFrnLBK+EumTVt2c5LfyydEjCCnbs=;
        b=jXIQIVoKw2Szty5LUiZROUUMy0AyLJQW6k6TPi2RSuDOZFQRqYCL+l8Orjw1GE3Nub
         5hYyy/zGCNo4HVmF4jPLmNunHL7FNqvCbUFLnBb9/kgFHX8F/ZmpSdxGs7StcDAH5WTB
         DT+IygKjidR+dUcdzJd9G+8fWLHrMk6MSSoMtD2W2xLAp1wS/RFSnOKNu6nzNS0vP5pq
         uQQHSjoWFKLsxIayq7xdL+1KN6jKx9T9ahDs/X5X3Bit2o+Z1LkrF/1JEBjQq20C74ZJ
         1vSJBT29E45dvcApsU9OzM4iOCZ15KEKjKYBPddrtKrYscqbEVrRDI5eBpgq4xOnUyl1
         oDXA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1775210432; x=1775815232; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zjWajqBplgrIl9oRSCdrQus1iO1+sDZy/ehy5qu/Tm8=;
        b=Br7IhWG9widgzccTZ+d+xtzaXe4yAgbsnjQnr04WgA+P6WyWGJNRkVGLFGtBu9MZgh
         6TpgOP9hYl2jmxA1kAo3CPMRc3SUb0fslBbfXKyLejJ/EkYuOoDjPm2WRq3wxr2Va1QH
         E8DnpfnnYrKlWrwS2nFZv6FnhS129SShtSC5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210432; x=1775815232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjWajqBplgrIl9oRSCdrQus1iO1+sDZy/ehy5qu/Tm8=;
        b=phCTSMPPHDf6l8uQXjTnRSSxK/On8duZ07r8N7zUu+bWuatzhT6qdMfdgoj1asDLz7
         RfynEGhGX/qK8sc5pHXRUVZfZGKznZWoX/GDGy4PJNL8GcZ+WMST82MJIu3Zdg1IkJqm
         7AACKm42rPeYmWqdf4X+Grn++GKn393j1iwFWP5WPxhHRKok3TkkxW9I5DJFdObaeMG9
         ixgXh+gO/CvW3d1J0JI3HXzdt6lFH1oShqt8sUI+uHM0D6JVnSMe8pG8I40+haf8qOoB
         oedOb1Pxi4W0FlcWPVFrl+HqNlTM+JgWUT2VgHFpmIQWFP1wM86k9Ita6BMHSNeXx4Jx
         CoIA==
X-Forwarded-Encrypted: i=1; AJvYcCU4f0JeLItfisEi79XwLgqnzbCZxcGJ1ZkL554+dA6y/pGAZNzEFO5joV6iHo66xqu0Ufhc/M6W0Xj6JWXu6PwAbOQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfHEk4ocniEbO59wsYRl8O7gyHoekUxr7UdQDeCFWDHSAq1W26
	tawie5gzZvLCZCS1LMJhAa+2zgz6FZy9oje9esu3xOG6gfKwVywceNtmt7v6rfEo7saxI/WrakA
	oDHrcwZZoh6/wxVVKlJ7AIErCqbsYuqbKEgnuxQ6THw==
X-Gm-Gg: AeBDieueG8a2AxUGlKny/eZ3XTsrUxG7235+9WQi+9m9+ShdlgIIsLnfGdUTs3jJbga
	BD2mfNHHjMBekGwZ8RmbpZ5jv31R/qwWmqSnOb+bOO0T2etlg1rKOH6FIfZMB8CMty2O/y+GTl/
	E+2NwF+u/hJd6/MI/Ycck3rIa/d514f184axEQ4OuU8iYwbffYzaxzioKJOyQCvTDjvivzRl3XY
	an9o8S4OtCWPXBZmA4Ym+I1DF2k5XttjSur3kTcmZ9vdg+DgZLwBsdH1jRsMJtQ54ZawhDPpWiK
	v5Jhx0Gjq2KXvMWiUbhzvrv9KUcYi8wb4uBtI/9m
X-Received: by 2002:a05:6000:24c4:b0:43d:1c21:efd1 with SMTP id
 ffacd0b85a97d-43d2926acd7mr3906958f8f.4.1775210432097; Fri, 03 Apr 2026
 03:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
 <20260330100744.739123-1-git-patches@bmwtechworks.in> <3c569855-52ed-4d3b-9e76-e646b5cb2802@gmail.com>
In-Reply-To: <3c569855-52ed-4d3b-9e76-e646b5cb2802@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 3 Apr 2026 12:00:20 +0200
X-Gm-Features: AQROBzC1ktcFTNyYWhLNg5yFNx2BExZPlof94JvxS_E-rfZxO7OP27pWgjQZUog
Message-ID: <CAHUKmYaxuQbspV8Z1kPMuuMnXkcgDzBOjcsOETvaNoowxJb2RA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 0/2] android-tools: migration and cleanup
To: skandigraun@gmail.com
Cc: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org, 
	Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000351310064e8b63bf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 10:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125983

--000000000000351310064e8b63bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I added the recipe originally. I think this is a good change. I remember
that I had issue building without the selinux dependency, but apparently
this is not the case with version 29 any more.

=C3=89tienne

On Thu, Apr 2, 2026 at 6:49=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Khem,
>
> Got any opinion on this one?
>
>
> On 3/30/26 12:07, Ashish Kumar Mishra via lists.openembedded.org wrote:
> > From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> >
> > Following the feedback on the initial RFC, the logic has been split int=
o
> two
> > distinct commits to improve clarity and maintainability:
> >
> > 1. Removal of the legacy android-tools 5.x version from
> meta-oe/recipes-devtools.
> > 2. Migration of android-tools v29.x from dynamic-layers/selinux to
> meta-oe.
> >
> > This ensures the newer version is correctly positioned in meta-oe while
> > cleaning up the deprecated 5.x recipe.
> >
> > Ashish Kumar Mishra (2):
> >   android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
> >   android-tools: move android-tools v29.x from dynamic-layers/selinux t=
o
> >     meta-oe
> >
> >  .../android-tools-conf/android-gadget-setup   |  37 --
> >  .../android-tools/android-tools-conf_1.0.bb   |  20 -
> >  .../android-tools/android-tools/adbd.mk       |  87 -----
> >  .../android-tools/android-tools-adbd.service  |  13 -
> >  .../10-adbd-configfs.conf                     |   4 -
> >  .../android-gadget-cleanup                    |  24 --
> >  .../android-gadget-setup                      |  38 --
> >  .../android-gadget-start                      |   9 -
> >  .../android-tools-conf-configfs_1.0.bb        |  38 --
> >  .../android-tools/android-tools-conf_1.0.bb   |   4 +-
> >  .../0001-Fixes-for-yocto-build.patch          |   0
> >  .../0001-liblp-fix-building-with-GCC-14.patch |   0
> >  ...difications-to-make-it-build-in-yoct.patch |   0
> >  ...usbdevfs_urb-to-match-new-kernel-UAP.patch |   0
> >  ...-adb-Fix-build-on-big-endian-systems.patch |   0
> >  ...005-adb-Allow-adbd-to-be-run-as-root.patch |   0
> >  .../android-tools/android-tools/adb.mk        |  72 ----
> >  .../android-tools/android-tools/adbd.mk       | 247 +++++-------
> >  ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
> >  .../0001-adb-remove-selinux-extensions.patch  |  44 ---
> >  ...define-strlcpy-for-glibc-based-syste.patch |  35 --
> >  ...-Use-local-sockets-where-appropriate.patch |  70 ----
> >  .../core/0003-adb-define-shell-command.patch  |  29 --
> >  ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
> >  .../0005-adb-add-base64-implementation.patch  | 350 -----------------
> >  .../core/0006-adb-Musl-fixes.patch            | 130 -------
> >  ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
> >  ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
> >  ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
> >  ...ux-capability.h-on-linux-systems-too.patch |  23 --
> >  .../0011-Remove-bionic-specific-calls.patch   |  64 ----
> >  ...laration-of-stlcat-strlcopy-function.patch |  50 ---
> >  .../core/0013-adb-Support-riscv64.patch       | 191 ---------
> >  ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
> >  ...off-most-of-sparse_file_read_normal-.patch |  60 ---
> >  ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
> >  ...port-for-converting-holes-to-don-t-c.patch | 114 ------
> >  .../android-tools/core/adb_libssl_11.diff     |  48 ---
> >  .../core/b64_pton_function_decl.patch         |  14 -
> >  .../debian/Add-riscv64-support.patch          |   0
> >  .../debian/Added-missing-headers.patch        |   0
> >  .../android-tools/debian/Nonnull.patch        |   0
> >  .../android-tools/debian/Vector-cast.patch    |   0
> >  .../debian/add-missing-headers.patch          |   0
> >  .../20150704-CVE-2015-3239_dwarf_i.h.patch    |   0
> >  .../legacy_built-in_sync_functions.patch      |   0
> >  ...nd-fix-strchr-conformance-to-ISO-C23.patch |   0
> >  ...unreachable-macro-to-avoid-redefinit.patch |   0
> >  .../external/libunwind/user_pt_regs.patch     |   0
> >  .../debian/fix-attribute-issue-with-gcc.patch |   0
> >  .../debian/fix-build-on-non-x86.patch         |   0
> >  .../fix-gettid-exception-declaration.patch    |   0
> >  .../fix-standard-namespace-errors.patch       |   0
> >  .../debian/hard-code-build-number.patch       |   0
> >  .../debian/libusb-header-path.patch           |   0
> >  .../debian/move-log-file-to-proper-dir.patch  |   0
> >  .../debian/simg_dump-python3.patch            |   0
> >  .../android-tools/debian/stdatomic.patch      |   0
> >  .../debian/stub-out-fastdeploy.patch          |   0
> >  .../system/core/Add-riscv64-support.patch     |   0
> >  .../system/core/Added-missing-headers.patch   |   0
> >  .../debian/system/core/Nonnull.patch          |   0
> >  .../debian/system/core/Vector-cast.patch      |   0
> >  .../system/core/add-missing-headers.patch     |   0
> >  ...ope-write-macro-to-prevent-conflict-.patch |   0
> >  .../core/fix-attribute-issue-with-gcc.patch   |   0
> >  .../system/core/fix-build-on-non-x86.patch    |   0
> >  .../fix-gettid-exception-declaration.patch    |   0
> >  .../core/fix-standard-namespace-errors.patch  |   0
> >  .../system/core/hard-code-build-number.patch  |   0
> >  .../system/core/libusb-header-path.patch      |   0
> >  ...x-missing-fixed-width-integer-types-.patch |   0
> >  .../core/move-log-file-to-proper-dir.patch    |   0
> >  .../system/core/simg_dump-python3.patch       |   0
> >  .../debian/system/core/stdatomic.patch        |   0
> >  .../system/core/stub-out-fastdeploy.patch     |   0
> >  .../core/throw-exception-on-unknown-os.patch  |   0
> >  .../throw-exception-on-unknown-os.patch       |   0
> >  .../android-tools/android-tools/ext4_utils.mk | 103 -----
> >  ...ext4_utils-remove-selinux-extensions.patch |  39 --
> >  ...add-o-argument-to-preserve-ownership.patch |  78 ----
> >  ...unused-parameter-from-allocate_inode.patch |  69 ----
> >  .../android-tools/android-tools/fastboot.mk   |  89 -----
> >  .../android-tools/android-tools/gitignore     |  59 ---
> >  .../0001-Remove-bionic-specific-calls.patch   |  25 --
> >  ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
> >  .../android-tools/android-tools/mkbootimg.mk  |  29 --
> >  .../android-tools/android-tools/remount       |   0
> >  .../android-tools/rules_yocto.mk              |   0
> >  .../android-tools/android-tools_29.0.6.r14.bb |   7 +-
> >  .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
> >  91 files changed, 92 insertions(+), 3560 deletions(-)
> >  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s-conf/android-gadget-setup
> >  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/
> android-tools-conf_1.0.bb
> >  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s/
> adbd.mk
> >  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s/android-tools-adbd.service
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adb=
d-configfs.conf
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-cleanup
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-setup
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-start
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools-conf-configfs_1.0.bb
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.=
patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-wit=
h-GCC-14.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0002-android-tools-modifica=
tions-to-make-it-build-in-yoct.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdev=
fs_urb-to-match-new-kernel-UAP.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-e=
ndian-systems.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-r=
un-as-root.patch
> (100%)
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> adb.mk
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add=
-risc-v-Android-config-header.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove=
-selinux-extensions.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-A=
lways-define-strlcpy-for-glibc-based-syste.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-lo=
cal-sockets-where-appropriate.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define=
-shell-command.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-bu=
ild-on-big-endian-systems.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-ba=
se64-implementation.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-f=
ixes.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_li=
nux.c-fix-build-with-glibc-2.28.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-=
adbd-to-be-ran-as-root.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-=
Add-dt-parameter-to-specify-DT-image.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-=
capability.h-on-linux-systems-too.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bio=
nic-specific-calls.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implic=
it-declaration-of-stlcat-strlcopy-function.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Suppor=
t-riscv64.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-=
descriptor-support-for-adb.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-=
Split-off-most-of-sparse_file_read_normal-.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-=
Add-hole-mode-to-sparse_file_read.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-A=
dd-support-for-converting-holes-to-don-t-c.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.d=
iff
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_functi=
on_decl.patch
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Add-riscv64-support.=
patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Added-missing-header=
s.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Vector-cast.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/add-missing-headers.=
patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/2=
0150704-CVE-2015-3239_dwarf_i.h.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
egacy_built-in_sync_functions.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
ibunwind-fix-strchr-conformance-to-ISO-C23.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
ibunwind-guard-unreachable-macro-to-avoid-redefinit.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/u=
ser_pt_regs.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-attribute-issue-=
with-gcc.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86=
.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-gettid-exception=
-declaration.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-standard-namespa=
ce-errors.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/hard-code-build-numb=
er.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/libusb-header-path.p=
atch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/move-log-file-to-pro=
per-dir.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/simg_dump-python3.pa=
tch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/stdatomic.patch (100=
%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.=
patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Add-risc=
v64-support.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Added-mi=
ssing-headers.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Nonnull.=
patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Vector-c=
ast.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/add-miss=
ing-headers.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/android-=
tools-scope-write-macro-to-prevent-conflict-.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-attr=
ibute-issue-with-gcc.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-buil=
d-on-non-x86.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-gett=
id-exception-declaration.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-stan=
dard-namespace-errors.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/hard-cod=
e-build-number.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/libusb-h=
eader-path.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/libzipar=
chive-fix-missing-fixed-width-integer-types-.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/move-log=
-file-to-proper-dir.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/simg_dum=
p-python3.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/stdatomi=
c.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/stub-out=
-fastdeploy.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/throw-ex=
ception-on-unknown-os.patch
> (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/throw-exception-on-u=
nknown-os.patch
> (100%)
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> ext4_utils.mk
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_uti=
ls-remove-selinux-extensions.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_uti=
ls-add-o-argument-to-preserve-ownership.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_uti=
ls-drop-unused-parameter-from-allocate_inode.patch
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> fastboot.mk
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remo=
ve-bionic-specific-calls.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libs=
elinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> mkbootimg.mk
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/remount (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/rules_yocto.mk (100%)
> >  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools_29.0.6.r14.bb (96%)
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125958):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_125958&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3D4ozBgxRcNsyZGwQzTmh2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&s=3Djh=
0yKGB4p4dqPkU2aGYlvYtMbQAx5qviw9ZZF-0eyJk&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_118576547_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D4ozBgxRcNsyZG=
wQzTmh2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&s=3DPYOJ_FCcOuSLDitMRUw=
ILEFnEBQDXw6oXE2uhAUu3PE&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D4ozBg=
xRcNsyZGwQzTmh2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&s=3DeQ7B38lwTlk=
-hRGry5bo_0eHaSe6PDXW5_N_AtuWbSE&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000351310064e8b63bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I added the recipe originally. I think this is a g=
ood change. I remember that I had issue building without the selinux depend=
ency, but apparently this is not the case with version 29 any more.<br><br>=
=C3=89tienne</div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 2, 2026 at 6:49=E2=80=
=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Khem,<br>
<br>
Got any opinion on this one?<br>
<br>
<br>
On 3/30/26 12:07, Ashish Kumar Mishra via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Ashish Kumar Mishra &lt;<a href=3D"mailto:ashishkumar.mishra@bmw=
techworks.in" target=3D"_blank">ashishkumar.mishra@bmwtechworks.in</a>&gt;<=
br>
&gt; <br>
&gt; Following the feedback on the initial RFC, the logic has been split in=
to two <br>
&gt; distinct commits to improve clarity and maintainability:<br>
&gt; <br>
&gt; 1. Removal of the legacy android-tools 5.x version from meta-oe/recipe=
s-devtools.<br>
&gt; 2. Migration of android-tools v29.x from dynamic-layers/selinux to met=
a-oe.<br>
&gt; <br>
&gt; This ensures the newer version is correctly positioned in meta-oe whil=
e <br>
&gt; cleaning up the deprecated 5.x recipe.<br>
&gt; <br>
&gt; Ashish Kumar Mishra (2):<br>
&gt;=C2=A0 =C2=A0android-tools: remove android-tools 5.x from meta-oe/recip=
es-devtools<br>
&gt;=C2=A0 =C2=A0android-tools: move android-tools v29.x from dynamic-layer=
s/selinux to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe<br>
&gt; <br>
&gt;=C2=A0 .../android-tools-conf/android-gadget-setup=C2=A0 =C2=A0|=C2=A0 =
37 --<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools-conf_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">android-tools-conf_1.0.bb</a>=C2=A0 =C2=
=A0|=C2=A0 20 -<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adbd.mk" rel=
=3D"noreferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 87 -----<br>
&gt;=C2=A0 .../android-tools/android-tools-adbd.service=C2=A0 |=C2=A0 13 -<=
br>
&gt;=C2=A0 .../10-adbd-configfs.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
&gt;=C2=A0 .../android-gadget-cleanup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 --<br>
&gt;=C2=A0 .../android-gadget-setup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 --<br>
&gt;=C2=A0 .../android-gadget-start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 -<br>
&gt;=C2=A0 .../<a href=3D"http://android-tools-conf-configfs_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">android-tools-conf-configfs_1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 --<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools-conf_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">android-tools-conf_1.0.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../0001-Fixes-for-yocto-build.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../0001-liblp-fix-building-with-GCC-14.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 ...difications-to-make-it-build-in-yoct.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 ...usbdevfs_urb-to-match-new-kernel-UAP.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 ...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 ...005-adb-Allow-adbd-to-be-run-as-root.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adb.mk" rel=3D=
"noreferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 72 ----<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adbd.mk" rel=
=3D"noreferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
47 +++++-------<br>
&gt;=C2=A0 ...scv-Add-risc-v-Android-config-header.patch | 361 ------------=
------<br>
&gt;=C2=A0 .../0001-adb-remove-selinux-extensions.patch=C2=A0 |=C2=A0 44 --=
-<br>
&gt;=C2=A0 ...define-strlcpy-for-glibc-based-syste.patch |=C2=A0 35 --<br>
&gt;=C2=A0 ...-Use-local-sockets-where-appropriate.patch |=C2=A0 70 ----<br=
>
&gt;=C2=A0 .../core/0003-adb-define-shell-command.patch=C2=A0 |=C2=A0 29 --=
<br>
&gt;=C2=A0 ...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 47 ---<br>
&gt;=C2=A0 .../0005-adb-add-base64-implementation.patch=C2=A0 | 350 -------=
----------<br>
&gt;=C2=A0 .../core/0006-adb-Musl-fixes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 130 -------<br>
&gt;=C2=A0 ...sb_linux.c-fix-build-with-glibc-2.28.patch |=C2=A0 26 --<br>
&gt;=C2=A0 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |=C2=A0 23 --<br>
&gt;=C2=A0 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------<br>
&gt;=C2=A0 ...ux-capability.h-on-linux-systems-too.patch |=C2=A0 23 --<br>
&gt;=C2=A0 .../0011-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 =
64 ----<br>
&gt;=C2=A0 ...laration-of-stlcat-strlcopy-function.patch |=C2=A0 50 ---<br>
&gt;=C2=A0 .../core/0013-adb-Support-riscv64.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 191 ---------<br>
&gt;=C2=A0 ...add-u3-ss-descriptor-support-for-adb.patch | 344 ------------=
-----<br>
&gt;=C2=A0 ...off-most-of-sparse_file_read_normal-.patch |=C2=A0 60 ---<br>
&gt;=C2=A0 ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------<br=
>
&gt;=C2=A0 ...port-for-converting-holes-to-don-t-c.patch | 114 ------<br>
&gt;=C2=A0 .../android-tools/core/adb_libssl_11.diff=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 48 ---<br>
&gt;=C2=A0 .../core/b64_pton_function_decl.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 14 -<br>
&gt;=C2=A0 .../debian/Add-riscv64-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/Added-missing-headers.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/debian/Nonnull.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/debian/Vector-cast.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../debian/add-missing-headers.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../20150704-CVE-2015-3239_dwarf_i.h.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../legacy_built-in_sync_functions.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...nd-fix-strchr-conformance-to-ISO-C23.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 ...unreachable-macro-to-avoid-redefinit.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../external/libunwind/user_pt_regs.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/fix-attribute-issue-with-gcc.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../debian/fix-build-on-non-x86.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../fix-gettid-exception-declaration.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../fix-standard-namespace-errors.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/hard-code-build-number.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/libusb-header-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/move-log-file-to-proper-dir.patch=C2=A0 |=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 .../debian/simg_dump-python3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/debian/stdatomic.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/stub-out-fastdeploy.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../system/core/Add-riscv64-support.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../system/core/Added-missing-headers.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../debian/system/core/Nonnull.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/system/core/Vector-cast.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../system/core/add-missing-headers.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...ope-write-macro-to-prevent-conflict-.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../core/fix-attribute-issue-with-gcc.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../system/core/fix-build-on-non-x86.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../fix-gettid-exception-declaration.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../core/fix-standard-namespace-errors.patch=C2=A0 |=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 .../system/core/hard-code-build-number.patch=C2=A0 |=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 .../system/core/libusb-header-path.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...x-missing-fixed-width-integer-types-.patch |=C2=A0 =C2=A00<br=
>
&gt;=C2=A0 .../core/move-log-file-to-proper-dir.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
&gt;=C2=A0 .../system/core/simg_dump-python3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../debian/system/core/stdatomic.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../system/core/stub-out-fastdeploy.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../core/throw-exception-on-unknown-os.patch=C2=A0 |=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 .../throw-exception-on-unknown-os.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://ext4_utils.mk"=
 rel=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a> | 103 -----<br>
&gt;=C2=A0 ...ext4_utils-remove-selinux-extensions.patch |=C2=A0 39 --<br>
&gt;=C2=A0 ...add-o-argument-to-preserve-ownership.patch |=C2=A0 78 ----<br=
>
&gt;=C2=A0 ...unused-parameter-from-allocate_inode.patch |=C2=A0 69 ----<br=
>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://fastboot.mk" r=
el=3D"noreferrer" target=3D"_blank">fastboot.mk</a>=C2=A0 =C2=A0|=C2=A0 89 =
-----<br>
&gt;=C2=A0 .../android-tools/android-tools/gitignore=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 59 ---<br>
&gt;=C2=A0 .../0001-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 =
25 --<br>
&gt;=C2=A0 ...t-define-gettid-if-glibc-2.30-is-use.patch |=C2=A0 51 ---<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://mkbootimg.mk" =
rel=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a>=C2=A0 |=C2=A0 29 --<b=
r>
&gt;=C2=A0 .../android-tools/android-tools/remount=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://rules_yocto.mk" rel=3D"noref=
errer" target=3D"_blank">rules_yocto.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_29.0.6.r14.bb"=
 rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.bb</a> |=C2=
=A0 =C2=A07 +-<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_5.1.1.r37.bb" =
rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r37.bb</a>=C2=A0 |=
 189 ---------<br>
&gt;=C2=A0 91 files changed, 92 insertions(+), 3560 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtoo=
l/android-tools/android-tools-conf/android-gadget-setup<br>
&gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtoo=
l/android-tools/<a href=3D"http://android-tools-conf_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">android-tools-conf_1.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtoo=
l/android-tools/android-tools/<a href=3D"http://adbd.mk" rel=3D"noreferrer"=
 target=3D"_blank">adbd.mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtoo=
l/android-tools/android-tools/android-tools-adbd.service<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/10-adbd-configfs.conf<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/android-gadget-cleanup<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/android-gadget-setup<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/android-gadget-start<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/<a hre=
f=3D"http://android-tools-conf-configfs_1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">android-tools-conf-configfs_1.0.bb</a><br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.pat=
ch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-with-G=
CC-14.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0002-android-tools-modificatio=
ns-to-make-it-build-in-yoct.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_=
urb-to-match-new-kernel-UAP.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-endi=
an-systems.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-=
as-root.patch (100%)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.=
mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0001-adb-remove-selinux-extensions.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0003-adb-define-shell-command.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0005-adb-add-base64-implementation.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0006-adb-Musl-fixes.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0011-Remove-bionic-specific-calls.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0013-adb-Support-riscv64.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/adb_libssl_11.diff<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/b64_pton_function_decl.patch<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/Add-riscv64-support.pat=
ch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/Added-missing-headers.p=
atch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)<br=
>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/Vector-cast.patch (100%=
)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/add-missing-headers.pat=
ch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/external/libunwind/2015=
0704-CVE-2015-3239_dwarf_i.h.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/external/libunwind/lega=
cy_built-in_sync_functions.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/external/libunwind/libu=
nwind-fix-strchr-conformance-to-ISO-C23.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/external/libunwind/libu=
nwind-guard-unreachable-macro-to-avoid-redefinit.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/external/libunwind/user=
_pt_regs.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/fix-attribute-issue-wit=
h-gcc.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86.pa=
tch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/fix-gettid-exception-de=
claration.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/fix-standard-namespace-=
errors.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/hard-code-build-number.=
patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/libusb-header-path.patc=
h (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/move-log-file-to-proper=
-dir.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/simg_dump-python3.patch=
 (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/stdatomic.patch (100%)<=
br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.pat=
ch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/Add-riscv64=
-support.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/Added-missi=
ng-headers.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/Nonnull.pat=
ch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/Vector-cast=
.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/add-missing=
-headers.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/android-too=
ls-scope-write-macro-to-prevent-conflict-.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/fix-attribu=
te-issue-with-gcc.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/fix-build-o=
n-non-x86.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/fix-gettid-=
exception-declaration.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/fix-standar=
d-namespace-errors.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/hard-code-b=
uild-number.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/libusb-head=
er-path.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/libziparchi=
ve-fix-missing-fixed-width-integer-types-.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/move-log-fi=
le-to-proper-dir.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/simg_dump-p=
ython3.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/stdatomic.p=
atch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/stub-out-fa=
stdeploy.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/system/core/throw-excep=
tion-on-unknown-os.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/debian/throw-exception-on-unkn=
own-os.patch (100%)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blan=
k">ext4_utils.mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch<b=
r>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.pa=
tch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank"=
>fastboot.mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/gitignore<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libselinux/0001-Remove-bionic-specific-calls.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-us=
e.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank=
">mkbootimg.mk</a><br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/remount (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/android-tools/<a href=3D"http://rules_yocto.=
mk" rel=3D"noreferrer" target=3D"_blank">rules_yocto.mk</a> (100%)<br>
&gt;=C2=A0 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; r=
ecipes-devtools}/android-tools/<a href=3D"http://android-tools_29.0.6.r14.b=
b" rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.bb</a> (96=
%)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/<a hre=
f=3D"http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank=
">android-tools_5.1.1.r37.bb</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125958): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
25958&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D4ozBgxRcNsyZGwQzT=
mh2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&amp;s=3Djh0yKGB4p4dqPkU2aGY=
lvYtMbQAx5qviw9ZZF-0eyJk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_125958&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3D4ozBgxRcNsyZGwQzTmh2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7=
ANfj&amp;s=3Djh0yKGB4p4dqPkU2aGYlvYtMbQAx5qviw9ZZF-0eyJk&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_118576547_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D4ozBgxRcNsyZGwQzTmh2PtXB3nzVhZaSbp4jpCGMOdd1Od=
2NuuzifzcDnmF7ANfj&amp;s=3DPYOJ_FCcOuSLDitMRUwILEFnEBQDXw6oXE2uhAUu3PE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_118576547_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D4ozBgxRcNsyZGwQzTmh2PtXB3nzVhZa=
Sbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&amp;s=3DPYOJ_FCcOuSLDitMRUwILEFnEBQDXw6oX=
E2uhAUu3PE&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3D4ozBgxRcNsyZGwQzTmh2PtXB3nzVhZaSbp4jpCGMOd=
d1Od2NuuzifzcDnmF7ANfj&amp;s=3DeQ7B38lwTlk-hRGry5bo_0eHaSe6PDXW5_N_AtuWbSE&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D4ozBgxRcNsyZGwQzTmh=
2PtXB3nzVhZaSbp4jpCGMOdd1Od2NuuzifzcDnmF7ANfj&amp;s=3DeQ7B38lwTlk-hRGry5bo_=
0eHaSe6PDXW5_N_AtuWbSE&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000351310064e8b63bf--

