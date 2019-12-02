Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDD87EC47
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:33:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n1so604084wra.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BRBqcACxYYDc8U1PUZRnn36hpqS67x2dr9N5o90uPGQ=;
	b=HuWPF/kHT0CKYdxNkb+t6SpgEdzS6CkxTVvW3cW5VcF1zZhaGtzfk4/O49OR0cyq/z
	NKCx/X8MHLG4M2bY6CehS9DW3YvvjfzM5YyPu1iPTitCPj7qFjyWP3cGN1Irv9XmcBuN
	7LQyaD7rXwo5f4Wob8F872pgc+tkhwfVWkoJxNhNhiot6buaH5rt2OCpjHwQmVGG6NXi
	S5f9nj7jbQz2WMWzIPKn2AFcYeZkXBqrZG61d2Pb/I7NdP4wb2476mApKqbKFKwgsJ4e
	rvNoYFSxeYG3L3N2gvonsGtcVfE4mL2bWM5T7xOf0QxsAjeMUhbzkd3qre7AcZaCB3r8
	G3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BRBqcACxYYDc8U1PUZRnn36hpqS67x2dr9N5o90uPGQ=;
	b=DAXIjkgXrPqjCZ2rB0Ie5PvmxejzjAto7NZCCkdl+WJd7qAA7vIG4lnfYtp3fGjVFY
	yQ1kQRzHWIOKrsN4qG5yR+9+FHYytFNOCvLjFroDjI9agzgz98bdrKR7Ugy83b4RMrGU
	VvGh+FKLVnXL/JUNpGT5DD28IArUoG+tYw+LXjQ9xzqGouXPvpe7NlssG9tP5VDWiL9H
	0XFKDDi8/Gwx4LoB7cMOJk7ivwMKW7+AEIKwqLGj2VVGZS6yqzRMn/X+8/VhJBW8Ae/G
	xwlQivrb1xvdqhw1+9OX1X5tlFUu0Pbrd5justM+tH95fcqgdRGp+VD92jNQkMBbqIsj
	RD/Q==
X-Gm-Message-State: APjAAAWJPNizNNE96AGF2BENBhmhRk2UDkPb0vqZ3yAF+KRJmkLyXAEU
	QGwGObgaKyP7CJVtznydDA0jAI3K
X-Google-Smtp-Source: APXvYqw4vXF9OlgtgSijsVBNgvslDZLwhOwjyoopklWJ9lHdDcZSVAIpOKwgR3B6eRZ18+RWGvaszQ==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr685039wrq.396.1575315232823;
	Mon, 02 Dec 2019 11:33:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y139sm465420wmd.24.2019.12.02.11.33.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:33:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:33:39 +0000
Message-Id: <20191202193343.12298-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe][PATCH 1/5] ostree: Fix DISTRO_FEATURES with ptest but w/o xattr
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
X-List-Received-Date: Mon, 02 Dec 2019 19:33:52 -0000

Fix the test for PTEST_ENABLED so it only fires when it's actually enabled, as
opposed to everytime. This allows the tautological test for native to be
removed as PTEST_ENABLED isn't set there.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index b3b34a15e694..b2bfaaf0514b 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -182,8 +182,8 @@ SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
 BBCLASSEXTEND = "native"
 
 python __anonymous() {
-    if not bb.data.inherits_class('native', d) and bb.utils.contains('PTEST_ENABLED', '1', 'True', 'False', d):
-        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', 'False', d):
+    if bb.utils.contains('PTEST_ENABLED', '1', 'True', '', d):
+        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', '', d):
             raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
         elif not bb.utils.contains_any('PACKAGECONFIG', 'soup curl', 'True', 'False', d):
             raise bb.parse.SkipRecipe('ptest requires soup enabled in PACKAGECONFIG.')
-- 
2.17.1


