Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1356877DD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879545971"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:21 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:05 +0800
Message-Id: <1500259691-9782-4-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
Subject: [meta-openwrt][PATCH 3/9] Juci: fixed gcc 7 issue
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:21 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

Jucid had issues with the snprint:

'snprintf' output 2 or more bytes (assuming 257) into a destination of
size 255

Replaced snprintf with anprintf with pointer rather than a fixed array
length.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch | 41 +++++++++++++++++++++++
 recipes-core/juci/jucid_git.bb                    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch

diff --git a/recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch b/recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch
new file mode 100644
index 0000000..bae5b31
--- /dev/null
+++ b/recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch
@@ -0,0 +1,41 @@
+Index: git/src/juci.c
+===================================================================
+--- git.orig/src/juci.c
++++ git/src/juci.c
+@@ -14,7 +14,7 @@
+ 	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ 	GNU General Public License for more details.
+ */
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <dirent.h>
+@@ -57,11 +57,11 @@ int juci_load_plugins(struct juci *self,
+         return -ENOENT; 
+     }
+     struct dirent *ent = 0; 
+-    char fname[255]; 
++    char *fname; 
+     while((ent = readdir(dir))){
+         if(strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0) continue; 
+ 
+-        snprintf(fname, sizeof(fname), "%s/%s", path, ent->d_name); 
++        asprintf(&fname, "%s/%s", path, ent->d_name); 
+         
+         if(ent->d_type == DT_DIR) {
+             rv |= juci_load_plugins(self, fname, base_path);  
+@@ -262,11 +262,11 @@ static bool _try_auth(const char *sha1ha
+ 
+ int _load_session_acls(struct juci_session *ses, const char *pat){
+ 	glob_t glob_result;
+-	char path[255]; 
++	char *path; 
+ 	char *dir = getenv("JUCI_ACL_DIR_PATH"); 
+ 	if(!dir) dir = JUCI_ACL_DIR_PATH; 
+ 	DEBUG("loading acls from %s/%s.acl\n", dir, pat); 
+-	snprintf(path, sizeof(path), "%s/%s.acl", dir, pat); 
++	asprintf(&path, "%s/%s.acl", dir, pat); 
+ 	glob(path, GLOB_TILDE, NULL, &glob_result);
+ 	for(unsigned int i=0;i<glob_result.gl_pathc;++i){
+ 		char *text = _load_file(glob_result.gl_pathv[i]); 
diff --git a/recipes-core/juci/jucid_git.bb b/recipes-core/juci/jucid_git.bb
index 85df80d..030b32e 100644
--- a/recipes-core/juci/jucid_git.bb
+++ b/recipes-core/juci/jucid_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/mkschreder/jucid \
            file://0001-juci_ws_server.c-ubus_srv_ws_client_new-expects-no-p.patch \
            file://0001-main.c-define-_DEFAULT_SOURCE.patch \
            file://0002-fix-makefile-in.patch \
+           file://0001-gcc7-fix-jucid.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


