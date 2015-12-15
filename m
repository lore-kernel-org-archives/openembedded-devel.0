Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B15BD7319B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:38:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n186so180284850wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hngVJp7481UyMYE3Rnag2mejMKbxiHD5y+vJPAUcD2U=;
	b=punuV5oyJZTE4xn28wuG0nHEQ21YsKXlnjBOddP9uandg0XPMsyn69Wl8YmsjUfOE8
	rRQ9YrFsVrB6tjcH5yqLvkwMO2h1k17OuPHWk3r1Vzqha6J1XGhAVKhMOc1NmvIdJz7B
	fS2mLdGwpCkTDc0MC0MiYjIAXNrZ0UbtEBpAg6j4cMawjbp+WOO6NUpcsjSlmelZOd5e
	lbhPJx8UTZX4DqvHVVPC1CcytmR6g6RFTfvHiqcgpxEy2p9B8dUgig1RDkfZpEVWO2Ma
	eHVlQ5THJflyy8/A2a1yb/QE32FqQjvBpuaEY/QcZifZ3XM+rKr8O9QTQxZg6Hhcx2LF
	T5qA==
X-Received: by 10.28.24.200 with SMTP id 191mr6446538wmy.99.1450208282163;
	Tue, 15 Dec 2015 11:38:02 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	a186sm4172944wmh.4.2015.12.15.11.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 11:38:00 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 12:37:46 -0700
Message-Id: <a24714fa08d9ce27b02c0aa3cabb7b59f3bf6db6.1450208019.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/3] oe.headrevs: save and restore the bitbake URI headrevs
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
X-List-Received-Date: Tue, 15 Dec 2015 19:38:05 -0000

From: Christopher Larson <chris_larson@mentor.com>

This module provides functions to save and restore the BB_URI_HEADREVS from/to
the persist_data database. The BB_URI_HEADREVS are the mappings between git
refs and the revisions they refer to.

This is useful to fully support BB_NO_NETWORK when AUTOREV is involved, as we
can use the dumped mappings rather than contacting upstream at parse time.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/lib/oe/headrevs.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/lib/oe/headrevs.py

diff --git a/meta-oe/lib/oe/headrevs.py b/meta-oe/lib/oe/headrevs.py
new file mode 100644
index 0000000..9245300
--- /dev/null
+++ b/meta-oe/lib/oe/headrevs.py
@@ -0,0 +1,38 @@
+"""Save and restore the bitbake URI headrevs.
+
+This module provides functions to save and restore the BB_URI_HEADREVS from/to
+the persist_data database. The BB_URI_HEADREVS are the mappings between git
+refs and the revisions they refer to.
+
+This is useful to fully support BB_NO_NETWORK when AUTOREV is involved, as we
+can use the dumped mappings rather than contacting upstream at parse time. See
+also restore_headrevs.bbclass.
+
+By default, any existing mapping will not be overwritten, as we assume the
+user's mappings are more current than any dumped content.
+"""
+
+
+def copy_persist_domain(d, domain, other_db_path, restore=False, overwrite=False):
+    import contextlib
+
+    source_table = bb.persist_data.persist(domain, d)
+    dest_table = bb.persist_data.SQLTable(other_db_path, domain)
+    if restore:
+        source_table, dest_table = dest_table, source_table
+
+    with contextlib.nested(source_table, dest_table):
+        if overwrite:
+            dest_table.update(source_table)
+        else:
+            for key in source_table:
+                if key not in dest_table:
+                    dest_table[key] = source_table[key]
+
+
+def dump_headrevs(d, dump_db_path):
+    copy_persist_domain(d, 'BB_URI_HEADREVS', dump_db_path)
+
+
+def restore_headrevs(d, dump_db_path):
+    copy_persist_domain(d, 'BB_URI_HEADREVS', dump_db_path, restore=True)
-- 
2.2.1


