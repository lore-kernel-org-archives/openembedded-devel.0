Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A37B76C268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 23:31:09 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p4-v6so6794635plo.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 15:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PWZiv2aBhCKmJUSLPHMI1tOtkyvqX/GYtxjGa2HOR+k=;
	b=iVFodxRy6Mi+fowhR0ZQerSYMAO+6R8IxnWY2CfAYjsgxLmYoy3RS5XXeANQ1hcAR4
	DhPu8RcrJkOkUkKuGjkfqlZlgXZ6QGQOanlWKmguva0WXELYTU62oSoK6dDOCnqvWunh
	DYu/OEq1jgXmeFtm5/zTtydDrtRxuaCmQ/UhPKG1ghSvxxWLnaFmh/++70CBTD6e+Ax+
	H3yoaSjb/O9Uq9xuAzP8SV4Juu2QJgDzfzxcEVlZU/Rfg/74XyNKfQoRE4HEzhmg4MWQ
	cAuN2u5FB7UQCpm4kIj1xH6kYHdGTE9V0rE0YtyfbBunS81v07M7UdwVvbTZo6p+if2J
	pnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PWZiv2aBhCKmJUSLPHMI1tOtkyvqX/GYtxjGa2HOR+k=;
	b=s2ddzuNOcAxuqa1UhxocaQciVxfb7ICZBjkaiHxIDcEhbI3/PXNS5GkLFxfK8YXb8X
	eBnUp9KBZ9dRB5XlfZ9HmKXIjq1aa/aXSMAk/0Iwi/mmHJU4FySqhEqiMVdOwM9XJbiI
	rN8yGzaaVEAmDN9PlKNog5FuExMTpk/NjKShmlpqpzpeRddTaCZ5F/CZxRnfu9nu+PKb
	aghR6eBMRFxH7kf4M48csp/6tT5EkvMpcTPpDn3R4nAH0n+LITPnBpR6+I/+dK9gJF24
	YHhO/K+OLr8KBichIY3hpnUCB3S2NM4n+m5zHmQTtTkwQNhweYRt2wEQQXzFZeEqzhQB
	2Idw==
X-Gm-Message-State: AGRZ1gK4Pg1XXM2kCQBzGw/7izZALU4dh5Gb34ElxVAFH1T7km4LXXJT
	ZUTT71bCdQ/T4aHY+PSH6UdappLR
X-Google-Smtp-Source: AJdET5fwsUqoY/B2Zf7olo9pZ/Agq1mUTkC7rheIsrwMHhfXyCOC4ZIAgISkXqC95kHVaD90b4PiYA==
X-Received: by 2002:a17:902:2d81:: with SMTP id
	p1-v6mr6925844plb.97.1542151870526; 
	Tue, 13 Nov 2018 15:31:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	y88-v6sm27328006pfd.104.2018.11.13.15.31.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Nov 2018 15:31:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 15:31:08 -0800
Message-Id: <1542151868-31174-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][v2][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Tue, 13 Nov 2018 23:31:09 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
[V2]
remove mirror/sources from URL
---
 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py

diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
new file mode 100644
index 0000000..b17c795
--- /dev/null
+++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
@@ -0,0 +1,30 @@
+import os
+import re
+import glob as g
+import shutil
+import tempfile
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+
+class MetaOESourceMirroring(OESelftestTestCase):
+    # Can we download everything from the OpenEmbedded Sources Mirror over http only
+    def test_oe_source_mirror(self):
+        self.write_config("""
+BB_ALLOWED_NETWORKS = " sources.openembedded.org"
+MIRRORS = ""
+DL_DIR = "${TMPDIR}/test_oe_downloads"
+PREMIRRORS = "\\
+    bzr://.*/.*   http://sources.openembedded.org/ \\n \\
+    cvs://.*/.*   http://sources.openembedded.org/ \\n \\
+    git://.*/.*   http://sources.openembedded.org/ \\n \\
+    gitsm://.*/.* http://sources.openembedded.org/ \\n \\
+    hg://.*/.*    http://sources.openembedded.org/ \\n \\
+    osc://.*/.*   http://sources.openembedded.org/ \\n \\
+    p4://.*/.*    http://sources.openembedded.org/ \\n \\
+    svn://.*/.*   http://sources.openembedded.org/ \\n \\
+    ftp://.*/.*      http://sources.openembedded.org/ \\n \\
+    http://.*/.*     http://sources.openembedded.org/ \\n \\
+    https://.*/.*    http://sources.openembedded.org/ \\n"
+    """)
+
+        bitbake("world --runall fetch")
-- 
2.7.4


