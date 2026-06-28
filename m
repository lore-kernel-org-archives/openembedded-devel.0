Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D385C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69159.1782634369874526719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gnp3ecKi;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30c965eab27so3695658eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634369; x=1783239169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilD9FgnkGdqe5GqMnY5Ul/aeY+OYY8Ec4Cj/SXeSGYw=;
        b=Gnp3ecKi5dlY7nLWGJneXKl2CiFkyGCenHA0/OIsBxVwORrjsGktFjpTfKa6rhaTSv
         ODDY6VAtMBWOsb2PJswE/ub8nNdCDUGabpWw0Knl7FrkAjvYgNEcOEOp+8xk0H3Q9yKp
         cDawwk/4vZGSH/uIyZeouCtOZVFUgmQ3BPnsY8sVel/4aPonE1eXbg0MuVQfdZux1QB3
         bqjl1qMrCenNVfRrIFM117XjkzY5e3H8qkmhaJ9GCI6ST01A4GQqT1KEvUYTFw3VkuLE
         3TWb3SyjxjpdQ6e6h/OjReDupvYQL34ZF923ls8xd2EfZuihBJv2MTLqUXafzqTgZUiH
         n4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634369; x=1783239169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilD9FgnkGdqe5GqMnY5Ul/aeY+OYY8Ec4Cj/SXeSGYw=;
        b=QKVxQ1mK6F5HHT064FfwMaB0ouCIU3mVWtHagM96QQi0anKpbV5ioL4gPNTD8Tikaa
         WiDR5wUHZpWfxwUGNadGwEpm8rV+bQIajLiSgSCoYJ4fEpB2LxrUs6BsHpbwgZhaET6U
         Q2B5xgNLh/7uc35tX2AlmJuYQK7h8skcwZ6bw7g+ISpplxl98YdOReZghL0V2woylg+c
         jAGrgSGB5g6LiKPNMVOWmVCGMllDyDyEt6oDVqOsqu31rklfRuEO5PxI7zF59D0aMtWi
         6GC0ySxHlUnhCSfRCNqY2ifdUKpve9eVvMfBBVejGcpYP6449k+RXwSAqWf0vkNh74L+
         XBIg==
X-Gm-Message-State: AOJu0YyNFCf87Xoh51WH4nT0HTdIexlh/AbYO2QNqSqt5RXf8zR/6UMC
	6k5zBn7iD6ZUMAyzU9tcuiLee0IF18tgHdY/egPJbvcMLmXcVe455kF8OKsjsqWDGnKlGQ==
X-Gm-Gg: AfdE7ckB7gOFO+NlOxn6T23KoTBGMgsCwsnCi//U2AmynvpcH/RpzyQqFT8Lr8TdKFp
	JSYzziPvNeENwM2yl+8mv1QanbWTBYTizRTQ6bTQH6ZqPx3TpXUy+SW0f9z3zsjtJMQqyw38UK4
	V2G1dKe4GhwBG/IBhHNaro8u6KDNTlJ28PubLsJcCTA7yBCdPFIiFsaNmV1egkcOSbnd2JD0ngo
	pCcJp40YFFiIaCZLzYn3qaQBtgmxFaLYPeNRVOYohnkYH18ti91xjJX4+dkOaWRqF/RziIIkOPz
	jZRqwNxZFcaCizuVWBkOYPDu1MSVF0XAF/d7BEtZ8Gp8V+49DxxMi2q4aXW6OHKdA82Yv28vKt9
	zhUFKWk0FsErqpFjHdBWVCyWOexl8tbo7Ra8eWUjbkESpmgx8SnDazhg4eSg5Z3t83YwGVKnbmR
	5ClvoftH+lc6oeFLIyGpv6rcF4cdr9cKrfbQ7A2KTtqM6y5uIwRPJQPqyUJYX6EdA2mvWojZSKy
	1UXx7/yj2LQmVBjYOdp5HV1o7KVe9CdG2jXYhA4g8Fj14RaClKLQEriDcyLaAn4Y6zv855wU8pV
	oMEy/UkMYuQWK/GfNYC1XXS/pczs/A==
X-Received: by 2002:a05:7300:a485:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30c84dadbb3mr11644777eec.16.1782634369157;
        Sun, 28 Jun 2026 01:12:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 091/128] ktls-utils: upgrade 1.3.0 -> 1.4.0
Date: Sun, 28 Jun 2026 01:10:42 -0700
Message-ID: <20260628081122.178348-91-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127901

Drop 0001-systemd-Fix-out-of-tree-builds, which is present in 1.4.0 and
no longer applies.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-systemd-Fix-out-of-tree-builds.patch | 28 -------------------
 ...tls-utils_1.3.0.bb => ktls-utils_1.4.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch
 rename meta-oe/recipes-kernel/ktls-utils/{ktls-utils_1.3.0.bb => ktls-utils_1.4.0.bb} (83%)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch
deleted file mode 100644
index a5a46ea8d3..0000000000
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 496b0ffd7cd685a1adb48b150157fdea14f5f159 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Dec 2025 08:53:53 -0800
-Subject: [PATCH] systemd: Fix out-of-tree builds
-
-The systemd unit file installation does not work when the build directory
-differs from the source directory because cp cannot find the source file.
-Prefix the unit files with $(srcdir) to reference files from the source tree.
-
-This fixes out-of-tree builds which use separate build directories (B != S).
-
-Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/134]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- systemd/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd/Makefile.am b/systemd/Makefile.am
-index d2f8e25..d6435ad 100644
---- a/systemd/Makefile.am
-+++ b/systemd/Makefile.am
-@@ -24,5 +24,5 @@ MAINTAINERCLEANFILES	= Makefile.in
- if INSTALL_SYSTEMD
- install-data-hook: $(unit_files)
- 	mkdir -p $(DESTDIR)/$(unitdir)
--	cp $(unit_files) $(DESTDIR)/$(unitdir)
-+	cp $(addprefix $(srcdir)/,$(unit_files)) $(DESTDIR)/$(unitdir)
- endif
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
similarity index 83%
rename from meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
rename to meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
index 947aa90e2e..e8e4f36d6c 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
@@ -7,10 +7,8 @@ RDEPENDS:${PN} += " gnutls"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
 
-SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz \
-           file://0001-systemd-Fix-out-of-tree-builds.patch \
-           "
-SRC_URI[sha256sum] = "8ee295b26b608450bc0c47ba199b34cf92f7f9ec4c81a62363e6450da76b6739"
+SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "acd9e1851e492e7e16b879b30fc800f4a98d4214fa534ebb7e24d379f5984770"
 
 inherit autotools pkgconfig systemd
 

