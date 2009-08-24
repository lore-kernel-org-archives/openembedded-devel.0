Received: from [209.85.216.177] (helo=mail-px0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MfPcp-0004lg-GK
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 04:49:39 +0200
Received: by pxi7 with SMTP id 7so5325918pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 19:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=R+gcDT7Z5hIMWTkR9Rt9ckcfdmbkR6WfrStxh0vQDlQ=;
	b=Oc4Y/j8oHmASnUrHptVWTea5TCwXQCDEC17xcxwsMFVp3Ei4UUTq/wvRjpb8c66pYB
	JoI95K7W4ulESS76q4ag6PLCPz47YNYwJdVUQ0f/Fk1oCCAdu9lFFhle2DRjXiaWKUg5
	spp9rRTxUK1JigGd9OmWROwXHtpjSwzHED4nE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ppHpF/24nh8oI/ij4uZF5jReQoIDiguBrTgyEnmp2zN+ts/D+xQmAOYXqJm2aFMwYl
	IqXB0WEUDEFzLh28gajE9AuWHA+Rn+Vmt0/+TCEupMOVeSx+DiSg4nlBAiqYGfz8/s9Z
	zi0YXN0Z/y4G3GVG11dpq24y08/hYExG6/Mz4=
Received: by 10.114.9.16 with SMTP id 16mr6224264wai.114.1251081116323;
	Sun, 23 Aug 2009 19:31:56 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id j34sm8128630waf.26.2009.08.23.19.31.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 Aug 2009 19:31:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2009 19:31:41 -0700
Message-Id: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] base.bbclass: Replace os.system with subprocess call.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2009 02:49:39 -0000

Often gzip is reporting broken pipe errors with do_unpack of
tar.gz files.

If you use the commands described above to extract a tar.gz file, gzip
sometimes emits a Broken pipe error message. This can safely be ignored
if tar extracted all files without any other error message.

We do not let python install its SIGPIPE handler and use subprocess call
to invoke the command.

This is based on the following python bug report.
http://bugs.python.org/issue1652

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 598a7bb..4e9b65c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -728,9 +728,14 @@ base_do_buildall() {
 	:
 }
 
+def subprocess_setup():
+	import signal, subprocess
+	# Python installs a SIGPIPE handler by default. This is usually not what
+	# non-Python subprocesses expect.
+	signal.signal(signal.SIGPIPE, signal.SIG_DFL)
 
 def oe_unpack_file(file, data, url = None):
-	import bb, os
+	import bb, os, signal, subprocess
 	if not url:
 		url = "file://%s" % file
 	dots = file.split(".")
@@ -799,7 +804,7 @@ def oe_unpack_file(file, data, url = None):
 
 	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
 	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), base_path_out(os.getcwd(), data)))
-	ret = os.system(cmd)
+	ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
 
 	os.chdir(save_cwd)
 
-- 
1.6.3.3



