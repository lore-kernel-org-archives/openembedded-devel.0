Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEA1C55191
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:44 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.10968.1649771805584087898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FvrZSRxU;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id e10so12120421qka.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vNMG4Jde6tS7gyxc+QsNUDPlRALDbqJyI46Qyfo0Qo4=;
        b=FvrZSRxUDUXF+pCrt6QTjFQDFK8Nu1Z2pSAA+Gkwb+gluYadWS3h29P9izbjxjB7oR
         V8CKXoVyiIsV0oY/DpsHP3UUzHbtQdOrymZZ7dLA/Ang4n3xQ1vA1lMSm0P/TsoGL3Mv
         ZcdljknoEy8sCQq8cgkZdZmmStjZk7Qhbfb+eQdLqHUA6YWAmq3k53ZekOune7AdhJ2K
         m6ZuATbeCwYjy9pK5BwNg4AzaNFUgn34hbU4PRM6mGb+H+NoAjYK3kAB/m4mrg6CRfHh
         h5SgrA3Zggy2kmsko0q9VlIC/lYZHbEp2YGPBy7ibDo9PW0zlRgJdHftKTCRSoLLAyQn
         KhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vNMG4Jde6tS7gyxc+QsNUDPlRALDbqJyI46Qyfo0Qo4=;
        b=cFGn+qA037wIN11LMlRBrmHlrkAeodKjnM/+m7vMA0xWuYOFNNpspPW6ehfMjn+7gd
         RQiHFhdhfSJV6/oaAA4lI7on1BeI75L05za4KLjmnwGd5SShdieoLXYYHsNTZT/i5eHq
         3UkcqotgiWmG0RCIj1bbMedasQlF/juCAOCp/60zhjVe46cCdGakQ1W6KVaf14c1NJpx
         xcMSg9KYOFdVZYvyVQZC5CjJwu5lSlPT0nBI3tERVhGgiI2+oL3zVLqptFahtGJ6JJTt
         mUdskxdOwaZm/eHE52E4LpGjDRL5WWuA9j0j44J45ibeIqoWYHZxgvDqOlZMrQ9VTe5S
         BMzw==
X-Gm-Message-State: AOAM530CmazD8DxZjloQUIOv0LLU3TpR6QB58J1vaV0O6fwOun3T+CRJ
	U8EA/WIHSTch2DgAMbwAWGaP7c3ZVAp/yXHT2NE=
X-Google-Smtp-Source: 
 ABdhPJyY5UQ3vewGxQunRDfICTLD97fGRYZaLZVi1x/imGTVx/TLrr7VBqj9ain8HEDEcEOOuMr0ZL9gx8MOhQwb98o=
X-Received: by 2002:a05:620a:460a:b0:69b:f4ce:e764 with SMTP id
 br10-20020a05620a460a00b0069bf4cee764mr3096356qkb.227.1649771804467; Tue, 12
 Apr 2022 06:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220407191438.3696227-1-stefan@datenfreihafen.org>
In-Reply-To: <20220407191438.3696227-1-stefan@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Apr 2022 06:56:18 -0700
Message-ID: 
 <CAMKF1sqT2ZBRU7q9ojY-Jq_PAJGEH5ntfU_ZbEixNRYFi3btvA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3 1/4] ot-br-posix: add recipe for
 an OpenThread Border Router
To: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96585

this fails with gcc ( especially with gcc12 )

https://errors.yoctoproject.org/Errors/Details/654559/

On Thu, Apr 7, 2022 at 12:15 PM Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
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
> In terms of patches we need a fix to allow building on musl + clang
> (CMSG_NXTHDR macro triggers a -Wsign-compare warning) and a systemd
> unit file change is OE specific and avoids having service dependencies
> implemented as pre exec hooks.
>
> Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> ---
> v3:
> - Dropped the musl include fixed which was merged upstream and we bumped =
the
>   version
> - Version bump also fixed a C++ deprecated-copy error I saw
> - Included new patch to fix CMSG_NXTHDR macro usage on musl+clang
>
>  ...ce.in-remove-pre-exec-hook-for-mdns-.patch |  35 +++++
>  .../Turn-off-sign-compare-for-musl-libc.patch | 131 ++++++++++++++++++
>  .../openthread/ot-br-posix_git.bb             |  59 ++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/Turn-off-sign-compare-for-musl-libc.patch
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
Turn-off-sign-compare-for-musl-libc.patch b/meta-networking/recipes-connect=
ivity/openthread/ot-br-posix/Turn-off-sign-compare-for-musl-libc.patch
> new file mode 100644
> index 000000000..df84550be
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/Turn-of=
f-sign-compare-for-musl-libc.patch
> @@ -0,0 +1,131 @@
> +From: Stefan Schmidt <stefan.schmidt@huawei.com>
> +Subject: Turn off sign compare for musl libc
> +
> +When building with musl and clang the usage of CMSG_NXTHDR results in
> +sign-compare error. Disable the check only in this specific part of the
> +code with a #pragma.
> +
> +| /home/stefan/huawei/yocto-upstream/yoe/workspace/sources/ot-br-posix/t=
hird_party/openthread/repo/src/posix/platform/udp.cpp:147:28: fatal error: =
comparison of integers of different signs: 'unsigned long' and 'long' [-Wsi=
gn-compare]
> +|         cmsg             =3D CMSG_NXTHDR(&msg, cmsg);
> +|                            ^~~~~~~~~~~~~~~~~~~~~~~
> +| /home/stefan/huawei/yocto-upstream/yoe/build/tmp/work/cortexa57-yoe-li=
nux-musl/ot-br-posix/0.3.0+git999-r0/recipe-sysroot/usr/include/sys/socket.=
h:358:44: note: expanded from macro 'CMSG_NXTHDR'
> +|         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D __MHDR_END(mhdr=
) - (unsigned char *)(cmsg) \
> +|         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
> +| 1 error generated.
> +
> +Idea and fix taken from
> +recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-l=
ibc.patch
> +by Khem Raj.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> +
> +diff --git a/src/backbone_router/nd_proxy.cpp b/src/backbone_router/nd_p=
roxy.cpp
> +index 7136878c3d..8a223c95c7 100644
> +--- a/src/backbone_router/nd_proxy.cpp
> ++++ b/src/backbone_router/nd_proxy.cpp
> +@@ -185,9 +185,18 @@ void NdProxyManager::ProcessMulticastNeighborSolici=
tion()
> +         VerifyOrExit(icmp6header->icmp6_type =3D=3D ND_NEIGHBOR_SOLICIT=
, error =3D OTBR_ERROR_PARSE);
> +
> +         otbrLogDebug("NdProxyManager: Received ND-NS from %s", src.ToSt=
ring().c_str());
> +-
> ++#ifndef __GLIBC__
> ++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
> ++  // clang to throw sign-compare warning. This is to suppress the warni=
ng
> ++  // inline.
> ++  #pragma clang diagnostic push
> ++  #pragma clang diagnostic ignored "-Wsign-compare"
> ++#endif
> +         for (cmsghdr =3D CMSG_FIRSTHDR(&msghdr); cmsghdr; cmsghdr =3D C=
MSG_NXTHDR(&msghdr, cmsghdr))
> +-        {
> ++#ifndef __GLIBC__
> ++  #pragma clang diagnostic pop
> ++#endif
> ++      {
> +             if (cmsghdr->cmsg_level !=3D IPPROTO_IPV6)
> +             {
> +                 continue;
> +Submodule third_party/openthread/repo contains modified content
> +diff --git a/third_party/openthread/repo/src/posix/platform/infra_if.cpp=
 b/third_party/openthread/repo/src/posix/platform/infra_if.cpp
> +index 9f93d2b1c..1ed40fe50 100644
> +--- a/third_party/openthread/repo/src/posix/platform/infra_if.cpp
> ++++ b/third_party/openthread/repo/src/posix/platform/infra_if.cpp
> +@@ -228,7 +228,17 @@ otError InfraNetif::SendIcmp6Nd(uint32_t           =
 aInfraIfIndex,
> +     packetInfo->ipi6_ifindex =3D mInfraIfIndex;
> +
> +     // Per section 6.1.2 of RFC 4861, we need to send the ICMPv6 messag=
e with IP Hop Limit 255.
> ++#ifndef __GLIBC__
> ++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
> ++  // clang to throw sign-compare warning. This is to suppress the warni=
ng
> ++  // inline.
> ++  #pragma clang diagnostic push
> ++  #pragma clang diagnostic ignored "-Wsign-compare"
> ++#endif
> +     cmsgPointer             =3D CMSG_NXTHDR(&msgHeader, cmsgPointer);
> ++#ifndef __GLIBC__
> ++  #pragma clang diagnostic pop
> ++#endif
> +     cmsgPointer->cmsg_level =3D IPPROTO_IPV6;
> +     cmsgPointer->cmsg_type  =3D IPV6_HOPLIMIT;
> +     cmsgPointer->cmsg_len   =3D CMSG_LEN(sizeof(hopLimit));
> +@@ -481,7 +491,17 @@ void InfraNetif::ReceiveIcmp6Message(void)
> +
> +     bufferLength =3D static_cast<uint16_t>(rval);
> +
> ++#ifndef __GLIBC__
> ++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
> ++  // clang to throw sign-compare warning. This is to suppress the warni=
ng
> ++  // inline.
> ++  #pragma clang diagnostic push
> ++  #pragma clang diagnostic ignored "-Wsign-compare"
> ++#endif
> +     for (cmh =3D CMSG_FIRSTHDR(&msg); cmh; cmh =3D CMSG_NXTHDR(&msg, cm=
h))
> ++#ifndef __GLIBC__
> ++  #pragma clang diagnostic pop
> ++#endif
> +     {
> +         if (cmh->cmsg_level =3D=3D IPPROTO_IPV6 && cmh->cmsg_type =3D=
=3D IPV6_PKTINFO &&
> +             cmh->cmsg_len =3D=3D CMSG_LEN(sizeof(struct in6_pktinfo)))
> +diff --git a/third_party/openthread/repo/src/posix/platform/udp.cpp b/th=
ird_party/openthread/repo/src/posix/platform/udp.cpp
> +index b7aacc5fa..a814fea70 100644
> +--- a/third_party/openthread/repo/src/posix/platform/udp.cpp
> ++++ b/third_party/openthread/repo/src/posix/platform/udp.cpp
> +@@ -144,8 +144,18 @@ otError transmitPacket(int aFd, uint8_t *aPayload, =
uint16_t aLength, const otMes
> +     {
> +         struct in6_pktinfo pktinfo;
> +
> ++#ifndef __GLIBC__
> ++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
> ++  // clang to throw sign-compare warning. This is to suppress the warni=
ng
> ++  // inline.
> ++  #pragma clang diagnostic push
> ++  #pragma clang diagnostic ignored "-Wsign-compare"
> ++#endif
> +         cmsg             =3D CMSG_NXTHDR(&msg, cmsg);
> +-        cmsg->cmsg_level =3D IPPROTO_IPV6;
> ++#ifndef __GLIBC__
> ++  #pragma clang diagnostic pop
> ++#endif
> ++      cmsg->cmsg_level =3D IPPROTO_IPV6;
> +         cmsg->cmsg_type  =3D IPV6_PKTINFO;
> +         cmsg->cmsg_len   =3D CMSG_LEN(sizeof(pktinfo));
> +
> +@@ -200,7 +210,17 @@ otError receivePacket(int aFd, uint8_t *aPayload, u=
int16_t &aLength, otMessageIn
> +     VerifyOrExit(rval > 0, perror("recvmsg"));
> +     aLength =3D static_cast<uint16_t>(rval);
> +
> ++#ifndef __GLIBC__
> ++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
> ++  // clang to throw sign-compare warning. This is to suppress the warni=
ng
> ++  // inline.
> ++  #pragma clang diagnostic push
> ++  #pragma clang diagnostic ignored "-Wsign-compare"
> ++#endif
> +     for (struct cmsghdr *cmsg =3D CMSG_FIRSTHDR(&msg); cmsg !=3D nullpt=
r; cmsg =3D CMSG_NXTHDR(&msg, cmsg))
> ++#ifndef __GLIBC__
> ++  #pragma clang diagnostic pop
> ++#endif
> +     {
> +         if (cmsg->cmsg_level =3D=3D IPPROTO_IPV6)
> +         {
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> new file mode 100644
> index 000000000..d9f558d79
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
> +SRCREV =3D "ad6822257ffddbac295db97186e4ab449a2ed32a"
> +PV =3D "0.3.0+git${SRCPV}"
> +
> +SRC_URI =3D "gitsm://github.com/openthread/ot-br-posix.git;protocol=3Dht=
tps;branch=3Dmain \
> +           file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-md=
ns-.patch \
> +           file://Turn-off-sign-compare-for-musl-libc.patch \
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
> View/Reply Online (#96455): https://lists.openembedded.org/g/openembedded=
-devel/message/96455
> Mute This Topic: https://lists.openembedded.org/mt/90320831/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

