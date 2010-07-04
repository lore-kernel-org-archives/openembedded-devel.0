Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVGeu-0005lw-Qr
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 06:18:28 +0200
Received: by pwi10 with SMTP id 10so1874060pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jul 2010 21:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=6VXxcbRPvBHwkpvSQpSVj58EoF9tHvCKyq9DAwRKNEg=;
	b=jVnjwa8z0yI/bwjVA+UWoBcYQ5wLcUaMdfN+t7zIWDh3ujxk8wf8Mo9luUwDoAQDfZ
	oSJuoGismCha9fAj8nslYHR68eIwq4ehnS3evKDsuMqOLU7XGyEYSH27tzes1b+lYBQr
	BpqN07Cg30PcvlJ0z3cTid+GZg3DV+++DZ6vo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VTIKAmlQZJ5juU1uRSXc6X8ljsv5pOBZmCEcdLyKjTkzNekoAmiRPVulTwRvwvCTpJ
	BcY056QADIxxRWUDYd0ks9RpGg2+U0BBLP+RQNAoohQsMYcB58cvOkpvOiGVaFGj//x1
	NosyWbrAzcJIUCgnFKeenuRBLZNz62APQ8sGc=
Received: by 10.142.172.6 with SMTP id u6mr1310057wfe.52.1278216816273;
	Sat, 03 Jul 2010 21:13:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm2860375wfl.13.2010.07.03.21.13.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 03 Jul 2010 21:13:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Jul 2010 21:13:31 -0700
Message-Id: <1278216811-2704-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: Fix oe_unpack_file to unpack files to match new bitbake bb.decodeurl()
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
X-List-Received-Date: Sun, 04 Jul 2010 04:18:30 -0000

* This patch now uses the path which essentially is the path and
  filename relative to recipe dir. It will create the directories
  as expected. Suppose if the is says file://pam.d/login in the
  SRC_URI then it will be copied to $WORKDIR/pam.d/login as it
  was happening before the fix to decodeurl in bitbake.

* Do not copy the .patch and .diff files into $WORKDIR
  they are already symlinked in patches/ dir which will
  be used by quilt.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |   19 +++++++++----------
 1 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 3995ac8..d0b0b1c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -177,6 +177,7 @@ def oe_unpack_file(file, data, url = None):
 	else:
 		efile = file
 	cmd = None
+	(type, host, path, user, pswd, parm) = bb.decodeurl(url)
 	if file.endswith('.tar'):
 		cmd = 'tar x --no-same-owner -f %s' % file
 	elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
@@ -193,10 +194,12 @@ def oe_unpack_file(file, data, url = None):
 		cmd = 'xz -dc %s > %s' % (file, efile)
 	elif file.endswith('.zip') or file.endswith('.jar'):
 		cmd = 'unzip -q -o'
-		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
 		if 'dos' in parm:
 			cmd = '%s -a' % cmd
 		cmd = "%s '%s'" % (cmd, file)
+	elif file.endswith('.patch') or file.endswith('.diff'):
+	# patch and diff files are special and need not be copied to workdir
+		cmd = ""
 	elif os.path.isdir(file):
 		destdir = "."
 		filespath = bb.data.getVar("FILESPATH", data, 1).split(":")
@@ -212,28 +215,24 @@ def oe_unpack_file(file, data, url = None):
 
 		cmd = 'cp -pPR %s %s/%s/' % (file, os.getcwd(), destdir)
 	else:
-		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
 		if not 'patch' in parm and parm.get('apply') != 'yes':
 			# The "destdir" handling was specifically done for FILESPATH
 			# items.  So, only do so for file:// entries.
 			if type == "file":
-				destdir = bb.decodeurl(url)[1] or "."
+				dest =  path or "."
 			else:
-				destdir = "."
-			bb.mkdirhier("%s/%s" % (os.getcwd(), destdir))
-			cmd = 'cp %s %s/%s/' % (file, os.getcwd(), destdir)
-
+				dest = "."
+			bb.mkdirhier("%s" % os.path.dirname(os.path.join(os.getcwd(),dest)))
+			cmd = 'cp %s %s/%s' % (file, os.getcwd(), dest)
 	if not cmd:
 		return True
-
-	dest = os.path.join(os.getcwd(), os.path.basename(file))
+	dest = os.path.join(os.getcwd(), path)
 	if os.path.exists(dest):
 		if os.path.samefile(file, dest):
 			return True
 
 	# Change to subdir before executing command
 	save_cwd = os.getcwd();
-	parm = bb.decodeurl(url)[5]
 	if 'subdir' in parm:
 		newdir = ("%s/%s" % (os.getcwd(), parm['subdir']))
 		bb.mkdirhier(newdir)
-- 
1.7.1



