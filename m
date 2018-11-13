Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B252B6C24F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:40:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u3-v6so4129483pfm.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=+EKuHUcq5N5xmadjup+JrdSviWFrylj7CX4Yk9fNMR8=;
	b=g28RT2fpkgg2kkr33dNPicz1z7EHx+jB0/tBa0W9wkK8BT8kdRno+5tO+E2ihRMhEt
	C54Or0HfL9cu6BtYIVPPQYXPxLb354XLlIEXYgR0tMpcV3EwjLjbJAPpI6ffQTmsNmfx
	eaTnq0Txn5SMLUDH6Iiv+37yDBYCJDVMNfCwBa92zsI8/R7rekVWTAizvFXdT/F7IsmE
	vB4eghSlHhW0YZvLscjpc7HX4nlw1rFwxscBgZbofkypeHviqax8wTpqz7pO8D4pTlJv
	zygOalY+5zjIDOQylSeKEJWaSAktYeklWb4mA+ki/Lm8fgHEugUBOdAJrVaCSb3WXjXo
	ikJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+EKuHUcq5N5xmadjup+JrdSviWFrylj7CX4Yk9fNMR8=;
	b=fMRcurLl0nVUGlnntNu9TiZLtHUKpoYYR0/ebA2Lvnrw2K3a4sPq+okG9HxueX8gp+
	vUQsfqmbfgWrtjWErobmoEbbHJ7PyrLkSRFKfMsFd0h1k//p3hwYXfbLFsY4WQ7V3m4c
	JHu8p1xEvGut0WLss7TAdv7CiO1Nz71ZY5JHEM341MqSxIz8UsmhDn40gdMJKllCAQIE
	IKGpG/eluJhluGzU3Ex59uLHNvse/XqZkmwLj0n6oJScPsKzIWIUaVCF22dAKJGdG1Lz
	qKgl7SdRO4IoxLvWyd4Ham4IxmfD8piEeRFrza/xrRZS0VcPBr5GokbyJrJg4KrNfk5s
	vEOA==
X-Gm-Message-State: AGRZ1gK4pjNOKJe2seBS1KnLfgM+Ctt8bLu7JS0L077TM0hugKDi4jnp
	l86mRgQ1lDPSNj9QZrgADVvpyvty
X-Google-Smtp-Source: AJdET5eUME7Q3x+KzPpu9zkLNEkt1Z9ByYF0Xmv1DqmZS6uAicky2mzdasDua/l3C4TSPBPdLmPCAA==
X-Received: by 2002:a62:8d92:: with SMTP id
	p18-v6mr7270597pfk.217.1542148833595; 
	Tue, 13 Nov 2018 14:40:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	e29-v6sm7869871pfb.6.2018.11.13.14.40.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Nov 2018 14:40:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 14:40:31 -0800
Message-Id: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Tue, 13 Nov 2018 22:40:32 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py

diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
new file mode 100644
index 0000000..79bebf5
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
+    bzr://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
+    cvs://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
+    git://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
+    gitsm://.*/.* http://sources.openembedded.org/mirror/sources/ \\n \\
+    hg://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n \\
+    osc://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
+    p4://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n \\
+    svn://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
+    ftp://.*/.*      http://sources.openembedded.org/mirror/sources/ \\n \\
+    http://.*/.*     http://sources.openembedded.org/mirror/sources/ \\n \\
+    https://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n"
+    """)
+
+        bitbake("world --runall fetch")
-- 
2.7.4


