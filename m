Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id ACD066FF97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:38:04 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l126so8777482wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sCrp3ardNAwcTD/p+qMJM97rr5Gxf6dvmRjPEFTR4yk=;
	b=v1RQYD74iodStr6Iqhvil8JFUvsZMundUUDkaGmtafAuG7K0KJtdOLEU+xGO/wL/Rq
	y0K6hImJcSY47CYCz20sOVtRNwiAvh0O31eiHKyTwc1j8y+fS7XVt2glQ8j0Wo/c1CrV
	81u5C1P7jDADeeEJwh816UWAcqk1jGmpIArHr5khpsjWenfP0ge+R/NhOsKk6ouA2Lg9
	hxQCO0XqV9I/rvPOIeDMug+FmeEz/dZ1kPHpe+xHPvyMESsN8nPOsmMJWKLlPdbc6kjS
	ypjvGH2t53pudEcFxzAvk5FQJolnAkEtJzceu0keWZQwyX/jpo5CuqFiml5MtOsEK64g
	m6hA==
X-Received: by 10.194.116.133 with SMTP id jw5mr46176330wjb.110.1450208284719; 
	Tue, 15 Dec 2015 11:38:04 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	a186sm4172944wmh.4.2015.12.15.11.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 11:38:03 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 12:37:47 -0700
Message-Id: <b577f8ef2e0870c3ba53fb383edbdef8a3e12537.1450208019.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 3/3] restore_headrevs.bbclass: add
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
X-List-Received-Date: Tue, 15 Dec 2015 19:38:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

If BB_NO_NETWORK=1, this class restores saved bitbake URI headrevs.

This is useful to support BB_NO_NETWORK with AUTOREV, by letting someone ship
dumped headrevs to the user, who then inherit this class, which ensures that
the cached headrevs are used, and upstream is not contacted at parse time.
BB_SRCREV_POLICY will be set to "cache" as well, if it's not already set, as
otherwise bitbake will contact upstream to update the cached values.

This only handles restoring dumped headrevs. Using the python module to dump
to this database will likely be done at release time, elsewhere.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/classes/restore_headrevs.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/classes/restore_headrevs.bbclass

diff --git a/meta-oe/classes/restore_headrevs.bbclass b/meta-oe/classes/restore_headrevs.bbclass
new file mode 100644
index 0000000..0d83428
--- /dev/null
+++ b/meta-oe/classes/restore_headrevs.bbclass
@@ -0,0 +1,32 @@
+# If BB_NO_NETWORK=1, this class restores saved bitbake URI headrevs.
+#
+# This is useful to support BB_NO_NETWORK with AUTOREV, by letting someone
+# ship dumped headrevs to the user, who then inherit this class, which ensures
+# that the cached headrevs are used, and upstream is not contacted at parse
+# time. BB_SRCREV_POLICY will be set to "cache" as well, if it's not already
+# set, as otherwise bitbake will contact upstream to update the cached values.
+#
+# See also lib/oe/headrevs.py.
+#
+# This only handles restoring dumped headrevs. Using the python module to dump
+# to this database will likely be done at release time, elsewhere.
+
+HEADREVS_RESTORE_STAMP ?= "${PERSISTENT_DIR}/headrevs_restored"
+DUMPED_HEADREVS_DB ?= "${COREBASE}/headrevs.db"
+
+python restore_dumped_headrevs() {
+    dump_db_path = d.getVar('DUMPED_HEADREVS_DB', True)
+    if os.path.exists(dump_db_path) and d.getVar('BB_NO_NETWORK', True) == '1':
+        if 'BB_SRCREV_POLICY' not in d:
+            d.setVar('BB_SRCREV_POLICY', 'cache')
+
+        stamp_path = d.getVar('HEADREVS_RESTORE_STAMP', True)
+        if (not os.path.exists(stamp_path) or
+                os.path.getmtime(dump_db_path) > os.path.getmtime(stamp_path)):
+            import oe.headrevs
+            oe.headrevs.restore_headrevs(d, dump_db_path)
+            bb.utils.mkdirhier(os.path.dirname(stamp_path))
+            open(stamp_path, 'w').close()
+}
+restore_dumped_headrevs[eventmask] = "bb.event.ConfigParsed"
+addhandler restore_dumped_headrevs
-- 
2.2.1


