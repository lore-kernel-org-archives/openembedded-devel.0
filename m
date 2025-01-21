Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFB3C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:43:34 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.21911.1737481408918086069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 09:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGDJYIar;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2a01bcd0143so4102297fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737481408; x=1738086208; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu8iTmt8/SZ5HjpcMTzUD2MjM62V3GdAghMEbxwX2+8=;
        b=mGDJYIarKhVnMp2w0RIxD6jLdohkHGZREhr5BcWZWZB1BV9BFIifHpHjJ3rAcBSalT
         PwjQaFjCgnZAMLleaF0e8CHQoZarq/dV84L7K7gnLjm/ZdKnk0MXTNupb/vpMNfVAnPI
         wh131hVr1MwCrHvxiwq5m6to2EMkaPA7n6iNwZShbp34ag7SaydIltIVKeaXn3HUK0+E
         dzMzPYiS9Upq5mo3wxYic7WXT01hiPPhdarWraG1O7m6RnsfHwiseSJLnk6JVL+GPat8
         ETEuY0lj492srLqc6QK2eUz/2effPYCZtYkzltzD3aG5RP4lcb2TnMTm/ItH0RdnKVDw
         BQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481408; x=1738086208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lu8iTmt8/SZ5HjpcMTzUD2MjM62V3GdAghMEbxwX2+8=;
        b=cJBGchecBor9gARxLy07WX91WJDd4IfW50oIUxHFUmaFfCCll6sW+sN2LFfUH3wKGn
         5i3HHRPcQn/c8xdpuvkvCTW2F3ZWz78FttBpAI9VYGRnkJ6ynI3CsFcVEBhBjTHM6zTb
         v3DLZtiF9NlcfsNlrIBwu49XgmyTZLt2d0L+PciFz9FFz25CrMw21c9g3t2Lx5jOD6OX
         4OzFBspRc35Z/sfGwuUl+zBTOT3E+udlm1Cnr6NyXLJ9IabCfIBKQGJjICjCnzJAId1T
         T2YAWYoJjLW6pDL8+nJLAq10mLJJyBz2QZeYxZMAMUhaG11yX0RIKNOhfhHRo+9BPyrU
         2Pog==
X-Gm-Message-State: AOJu0Yw7+NwyLVbeOQNV+jchGVYMeVxNhbMDS+bUMtpDm8sQdUiu1PXg
	v1SAEbzSVPBmU8b7KMvww4ljR2PJCZkkZc26kTdGcdWfKAxE35m/7eDn7hSuZSsevh8QaP+dZMz
	18X2PwKFfx9yeNJBMZ+NgeMdXOSQ=
X-Gm-Gg: ASbGncspu8fVZ3xfsqq/e4p24AHalhJcmjJednh66ickUVeFQAkz5Vz7BVimvwQ8m/u
	6q5NNrgY2bwWe9sSVGwGD6LppgR/+Cei1NTRAma6bHpQvRYc2Zg==
X-Google-Smtp-Source: AGHT+IHL46MZIM9Yd9LHJe8hGZOKJGmpm0+WS/FE92sxBPWOGemWvWsA5n3p7bZZU+vHa0/nJImOnJXOf/Z4U+KJzpM=
X-Received: by 2002:a05:6870:4e07:b0:29e:3484:ae12 with SMTP id
 586e51a60fabf-2b1c0b9f9b6mr11938977fac.33.1737481408004; Tue, 21 Jan 2025
 09:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20250121065346.37236-1-throos@amazon.de>
In-Reply-To: <20250121065346.37236-1-throos@amazon.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2025 09:43:01 -0800
X-Gm-Features: AbW1kvYWC7LPBTZVG6FoEYZBE44cUvAaXpWLpVX1DRv8Gqv4eLrA1QItJwwT_kk
Message-ID: <CAMKF1srN1uZ65JjdyYU2qJMNY+-JnSY_SErP1hQb0tx07g2=Bg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia] [scarthgap] [PATCH] libcamera: backport
 0.4.0 from master-next
To: throos@amazon.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 17:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115006

Hi Armin,

This patch should be fine to get into scarthgap, its gets it libcamera
functional on release.

On Mon, Jan 20, 2025 at 10:54=E2=80=AFPM Thomas Roos via
lists.openembedded.org <throos=3Damazon.de@lists.openembedded.org>
wrote:
>
> From: Thomas Roos <throos@amazon.de>
>
> This is done because libcamera 0.2. is broken,
> probablay because of 0001-rpi-Use-alloca-instead-of-variable-length-array=
s.patch
> Tested good with upstream version.
>
> See more details here:
> https://github.com/openembedded/meta-openembedded/issues/919
> and here:
> https://github.com/raspberrypi/rpicam-apps/issues/654
>
> Signed-off-by: Thomas Roos <throos@amazon.de>
> ---
>  .../0001-ipu3-Use-posix-basename.patch        |  71 ----------
>  ...ca-instead-of-variable-length-arrays.patch |  43 ------
>  ...002-options-Replace-use-of-VLAs-in-C.patch | 128 ------------------
>  ...{libcamera_0.2.0.bb =3D> libcamera_0.4.0.bb} |  11 +-
>  4 files changed, 5 insertions(+), 248 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-ipu3-Use-posix-basename.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0002-options-Replace-use-of-VLAs-in-C.patch
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb =
=3D> libcamera_0.4.0.bb} (84%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
ipu3-Use-posix-basename.patch b/meta-multimedia/recipes-multimedia/libcamer=
a/libcamera/0001-ipu3-Use-posix-basename.patch
> deleted file mode 100644
> index 9e4adf3d8d..0000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Us=
e-posix-basename.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 35d2acc61b1b27c0810a80cd21de65f29dc79df7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 24 Mar 2024 11:27:21 -0700
> -Subject: [PATCH] ipu3: Use posix basename
> -
> -musl does not implement GNU basename extention and with latest musl
> -the prototype from string.h is also removed [1] which now results in
> -compile errors e.g.
> -
> -../git/utils/ipu3/ipu3-pack.c:21:47: error: call to undeclared function =
'basename'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
> -
> -These utilities are using this function in usage() which is used just
> -before program exit. Always use the basename APIs from libgen.h which is
> -posix implementation
> -
> -[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22=
487bb64470881e86a92e7
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2024-March/041180.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - utils/ipu3/ipu3-pack.c   | 4 ++--
> - utils/ipu3/ipu3-unpack.c | 3 ++-
> - 2 files changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/utils/ipu3/ipu3-pack.c b/utils/ipu3/ipu3-pack.c
> -index decbfc6c..23d2db8b 100644
> ---- a/utils/ipu3/ipu3-pack.c
> -+++ b/utils/ipu3/ipu3-pack.c
> -@@ -8,6 +8,7 @@
> -
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <libgen.h>
> - #include <stdint.h>
> - #include <stdio.h>
> - #include <string.h>
> -@@ -15,9 +16,8 @@
> - #include <sys/types.h>
> - #include <unistd.h>
> -
> --static void usage(const char *argv0)
> -+static void usage(char *argv0)
> - {
> --
> -       printf("Usage: %s input-file output-file\n", basename(argv0));
> -       printf("Convert unpacked RAW10 Bayer data to the IPU3 packed Baye=
r formats\n");
> -       printf("If the output-file '-', output data will be written to st=
andard output\n");
> -diff --git a/utils/ipu3/ipu3-unpack.c b/utils/ipu3/ipu3-unpack.c
> -index 9d2c1200..1505a970 100644
> ---- a/utils/ipu3/ipu3-unpack.c
> -+++ b/utils/ipu3/ipu3-unpack.c
> -@@ -8,6 +8,7 @@
> -
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <libgen.h>
> - #include <stdint.h>
> - #include <stdio.h>
> - #include <string.h>
> -@@ -15,7 +16,7 @@
> - #include <sys/types.h>
> - #include <unistd.h>
> -
> --static void usage(const char *argv0)
> -+static void usage(char *argv0)
> - {
> -       printf("Usage: %s input-file output-file\n", basename(argv0));
> -       printf("Unpack the IPU3 raw Bayer format to 16-bit Bayer\n");
> ---
> -2.44.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
rpi-Use-alloca-instead-of-variable-length-arrays.patch b/meta-multimedia/re=
cipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variabl=
e-length-arrays.patch
> deleted file mode 100644
> index c336e92548..0000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use=
-alloca-instead-of-variable-length-arrays.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 11cc6dbd45f0880beea64cdc514f57484b90bc39 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 20 Feb 2024 18:44:23 -0800
> -Subject: [PATCH] rpi: Use malloc instead of variable length arrays
> -
> -Clang-18+ diagnoses this as error
> -
> -| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable len=
gth arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]     |=
   499 |         int xLo[X], xHi[X];
> -|       |                 ^
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2024-February/040529.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -s
> ----
> - src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controlle=
r/rpi/alsc.cpp
> -index 8a205c60..a7d42614 100644
> ---- a/src/ipa/rpi/controller/rpi/alsc.cpp
> -+++ b/src/ipa/rpi/controller/rpi/alsc.cpp
> -@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double> &calTabl=
eIn,
> -        * Precalculate and cache the x sampling locations and phases to =
save
> -        * recomputing them on every row.
> -        */
> --      int xLo[X], xHi[X];
> --      double xf[X];
> -+      int *xLo =3D (int*)malloc(X), *xHi =3D (int*)malloc(X);
> -+      double *xf =3D (double*)malloc(X);
> -       double scaleX =3D cameraMode.sensorWidth /
> -                       (cameraMode.width * cameraMode.scaleX);
> -       double xOff =3D cameraMode.cropX / (double)cameraMode.sensorWidth=
;
> -@@ -539,6 +539,9 @@ void resampleCalTable(const Array2D<double> &calTabl=
eIn,
> -                       *(out++) =3D above * (1 - yf) + below * yf;
> -               }
> -       }
> -+      free(xf);
> -+      free(xHi);
> -+      free(xLo);
> - }
> -
> - /* Calculate chrominance statistics (R/G and B/G) for each region. */
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-=
options-Replace-use-of-VLAs-in-C.patch b/meta-multimedia/recipes-multimedia=
/libcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch
> deleted file mode 100644
> index 473820653e..0000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options=
-Replace-use-of-VLAs-in-C.patch
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -From 6e4736180fcaffdb06acf52fd3eb50ba5baa3d2a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 31 Jan 2024 21:04:28 -0800
> -Subject: [PATCH] options: Replace use of VLAs in C++
> -
> -Clang++ 18 is fussy about this with new warning checks.
> -
> -   ../git/src/apps/common/options.cpp:882:20: error: variable length arr=
ays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
> -      882 |         char shortOptions[optionsMap_.size() * 3 + 2];
> -          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Therefore replace using VLAs with alloca and malloc/free
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2024-February/040381.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/apps/common/options.cpp      | 12 ++++++++++--
> - src/libcamera/ipc_unixsocket.cpp | 13 +++++++++----
> - 2 files changed, 19 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/apps/common/options.cpp b/src/apps/common/options.cpp
> -index 4f7e8691..3656f3c1 100644
> ---- a/src/apps/common/options.cpp
> -+++ b/src/apps/common/options.cpp
> -@@ -879,8 +879,8 @@ OptionsParser::Options OptionsParser::parse(int argc=
, char **argv)
> -        * Allocate short and long options arrays large enough to contain=
 all
> -        * options.
> -        */
> --      char shortOptions[optionsMap_.size() * 3 + 2];
> --      struct option longOptions[optionsMap_.size() + 1];
> -+      char *shortOptions =3D (char*)malloc(optionsMap_.size() * 3 + 2);
> -+      struct option *longOptions =3D (struct option*)malloc(sizeof(stru=
ct option) * (optionsMap_.size() + 1));
> -       unsigned int ids =3D 0;
> -       unsigned int idl =3D 0;
> -
> -@@ -935,12 +935,16 @@ OptionsParser::Options OptionsParser::parse(int ar=
gc, char **argv)
> -                       std::cerr << argv[optind - 1] << std::endl;
> -
> -                       usage();
> -+                      free(shortOptions);
> -+                      free(longOptions);
> -                       return options;
> -               }
> -
> -               const Option &option =3D *optionsMap_[c];
> -               if (!parseValue(option, optarg, &options)) {
> -                       usage();
> -+                      free(shortOptions);
> -+                      free(longOptions);
> -                       return options;
> -               }
> -       }
> -@@ -949,10 +953,14 @@ OptionsParser::Options OptionsParser::parse(int ar=
gc, char **argv)
> -               std::cerr << "Invalid non-option argument '" << argv[opti=
nd]
> -                         << "'" << std::endl;
> -               usage();
> -+              free(shortOptions);
> -+              free(longOptions);
> -               return options;
> -       }
> -
> -       options.valid_ =3D true;
> -+      free(shortOptions);
> -+      free(longOptions);
> -       return options;
> - }
> -
> -diff --git a/src/libcamera/ipc_unixsocket.cpp b/src/libcamera/ipc_unixso=
cket.cpp
> -index 1980d374..3bd861cb 100644
> ---- a/src/libcamera/ipc_unixsocket.cpp
> -+++ b/src/libcamera/ipc_unixsocket.cpp
> -@@ -8,6 +8,7 @@
> - #include "libcamera/internal/ipc_unixsocket.h"
> -
> - #include <array>
> -+#include <cstdint>
> - #include <poll.h>
> - #include <string.h>
> - #include <sys/socket.h>
> -@@ -247,8 +248,8 @@ int IPCUnixSocket::sendData(const void *buffer, size=
_t length,
> -       iov[0].iov_base =3D const_cast<void *>(buffer);
> -       iov[0].iov_len =3D length;
> -
> --      char buf[CMSG_SPACE(num * sizeof(uint32_t))];
> --      memset(buf, 0, sizeof(buf));
> -+      char *buf =3D (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
> -+      memset((void*)buf, 0, sizeof(buf));
> -
> -       struct cmsghdr *cmsg =3D (struct cmsghdr *)buf;
> -       cmsg->cmsg_len =3D CMSG_LEN(num * sizeof(uint32_t));
> -@@ -270,9 +271,11 @@ int IPCUnixSocket::sendData(const void *buffer, siz=
e_t length,
> -               int ret =3D -errno;
> -               LOG(IPCUnixSocket, Error)
> -                       << "Failed to sendmsg: " << strerror(-ret);
> -+              free(buf);
> -               return ret;
> -       }
> -
> -+      free(buf);
> -       return 0;
> - }
> -
> -@@ -283,8 +286,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t len=
gth,
> -       iov[0].iov_base =3D buffer;
> -       iov[0].iov_len =3D length;
> -
> --      char buf[CMSG_SPACE(num * sizeof(uint32_t))];
> --      memset(buf, 0, sizeof(buf));
> -+      char *buf =3D (char*)malloc(CMSG_SPACE(num * sizeof(uint32_t)));
> -+      memset((void*)buf, 0, sizeof(buf));
> -
> -       struct cmsghdr *cmsg =3D (struct cmsghdr *)buf;
> -       cmsg->cmsg_len =3D CMSG_LEN(num * sizeof(uint32_t));
> -@@ -305,12 +308,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t l=
ength,
> -               if (ret !=3D -EAGAIN)
> -                       LOG(IPCUnixSocket, Error)
> -                               << "Failed to recvmsg: " << strerror(-ret=
);
> -+              free(buf);
> -               return ret;
> -       }
> -
> -       if (fds)
> -               memcpy(fds, CMSG_DATA(cmsg), num * sizeof(uint32_t));
> -
> -+      free(buf);
> -       return 0;
> - }
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> similarity index 84%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> index 45d6be31ec..682e56739f 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> @@ -11,12 +11,9 @@ LIC_FILES_CHKSUM =3D "\
>  SRC_URI =3D " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
>          file://0001-media_device-Add-bool-return-type-to-unlock.patch \
> -        file://0002-options-Replace-use-of-VLAs-in-C.patch \
> -        file://0001-rpi-Use-alloca-instead-of-variable-length-arrays.pat=
ch \
> -        file://0001-ipu3-Use-posix-basename.patch \
>  "
>
> -SRCREV =3D "89227a428a82e724548399d35c98ea89566f9045"
> +SRCREV =3D "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
>
>  PE =3D "1"
>
> @@ -25,10 +22,11 @@ S =3D "${WORKDIR}/git"
>  DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
>
> -PACKAGES =3D+ "${PN}-gst"
> +PACKAGES =3D+ "${PN}-gst ${PN}-pycamera"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[pycamera] =3D "-Dpycamera=3Denabled,-Dpycamera=3Ddisabled,=
python3 python3-pybind11"
>
>  LIBCAMERA_PIPELINES ??=3D "auto"
>
> @@ -46,7 +44,7 @@ RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATUR=
ES', 'wayland qt', 'qtwayla
>  inherit meson pkgconfig python3native
>
>  do_configure:prepend() {
> -    sed -i -e 's|py_compile=3DTrue,||' ${S}/utils/ipc/mojo/public/tools/=
mojom/mojom/generate/template_expander.py
> +    sed -i -e 's|py_compile=3DTrue,||' ${S}/utils/codegen/ipc/mojo/publi=
c/tools/mojom/mojom/generate/template_expander.py
>  }
>
>  do_install:append() {
> @@ -72,6 +70,7 @@ do_package_recalculate_ipa_signatures() {
>
>  FILES:${PN} +=3D " ${libexecdir}/libcamera/v4l2-compat.so"
>  FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
> +FILES:${PN}-pycamera =3D "${PYTHON_SITEPACKAGES_DIR}/libcamera"
>
>  # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
>  # both 32 and 64 bit file APIs.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115002): https://lists.openembedded.org/g/openembedde=
d-devel/message/115002
> Mute This Topic: https://lists.openembedded.org/mt/110729722/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

