Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA23605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so445196pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CQXXZ44PNTeiJ1MPoueDr+2GUS6LTzH5lmciDo55gD4=;
	b=U90enSHxkBZSSL3IwIVFgcxQBAceM7KwkD2CwU7vEwP6R0jBl2iRPw4b65HUgqLviu
	3KvXvXdXGC/TgzV413zeHs49x3blvT21g0XYdDhM3s9vqiCrsx5Hl/qmkPVwaaxc8HZl
	Ha5aP0I693i26J97RiowxDpI3oilF9vn9binNZXluYmLvTuG9lD8ZJTXak9mZC1bKosN
	qKjN57VLB27765IvXBds+AcN1TGQiiAPDUMX+QGWxml7BYt81AzNZcI/fmUWZcYAhvex
	MBu2J9B98ytKi64TLxmln71WtrN/78tAswVvZ+WGvwCyL3o9TQD/Eo2dOwVtp9OvtSvN
	XCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CQXXZ44PNTeiJ1MPoueDr+2GUS6LTzH5lmciDo55gD4=;
	b=KDdG4MjQl+Bvx0nFitrftVWDjNWn4tl0dXJrm9XSwxMqKF8RZlXANImShfOwWZJk03
	Ism7DkStotJ7HdX+u7X7GhKtHwT7EFkPuuDeIIRqsZSIaOQxqKT+vD631bPCZYf/I3do
	h6mFgbcjSJnYGmx+/XEwYMMjbZmxUL1SUQrZGaeGAZ7I6DnweI+4KDvXcHmEQWg89Ykk
	KE4okXZkq4PYF+gtNq/h5lLNWHiU/vMwhlBHljgWk1d1GMx3RrlWszMSTIX0bU95jbvN
	0rvitfN254C3zWlGm2Wrnyur0ndSogHeUEayhC7uGMcqWdAxVt4/YUz3OmBR73QQ8DtW
	QvdA==
X-Gm-Message-State: AKaTC03sCJHgsfEdGw96lxAi0uz6apO0P+MD1fxxyZHPQz4v9Ee9vjYLnKL6lWgP5eEtXg==
X-Received: by 10.98.14.143 with SMTP id 15mr1902782pfo.11.1479892966060;
	Wed, 23 Nov 2016 01:22:46 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:57 -0800
Message-Id: <20161123092209.23699-37-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 37/49] flashrom: Remove redundant const qualifier
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:44 -0000

This is flagged by latest clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-ichspi.c-Fix-build-with-clang.patch       | 29 ++++++++++++++++++++++
 .../recipes-extended/flashrom/flashrom_0.9.6.1.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch

diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
new file mode 100644
index 0000000..ff16f0b
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
@@ -0,0 +1,29 @@
+From a2f603c54013cd0b04bb0103dc615644f315d5e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Nov 2016 17:39:24 +0000
+Subject: [PATCH] ichspi.c: Fix build with clang
+
+ichspi.c:1130:24: error: duplicate 'const' declaration specifier [-Werror,-Wduplicate-decl-specifier]
+        static const uint32_t const dec_berase[4] = {
+                              ^
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ichspi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ichspi.c b/ichspi.c
+index 0223ae3..e47aebd 100644
+--- a/ichspi.c
++++ b/ichspi.c
+@@ -1127,7 +1127,7 @@ static void ich_hwseq_set_addr(uint32_t addr)
+ static uint32_t ich_hwseq_get_erase_block_size(unsigned int addr)
+ {
+ 	uint8_t enc_berase;
+-	static const uint32_t const dec_berase[4] = {
++	static const uint32_t dec_berase[4] = {
+ 		256,
+ 		4 * 1024,
+ 		8 * 1024,
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
index d3ec578..0edc688 100644
--- a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
+++ b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
            file://0001-Fix-compilation-on-aarch64.patch \
            file://0002-Disable-Wtautological-pointer-compare-when-using-cla.patch \
            file://0003-remove-duplicate-const-qualifiers.patch \
+           file://0001-ichspi.c-Fix-build-with-clang.patch \
            "
 
 SRC_URI[md5sum] = "407e836c0a2b17ec76583cb6809f65e5"
-- 
2.10.2


