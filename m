Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O1zA5-00042u-EB
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 11:45:33 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3E9g2Da001972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Apr 2010 11:42:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O1z6e-0001jX-SJ; Wed, 14 Apr 2010 11:42:01 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 11:41:58 +0200
Message-Id: <1271238118-6524-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Wed, 14 Apr 2010 09:45:34 -0000

The old dangling link detection used os.stat() on the file and
registered it as a dangling link when it was not found. This causes
problems when the link is an absolute one because it will check
files of the host system.

E.g. when there is a link

.../tmp/work/../etc/cron.root -> /var/spool/cron/root

Then

* existence of /var/spool/cron/root but not of
  ../tmp/work/.../var/spool/cron/root will be checked

* the build aborts because a 'permission denied' exception is thrown
  but only 'not found' be catched

This patch uses os.lstat() to check whether source file is a link, adds
it to the installation root direction and checks for the existence of
this file then.

As this is only a QA mechanism which does not affect the resulting
package, there is checked for generic OSErrors only, not only for
ENOENT.  Other problems (e.g. EPERM) will be reported by other
functions.
---
 classes/package.bbclass |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 990c3f6..ae8e92e 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -482,15 +482,17 @@ python populate_packages () {
 				path = os.path.join(root, f)
 				rpath = path[len(inst_root):]
 				pkg_files[pkg].append(rpath)
-				try:
-					s = os.stat(path)
-				except OSError, (err, strerror):
-					if err != errno.ENOENT:
-						raise
+				if os.path.islink(path):
 					target = os.readlink(path)
 					if target[0] != '/':
 						target = os.path.join(root[len(inst_root):], target)
-					dangling_links[pkg].append(os.path.normpath(target))
+
+					rtarget = os.path.join(inst_root, target[1:])
+
+					try:
+						os.lstat(rtarget)
+					except OSError:
+						dangling_links[pkg].append(os.path.normpath(target))
 
 	for pkg in package_list:
 		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
-- 
1.7.0.1



