Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <darkstar6262@gmail.com>) id 1NBwxk-0004Ha-Lv
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 21:53:47 +0100
Received: by pwj11 with SMTP id 11so2711682pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=CFDzJUyqmciinAiD8aXoMNQGn9b3ODCDRf8cnW+x7ls=;
	b=UzApNYB8JbN6EgNJUAOTDLo4L7joW0Ymz7qFHllw+MuaYqEtZDnroz01acAtT1D+De
	gvwdXsCLp43lH03CO5/zETP7C2fVcaF7TgPh2mxxTaQvhPUI1Uy9AfaTiCZB8PliRKCu
	ZtmtGwMOFDjNH+ei5B7JpT8ZbVal8SqyZoTr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=hi2JGuWCfuTmkMVl/4yik2BFHGbaHupE2+JzG/MdRxicgcIi1xublvoyND6xc/2eBj
	lh7mmhsCFgaOVZZU+RADrYyfJgOpqMK/WlUM5t0+H95WCLH3/POfYF9/NBS/UiBW/mLV
	zriTUgPMHZyxEyxj8eOgpFoMtUmT+ZSsgnPqw=
Received: by 10.115.81.21 with SMTP id i21mr4619312wal.125.1258836737140;
	Sat, 21 Nov 2009 12:52:17 -0800 (PST)
Received: from ?192.168.0.102? (97-126-104-157.tukw.qwest.net [97.126.104.157])
	by mx.google.com with ESMTPS id 20sm1797787pxi.15.2009.11.21.12.52.16
	(version=SSLv3 cipher=RC4-MD5); Sat, 21 Nov 2009 12:52:16 -0800 (PST)
From: Cory Maccarrone <darkstar6262@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Nov 2009 12:52:15 -0800
Message-ID: <1258836735.21876.2.camel@runt>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: darkstar6262@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE] [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Sat, 21 Nov 2009 20:53:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

(This patch is being submitted on behalf of Khem Raj.  I am not the original
author, nor do I claim any part of this work.)
--------------

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
index e622aee..69d1979 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -716,9 +716,14 @@ base_do_buildall() {
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
@@ -787,7 +792,7 @@ def oe_unpack_file(file, data, url = None):
 
 	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
 	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), base_path_out(os.getcwd(), data)))
-	ret = os.system(cmd)
+	ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
 
 	os.chdir(save_cwd)
 
-- 
1.6.3.3




