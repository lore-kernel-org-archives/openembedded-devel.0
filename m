Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0848BC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 18:35:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.11144.1644604516327950467
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 10:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fBfoRKo8;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id l19so11944729pfu.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0tgQRiofUkRAeU3Nj/gtkN/BBU+iW+j1jbDJcoxkfQ=;
        b=fBfoRKo8+Zv7gKi5sYFxieOhtIOXhBkLesa9GuSVpEqD8b/pDXz4HpbFxRRzzmGi2c
         Xl2UvW6ZCGKfe1VDMSmWX66NK98vCxjFml3WJsXzmlPDZboVtBdi7ViTB9Jo7N0rj9+D
         S18HEm4bKJxD/Kg45cGL4phv4E6QRb4wYeyMqfq7+ppAQGSqcV/pFnHRMr59jYgoFWtv
         id4rWygZhPCfOHUkvdNN7mHMcgqqijyUab09SjCxCMvk8WKtkJ/VvO+RDRuMIYM1cLqx
         VQYGJNRbYy/urrZ3YUgajRlUanFzO5ev4YPEK4LCW4g35LVBNRI941o09MxFlb/Nba8P
         HVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0tgQRiofUkRAeU3Nj/gtkN/BBU+iW+j1jbDJcoxkfQ=;
        b=nrkGLM0VAhif0JV1rPpiS1kzAypHDsf/a5EpbLF8ubrFJihggOjydnUvlBZ1Ba9uQ+
         u5GmLbIYxBQT6FfmbTaBMfVAFmIPJiTWQ9HlTEDWj+qWO08qLw0jT9U82b7+IcFHLiRP
         RpbqZoKauqbOod8OVXumPuniJy0u26x9HQlwRGDGgc9rcAVWmDmxJWRAjfqH/TBWicuH
         prSNjOGQa7oqDz602Nu0nBqH2S7QmQvykQ5V+koHQ8QOmjSuFgaC73mk2wMJEWzaXK6c
         QDB3Nf4KTJSJaoE1jRa/nfa0EydSEmo0bJuI+B92JXXMCfz8zGSamGKAEjNNbGZlE1xJ
         wjrg==
X-Gm-Message-State: AOAM531DeuiMHTyWsksT+o9KloNZramCIZ4sMdmnv3tyYN1mfOEpnQP9
	wG/FGwVUb2OM0kj/5iUDxxr0xvQLMWs4YA==
X-Google-Smtp-Source: 
 ABdhPJz83kh4WagGg8v8f6rVMwDnO50r3oHE5gocpM96D0yqsrN6VdABx95rZIX84Tzg12oIQ85p4g==
X-Received: by 2002:a63:88c3:: with SMTP id
 l186mr2412711pgd.326.1644604515389;
        Fri, 11 Feb 2022 10:35:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 m21sm19918791pgh.69.2022.02.11.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 10:35:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dhcp-relay: Package needed shared libs from
 bind
Date: Fri, 11 Feb 2022 10:35:13 -0800
Message-Id: <20220211183513.2566422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 18:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95301

Fixes
ERROR: QA Issue: /usr/sbin/dhcrelay contained in package dhcp-relay requires libisccfg.so.163, but no providers found in RDEPENDS:dhcp-relay? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb    | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
index c86926813d..8d4be95cfe 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
@@ -8,7 +8,8 @@ HOMEPAGE = "http://www.isc.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
 
-DEPENDS = "openssl libcap zlib"
+DEPENDS = "openssl libcap zlib chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
            https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;name=bind;unpack=0 \
@@ -62,8 +63,11 @@ do_compile:prepend() {
 }
 
 do_install:append () {
-    install -d ${D}${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+    install -Dm 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+    install -Dm 0755 ${B}/bind/bind-9.11.32/lib/isccfg/.libs/libisccfg.so.163 ${D}${libdir}/libisccfg.so.163
+    install -Dm 0755 ${B}/bind/bind-9.11.32/lib/dns/.libs/libdns.so.1115 ${D}${libdir}/libdns.so.1115
+    chrpath --delete ${D}${libdir}/libisccfg.so.163
+    chrpath --delete ${D}${libdir}/libdns.so.1115
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-- 
2.35.1


