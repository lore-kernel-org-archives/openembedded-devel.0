Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64356C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 06:51:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.40305.1671691890768743249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 22:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6eVZkZB;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id s7so1155950plk.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxfoXnwys6w0oWSOlqedIb0aNl1lfLXjt35Q2uF1Jvw=;
        b=G6eVZkZBjCHyrg4GBqbNfJMKgy9kptTPyvCAQwZolY+RjdbT7ZdjZOd46v00MqoaE4
         wJjmvBvkMaRLQ17W/rGjTp/rvBtUQ3bb9Bsqo0awywlpIyNRT3FIoqw8YqDzcD7Nsd9J
         6eZ5H8vzo5LGlu4x2wlGxQ469avOODWTW8SONfA/0KiJ6omqsGIjPB+n4sE0WAaatn8W
         bj6r2N7+q1wW8n4sXzQIGvBmseD+ICPYQAEYCZQCagfIGU5QjANgIzdj+rMwph2+tt6O
         W/B5u/vCN53O2KR7Hc2G2Hoxln72derfTjLEk/SxPFArKknsy5Xl9K0LUoiIgcyj8NUu
         u97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxfoXnwys6w0oWSOlqedIb0aNl1lfLXjt35Q2uF1Jvw=;
        b=fszKnqljQP4qjPzJQ1WexlpDNu79XfBX1W4O+HQISC1QmFjR89l1CMLlIm5aX8IT1C
         OUyE+emjTMD82PteGNkPaFGYmG+uWD3Hq+bqinibYm/+gSUFcks/TzpMyu9DvUkcg/e/
         UXthPizpBc6+tVe6gat1DwJ3tqs0+a2UlDylf8qzgOBl+zshwuNmVwymxEmgG2KKsG/7
         5xxy0dzfjWi6216wKuXK29Ft7595JMKuK6xm9H3S1uPR28Ww98Wfe9fKb6T2Oz+w1j8I
         B1ayL4/2QNB1481XsQL+bRrnfgtLlKA+1uCu6tB/+HdDrIiTtYV3PUgMTwhxDB7WSTTG
         03vw==
X-Gm-Message-State: AFqh2kptw2IV1F4S/ZM1Pv3l9bwSx7CaL2IDie8W8viPvZU2X/87orlY
	cYy0+muBVOjPGSDYxKDFR5R/pYC9gzk=
X-Google-Smtp-Source: AMrXdXuh9FxkL4eRJYTm6vWyCj+JZtMSatWruPQN486R6Nr1BJpHnZJKO6wWCPX6cgnJ2U7Y+it+6Q==
X-Received: by 2002:a17:90a:5d08:b0:219:4578:6409 with SMTP id s8-20020a17090a5d0800b0021945786409mr5227631pji.41.1671691889288;
        Wed, 21 Dec 2022 22:51:29 -0800 (PST)
Received: from localhost.localdomain ([122.170.226.200])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090a3f8a00b002195819d541sm2440503pjc.8.2022.12.21.22.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 22:51:28 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] capnproto: Fix CVE-2022-46149
Date: Thu, 22 Dec 2022 12:21:22 +0530
Message-Id: <20221222065122.10079-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 06:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100186

From: Virendra Thakur <virendrak@kpit.com>

This patch contains a fix for CVE-2022-46149

Patch backported from :
https://github.com/capnproto/capnproto/commit/25d34c67863fd960af34fc4f82a7ca3362ee74b9

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../capnproto/capnproto_0.7.0.bb              |  4 +-
 .../capnproto/files/CVE-2022-46149.patch      | 49 +++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
index cb748d3cb..fa1751e56 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
@@ -5,7 +5,9 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
+           file://CVE-2022-46149.patch \
+"
 SRCREV = "3f44c6db0f0f6c0cab0633f15f15d0a2acd01d19"
 
 S = "${WORKDIR}/git/c++"
diff --git a/meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch b/meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch
new file mode 100644
index 000000000..b6b1fa651
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch
@@ -0,0 +1,49 @@
+From 25d34c67863fd960af34fc4f82a7ca3362ee74b9 Mon Sep 17 00:00:00 2001
+From: Kenton Varda <kenton@cloudflare.com>
+Date: Wed, 23 Nov 2022 12:02:29 -0600
+Subject: [PATCH] Apply data offset for list-of-pointers at access time rather
+ than ListReader creation time.
+
+Baking this offset into `ptr` reduced ops needed at access time but made the interpretation of `ptr` inconsistent depending on what type of list was expected.
+
+CVE: CVE-2022-46149
+Upstream-Status: Backport [https://github.com/capnproto/capnproto/commit/25d34c67863fd960af34fc4f82a7ca3362ee74b9]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ c++/src/capnp/layout.c++ | 4 ----
+ c++/src/capnp/layout.h   | 6 +++++-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+Index: c++/src/capnp/layout.c++
+===================================================================
+--- c++.orig/src/capnp/layout.c++
++++ c++/src/capnp/layout.c++
+@@ -2322,10 +2322,6 @@ struct WireHelpers {
+             break;
+ 
+           case ElementSize::POINTER:
+-            // We expected a list of pointers but got a list of structs.  Assuming the first field
+-            // in the struct is the pointer we were looking for, we want to munge the pointer to
+-            // point at the first element's pointer section.
+-            ptr += tag->structRef.dataSize.get();
+             KJ_REQUIRE(tag->structRef.ptrCount.get() > ZERO * POINTERS,
+                        "Expected a pointer list, but got a list of data-only structs.") {
+               goto useDefault;
+Index: c++/src/capnp/layout.h
+===================================================================
+--- c++.orig/src/capnp/layout.h
++++ c++/src/capnp/layout.h
+@@ -1235,8 +1235,12 @@ inline Void ListReader::getDataElement<V
+ }
+ 
+ inline PointerReader ListReader::getPointerElement(ElementCount index) const {
++  // If the list elements have data sections we need to skip those. Note that for pointers to be
++  // present at all (which already must be true if we get here), then `structDataSize` must be a
++  // whole number of words, so we don't have to worry about unaligned reads here.
++  auto offset = structDataSize / BITS_PER_BYTE;
+   return PointerReader(segment, capTable, reinterpret_cast<const WirePointer*>(
+-      ptr + upgradeBound<uint64_t>(index) * step / BITS_PER_BYTE), nestingLimit);
++      ptr + offset + upgradeBound<uint64_t>(index) * step / BITS_PER_BYTE), nestingLimit);
+ }
+ 
+ // -------------------------------------------------------------------
-- 
2.17.1


