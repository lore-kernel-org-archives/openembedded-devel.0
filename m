Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20329C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:45:25 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.42129.1737395124366482103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOISCsVi;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e10e6a1ceso1306692a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737395123; x=1737999923; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=heJS38WCHfytKEbehRTtBFGNQ12vv6u6LoVacoR18Cs=;
        b=WOISCsVi/NDXZ7QiV7Mx4oM4qnjjmwtQfBnsHu5P30LJ7zj1A7dOhri2Djyexc7j4G
         4HM5LjjFPtTV7Rhi7d7WbIjKztFnKEhn5rhNYTU2zhZXtPi9SPvaNVT3Iz8wPcYL5myo
         i87mbCFYfOG1LC0ye3TFlaCAxCc2NtIFTJrblPTn+iUe4/aMspXkztxl3lcgzQnpx+vr
         ceb++euRmTo3QnR+0LgS9P2CpCwDyb7zTxFGCKz/vcLDTB0YkMnq100RS/5483dAd7hy
         P/zeXfAmnCjAb96iylhW6Cpjl6xz3E+5yQilsqAbrydGYAfxekYLZuJJ/OhzT3FeSYYi
         w9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395123; x=1737999923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heJS38WCHfytKEbehRTtBFGNQ12vv6u6LoVacoR18Cs=;
        b=A9vTaoTuKQob8cGvqG3qqWftVGU6ik7gYWRRPrm9yg6qWzn+mW4LdN8LCVh5i0q+de
         RpBRwDRYpmI13ma7Ax5aeVvNmUvicC9R7Cw5z//cLVNbixVqzv7fb8jkay2IXCiulhig
         ohftOUbb6BxoIbF7ULkp3JvJqnS9nEco4MaxzPO4tKijuWfsnPftDRM6/b7pWRJvA4kt
         lqCR20G19Ddwmm3KPpw3ZlbfyYHg1jwHz45x0z8xO4AiGpzvDsp6jZ4BgoBoug8YIah7
         0YSA61TfkLrbU1+Epwja6yYJFH0Kj2GgMCB873366YwkrIAktorFb1DsVe8O+W8j6ehL
         tqTw==
X-Gm-Message-State: AOJu0YwkpMMcUt606RcBmZUEQ7TnTTQdwdO1XvGlQ6jPX5FdwFo4/vty
	/+iUAc3SnYEeuHVIIymANW5UIQd/sHioTBM77z1BkLPQQnC6G4c9zgUQkpxKkDTYi0ZwbfS7VS0
	qrxPKJoRdqxz37HAvGb4hWSH6kls=
X-Gm-Gg: ASbGnctLmefGLpy94SYKC3y4U65wNZU6IBX4QvLOXXd+zoUX1xFvdHait/PTAoIpugv
	VSyiGz1rTxxKihRSQ/LmqtKRaFZCJC2AOU5kYbPg6+JgJKdLK7yjn5RJ+6Sb1415alzHITNcP1R
	s6+usNSxPH
X-Google-Smtp-Source: AGHT+IHVmCGKE2dAcaoaIf3v+C7T6K3C9bRoB8HOv1NFpMhBu2bHnUh/0y2DijNYhyauXRG/nZC5qNoBU5Z6qz86r0Y=
X-Received: by 2002:a05:6830:6288:b0:71d:4105:4053 with SMTP id
 46e09a7af769-7249da57febmr8939239a34.5.1737395122555; Mon, 20 Jan 2025
 09:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20250120145959.330141-1-throos@amazon.de>
In-Reply-To: <20250120145959.330141-1-throos@amazon.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2025 09:45:11 -0800
X-Gm-Features: AbW1kvZqKLjq9KgBLgddWu10G6GHQux9_QybeG5_51ULCl6ktMpbAe7LatF32z8
Message-ID: <CAMKF1sozfERMN-f6Hq7_LWjvazU26Qp1JNmbHGcY4_2LdxspYg@mail.gmail.com>
Subject: Re: [oe] [PATCH] libcamera: backport 0.4.0 from master-next
To: throos@amazon.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d54bb062c26d30a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114997

--0000000000001d54bb062c26d30a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which release is it for ?
It=E2=80=99s good to mention it in subject line

On Mon, Jan 20, 2025 at 7:00=E2=80=AFAM Thomas Roos via lists.openembedded.=
org
<throos=3Damazon.de@lists.openembedded.org> wrote:

> From: Thomas Roos <throos@amazon.de>
>
> This is done because libcamera 0.2. is broken,
> probablay because of
> 0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch
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
>  delete mode 100644
> meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-posi=
x-basename.patch
>  delete mode 100644
> meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-alloc=
a-instead-of-variable-length-arrays.patch
>  delete mode 100644
> meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Repla=
ce-use-of-VLAs-in-C.patch
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.2.0.bb
> =3D> libcamera_0.4.0.bb} (84%)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-po=
six-basename.patch
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-po=
six-basename.patch
> deleted file mode 100644
> index 9e4adf3d8d..0000000000
> ---
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-po=
six-basename.patch
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
> -../git/utils/ipu3/ipu3-pack.c:21:47: error: call to undeclared function
> 'basename'; ISO C99 and later do not support implicit function declaratio=
ns
> [-Wimplicit-function-declaration]
> -
> -These utilities are using this function in usage() which is used just
> -before program exit. Always use the basename APIs from libgen.h which is
> -posix implementation
> -
> -[1]
> https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb=
64470881e86a92e7
> -
> -Upstream-Status: Submitted [
> https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/041180.h=
tml
> ]
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
r
> formats\n");
> -       printf("If the output-file '-', output data will be written to
> standard output\n");
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
> diff --git
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-all=
oca-instead-of-variable-length-arrays.patch
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-all=
oca-instead-of-variable-length-arrays.patch
> deleted file mode 100644
> index c336e92548..0000000000
> ---
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-all=
oca-instead-of-variable-length-arrays.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 11cc6dbd45f0880beea64cdc514f57484b90bc39 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 20 Feb 2024 18:44:23 -0800
> -Subject: [PATCH] rpi: Use malloc instead of variable length arrays
> -
> -Clang-18+ diagnoses this as error
> -
> -| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable
> length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
>  |   499 |         int xLo[X], xHi[X];
> -|       |                 ^
> -
> -Upstream-Status: Submitted [
> https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/04052=
9.html
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -s
> ----
> - src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp
> b/src/ipa/rpi/controller/rpi/alsc.cpp
> -index 8a205c60..a7d42614 100644
> ---- a/src/ipa/rpi/controller/rpi/alsc.cpp
> -+++ b/src/ipa/rpi/controller/rpi/alsc.cpp
> -@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D<double>
> &calTableIn,
> -        * Precalculate and cache the x sampling locations and phases to
> save
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
> -@@ -539,6 +539,9 @@ void resampleCalTable(const Array2D<double>
> &calTableIn,
> -                       *(out++) =3D above * (1 - yf) + below * yf;
> -               }
> -       }
> -+      free(xf);
> -+      free(xHi);
> -+      free(xLo);
> - }
> -
> - /* Calculate chrominance statistics (R/G and B/G) for each region. */
> diff --git
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Rep=
lace-use-of-VLAs-in-C.patch
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Rep=
lace-use-of-VLAs-in-C.patch
> deleted file mode 100644
> index 473820653e..0000000000
> ---
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-Rep=
lace-use-of-VLAs-in-C.patch
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -From 6e4736180fcaffdb06acf52fd3eb50ba5baa3d2a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 31 Jan 2024 21:04:28 -0800
> -Subject: [PATCH] options: Replace use of VLAs in C++
> -
> -Clang++ 18 is fussy about this with new warning checks.
> -
> -   ../git/src/apps/common/options.cpp:882:20: error: variable length
> arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
> -      882 |         char shortOptions[optionsMap_.size() * 3 + 2];
> -          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Therefore replace using VLAs with alloca and malloc/free
> -
> -Upstream-Status: Submitted [
> https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/04038=
1.html
> ]
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
,
> char **argv)
> -        * Allocate short and long options arrays large enough to contain
> all
> -        * options.
> -        */
> --      char shortOptions[optionsMap_.size() * 3 + 2];
> --      struct option longOptions[optionsMap_.size() + 1];
> -+      char *shortOptions =3D (char*)malloc(optionsMap_.size() * 3 + 2);
> -+      struct option *longOptions =3D (struct option*)malloc(sizeof(stru=
ct
> option) * (optionsMap_.size() + 1));
> -       unsigned int ids =3D 0;
> -       unsigned int idl =3D 0;
> -
> -@@ -935,12 +935,16 @@ OptionsParser::Options OptionsParser::parse(int
> argc, char **argv)
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
> -@@ -949,10 +953,14 @@ OptionsParser::Options OptionsParser::parse(int
> argc, char **argv)
> -               std::cerr << "Invalid non-option argument '" <<
> argv[optind]
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
> -diff --git a/src/libcamera/ipc_unixsocket.cpp
> b/src/libcamera/ipc_unixsocket.cpp
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
> -@@ -247,8 +248,8 @@ int IPCUnixSocket::sendData(const void *buffer,
> size_t length,
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
> -@@ -270,9 +271,11 @@ int IPCUnixSocket::sendData(const void *buffer,
> size_t length,
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
> -@@ -283,8 +286,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t
> length,
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
> -@@ -305,12 +308,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t
> length,
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
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.2.0.bb b/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.4.0.bb
> similarity index 84%
> rename from meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.2.0.bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> index 45d6be31ec..682e56739f 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> @@ -11,12 +11,9 @@ LIC_FILES_CHKSUM =3D "\
>  SRC_URI =3D " \
>          git://
> git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaste=
r \
>          file://0001-media_device-Add-bool-return-type-to-unlock.patch \
> -        file://0002-options-Replace-use-of-VLAs-in-C.patch \
> -
> file://0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch \
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
ive
> python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase
> qtbase-native', '', d)}"
>
> -PACKAGES =3D+ "${PN}-gst"
> +PACKAGES =3D+ "${PN}-gst ${PN}-pycamera"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gst] =3D
> "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gstreamer1.0
> gstreamer1.0-plugins-base"
> +PACKAGECONFIG[pycamera] =3D "-Dpycamera=3Denabled,-Dpycamera=3Ddisabled,=
python3
> python3-pybind11"
>
>  LIBCAMERA_PIPELINES ??=3D "auto"
>
> @@ -46,7 +44,7 @@ RDEPENDS:${PN} =3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayla
>  inherit meson pkgconfig python3native
>
>  do_configure:prepend() {
> -    sed -i -e 's|py_compile=3DTrue,||'
> ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.p=
y
> +    sed -i -e 's|py_compile=3DTrue,||'
> ${S}/utils/codegen/ipc/mojo/public/tools/mojom/mojom/generate/template_ex=
pander.py
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
> View/Reply Online (#114996):
> https://lists.openembedded.org/g/openembedded-devel/message/114996
> Mute This Topic: https://lists.openembedded.org/mt/110715612/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001d54bb062c26d30a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Which release is it for ?=C2=A0</div><div dir=3D"auto">It=
=E2=80=99s good to mention it in subject line=C2=A0</div><div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Jan 20, 2025 at 7:00=E2=80=AFAM Thomas Roos via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;throos=3D<a href=
=3D"mailto:amazon.de@lists.openembedded.org">amazon.de@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Thomas Roos=
 &lt;<a href=3D"mailto:throos@amazon.de" target=3D"_blank">throos@amazon.de=
</a>&gt;<br>
<br>
This is done because libcamera 0.2. is broken,<br>
probablay because of 0001-rpi-Use-alloca-instead-of-variable-length-arrays.=
patch<br>
Tested good with upstream version.<br>
<br>
See more details here:<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/issues/919" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/meta-ope=
nembedded/issues/919</a><br>
and here:<br>
<a href=3D"https://github.com/raspberrypi/rpicam-apps/issues/654" rel=3D"no=
referrer" target=3D"_blank">https://github.com/raspberrypi/rpicam-apps/issu=
es/654</a><br>
<br>
Signed-off-by: Thomas Roos &lt;<a href=3D"mailto:throos@amazon.de" target=
=3D"_blank">throos@amazon.de</a>&gt;<br>
---<br>
=C2=A0.../0001-ipu3-Use-posix-basename.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 71 ----------<br>
=C2=A0...ca-instead-of-variable-length-arrays.patch |=C2=A0 43 ------<br>
=C2=A0...002-options-Replace-use-of-VLAs-in-C.patch | 128 -----------------=
-<br>
=C2=A0...{<a href=3D"http://libcamera_0.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">libcamera_0.2.0.bb</a> =3D&gt; <a href=3D"http://libcamera_0.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.4.0.bb</a>} |=C2=A0 =
11 +-<br>
=C2=A04 files changed, 5 insertions(+), 248 deletions(-)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libca=
mera/0001-ipu3-Use-posix-basename.patch<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libca=
mera/0001-rpi-Use-alloca-instead-of-variable-length-arrays.patch<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libca=
mera/0002-options-Replace-use-of-VLAs-in-C.patch<br>
=C2=A0rename meta-multimedia/recipes-multimedia/libcamera/{<a href=3D"http:=
//libcamera_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.2.0.=
bb</a> =3D&gt; <a href=3D"http://libcamera_0.4.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libcamera_0.4.0.bb</a>} (84%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ip=
u3-Use-posix-basename.patch b/meta-multimedia/recipes-multimedia/libcamera/=
libcamera/0001-ipu3-Use-posix-basename.patch<br>
deleted file mode 100644<br>
index 9e4adf3d8d..0000000000<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipu3-Use-=
posix-basename.patch<br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-From 35d2acc61b1b27c0810a80cd21de65f29dc79df7 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 24 Mar 2024 11:27:21 -0700<br>
-Subject: [PATCH] ipu3: Use posix basename<br>
-<br>
-musl does not implement GNU basename extention and with latest musl<br>
-the prototype from string.h is also removed [1] which now results in<br>
-compile errors e.g.<br>
-<br>
-../git/utils/ipu3/ipu3-pack.c:21:47: error: call to undeclared function &#=
39;basename&#39;; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]<br>
-<br>
-These utilities are using this function in usage() which is used just<br>
-before program exit. Always use the basename APIs from libgen.h which is<b=
r>
-posix implementation<br>
-<br>
-[1] <a href=3D"https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6d=
ff4d0cd22487bb64470881e86a92e7" rel=3D"noreferrer" target=3D"_blank">https:=
//git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb64470881=
e86a92e7</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lists.libcamera.org/piperma=
il/libcamera-devel/2024-March/041180.html" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/04118=
0.html</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- utils/ipu3/ipu3-pack.c=C2=A0 =C2=A0| 4 ++--<br>
- utils/ipu3/ipu3-unpack.c | 3 ++-<br>
- 2 files changed, 4 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/utils/ipu3/ipu3-pack.c b/utils/ipu3/ipu3-pack.c<br>
-index decbfc6c..23d2db8b 100644<br>
---- a/utils/ipu3/ipu3-pack.c<br>
-+++ b/utils/ipu3/ipu3-pack.c<br>
-@@ -8,6 +8,7 @@<br>
- <br>
- #include &lt;errno.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#include &lt;libgen.h&gt;<br>
- #include &lt;stdint.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;string.h&gt;<br>
-@@ -15,9 +16,8 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
- <br>
--static void usage(const char *argv0)<br>
-+static void usage(char *argv0)<br>
- {<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Usage: %s input-file output-file\n=
&quot;, basename(argv0));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Convert unpacked RAW10 Bayer data =
to the IPU3 packed Bayer formats\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;If the output-file &#39;-&#39;, ou=
tput data will be written to standard output\n&quot;);<br>
-diff --git a/utils/ipu3/ipu3-unpack.c b/utils/ipu3/ipu3-unpack.c<br>
-index 9d2c1200..1505a970 100644<br>
---- a/utils/ipu3/ipu3-unpack.c<br>
-+++ b/utils/ipu3/ipu3-unpack.c<br>
-@@ -8,6 +8,7 @@<br>
- <br>
- #include &lt;errno.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#include &lt;libgen.h&gt;<br>
- #include &lt;stdint.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;string.h&gt;<br>
-@@ -15,7 +16,7 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
- <br>
--static void usage(const char *argv0)<br>
-+static void usage(char *argv0)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Usage: %s input-file output-file\n=
&quot;, basename(argv0));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Unpack the IPU3 raw Bayer format t=
o 16-bit Bayer\n&quot;);<br>
--- <br>
-2.44.0<br>
-<br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rp=
i-Use-alloca-instead-of-variable-length-arrays.patch b/meta-multimedia/reci=
pes-multimedia/libcamera/libcamera/0001-rpi-Use-alloca-instead-of-variable-=
length-arrays.patch<br>
deleted file mode 100644<br>
index c336e92548..0000000000<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-rpi-Use-a=
lloca-instead-of-variable-length-arrays.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 11cc6dbd45f0880beea64cdc514f57484b90bc39 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 20 Feb 2024 18:44:23 -0800<br>
-Subject: [PATCH] rpi: Use malloc instead of variable length arrays<br>
-<br>
-Clang-18+ diagnoses this as error<br>
-<br>
-| ../git/src/ipa/rpi/controller/rpi/alsc.cpp:499:10: error: variable lengt=
h arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0499 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int xLo[X=
], xHi[X];<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lists.libcamera.org/piperma=
il/libcamera-devel/2024-February/040529.html" rel=3D"noreferrer" target=3D"=
_blank">https://lists.libcamera.org/pipermail/libcamera-devel/2024-February=
/040529.html</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-<br>
-s<br>
----<br>
- src/ipa/rpi/controller/rpi/alsc.cpp | 7 +++++--<br>
- 1 file changed, 5 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/ipa/rpi/controller/rpi/alsc.cpp b/src/ipa/rpi/controller/=
rpi/alsc.cpp<br>
-index 8a205c60..a7d42614 100644<br>
---- a/src/ipa/rpi/controller/rpi/alsc.cpp<br>
-+++ b/src/ipa/rpi/controller/rpi/alsc.cpp<br>
-@@ -496,8 +496,8 @@ void resampleCalTable(const Array2D&lt;double&gt; &amp=
;calTableIn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Precalculate and cache the x sampling locati=
ons and phases to save<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * recomputing them on every row.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 int xLo[X], xHi[X];<br>
--=C2=A0 =C2=A0 =C2=A0 double xf[X];<br>
-+=C2=A0 =C2=A0 =C2=A0 int *xLo =3D (int*)malloc(X), *xHi =3D (int*)malloc(=
X);<br>
-+=C2=A0 =C2=A0 =C2=A0 double *xf =3D (double*)malloc(X);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0double scaleX =3D cameraMode.sensorWidth /<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(cameraMode.width * cameraMode.scaleX);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0double xOff =3D cameraMode.cropX / (double)came=
raMode.sensorWidth;<br>
-@@ -539,6 +539,9 @@ void resampleCalTable(const Array2D&lt;double&gt; &amp=
;calTableIn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*(out++) =3D above * (1 - yf) + below * yf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 free(xf);<br>
-+=C2=A0 =C2=A0 =C2=A0 free(xHi);<br>
-+=C2=A0 =C2=A0 =C2=A0 free(xLo);<br>
- }<br>
- <br>
- /* Calculate chrominance statistics (R/G and B/G) for each region. */<br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-op=
tions-Replace-use-of-VLAs-in-C.patch b/meta-multimedia/recipes-multimedia/l=
ibcamera/libcamera/0002-options-Replace-use-of-VLAs-in-C.patch<br>
deleted file mode 100644<br>
index 473820653e..0000000000<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-options-R=
eplace-use-of-VLAs-in-C.patch<br>
+++ /dev/null<br>
@@ -1,128 +0,0 @@<br>
-From 6e4736180fcaffdb06acf52fd3eb50ba5baa3d2a Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 31 Jan 2024 21:04:28 -0800<br>
-Subject: [PATCH] options: Replace use of VLAs in C++<br>
-<br>
-Clang++ 18 is fussy about this with new warning checks.<br>
-<br>
-=C2=A0 =C2=A0../git/src/apps/common/options.cpp:882:20: error: variable le=
ngth arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]<br>
-=C2=A0 =C2=A0 =C2=A0 882 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char shortOpti=
ons[optionsMap_.size() * 3 + 2];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~=
~~~~~~~~~~<br>
-<br>
-Therefore replace using VLAs with alloca and malloc/free<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://lists.libcamera.org/piperma=
il/libcamera-devel/2024-February/040381.html" rel=3D"noreferrer" target=3D"=
_blank">https://lists.libcamera.org/pipermail/libcamera-devel/2024-February=
/040381.html</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/apps/common/options.cpp=C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++--<br>
- src/libcamera/ipc_unixsocket.cpp | 13 +++++++++----<br>
- 2 files changed, 19 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/src/apps/common/options.cpp b/src/apps/common/options.cpp<br>
-index 4f7e8691..3656f3c1 100644<br>
---- a/src/apps/common/options.cpp<br>
-+++ b/src/apps/common/options.cpp<br>
-@@ -879,8 +879,8 @@ OptionsParser::Options OptionsParser::parse(int argc, =
char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Allocate short and long options arrays large=
 enough to contain all<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * options.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 char shortOptions[optionsMap_.size() * 3 + 2];<br>
--=C2=A0 =C2=A0 =C2=A0 struct option longOptions[optionsMap_.size() + 1];<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 char *shortOptions =3D (char*)malloc(optionsMap_.siz=
e() * 3 + 2);<br>
-+=C2=A0 =C2=A0 =C2=A0 struct option *longOptions =3D (struct option*)mallo=
c(sizeof(struct option) * (optionsMap_.size() + 1));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ids =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int idl =3D 0;<br>
- <br>
-@@ -935,12 +935,16 @@ OptionsParser::Options OptionsParser::parse(int argc=
, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0std::cerr &lt;&lt; argv[optind - 1] &lt;&lt; std::endl;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0usage();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(shortOptions);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(longOptions);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return options;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const Option &amp;o=
ption =3D *optionsMap_[c];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!parseValue(opt=
ion, optarg, &amp;options)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0usage();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(shortOptions);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(longOptions);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return options;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -949,10 +953,14 @@ OptionsParser::Options OptionsParser::parse(int argc=
, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::cerr &lt;&lt; =
&quot;Invalid non-option argument &#39;&quot; &lt;&lt; argv[optind]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;&lt; &quot;&#39;&quot; &lt;&lt; std::endl;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(shortOptions);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(longOptions);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return options;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0options.valid_ =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 free(shortOptions);<br>
-+=C2=A0 =C2=A0 =C2=A0 free(longOptions);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return options;<br>
- }<br>
- <br>
-diff --git a/src/libcamera/ipc_unixsocket.cpp b/src/libcamera/ipc_unixsock=
et.cpp<br>
-index 1980d374..3bd861cb 100644<br>
---- a/src/libcamera/ipc_unixsocket.cpp<br>
-+++ b/src/libcamera/ipc_unixsocket.cpp<br>
-@@ -8,6 +8,7 @@<br>
- #include &quot;libcamera/internal/ipc_unixsocket.h&quot;<br>
- <br>
- #include &lt;array&gt;<br>
-+#include &lt;cstdint&gt;<br>
- #include &lt;poll.h&gt;<br>
- #include &lt;string.h&gt;<br>
- #include &lt;sys/socket.h&gt;<br>
-@@ -247,8 +248,8 @@ int IPCUnixSocket::sendData(const void *buffer, size_t=
 length,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iov[0].iov_base =3D const_cast&lt;void *&gt;(bu=
ffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iov[0].iov_len =3D length;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 char buf[CMSG_SPACE(num * sizeof(uint32_t))];<br>
--=C2=A0 =C2=A0 =C2=A0 memset(buf, 0, sizeof(buf));<br>
-+=C2=A0 =C2=A0 =C2=A0 char *buf =3D (char*)malloc(CMSG_SPACE(num * sizeof(=
uint32_t)));<br>
-+=C2=A0 =C2=A0 =C2=A0 memset((void*)buf, 0, sizeof(buf));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cmsghdr *cmsg =3D (struct cmsghdr *)buf;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmsg-&gt;cmsg_len =3D CMSG_LEN(num * sizeof(uin=
t32_t));<br>
-@@ -270,9 +271,11 @@ int IPCUnixSocket::sendData(const void *buffer, size_=
t length,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -errno;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG(IPCUnixSocket, =
Error)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&lt;&lt; &quot;Failed to sendmsg: &quot; &lt;&lt; strerror(-ret);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
-@@ -283,8 +286,8 @@ int IPCUnixSocket::recvData(void *buffer, size_t lengt=
h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iov[0].iov_base =3D buffer;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iov[0].iov_len =3D length;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 char buf[CMSG_SPACE(num * sizeof(uint32_t))];<br>
--=C2=A0 =C2=A0 =C2=A0 memset(buf, 0, sizeof(buf));<br>
-+=C2=A0 =C2=A0 =C2=A0 char *buf =3D (char*)malloc(CMSG_SPACE(num * sizeof(=
uint32_t)));<br>
-+=C2=A0 =C2=A0 =C2=A0 memset((void*)buf, 0, sizeof(buf));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cmsghdr *cmsg =3D (struct cmsghdr *)buf;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmsg-&gt;cmsg_len =3D CMSG_LEN(num * sizeof(uin=
t32_t));<br>
-@@ -305,12 +308,14 @@ int IPCUnixSocket::recvData(void *buffer, size_t len=
gth,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D -EAGAI=
N)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0LOG(IPCUnixSocket, Error)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot;Failed to recvmsg: &qu=
ot; &lt;&lt; strerror(-ret);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fds)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(fds, CMSG_DA=
TA(cmsg), num * sizeof(uint32_t));<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http:/=
/libcamera_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.2.0.b=
b</a> b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libc=
amera_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.4.0.bb</a>=
<br>
similarity index 84%<br>
rename from meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://=
libcamera_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.2.0.bb=
</a><br>
rename to meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://li=
bcamera_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.4.0.bb</=
a><br>
index 45d6be31ec..682e56739f 100644<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.2.0.bb</a><b=
r>
+++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.4.0.bb</a><b=
r>
@@ -11,12 +11,9 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.libcamera.org=
/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferre=
r" target=3D"_blank">git.libcamera.org/libcamera/libcamera.git;protocol=3Dh=
ttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-media_device-Add-bool-return-=
type-to-unlock.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-options-Replace-use-of-VLAs-in-C.p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rpi-Use-alloca-instead-of-variable=
-length-arrays.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ipu3-Use-posix-basename.patch \<br=
>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;89227a428a82e724548399d35c98ea89566f9045&quot;<br>
+SRCREV =3D &quot;35ed4b91291d9f3d08e4b51acfb51163e65df8f8&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
@@ -25,10 +22,11 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0DEPENDS =3D &quot;python3-pyyaml-native python3-jinja2-native python3=
-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libya=
ml&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;qt&#39;, &#39;qtbase qtbase-native&#39;, &#39;&#39;, d)}&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-gst&quot;<br>
+PACKAGES =3D+ &quot;${PN}-gst ${PN}-pycamera&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[gst] =3D &quot;-Dgstreamer=3Denabled,-Dgstreamer=3Ddisa=
bled,gstreamer1.0 gstreamer1.0-plugins-base&quot;<br>
+PACKAGECONFIG[pycamera] =3D &quot;-Dpycamera=3Denabled,-Dpycamera=3Ddisabl=
ed,python3 python3-pybind11&quot;<br>
<br>
=C2=A0LIBCAMERA_PIPELINES ??=3D &quot;auto&quot;<br>
<br>
@@ -46,7 +44,7 @@ RDEPENDS:${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;wayland qt&#39;, &#39;qtwayla<br>
=C2=A0inherit meson pkgconfig python3native<br>
<br>
=C2=A0do_configure:prepend() {<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s|py_compile=3DTrue,||&#39; ${S}/utils/ipc/mo=
jo/public/tools/mojom/mojom/generate/template_expander.py<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|py_compile=3DTrue,||&#39; ${S}/utils/codege=
n/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append() {<br>
@@ -72,6 +70,7 @@ do_package_recalculate_ipa_signatures() {<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; ${libexecdir}/libcamera/v4l2-compat.so&quot;<=
br>
=C2=A0FILES:${PN}-gst =3D &quot;${libdir}/gstreamer-1.0&quot;<br>
+FILES:${PN}-pycamera =3D &quot;${PYTHON_SITEPACKAGES_DIR}/libcamera&quot;<=
br>
<br>
=C2=A0# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access=
 to<br>
=C2=A0# both 32 and 64 bit file APIs.<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#114996): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114996" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/114996</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110715612/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110715612/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001d54bb062c26d30a--

