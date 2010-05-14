Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OD2Pn-0001Hp-Mm
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 23:27:28 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2049F11000DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 23:23:33 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 916F711000A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 23:23:31 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052235244.adsl.alicedsl.de
	[78.52.235.244]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 23:23:31 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E60BE3C0F6; Fri, 14 May 2010 23:23:30 +0200 (CEST)
Date: Fri, 14 May 2010 23:23:30 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20100514212330.GA11268@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Using tar option strip-components in do_unpack
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
X-List-Received-Date: Fri, 14 May 2010 21:27:28 -0000
X-Groupsio-MsgNum: 19315
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I discussed with pb on irc, how it would be the best way to unpack two tar
archivs into the same directory. He pointed me to the tar strip-components
options and attached is the outcome. Because base.bbclass is touched it is
open for discussion here.

Bye Henning

--r5Pyd7+fXNt84Ff3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-base.bbclass-introduce-strip-components-option-for-t.patch"

From 0688f07fe2e8b1926ae1dc34a03d6b5845871f74 Mon Sep 17 00:00:00 2001
From: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Fri, 14 May 2010 21:16:30 +0200
Subject: [PATCH] base.bbclass: introduce strip-components option for tar and set tar
               options in a sane way

* you can use now the following in your SRC_URI to munge diffrent tar archivs
  into the same directory
  http://foo.tar.bz2;strip_components=1;subdir=foo \
  http://foo2.tar.bz2;strip_components=1;subdir=foo
---
 classes/base.bbclass |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 3c854c6..373f5f2 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -171,18 +171,24 @@ def oe_unpack_file(file, data, url = None):
 	else:
 		efile = file
 	cmd = None
+        tar_options = 'x --no-same-owner'
+	parm = bb.decodeurl(url)[5]
+	if 'strip_components' in parm:
+           bb.note("using strip_componetes")
+           tar_options = tar_options + ' --strip-components=%s' % parm['strip_components']
+        tar_options = tar_options + ' -f'
 	if file.endswith('.tar'):
-		cmd = 'tar x --no-same-owner -f %s' % file
+		cmd = 'tar %s %s' % (tar_options, file)
 	elif file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'):
-		cmd = 'tar xz --no-same-owner -f %s' % file
+		cmd = 'tar z%s %s' % (tar_options, file)
 	elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar.bz2'):
-		cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
+		cmd = 'bzip2 -dc %s | tar %s -' % (file, tar_options)
 	elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
 		cmd = 'gzip -dc %s > %s' % (file, efile)
 	elif file.endswith('.bz2'):
 		cmd = 'bzip2 -dc %s > %s' % (file, efile)
 	elif file.endswith('.tar.xz'):
-		cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
+		cmd = 'xz -dc %s | tar %s -' % (file, tar_options)
 	elif file.endswith('.xz'):
 		cmd = 'xz -dc %s > %s' % (file, efile)
 	elif file.endswith('.zip') or file.endswith('.jar'):
@@ -227,7 +233,6 @@ def oe_unpack_file(file, data, url = None):
 
 	# Change to subdir before executing command
 	save_cwd = os.getcwd();
-	parm = bb.decodeurl(url)[5]
 	if 'subdir' in parm:
 		newdir = ("%s/%s" % (os.getcwd(), parm['subdir']))
 		bb.mkdirhier(newdir)
-- 
1.7.1


--r5Pyd7+fXNt84Ff3--
