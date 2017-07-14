Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 514B7781F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so9411338pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VKt5KuYM61vHP90buV3ESWm2W5tkcILdviZ2tfEzzPY=;
	b=JCIBZTjCJmULC8PtGBMJjPNpt0D8HObV6Qp1+psMmE7yH42jHsD5aEWil5h4Cw8xNE
	GFngSPFODnlyqw1psheBNMdj3SIwYM/bJZ8lUEXEh8Jphe6qQNwH4QSDA1H4rAm02xoa
	2MOVPV7nIQnx4B6JOYI2udSyDQnhwPDZGpCZHJVJML6OnQ1ufazEuupoOgPGyYFuOLxj
	EG7StobTpfUl+3M9WDAvWTaXeKamdJA7WXYUKlswX4fjxL49uMBz14YoQ0eLBnXUrDui
	VJylA3XQE/fPzqPyf8wOyfezE0uJAxykGaQnTeEDKwf6fhcrJ7HN5JfVLo/X2IikqCcx
	L6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VKt5KuYM61vHP90buV3ESWm2W5tkcILdviZ2tfEzzPY=;
	b=Sks4ibKxLMd1czX6a3bWDJnMeUIf32sXsXOUGMiSXZ4Iqd7+p8DOXtZhClbGJo4Ey3
	bNwA2ZXOgtV616TMX1trvVt71N5170YZIBHX6sb1kasX2UTQ9QsW7egUSiABKV+Pc6zb
	X6c6qf15qYTeW7yS93Vk1EHHAEAjEyRUVuDrDDcACb+Hvwz8aApDjBrCsk0gUdtXm2ab
	DgXrRRR9lxu/oR4ywIqXxglXEKNHOwbEvuyXhqcBKmSI2rXsyXhTDEjUqqw5zjRDEq7U
	PodyrhGP9NjA4sVbfK3lgRJZJxQ365afppfadqG5n035xz5Zqi+N/WqpWL+RegdBbHWJ
	nTjw==
X-Gm-Message-State: AIVw113/8BPeuO4cuAdRLyE7wNDGdXX/XcXFUmoSCwHX+sO3eZDMB+Z3
	r9AXbypxHhYAETLO
X-Received: by 10.99.123.28 with SMTP id w28mr13052668pgc.183.1500010849580;
	Thu, 13 Jul 2017 22:40:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:13 -0700
Message-Id: <20170714054013.34458-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 18/18] logfsprogs: Rename setkey API to _setkey to not conflict with libc
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-conflicts-with-libc-namespace-about-setk.patch | 135 +++++++++++++++++++++
 .../logfsprogs/logfsprogs_git.bb                   |   3 +-
 2 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
new file mode 100644
index 000000000..dbf7ae016
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
@@ -0,0 +1,135 @@
+From 5a8e26157d9642f022587cc1ca7525213c7a5379 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 18:41:53 -0700
+Subject: [PATCH] btree: Avoid conflicts with libc namespace about setkey()
+
+This issue is highlighted with musl mainly because the
+function signature from stdlib.h does not match the local
+static function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ btree.c | 32 ++++++++++++++++----------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/btree.c b/btree.c
+index eddc33b..dd3fef9 100644
+--- a/btree.c
++++ b/btree.c
+@@ -123,7 +123,7 @@ static unsigned long bval(struct btree_geo *geo, unsigned long *node, int n)
+ 	return node[geo->no_pairs * geo->keylen + n];
+ }
+ 
+-static void setkey(struct btree_geo *geo, unsigned long *node,
++static void _setkey(struct btree_geo *geo, unsigned long *node,
+ 		unsigned long *key, int n)
+ {
+ 	longcpy(bkey(geo, node, n), key, geo->keylen);
+@@ -292,7 +292,7 @@ static unsigned long *find_level(struct btree_head *head, struct btree_geo *geo,
+ 			/* FIXME: If the right-most key on higher levels is
+ 			 * always zero, this wouldn't be necessary. */
+ 			i--;
+-			setkey(geo, node, key, i);
++			_setkey(geo, node, key, i);
+ 		}
+ 		BUG_ON(i < 0);
+ 		node = (unsigned long *)bval(geo, node, i);
+@@ -311,7 +311,7 @@ static int btree_grow(struct btree_head *head, struct btree_geo *geo)
+ 		return -ENOMEM;
+ 	if (head->node) {
+ 		fill = getfill(geo, head->node, 0);
+-		setkey(geo, node, bkey(geo, head->node, fill - 1), 0);
++		_setkey(geo, node, bkey(geo, head->node, fill - 1), 0);
+ 		setval(geo, node, (unsigned long)head->node, 0);
+ 	}
+ 	head->node = node;
+@@ -342,16 +342,16 @@ static void steal_l(struct btree_head *head, struct btree_geo *geo, int level,
+ 
+ 	for (i = rfill - 1; i >= 0; i--) {
+ 		/* Shift entries on the right */
+-		setkey(geo, right, bkey(geo, right, i), i + no_entries);
++		_setkey(geo, right, bkey(geo, right, i), i + no_entries);
+ 		setval(geo, right, bval(geo, right, i), i + no_entries);
+ 	}
+ 	for (i = 0; i < no_entries; i++) {
+ 		/* Move some entries to the right */
+-		setkey(geo, right, bkey(geo, left, lfill - no_entries + i), i);
++		_setkey(geo, right, bkey(geo, left, lfill - no_entries + i), i);
+ 		setval(geo, right, bval(geo, left, lfill - no_entries + i), i);
+ 	}
+ 	/* Set parent key */
+-	setkey(geo, parent, bkey(geo, left, lfill - no_entries - 1), lpos);
++	_setkey(geo, parent, bkey(geo, left, lfill - no_entries - 1), lpos);
+ 	for (i = lfill - no_entries; i < lfill; i++)
+ 		clearpair(geo, left, i);
+ }
+@@ -366,14 +366,14 @@ static void steal_r(struct btree_head *head, struct btree_geo *geo, int level,
+ 
+ 	for (i = 0; i < no_entries; i++) {
+ 		/* Move some entries to the left */
+-		setkey(geo, left, bkey(geo, right, i), lfill + i);
++		_setkey(geo, left, bkey(geo, right, i), lfill + i);
+ 		setval(geo, left, bval(geo, right, i), lfill + i);
+ 	}
+ 	/* Set parent key */
+-	setkey(geo, parent, bkey(geo, right, no_entries - 1), lpos);
++	_setkey(geo, parent, bkey(geo, right, no_entries - 1), lpos);
+ 	/* Shift entries on the right */
+ 	for ( ; i < rfill; i++) {
+-		setkey(geo, right, bkey(geo, right, i), i - no_entries);
++		_setkey(geo, right, bkey(geo, right, i), i - no_entries);
+ 		setval(geo, right, bval(geo, right, i), i - no_entries);
+ 	}
+ 	for (i = rfill - no_entries; i < rfill; i++)
+@@ -399,14 +399,14 @@ static int split(struct btree_head *head, struct btree_geo *geo,
+ 		return err;
+ 	}
+ 	for (i = 0; i < fill / 2; i++) {
+-		setkey(geo, new, bkey(geo, node, i), i);
++		_setkey(geo, new, bkey(geo, node, i), i);
+ 		setval(geo, new, bval(geo, node, i), i);
+-		setkey(geo, node, bkey(geo, node, i + fill / 2), i);
++		_setkey(geo, node, bkey(geo, node, i + fill / 2), i);
+ 		setval(geo, node, bval(geo, node, i + fill / 2), i);
+ 		clearpair(geo, node, i + fill / 2);
+ 	}
+ 	if (fill & 1) {
+-		setkey(geo, node, bkey(geo, node, fill - 1), i);
++		_setkey(geo, node, bkey(geo, node, fill - 1), i);
+ 		setval(geo, node, bval(geo, node, fill - 1), i);
+ 		clearpair(geo, node, fill - 1);
+ 	}
+@@ -487,10 +487,10 @@ retry:
+ 
+ 	/* shift and insert */
+ 	for (i = fill; i > pos; i--) {
+-		setkey(geo, node, bkey(geo, node, i - 1), i);
++		_setkey(geo, node, bkey(geo, node, i - 1), i);
+ 		setval(geo, node, bval(geo, node, i - 1), i);
+ 	}
+-	setkey(geo, node, key, pos);
++	_setkey(geo, node, key, pos);
+ 	setval(geo, node, val, pos);
+ 
+ 	return 0;
+@@ -513,7 +513,7 @@ static void merge(struct btree_head *head, struct btree_geo *geo, int level,
+ 
+ 	for (i = 0; i < rfill; i++) {
+ 		/* Move all entries to the left */
+-		setkey(geo, left, bkey(geo, right, i), lfill + i);
++		_setkey(geo, left, bkey(geo, right, i), lfill + i);
+ 		setval(geo, left, bval(geo, right, i), lfill + i);
+ 	}
+ 	/* Exchange left and right child in parent */
+@@ -615,7 +615,7 @@ static void *btree_remove_level(struct btree_head *head, struct btree_geo *geo,
+ 
+ 	/* remove and shift */
+ 	for (i = pos; i < fill - 1; i++) {
+-		setkey(geo, node, bkey(geo, node, i + 1), i);
++		_setkey(geo, node, bkey(geo, node, i + 1), i);
+ 		setval(geo, node, bval(geo, node, i + 1), i);
+ 	}
+ 	clearpair(geo, node, fill - 1);
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index c41f0eaa6..1b4d97d76 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -13,7 +13,8 @@ DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git \
            file://0001-Add-LDFLAGS-to-linker-cmdline.patch \
-"
+           file://0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch \
+           "
 SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
 
 S = "${WORKDIR}/git"
-- 
2.13.2


