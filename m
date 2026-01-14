Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EA8D3CC86
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 22:15:58 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22812.1768428954845283039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 14:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kbMboHd1;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3f13043e2fdso105098fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768428954; x=1769033754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEatGLFyQ6x/t7/W0NQ9xoXZnZNNbhCvfnle57mpwbE=;
        b=kbMboHd1NPqMI5sR0x3MmE6K0nILGs9Z9IpcU2MLBQZHfQGofj5uj3Jbu3DOsAE41q
         0yqH9+HM1fExrOQKW46xZjsW9NXVWSO+ucWDN6zy1uG2efw67HHFJBiY67CYf/JLDA0e
         G0eywwell8hklYQ+VXuv9KjwEwYrSyhGE51lOU+pnKgKrHI9XyhdIDFw8T665cq+9YXT
         9PbIt2ohtmOi31kTJoJ0xjcGBNufwrJxxrfbi1zSc3gIOlfAHf9K4ygvwGzlpT1H7zW7
         u3/f5Fm3/RzWQZs+55YZ71r/vTlCguoHQNNZgjLSVaPzzyRLsKpOiBdMb/+xhb/tQSqt
         xJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428954; x=1769033754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEatGLFyQ6x/t7/W0NQ9xoXZnZNNbhCvfnle57mpwbE=;
        b=bIr86Nes1Yqk9GDhjOb2sKJSv7HIOoRjzHRvjCFyuOFKUrKTSKK4PX2B7i366+Rg8Y
         Mh/Wu1naB627Ojd9hJumawJqqzW7FyPLNGiM5OB6zEPGl7CXD9ft7CLZro1oEXnuzy3p
         xc2+vV0SMcNxD6JfF0+rnN3yRgQ7UtvIbIVZcyUvoE0X5hGJVwIYjnY9CBzeBP95HwTD
         cAa+sgZRKtpavJM9GpX1KMQ/6DhHiH2fwWDkKhRqUflShUSqVhTkKS3joPBQ1pkLeOZA
         ym/juAoD68zFZ+V3c38d2F6oJmOgliO4RiJnY7h3akG+rEy6WZ3Q33YgzbS5p5RLX+90
         zMRg==
X-Gm-Message-State: AOJu0Yy39exDe37yJ+pdq8+oojewmVzEUcSo6M/mvVFBKLbt0MRmD1ux
	0dZScSrlEs8kAAviSa/+Jzmu0xe5NLyDVRciVkvsF6km2E2jkn6nlbPv6dumYPEdQzITJsKPE8f
	9z0lFsy159guFZ23V4z8Qvo2RbigRoSDNfA==
X-Gm-Gg: AY/fxX7/dAzqK36DbCyBUBoF2I5iALy0K2pOAiVMxPiun7opP8AiQF1t3PLBoDy7eUi
	kyGGZDi1w9bWrHjMwrNWISXjK903ToLllwHTU2mDVrpBHb+DpRn+X/10tRUmQVSmWO3UhtTBbpv
	SoWHgIXAX0wutzatexJ3ZBI0FYGT9d8hYt+L1M0QbjoglHINnOkhaWFFO0VC27z0oXwVkOVWTnP
	995UTpdJP6/vHV3X3RBuedKdPfFQdrUr5+cBpah4JnB1RzolB01RDUNBRsI9qB2lbmPtewj
X-Received: by 2002:a05:6808:23ce:b0:450:794a:6d05 with SMTP id
 5614622812f47-45c73e63897mr2333793b6e.66.1768428953945; Wed, 14 Jan 2026
 14:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20260114215656.1235700-1-raj.khem@gmail.com>
In-Reply-To: <20260114215656.1235700-1-raj.khem@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 15 Jan 2026 11:15:42 +1300
X-Gm-Features: AZwV_Qi5AuusbtgrPNBqjls3wEMWbCBa0E4-LNC3sQyZGpnMCc0DOpX9f55Qy1E
Message-ID: <CADySD0HrRW1ucc68sNc5+1u=+P=rf2gBGizGcyuhAY-UtdZn+w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade to 1.76.0
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 22:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123488

On Thu, Jan 15, 2026 at 10:57=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Backport a fix to build with latest gcc and clang
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...001-build-add-missing-includes-41351.patch | 58 +++++++++++++++++++
>  .../grpc/{grpc_1.71.0.bb =3D> grpc_1.76.0.bb}   |  7 ++-
>  2 files changed, 62 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-build-add-mis=
sing-includes-41351.patch
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.71.0.bb =3D> grpc_1.76.0.bb=
} (94%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-in=
cludes-41351.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-miss=
ing-includes-41351.patch
> new file mode 100644
> index 0000000000..bf1f22b906
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-=
41351.patch
> @@ -0,0 +1,58 @@
> +From a976f66ac7d1b9f43a3071e22b5014fcfeab04b3 Mon Sep 17 00:00:00 2001
> +From: "Mark D. Roth" <roth@google.com>
> +Date: Tue, 6 Jan 2026 10:09:45 -0800
> +Subject: [PATCH] [build] add missing includes (#41351)
> +
> +Fixes #41305.
> +
> +Closes #41351
> +
> +COPYBARA_INTEGRATE_REVIEW=3Dhttps://github.com/grpc/grpc/pull/41351 from=
 markdroth:add_missing_includes 223be6932adb00d085149c53167c1b0318745f6c
> +PiperOrigin-RevId: 852829597
> +
> +Upstream-Status: Backport [https://github.com/grpc/grpc/commit/d54219b50=
8423f0a2ff6a0b98c16fb6dafd44b84]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/grpc/event_engine/memory_request.h | 2 ++
> + src/core/channelz/v2tov1/property_list.cc  | 1 +
> + src/core/util/glob.cc                      | 2 ++
> + 3 files changed, 5 insertions(+)
> +
> +diff --git a/include/grpc/event_engine/memory_request.h b/include/grpc/e=
vent_engine/memory_request.h
> +index 76bcbb2036..ad8cab842e 100644
> +--- a/include/grpc/event_engine/memory_request.h
> ++++ b/include/grpc/event_engine/memory_request.h
> +@@ -17,6 +17,8 @@
> + #include <grpc/support/port_platform.h>
> + #include <stddef.h>
> +
> ++#include <string>
> ++
> + #include "absl/strings/string_view.h"
> +
> + namespace grpc_event_engine {
> +diff --git a/src/core/channelz/v2tov1/property_list.cc b/src/core/channe=
lz/v2tov1/property_list.cc
> +index 64bbb6307c..03367cce7c 100644
> +--- a/src/core/channelz/v2tov1/property_list.cc
> ++++ b/src/core/channelz/v2tov1/property_list.cc
> +@@ -15,6 +15,7 @@
> + #include "src/core/channelz/v2tov1/property_list.h"
> +
> + #include <cstdint>
> ++#include <limits>
> + #include <optional>
> + #include <string>
> +
> +diff --git a/src/core/util/glob.cc b/src/core/util/glob.cc
> +index 1b1c16e23d..22e54259f0 100644
> +--- a/src/core/util/glob.cc
> ++++ b/src/core/util/glob.cc
> +@@ -12,6 +12,8 @@
> + // See the License for the specific language governing permissions and
> + // limitations under the License.
> +
> ++#include <algorithm>
> ++
> + #include "absl/strings/string_view.h"
> +
> + namespace grpc_core {
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.76.0.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
> index 53867b8fe6..f05b2d9e83 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
> @@ -23,10 +23,11 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-co=
mpiler"
>  # Both dependencies are mutually exclusive
>  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>
> -SRCREV_grpc =3D "4e9357bca1408596663a218c0c608a4c0560a867"
> -BRANCH =3D "v1.71.x"
> -SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgr=
pc;branch=3D${BRANCH} \
> +SRCREV_grpc =3D "f5ffb68d8a2fd603dff16287e90a4ac571e1fec6"
> +BRANCH =3D "v1.76.x"
> +SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgr=
pc;branch=3D${BRANCH};tag=3Dv${PV} \
>             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
> +           file://0001-build-add-missing-includes-41351.patch \
>             "

Do we still need name=3Dgrpc in the SRC_URI?
IMO we can drop it and rename SRCREV as well.

>
>  inherit cmake pkgconfig
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123487): https://lists.openembedded.org/g/openembedde=
d-devel/message/123487
> Mute This Topic: https://lists.openembedded.org/mt/117269739/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

