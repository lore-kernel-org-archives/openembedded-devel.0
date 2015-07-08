Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 212DD75D3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 03:23:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t683NH6d006710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jul 2015 20:23:17 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Jul 2015 20:23:16 -0700
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jul 2015 11:23:15 +0800
Message-ID: <1436325795-22322-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH][meta-networking] systemd.bbclass: delete dangling symblink
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jul 2015 03:23:20 -0000
Content-Type: text/plain

If only systemd is enabled, scripts of sysvinit under "/etc/init.d/"
will be deleted. But there may be some symblinks /etc/rc*/ that
points to the files under "/etc/init.d/". We need to delete them.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/classes/systemd.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c34884b..ff3e0f8 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -184,6 +184,31 @@ do_install[postfuncs] += "rm_systemd_unitdir "
 python rm_sysvinit_initddir (){
     import shutil
     sysv_initddir = oe.path.join(d.getVar("D", True), (d.getVar('INIT_D_DIR', True) or "/etc/init.d"))
+    sysv_rcdirs = []
+    cpath = oe.cachedpath.CachedPath()
+
+    def check_dangling_sym(file,inst_root):
+        if not cpath.islink(file):
+            return False
+
+        rtarget = cpath.realpath(file, inst_root, True, assume_dir = True)
+        if not cpath.lexists(rtarget):
+            return True
+
+        return False
+
+    # delete dangling symblink under rc*
+    def rm_sysv_rcdirs():
+        dest = d.getVar("D", True)
+        rcdirs = "rc.d rc0.d rc1.d rc2.d rc3.d rc4.d rc5.d rc6.d rcS.d"
+
+        for rcdir in rcdirs.split():
+            path = dest + "/etc/" + rcdir
+            for walk_root, walk_dirs, walk_files in cpath.walk(path):
+                for file in walk_files:
+                    file = walk_root + "/" + file
+                    if check_dangling_sym(file, walk_root):
+                        sysv_rcdirs.append(file)
 
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
         not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
@@ -193,5 +218,9 @@ python rm_sysvinit_initddir (){
         # If systemd_unitdir contains anything, delete sysv_initddir
         if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
             shutil.rmtree(sysv_initddir)
+
+            rm_sysv_rcdirs()
+            for rcdir in sysv_rcdirs:
+                os.remove(rcdir)
 }
 do_install[postfuncs] += "rm_sysvinit_initddir "
-- 
1.8.5.2.233.g932f7e4


