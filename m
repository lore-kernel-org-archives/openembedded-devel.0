Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E43996D053
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s089WfEn001958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:41 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:40 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:24 -0500
Message-ID: <9bea9ea4a159ebd6f4b0d95eead4cbb2a5517245.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 04/10] libsemanage: migrate SRC_URI to 2.2
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:40 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Updated patch:
 - libsemanage-fix-path-nologin.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libsemanage/libsemanage-fix-path-nologin.patch |    9 +++++----
 recipes-security/selinux/libsemanage_2.2.bb        |    6 +++---
 recipes-security/selinux/libsemanage_git.bb        |    3 ++-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/recipes-security/selinux/libsemanage/libsemanage-fix-path-nologin.patch b/recipes-security/selinux/libsemanage/libsemanage-fix-path-nologin.patch
index 7ce586b..5fc1e17 100644
--- a/recipes-security/selinux/libsemanage/libsemanage-fix-path-nologin.patch
+++ b/recipes-security/selinux/libsemanage/libsemanage-fix-path-nologin.patch
@@ -6,12 +6,13 @@ shadow package of oe-core and Debian has installed nologin into
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ---
  src/genhomedircon.c |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/genhomedircon.c b/src/genhomedircon.c
-index 262a6cd..a50e03d 100644
+index f3b9b5c..4f4865a 100644
 --- a/src/genhomedircon.c
 +++ b/src/genhomedircon.c
 @@ -58,7 +58,7 @@
@@ -23,12 +24,12 @@ index 262a6cd..a50e03d 100644
  
  /* comments written to context file */
  #define COMMENT_FILE_CONTEXT_HEADER "#\n#\n# " \
-@@ -392,7 +392,7 @@ static semanage_list_t *get_home_dirs(genhomedircon_settings_t * s)
+@@ -393,7 +393,7 @@ static semanage_list_t *get_home_dirs(genhomedircon_settings_t * s)
  
  			/* NOTE: old genhomedircon printed a warning on match */
  			if (hand.matched) {
--				WARN(s->h_semanage, "%s homedir %s or its parent directory conflicts with a file context already specified in the policy.  This usually indicates an incorrectly defined system account.  If it is a system account please make sure its uid is less than %u or its login shell is /sbin/nologin.", pwbuf->pw_name, pwbuf->pw_dir, minuid);
-+				WARN(s->h_semanage, "%s homedir %s or its parent directory conflicts with a file context already specified in the policy.  This usually indicates an incorrectly defined system account.  If it is a system account please make sure its uid is less than %u or its login shell is /usr/sbin/nologin.", pwbuf->pw_name, pwbuf->pw_dir, minuid);
+-				WARN(s->h_semanage, "%s homedir %s or its parent directory conflicts with a file context already specified in the policy.  This usually indicates an incorrectly defined system account.  If it is a system account please make sure its uid is less than %u or greater than %u or its login shell is /sbin/nologin.", pwbuf->pw_name, pwbuf->pw_dir, minuid, maxuid);
++				WARN(s->h_semanage, "%s homedir %s or its parent directory conflicts with a file context already specified in the policy.  This usually indicates an incorrectly defined system account.  If it is a system account please make sure its uid is less than %u or greater than %u or its login shell is /usr/sbin/nologin.", pwbuf->pw_name, pwbuf->pw_dir, minuid, maxuid);
  			} else {
  				if (semanage_list_push(&homedir_list, path))
  					goto fail;
diff --git a/recipes-security/selinux/libsemanage_2.2.bb b/recipes-security/selinux/libsemanage_2.2.bb
index 900d608..4ee93c0 100644
--- a/recipes-security/selinux/libsemanage_2.2.bb
+++ b/recipes-security/selinux/libsemanage_2.2.bb
@@ -1,12 +1,12 @@
 PR = "r0"
 
-include selinux_20130423.inc
+include selinux_20131030.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "44fc8a3387486378a21d8df7454b9d42"
-SRC_URI[sha256sum] = "de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91"
+SRC_URI[md5sum] = "2a939538645de6023633bc2247a5e72e"
+SRC_URI[sha256sum] = "11f60bfa0f1c6063cd9bd99ce0cb4acc9d6d9e9b8d7743d39e847bcd7803bd75"
 
 SRC_URI += "\
 	file://libsemanage-Fix-execve-segfaults-on-Ubuntu.patch \
diff --git a/recipes-security/selinux/libsemanage_git.bb b/recipes-security/selinux/libsemanage_git.bb
index 6553c6b..c3799fd 100644
--- a/recipes-security/selinux/libsemanage_git.bb
+++ b/recipes-security/selinux/libsemanage_git.bb
@@ -1,5 +1,5 @@
 PR = "r0"
-PV = "2.1.10+git${SRCPV}"
+PV = "2.2+git${SRCPV}"
 
 include selinux_git.inc
 include ${BPN}.inc
@@ -11,4 +11,5 @@ SRC_URI += "\
 	file://libsemanage-fix-path-len-limit.patch \
 	file://libsemanage-fix-path-nologin.patch \
 	file://libsemanage-drop-Wno-unused-but-set-variable.patch \
+	file://libsemanage-define-FD_CLOEXEC-as-necessary.patch;striplevel=2 \
 	"
-- 
1.7.9.5


