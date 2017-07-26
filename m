Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A764E77E24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y25so8736558pfk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ODbBeTJ3TN4Mp2UGK5PN4jCQqVpqnHIUfRVpQXbZCA4=;
	b=HKkNrXKEtie7l1jItf/otaGmyNHoKveO4QC4fq09xY1mS+NoJtYb3xA/7RFlf7JbH/
	73y10S5E+Dm/5YTqhsDd/QdG4JOw2THdk058P6xvrSYuE6MgyioiPb3+fFRl49Mv0vEN
	zcOQy7p/8MQY8X3sjlrYTUn+dnz2DU9iv0TXDeL4g2gHSEi80TmfNdTL+mRM2cTde2Ph
	ILgvnIhP0qXrrH3QkFPtpcgxXqcnZldJ4DBX02xNJBhZNdc5yiXndIDVI+uoNVX0w/Ni
	DbcIZh/1VuanBOtdVS6c/G2UWmV4ekFb1cxu6HWArns5+wxKg5Mxzqsq8bJmzvVT6dWK
	kIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ODbBeTJ3TN4Mp2UGK5PN4jCQqVpqnHIUfRVpQXbZCA4=;
	b=uFuid6BEW7IvkdxuvjwlWf+KQnxF2jPHHpo9ker7HUN765HNzcz3R4w8u1X2I2Ixar
	IlHi2aVavf+f0+EVgZcQoGVf4Do2OS7TMIZn2aPS4Sbo65Zre83e0Et7A5y0105Tn9a3
	3wtua6JlBKhL0Hopi+BE70xJAKUrP6juq1zXDUu+JiponqhAmPoibSbC5leqOKsgWZR8
	rfCTVUu7hJjnfbtbq/CQ8NdvsHnkHPBzlYaxGgDl+PeEKA5K8gqt6OTVlYg7ukwYpN+L
	gnUQisF3clqovPO1FTY6DMAQAnRb3/gvcwVSoKAZIEZXHCk9UnjTAhwV2lOl+3iaasVo
	oKEw==
X-Gm-Message-State: AIVw110TZj4/JruD8Cy+vPuvbXGT39OYNmKk+6Bw4jW6gWhgnjO1Z4f4
	TBH7hrBI4jgtdJJe
X-Received: by 10.84.210.38 with SMTP id z35mr1866700plh.416.1501095510168;
	Wed, 26 Jul 2017 11:58:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:09 -0700
Message-Id: <20170726185815.8898-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-oe][PATCH 1/7] minicoredumper: Initialize struct config
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:29 -0000

Fixes build error with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...per-Initialize-pointer-to-config-struct-t.patch | 29 ++++++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.0.bb         |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch
new file mode 100644
index 000000000..ad255fae0
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch
@@ -0,0 +1,29 @@
+From 6181d9c3c407ee030b4c3a94045318b9e3a3cc89 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 14:08:54 -0700
+Subject: [PATCH] minicoredumper: Initialize pointer to config struct to null
+
+Fixes
+corestripper.c:3632:13: error: variable 'cfg' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicoredumper/corestripper.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index a764073..ddb0d25 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -3605,7 +3605,7 @@ out:
+ 
+ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
+ {
+-	struct config *cfg;
++	struct config *cfg = 0;
+ 	const char *recept;
+ 	bool live_dumper;
+ 	char *comm_base;
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 58cd45a53..3bf9f66b9 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -16,7 +16,8 @@ PR .= "+git${SRCPV}"
 SRC_URI = "git://github.com/Linutronix/minicoredumper-debian;branch=unstable \
            file://minicoredumper.service \
            file://minicoredumper.init \
-"
+           file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3


