Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <julian_chu@openmoko.com>) id 1KnAwo-00006J-7R
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 13:41:50 +0200
Received: from [172.16.23.108] (helo=walkingice)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <julian_chu@openmoko.com>)
	id 1KnAsC-00027q-Ft; Tue, 07 Oct 2008 19:37:14 +0800
Received: from walkingice by walkingice with local (Exim 4.67)
	(envelope-from <julian_chu@openmoko.com>)
	id 1KnAs4-0005xh-C2; Tue, 07 Oct 2008 19:36:56 +0800
Date: Tue, 7 Oct 2008 19:36:56 +0800
From: Julian Chu <julian_chu@openmoko.com>
To: bitbake-dev@lists.berlios.de
Message-ID: <20081007113656.GA22888@walkingice>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
X-SA-Exim-Connect-IP: 172.16.23.108
X-SA-Exim-Mail-From: julian_chu@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	DNS_FROM_SECURITYSAGE autolearn=no version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: A patch of git.py
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
X-List-Received-Date: Tue, 07 Oct 2008 11:41:50 -0000
X-Groupsio-MsgNum: 6101
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, 
        The attachment is a patch.

        Which fix an error of git.py which may cause error when symbolic link inside the directory.

-Ju1ian


--opJtzjQTFsWo+cga
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-git.py-Let-prunedir-can-make-a-difference-between.patch"

From b6722b83362e246f51a8397a94d21601176bc6d6 Mon Sep 17 00:00:00 2001
From: Julian_Chu <julian_chu@openmoko.com>
Date: Tue, 7 Oct 2008 19:19:34 +0800
Subject: [PATCH] git.py : Let prunedir can make a difference between real dir and symbolic link

---
 lib/bb/fetch/git.py |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 774bd1a..37a84dd 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -34,7 +34,10 @@ def prunedir(topdir):
         for name in files:
             os.remove(os.path.join(root, name))
         for name in dirs:
-            os.rmdir(os.path.join(root, name))
+            if os.path.islink(os.path.join(root, name)):
+                os.remove(os.path.join(root, name))
+            else:
+                os.rmdir(os.path.join(root, name))
 
 class Git(Fetch):
     """Class to fetch a module or modules from git repositories"""
-- 
1.5.5.1


--opJtzjQTFsWo+cga--
