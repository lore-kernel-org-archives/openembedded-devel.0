Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVT9a-0001zI-Cz
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 19:38:55 +0200
Received: by pvg13 with SMTP id 13so165471pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+rO/pLxa+ZWNIjp+HTXvidxtowc4QyzL2W/zqG3uiyI=;
	b=sATKFDf5WMXxG24RdnLqVmOKU5PwYTUeVttdk9g0GNV2Jq3GJ5wz2AMnjj3JW9MSvx
	HxdT0X15NlFfm/umFqaFom/6H/BWMFMDlVUux2yFtgBtw5hjwLd0pZn4OOP5cez9tmgf
	r2/7Ytwz2cThkzXxbrzlHhNqKfkKx5GE3CedY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KudFe5NKJcE5Yo41GZVg5BHS8STaW8UOuFzsfyXzVIJh04gl67XNl5/RLM91HruEJJ
	z7LPcHZNJizXnuPdhXUURTdgZZtZ7IdEKm4sfv55G5QZdYYjoPa1ozcQBwwC1FUW26Y7
	7J3ZG+AfFUE+7WrwHesGekfqEYpPLdQHEjs8g=
Received: by 10.114.14.16 with SMTP id 16mr1946955wan.61.1278264845122;
	Sun, 04 Jul 2010 10:34:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k23sm49481258waf.5.2010.07.04.10.34.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Jul 2010 10:34:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Jul 2010 10:34:00 -0700
Message-Id: <1278264840-24635-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v2] base.bbclass: Fix oe_unpack_file to unpack files to match new bitbake bb.decodeurl()
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
X-List-Received-Date: Sun, 04 Jul 2010 17:38:55 -0000

* This patch now uses the path which essentially is the path and
  filename relative to recipe dir. It will create the directories
  as expected. Suppose if the is says file://pam.d/login in the
  SRC_URI then it will be copied to $WORKDIR/pam.d/login as it
  was happening before the fix to decodeurl in bitbake.

* Do not copy the .patch and .diff files into $WORKDIR
  they are already symlinked in patches/ dir which will
  be used by quilt.


I have done native-sdk-image build from scratch for arm/x86 using bitbake master
and this patch on OE without any problem.

OK for .dev ?

Thanks

-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 3995ac8..2da0b7a 100644
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
+	elif (type == "file" and file.endswith('.patch') or file.endswith('.diff')) and parm.get('apply') != 'no':
+	# patch and diff files are special and need not be copied to workdir
+		cmd = ""
 	elif os.path.isdir(file):
 		destdir = "."
 		filespath = bb.data.getVar("FILESPATH", data, 1).split(":")
@@ -212,28 +215,23 @@ def oe_unpack_file(file, data, url = None):
 
 		cmd = 'cp -pPR %s %s/%s/' % (file, os.getcwd(), destdir)
 	else:
-		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
 		if not 'patch' in parm and parm.get('apply') != 'yes':
 			# The "destdir" handling was specifically done for FILESPATH
 			# items.  So, only do so for file:// entries.
 			if type == "file":
-				destdir = bb.decodeurl(url)[1] or "."
+				dest = os.path.dirname(path) or "."
 			else:
-				destdir = "."
-			bb.mkdirhier("%s/%s" % (os.getcwd(), destdir))
-			cmd = 'cp %s %s/%s/' % (file, os.getcwd(), destdir)
-
+				dest = "."
+			bb.mkdirhier("%s" % os.path.join(os.getcwd(),dest))
+			cmd = 'cp %s %s' % (file, os.path.join(os.getcwd(), dest))
 	if not cmd:
 		return True
-
-	dest = os.path.join(os.getcwd(), os.path.basename(file))
+	dest = os.path.join(os.getcwd(), path)
 	if os.path.exists(dest):
 		if os.path.samefile(file, dest):
 			return True
-
 	# Change to subdir before executing command
 	save_cwd = os.getcwd();
-	parm = bb.decodeurl(url)[5]
 	if 'subdir' in parm:
 		newdir = ("%s/%s" % (os.getcwd(), parm['subdir']))
 		bb.mkdirhier(newdir)
-- 
1.7.1



