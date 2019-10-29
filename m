Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A47D7FA4F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh31GbSzPG
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340019;
	bh=DGfYuHjsC1T57VSOqDRnq6WDZ9fz1fE6PzsodyZyG4Q=;
	h=From:To:Subject:Date:From;
	b=HCvazaBrGsdNHFqfNR7XxI11FPmqdmbqZvjENwiTk6RlKUdHxkOjm4GMu7kglNBD0
	z0Jx3ylD6hdu/d+MXM0IswBuZ4GyLN5DTUQUacRAj+N0oa5xmbLOVwOidhvNsbRDAv
	gOiQbwjgPRLDqpVQppoleJIeAhmPLgx4RyvLRAF+kuwiFvdSjDDLTsPtNcs3p+F+9z
	WxjvXbOzA3V/J7CpzowbjWFPQeBlmrOBRWmZFzBy0+nQDhF9S4lKvhMLw398NDv6/q
	rBN6uC+DaNk2odwNSQ4IbBf7b038hUwqhMo200Xtewa7+yO7pOWtyJ0cbK97j9jZY7
	1rkI/FiegOIp/XdnmfxDaCdWlHP318woM5J4H7CkrXbNS3UDwwVb/NWstxhkAh9j3X
	U7H8ANhUehRveXTB8Ue5i8qd1LDZqaeNp7PSnGG2Iv+d8IPgH4A7tOZ+eZBDZLph+L
	D0yzpNYxzKe3cX7qWmm2O/lZ7rVRfSGPn//W4MH5F7E9/NBG0CM8f2uJdMLXlfHWEP
	uXxkKblA037mTQQF9mSu7qFO5ixhZQpt3jFjRrjgocWNpAUWQXiVH4Lx+xhjzv5BTh
	TIsib38ywxjolnhhMeNNPQGc/4VEoWxQB+7ZzkVoENUNoum9K2HaHo04MCRvTZYfM2
	K6l7NorFYUs0LaEiGkr6n+3U=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:54 +0200
Message-Id: <20191029090657.30771-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] mdns: Mark as incompatible with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 09:06:59 -0000

musl does not support mDNS or NSS plugins.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...Do-not-include-nss.h-when-libc-glibc.patch | 42 -------------------
 .../recipes-protocols/mdns/mdns_878.200.35.bb |  3 +-
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch b/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
deleted file mode 100644
index 863866d18..000000000
--- a/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d3082d2c606c810aa0a39378bf1e02575af3a301 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Feb 2018 21:54:11 -0800
-Subject: [PATCH] nss_mdns: Do not include nss.h when libc != glibc
-
-Provide nss_status macro instead for non-glibc case
-where nss.h is absent
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mDNSPosix/nss_mdns.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
-index afadb3c..c469584 100755
---- a/mDNSPosix/nss_mdns.c
-+++ b/mDNSPosix/nss_mdns.c
-@@ -378,8 +378,19 @@ init_config ();
- 
- #define ENTNAME  hostent
- #define DATABASE "hosts"
--
-+#ifdef __GLIBC__
- #include <nss.h>
-+#else
-+enum nss_status
-+{
-+    NSS_STATUS_TRYAGAIN = -2,
-+    NSS_STATUS_UNAVAIL,
-+    NSS_STATUS_NOTFOUND,
-+    NSS_STATUS_SUCCESS,
-+    NSS_STATUS_RETURN
-+};
-+#define NETDB_INTERNAL NULL
-+#endif
- // For nss_status
- #include <netdb.h>
- // For hostent
--- 
-2.16.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
index 1bd17031a..1353b2bed 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
@@ -4,12 +4,13 @@ HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 RPROVIDES_${PN} += "libdns_sd.so"
 
 SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
            file://build.patch;patchdir=.. \
            file://mdns.service \
-           file://0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch;patchdir=.. \
            "
 SRC_URI[md5sum] = "e773f290a7d29f1072247985d6add2ff"
 SRC_URI[sha256sum] = "e777b4d7dbf5eb1552cb80090ad1ede319067ab6e45e3990d68aabf6e8b3f5a0"
-- 
2.17.1


