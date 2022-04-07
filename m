Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00601C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:13 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.807.1649290853813685962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2WYXHD5;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id s7so6911857qtk.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lOiQzkeKqMwKyJUOLFYkjwTl+V+vUnicilVc9laeimc=;
        b=e2WYXHD55EvdoEfjqwn7RpgF3t9tR7fNgGb7TO1Zxsm1KQFkR8x3qNVQHz6dS5rDqf
         DBsrxNwzGGNfLrrS0JvZRM5i1UopG5GNvRQyBg4ILncIcl0hf6dW7Hydz5B/8xdPWeKQ
         kZxu2ieura598tjb/JV24c3iVTjlmeZD4OGRe8eakQP4rauw7UNAFAMywxquf62zXNp1
         1IGBkTg9QJYsYBgW52GezynRIgcbggphKjyVAWo+ls79noL5dIuLB3IfbKKcEaqTFKnI
         TyinPFEXYGIULZk5ZA1YuBW1Foh80dvEkqKChcL+O8axAm5J9SowDEsR3nyeCd7JFMJu
         LoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lOiQzkeKqMwKyJUOLFYkjwTl+V+vUnicilVc9laeimc=;
        b=AAj7sW5CXA/6lvwYah8F/p7Nqj8QnNpoN5fKiwjTkNOjHLBA0SbMt8u2yS3B+ekV1w
         niIL1z1Wt2pgcrDOCOXctma+SZ4L4DoYvP8XObBz2KEYqCBhBe5iJybKu3uLUu8Zgm3G
         xR2rkAsf8Bdm6UO2fFt+71pBZMxKC9xc7rXPGT5cvH7jiR6Hv+8ekthgzU+l1xkultYT
         v2Vvhz38Jz/v6ZARCCMvbuk0wvsclnsEaQCeL7wSK+OgyegNgNJqt3n8llOTJiVdfp9L
         v4krDWEvxZhGtNuUzV+/vcuAXsezRMgjFOu7+7IiucJB7XKDi5+hFLBh/jTeqxyzRmGV
         J25g==
X-Gm-Message-State: AOAM531TWmiy3BRaNd0S8gxk9NU0HpYPyjGs6gTWTKWMkrQL5+pxCFMD
	vGk+FK/QUCkvIlRkJDHAyXeDMHXDgcPoKLG/e/NesxA5Li5Y8A==
X-Google-Smtp-Source: 
 ABdhPJwcUZrGQQXHgPqK+tQdzI6zIPIA1eD54DFc/JPoQT+wOB3hmf+lgv3jIJO+qoB1vqfzqbXMJXCQz5lFfmY3t0c=
X-Received: by 2002:a05:622a:1052:b0:2e1:fe6b:377d with SMTP id
 f18-20020a05622a105200b002e1fe6b377dmr9656841qte.229.1649290852819; Wed, 06
 Apr 2022 17:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220405091219.1593707-1-stefan@datenfreihafen.org>
In-Reply-To: <20220405091219.1593707-1-stefan@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2022 20:20:27 -0400
Message-ID: 
 <CAMKF1sqXOTFTJiNTg5zYebfFDm8JL=OeorNQDY+N_hBo=TAn-Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2 1/4] ot-br-posix: add recipe for
 an OpenThread Border Router
To: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96443

still fails to build

https://errors.yoctoproject.org/Errors/Details/654012/

On Tue, Apr 5, 2022 at 5:12 AM Stefan Schmidt <stefan@datenfreihafen.org> w=
rote:
>
> From: Stefan Schmidt <stefan.schmidt@huawei.com>
>
> The OpenThread project is an open source implementation of the Thread
> low-power mesh network protocol. In a Thread network devices can have
> different roles, and of of these roles is a Border Router that allows a
> Thread network to be connected with other IP networks.
>
> Ot-br-posix runs as a systemd service on a standard Linux system to
> handle the connection to a Thread network.
>
> The small musl compile fix has been submitted upstream and is pending
> while the systemd unit file change is OE specific and avoids having
> service dependencies implemented as pre exec hooks.
>
> Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> ---
> v2:
> - Upstream status of one patch changed from pending to submitted
>
>  ...ce.in-remove-pre-exec-hook-for-mdns-.patch | 35 +++++++++++
>  ...lient-add-needed-header-for-fd_set-c.patch | 27 +++++++++
>  .../openthread/ot-br-posix_git.bb             | 59 +++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix_git.bb
>
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/=
0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch b/meta-netw=
orking/recipes-connectivity/openthread/ot-br-posix/0001-otbr-agent.service.=
in-remove-pre-exec-hook-for-mdns-.patch
> new file mode 100644
> index 000000000..250de4bdd
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-ot=
br-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
> @@ -0,0 +1,35 @@
> +From ed60d4605b81c43b9ba9504a37835109c247c6f8 Mon Sep 17 00:00:00 2001
> +From: Stefan Schmidt <stefan.schmidt@huawei.com>
> +Date: Fri, 1 Apr 2022 21:46:03 +0200
> +Subject: [PATCH] otbr-agent.service.in: remove pre exec hook for mdns se=
rvice
> +
> +It uses the service command which is not available in all cases under
> +Yocto/OE. The upstream project uses this mainly with Ubuntu and Raspian
> +as testbeds.
> +
> +In our case we simply ensure that avahi-daemon is installed on the
> +system inside the recipe.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> +---
> + src/agent/otbr-agent.service.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/agent/otbr-agent.service.in b/src/agent/otbr-agent.serv=
ice.in
> +index 8314121347..4c97869def 100644
> +--- a/src/agent/otbr-agent.service.in
> ++++ b/src/agent/otbr-agent.service.in
> +@@ -6,7 +6,7 @@ After=3Ddbus.socket
> +
> + [Service]
> + EnvironmentFile=3D-@CMAKE_INSTALL_FULL_SYSCONFDIR@/default/otbr-agent
> +-@EXEC_START_PRE@ExecStart=3D@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OT=
BR_AGENT_OPTS
> ++ExecStart=3D@CMAKE_INSTALL_FULL_SBINDIR@/otbr-agent $OTBR_AGENT_OPTS
> + KillMode=3Dmixed
> + Restart=3Don-failure
> + RestartSec=3D5
> +--
> +2.35.1
> +
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/=
0001-web-service-ot-client-add-needed-header-for-fd_set-c.patch b/meta-netw=
orking/recipes-connectivity/openthread/ot-br-posix/0001-web-service-ot-clie=
nt-add-needed-header-for-fd_set-c.patch
> new file mode 100644
> index 000000000..29f2af849
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-we=
b-service-ot-client-add-needed-header-for-fd_set-c.patch
> @@ -0,0 +1,27 @@
> +From 596eb2b582609794d87f2dbefa4b2e839faf52c8 Mon Sep 17 00:00:00 2001
> +From: Stefan Schmidt <stefan.schmidt@huawei.com>
> +Date: Fri, 28 May 2021 14:19:53 +0200
> +Subject: [PATCH] web-service/ot-client: add needed header for fd_set() c=
all
> +
> +The select.h header file is needed for fd_set(). Depending on the
> +compiler and settings this will result in an error when not included.
> +
> +Upstream-Status: Submitted [https://github.com/openthread/ot-br-posix/pu=
ll/1326]
> +
> +Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> +---
> + src/web/web-service/ot_client.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/web/web-service/ot_client.cpp b/src/web/web-service/ot_=
client.cpp
> +index f151a0126..173cc48e1 100644
> +--- a/src/web/web-service/ot_client.cpp
> ++++ b/src/web/web-service/ot_client.cpp
> +@@ -39,6 +39,7 @@
> + #include <string.h>
> + #include <sys/socket.h>
> + #include <sys/un.h>
> ++#include <sys/select.h>
> + #include <unistd.h>
> +
> + #include "common/code_utils.hpp"
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> new file mode 100644
> index 000000000..5247ad4db
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -0,0 +1,59 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +SUMMARY =3D "OpenThread Border Router"
> +SECTION =3D "net"
> +LICENSE =3D "BSD-3-Clause & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D87109e44b2fda96a8991f27684a73=
49c \
> +                    file://third_party/Simple-web-server/repo/LICENSE;md=
5=3D852b3f7f320b19f6431487b8b2fb1d74 \
> +                    file://third_party/cJSON/repo/LICENSE;md5=3D218947f7=
7e8cb8e2fa02918dc41c50d0 \
> +                    file://third_party/http-parser/repo/LICENSE-MIT;md5=
=3D9bfa835d048c194ab30487af8d7b3778 \
> +                    file://third_party/openthread/repo/LICENSE;md5=3D543=
b6fe90ec5901a683320a36390c65f \
> +                    "
> +DEPENDS =3D "autoconf-archive dbus readline avahi jsoncpp boost libnetfi=
lter-queue"
> +SRCREV =3D "9ef4e310b05ca0dbecb549e92ce7caa9d7461f19"
> +PV =3D "0.3.0+git${SRCPV}"
> +
> +SRC_URI =3D "gitsm://github.com/openthread/ot-br-posix.git;protocol=3Dht=
tps;branch=3Dmain \
> +           file://0001-web-service-ot-client-add-needed-header-for-fd_se=
t-c.patch \
> +           file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-md=
ns-.patch \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
> +
> +inherit pkgconfig cmake systemd
> +
> +EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF \
> +                 -DOTBR_DBUS=3DON \
> +                 -DOTBR_REST=3DON \
> +                 -DOTBR_WEB=3DOFF \
> +                 -DCMAKE_LIBRARY_PATH=3D${libdir} \
> +                 -DOTBR_MDNS=3Davahi \
> +                 -DOTBR_BACKBONE_ROUTER=3DON \
> +                 -DOTBR_BORDER_ROUTING=3DON \
> +                 -DOTBR_SRP_ADVERTISING_PROXY=3DON \
> +                 -DOTBR_BORDER_AGENT=3DON \
> +                 -DOT_SPINEL_RESET_CONNECTION=3DON \
> +                 -DOT_TREL=3DON \
> +                 -DOT_MLR=3DON \
> +                 -DOT_SRP_SERVER=3DON \
> +                 -DOT_ECDSA=3DON \
> +                 -DOT_SERVICE=3DON \
> +                 -DOTBR_DUA_ROUTING=3DON \
> +                 -DOT_DUA=3DON \
> +                 -DOT_BORDER_ROUTING_NAT64=3DON \
> +                 -DOTBR_DNSSD_DISCOVERY_PROXY=3DON \
> +                 -DOTBR_INFRA_IF_NAME=3Deth0 \
> +                 -DOTBR_NO_AUTO_ATTACH=3D1 \
> +                 -DOT_REFERENCE_DEVICE=3DON \
> +                 -DOT_DHCP6_CLIENT=3DON \
> +                 -DOT_DHCP6_SERVER=3DON \
> +                 "
> +
> +RDEPENDS:${PN} =3D "iproute2 avahi-daemon"
> +
> +RCONFLICTS:${PN} =3D "ot-daemon"
> +
> +FILES:${PN} +=3D "${systemd_unitdir}/*"
> +FILES:${PN} +=3D "${datadir}/*"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96421): https://lists.openembedded.org/g/openembedded=
-devel/message/96421
> Mute This Topic: https://lists.openembedded.org/mt/90261621/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

