Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id AA9A771AC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:48:45 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id w124so46165919itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KqXeowspSnWpbHmYM4TEmiFZHCpHGWzsh4QIDHhDLFw=;
	b=UdZQ/4MmHC7Mp08fb79zkAlsyPQFZIXEkP3imC0qxOdKM0FeY1Bga/b2Xtv2NWpb+2
	gZbWmEMwHuVsRnQPRH+swQkZ9L4MYpzYMRnshxROBBSXnfHXCQuKSGFaDu8fCSWtN17m
	2YXiiWc5Q1PGzDFDp9YfwKiBWEHt67WoIgvfuGrzmVBlCJYKKmj0SLLNcHRd7vp3r0lK
	OAVnuN8W1LC8BIqgs7dR36czRpP9lu+9oeri7Jn+N7vygccu/tGfeE0ClEQiKaK4qRMJ
	BH6L+C5HY0COj8pLLY5L81oM4/Dy3MmT136hdHvCNrFG9H3sOkYzqWWMMpQuB2m0vPJR
	9KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KqXeowspSnWpbHmYM4TEmiFZHCpHGWzsh4QIDHhDLFw=;
	b=CRXYNF35vYXcj1PqtqB6IoaPBQFwjAD0PHFrPK3kFpj2dznkgBbZoxmhGoCNVTGIb+
	Q3AF1Vj5b+U/h2dBbpSS0po905X6+lxbVddfw2LBNWmiIF2tXifrFja6Je3A+Jzs8D2F
	Z6aiRH5iuiL4off57IccYcld9pRZhr1SeRSxbUYUTkqBW7C4rAfPlUTPsmbJ+qgrxAUR
	VK8C6PxllfrHh1e3MjQpYRBhrFS62cytLwgUNSrrmug08z/LjKLYI6xSLVsfAOCKS8Ii
	DnfRDWOYlSYVefgmNJHIRV/PQkKGvXO4PvydJ4vxTi81OgGF17oKc4zAIJQ6SnmRLbdL
	Wa6A==
X-Gm-Message-State: AFeK/H03aph97BNyVeKvQRm1WwbrJY2ikNS+hjR69BvlOR1Z/hl5Budf9XgDD6S2pwNBThSW
X-Received: by 10.36.58.76 with SMTP id m73mr21176048itm.17.1489571326955;
	Wed, 15 Mar 2017 02:48:46 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DCEB.dip0.t-ipconnect.de.
	[93.232.220.235])
	by smtp.gmail.com with ESMTPSA id h71sm1283620ioe.9.2017.03.15.02.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 02:48:46 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 10:48:41 +0100
Message-Id: <20170315094841.4126-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: saul.wold@intel.com
Subject: [PATCH] yocto-compat-layer: improve error handling in signature creation
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
X-List-Received-Date: Wed, 15 Mar 2017 09:48:47 -0000

When "bitbake -k -S none world" failed, the error printed by
yocto-compat-layer.py contained the stack trace multiple times and did not
contain the stderr output from bitbake, making the error hard to understand
and debug:

  INFO: ======================================================================
  INFO: ERROR: test_signatures (common.CommonCompatLayer)
  INFO: ----------------------------------------------------------------------
  INFO: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 144, in get_signatures
      stderr=subprocess.PIPE)
    File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
      raise CalledProcessError(retcode, process.args, output=output)
  subprocess.CalledProcessError: Command 'bitbake -k -S none world' returned non-zero exit status 1

  During handling of the above exception, another exception occurred:

  Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", line 51, in test_signatures
      curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 149, in get_signatures
      raise RuntimeError(msg)
  RuntimeError: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 144, in get_signatures
      stderr=subprocess.PIPE)
    File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
      raise CalledProcessError(retcode, process.args, output=output)
  subprocess.CalledProcessError: Command 'bitbake -k -S none world' returned non-zero exit status 1

  Loading cache...done.
  Loaded 1328 entries from dependency cache.
  NOTE: Resolving any missing task queue dependencies
  NOTE: Runtime target 'zlib-qat' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['zlib-qat']
  ...
  Summary: There were 5 ERROR messages shown, returning a non-zero exit code.

The yocto-compat-layer.log was incomplete, it only had the first part
without the command output.

stderr was missing due to stderr=subprocess.PIPE.

Instead of the complicated try/except construct it's better to check
the return code ourselves and raise just a single exception. The
output (both on stderr and in the yocto-compat-layer.log) now is:

  INFO: ======================================================================
  INFO: ERROR: test_signatures (common.CommonCompatLayer)
  INFO: ----------------------------------------------------------------------
  INFO: Traceback (most recent call last):
    File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", line 51, in test_signatures
      curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
    File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 147, in get_signatures
      raise RuntimeError(msg)
  RuntimeError: Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.
  Command: bitbake -k -S none world
  Output:
  Loading cache...done.
  Loaded 1328 entries from dependency cache.
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'qat16' (but /fast/work/meta-intel/common/recipes-extended/openssl-qat/openssl-qat_0.4.9-009.bb DEPENDS on or otherwise requires it)
  ERROR: qat16 was skipped: incompatible with machine qemux86 (not in COMPATIBLE_MACHINE)
  ...
  Missing or unbuildable dependency chain was: ['openssl-qat-dev']
  ...
  Summary: There were 5 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index b3a166aa9ab..a7eb8625310 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -135,17 +135,15 @@ def get_signatures(builddir, failsafe=False):
 
     sigs = {}
 
-    try:
-        cmd = 'bitbake '
-        if failsafe:
-            cmd += '-k '
-        cmd += '-S none world'
-        output = subprocess.check_output(cmd, shell=True,
-                stderr=subprocess.PIPE)
-    except subprocess.CalledProcessError as e:
-        import traceback
-        exc = traceback.format_exc()
-        msg = '%s\n%s\n' % (exc, e.output.decode('utf-8'))
+    cmd = 'bitbake '
+    if failsafe:
+        cmd += '-k '
+    cmd += '-S none world'
+    p = subprocess.Popen(cmd, shell=True,
+                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    output, _ = p.communicate()
+    if p.returncode:
+        msg = "Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.\nCommand: %s\nOutput:\n%s" % (cmd, output.decode('utf-8'))
         raise RuntimeError(msg)
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
 
-- 
2.11.0


