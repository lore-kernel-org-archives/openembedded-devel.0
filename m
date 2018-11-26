Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4A78F6C590
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:06:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id p4so19282347wrt.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aAQ2mKAg9BIHj33flcSPYd/Q9+G4/B3K07p4tMY4J9o=;
	b=k4clWtaNK4aPyZQE4j0YMy1mnL4waCOAfHcSdBljtjK0dH8wP2yRNVR2zkSdWIntku
	VAh40vqgcJH8+zovH1bk6zgSYnEK9ieP98thZCoPo6hf7gLJao7FkGPXoqesFSFdwObh
	ZzL1sJI18GTMF+PtTswqkCYJf1bL69AD1A2IWD06tRiwCMT6s/wda8dkd0Utswe4MNs2
	cwMeeKwA2BJ8ofcku0awwQaJGJOp0a4ocT2VKLSBWLlY9qiZsReQxAdm4Eysq8EiA0M9
	/65Wqp9WJJHGZ7d9hIDC4ha3nFuSB0COrYAJqoC69NZZEwIqW+fvjykB7r8+UJZqlow8
	pPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aAQ2mKAg9BIHj33flcSPYd/Q9+G4/B3K07p4tMY4J9o=;
	b=EFNAoQsytrd3y1M8b1/FgMq+1VkxLj2Ihu7PBeP1X3w1xxIKjQtYt7VweB4+ajRdtH
	tRE+/EY3Pz/xTk1RrYS6uq26wTATAOZtSaaSJERiHLR1ZMFw9dK7KMsYpSDsAWWJRjns
	8fpnYqZInTIxFd9lvq46S1TYyRNv1FtypgXj60lOnwIovKNgFBhI2Rq4VHbUIIJN5E1T
	/zOYmBgpRDRhflf37OVHCGFqtzaBv6MrEVlvbIVBQ61OmMT6mzqCdTeomzDOSpv/oXyE
	Scog8Q2x4XnhKmgGMfxCzTDIdv5/0Szt/DdPKexpP3HwOOFY73ojJeWI+xgMML8w+LG2
	Q2Aw==
X-Gm-Message-State: AA+aEWbJTEDMoclnpctqWMO6C2fYpBqytyr1eWdW7Q3OJR9rybP0KpRA
	dbjC169q/oL0jIe+c65xk8Iw5/WcFw8=
X-Google-Smtp-Source: AFSGD/WY2ACWBTAfBbYmtq9D3YOtFreMa6GZet6noXIetdhPOtEydwRqtt1yQhW662jMzPKNpGXj1g==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr19161160wrv.161.1543244762464;
	Mon, 26 Nov 2018 07:06:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p14sm548710wrt.37.2018.11.26.07.06.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 07:06:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 15:05:58 +0000
Message-Id: <20181126150558.14940-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-python] bandit: add class to perform Bandit scans
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
X-List-Received-Date: Mon, 26 Nov 2018 15:06:02 -0000

Add a class to perform security scans of Python code using Bandit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/classes/bandit.bbclass | 63 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-python/classes/bandit.bbclass

diff --git a/meta-python/classes/bandit.bbclass b/meta-python/classes/bandit.bbclass
new file mode 100644
index 0000000000..dc1041e466
--- /dev/null
+++ b/meta-python/classes/bandit.bbclass
@@ -0,0 +1,63 @@
+# Class to scan Python code for security issues, using Bandit.
+#
+# $ bitbake python-foo -c bandit
+#
+# Writes the report to $DEPLOY_DIR/bandit/python-foo.html.
+# No output if no issues found, a warning if issues found.
+#
+# https://github.com/PyCQA/bandit
+
+# Default location of sources, based on standard distutils
+BANDIT_SOURCE ?= "${S}/build"
+
+# The report format to use.
+# https://bandit.readthedocs.io/en/latest/formatters/index.html
+BANDIT_FORMAT ?= "html"
+
+# Whether a scan should be done every time the recipe is built.
+#
+# By default the scanning needs to be done explicitly, but by setting BANDIT_AUTO
+# to 1 the scan will be done whenever the recipe it built.  Note that you
+# shouldn't set BANDIT_AUTO to 1 globally as it will then try to scan every
+# recipe, including non-Python recipes, causing circular loops.
+BANDIT_AUTO ?= "0"
+
+# Whether Bandit finding issues results in a warning (0) or an error (1).
+BANDIT_FATAL ?= "0"
+
+do_bandit[depends] = "python3-bandit-native:do_populate_sysroot"
+python do_bandit() {
+    import os, subprocess
+    try:
+        report = d.expand("${DEPLOY_DIR}/bandit/${PN}-${PV}.${BANDIT_FORMAT}")
+        os.makedirs(os.path.dirname(report), exist_ok=True)
+
+        args = ("bandit",
+                "--format", d.getVar("BANDIT_FORMAT"),
+                "--output", report,
+                "-ll",
+                "--recursive", d.getVar("BANDIT_SOURCE"))
+        subprocess.check_output(args, stderr=subprocess.STDOUT)
+        bb.note("Bandit found no issues (report written to %s)" % report)
+    except subprocess.CalledProcessError as e:
+        if e.returncode == 1:
+            if oe.types.boolean(d.getVar("BANDIT_FATAL")):
+                bb.error("Bandit found issues (report written to %s)" % report)
+            else:
+                bb.warn("Bandit found issues (report written to %s)" % report)
+        else:
+            bb.error("Bandit failed:\n" + e.output.decode("utf-8"))
+}
+
+python() {
+    before = "do_build"
+    after = "do_compile"
+
+    if oe.types.boolean(d.getVar("BANDIT_AUTO")):
+        bb.build.addtask("do_bandit", before, after, d)
+    else:
+        bb.build.addtask("do_bandit", None, after, d)
+}
+
+# TODO: store report in sstate
+# TODO: a way to pass extra args or .bandit file, basically control -ll
-- 
2.11.0


