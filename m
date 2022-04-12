Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F33C35280
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.2459.1649801006278276290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZzKAMZjX;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so43654pjk.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zR8KeN7EPPh0pfVF9C6AhTOh/JSB2yyUHWU24YhzvnQ=;
        b=ZzKAMZjXgbnIBw94BzvpknXaOhfB8PXzULtOeXm8F+GwWqRFKqHzbt7OkCRg6Vyiig
         Wq8lv1vns/+mUFbiEGus5Yo8XfzdcI1tRN6KwzGcEBZCMmaje5puDsJMpxueCpE5eq3j
         97VJFnnORMnMpZI+FNrciEV/3tZQyhHYO9GZcJEmwQlfP7TEBXXtZVFKkYf603cr1N7W
         6tZYVVmmRNJmx199+RCCMdZZGLLTnCI4mek9r2WGPImAVgKBdxpk7JcWTJWOfwcuM3XQ
         zEXNJWIMdaCRAKNQoy6uaBG70O5nKHlNKALhTsdr3TvkD9bfszEsGe+ILFAczGyMh+GD
         Nidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zR8KeN7EPPh0pfVF9C6AhTOh/JSB2yyUHWU24YhzvnQ=;
        b=e/7jgdgFcsiBX0Ezy8OcHPDxmaaN2CWCPeVCTynEs6SkGlMXa2WdFIiSjOkWSXwesN
         Hb1Qygphn1F22KdSFNaVTyZYIZ6zNPP6K2tO2uVInEuG0Y7a4mM+YkdE+3F5I2fk8XIH
         UueBeujxLI+/Otcn34beE8j4wi4Zj+BtjUms5LptYpMxCRgZZFFNJJJ37agPJuqGfJo2
         XERYrRF0Rdjyd/5y0WwAJrTmNrzuEeKGLy6ugFVbX5ox/ioAg4yiYMUxNsVz+CDS3S6I
         Cev4Bs/TasNU/uxSZSC+ntTOCo5lhvHZV+ySXfVGuxAwl4S0VRicLYU4tMgTHxYIsZ28
         haYA==
X-Gm-Message-State: AOAM532yjhD+UxsNpF9s9BwwK99gbWkXDtYpWqpp1Bx4+yKHLWh7q1Ew
	Qc7Tz3FvtfNgCUCbRUrYSKLuIs5RE1GYXw==
X-Google-Smtp-Source: 
 ABdhPJxHGXrudWAjdwx4ewm4urSvqrjqiC5TjJ5v3JoMlbj7W2foPas7r3IDUgLF2ASmJvux5S9bWg==
X-Received: by 2002:a17:90b:4b11:b0:1cb:2a65:f275 with SMTP id
 lx17-20020a17090b4b1100b001cb2a65f275mr7329277pjb.33.1649801005439;
        Tue, 12 Apr 2022 15:03:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 7/7] ot-br-posix: Disable Wsign-compare for
 clang
Date: Tue, 12 Apr 2022 15:03:16 -0700
Message-Id: <20220412220316.3876985-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96600

Specify is via CXXFLAGS instead of pragma dance.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../Turn-off-sign-compare-for-musl-libc.patch | 131 ------------------
 .../openthread/ot-br-posix_git.bb             |   3 +-
 2 files changed, 2 insertions(+), 132 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/Turn-off-sign-compare-for-musl-libc.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/Turn-off-sign-compare-for-musl-libc.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/Turn-off-sign-compare-for-musl-libc.patch
deleted file mode 100644
index df84550be0..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/Turn-off-sign-compare-for-musl-libc.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From: Stefan Schmidt <stefan.schmidt@huawei.com>
-Subject: Turn off sign compare for musl libc
-
-When building with musl and clang the usage of CMSG_NXTHDR results in
-sign-compare error. Disable the check only in this specific part of the
-code with a #pragma.
-
-| /home/stefan/huawei/yocto-upstream/yoe/workspace/sources/ot-br-posix/third_party/openthread/repo/src/posix/platform/udp.cpp:147:28: fatal error: comparison of integers of different signs: 'unsigned long' and 'long' [-Wsign-compare]
-|         cmsg             = CMSG_NXTHDR(&msg, cmsg);
-|                            ^~~~~~~~~~~~~~~~~~~~~~~
-| /home/stefan/huawei/yocto-upstream/yoe/build/tmp/work/cortexa57-yoe-linux-musl/ot-br-posix/0.3.0+git999-r0/recipe-sysroot/usr/include/sys/socket.h:358:44: note: expanded from macro 'CMSG_NXTHDR'
-|         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >= __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
-|         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-Idea and fix taken from
-recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
-by Khem Raj.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
-
-diff --git a/src/backbone_router/nd_proxy.cpp b/src/backbone_router/nd_proxy.cpp
-index 7136878c3d..8a223c95c7 100644
---- a/src/backbone_router/nd_proxy.cpp
-+++ b/src/backbone_router/nd_proxy.cpp
-@@ -185,9 +185,18 @@ void NdProxyManager::ProcessMulticastNeighborSolicition()
-         VerifyOrExit(icmp6header->icmp6_type == ND_NEIGHBOR_SOLICIT, error = OTBR_ERROR_PARSE);
- 
-         otbrLogDebug("NdProxyManager: Received ND-NS from %s", src.ToString().c_str());
--
-+#ifndef __GLIBC__
-+  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
-+  // clang to throw sign-compare warning. This is to suppress the warning
-+  // inline.
-+  #pragma clang diagnostic push
-+  #pragma clang diagnostic ignored "-Wsign-compare"
-+#endif
-         for (cmsghdr = CMSG_FIRSTHDR(&msghdr); cmsghdr; cmsghdr = CMSG_NXTHDR(&msghdr, cmsghdr))
--        {
-+#ifndef __GLIBC__
-+  #pragma clang diagnostic pop
-+#endif
-+	{
-             if (cmsghdr->cmsg_level != IPPROTO_IPV6)
-             {
-                 continue;
-Submodule third_party/openthread/repo contains modified content
-diff --git a/third_party/openthread/repo/src/posix/platform/infra_if.cpp b/third_party/openthread/repo/src/posix/platform/infra_if.cpp
-index 9f93d2b1c..1ed40fe50 100644
---- a/third_party/openthread/repo/src/posix/platform/infra_if.cpp
-+++ b/third_party/openthread/repo/src/posix/platform/infra_if.cpp
-@@ -228,7 +228,17 @@ otError InfraNetif::SendIcmp6Nd(uint32_t            aInfraIfIndex,
-     packetInfo->ipi6_ifindex = mInfraIfIndex;
- 
-     // Per section 6.1.2 of RFC 4861, we need to send the ICMPv6 message with IP Hop Limit 255.
-+#ifndef __GLIBC__
-+  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
-+  // clang to throw sign-compare warning. This is to suppress the warning
-+  // inline.
-+  #pragma clang diagnostic push
-+  #pragma clang diagnostic ignored "-Wsign-compare"
-+#endif
-     cmsgPointer             = CMSG_NXTHDR(&msgHeader, cmsgPointer);
-+#ifndef __GLIBC__
-+  #pragma clang diagnostic pop
-+#endif
-     cmsgPointer->cmsg_level = IPPROTO_IPV6;
-     cmsgPointer->cmsg_type  = IPV6_HOPLIMIT;
-     cmsgPointer->cmsg_len   = CMSG_LEN(sizeof(hopLimit));
-@@ -481,7 +491,17 @@ void InfraNetif::ReceiveIcmp6Message(void)
- 
-     bufferLength = static_cast<uint16_t>(rval);
- 
-+#ifndef __GLIBC__
-+  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
-+  // clang to throw sign-compare warning. This is to suppress the warning
-+  // inline.
-+  #pragma clang diagnostic push
-+  #pragma clang diagnostic ignored "-Wsign-compare"
-+#endif
-     for (cmh = CMSG_FIRSTHDR(&msg); cmh; cmh = CMSG_NXTHDR(&msg, cmh))
-+#ifndef __GLIBC__
-+  #pragma clang diagnostic pop
-+#endif
-     {
-         if (cmh->cmsg_level == IPPROTO_IPV6 && cmh->cmsg_type == IPV6_PKTINFO &&
-             cmh->cmsg_len == CMSG_LEN(sizeof(struct in6_pktinfo)))
-diff --git a/third_party/openthread/repo/src/posix/platform/udp.cpp b/third_party/openthread/repo/src/posix/platform/udp.cpp
-index b7aacc5fa..a814fea70 100644
---- a/third_party/openthread/repo/src/posix/platform/udp.cpp
-+++ b/third_party/openthread/repo/src/posix/platform/udp.cpp
-@@ -144,8 +144,18 @@ otError transmitPacket(int aFd, uint8_t *aPayload, uint16_t aLength, const otMes
-     {
-         struct in6_pktinfo pktinfo;
- 
-+#ifndef __GLIBC__
-+  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
-+  // clang to throw sign-compare warning. This is to suppress the warning
-+  // inline.
-+  #pragma clang diagnostic push
-+  #pragma clang diagnostic ignored "-Wsign-compare"
-+#endif
-         cmsg             = CMSG_NXTHDR(&msg, cmsg);
--        cmsg->cmsg_level = IPPROTO_IPV6;
-+#ifndef __GLIBC__
-+  #pragma clang diagnostic pop
-+#endif
-+	cmsg->cmsg_level = IPPROTO_IPV6;
-         cmsg->cmsg_type  = IPV6_PKTINFO;
-         cmsg->cmsg_len   = CMSG_LEN(sizeof(pktinfo));
- 
-@@ -200,7 +210,17 @@ otError receivePacket(int aFd, uint8_t *aPayload, uint16_t &aLength, otMessageIn
-     VerifyOrExit(rval > 0, perror("recvmsg"));
-     aLength = static_cast<uint16_t>(rval);
- 
-+#ifndef __GLIBC__
-+  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
-+  // clang to throw sign-compare warning. This is to suppress the warning
-+  // inline.
-+  #pragma clang diagnostic push
-+  #pragma clang diagnostic ignored "-Wsign-compare"
-+#endif
-     for (struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg); cmsg != nullptr; cmsg = CMSG_NXTHDR(&msg, cmsg))
-+#ifndef __GLIBC__
-+  #pragma clang diagnostic pop
-+#endif
-     {
-         if (cmsg->cmsg_level == IPPROTO_IPV6)
-         {
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index d9f558d792..c1af388627 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -16,7 +16,6 @@ PV = "0.3.0+git${SRCPV}"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
-           file://Turn-off-sign-compare-for-musl-libc.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -24,6 +23,8 @@ SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
 
 inherit pkgconfig cmake systemd
 
+CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
+
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_DBUS=ON \
                  -DOTBR_REST=ON \
-- 
2.35.1


