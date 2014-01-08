Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEE26D006
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s089WZLK014524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:35 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:34 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:21 -0500
Message-ID: <252c9fb3020d2323753a32907632ffd3892de7fd.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 01/10] selinux userspace: uprev packages to release 20131030
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Upreved packages:
 - checkpolicy to 2.2
 - libselinux to 2.2
 - libsemanage to 2.2
 - libsepol to 2.2
 - policycoreutils to 2.2.5
 - sepolgen to 1.2.1

Migrate patches in next commits.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../{checkpolicy_2.1.12.bb => checkpolicy_2.2.bb}  |    0
 .../{libselinux_2.1.13.bb => libselinux_2.2.bb}    |    0
 .../{libsemanage_2.1.10.bb => libsemanage_2.2.bb}  |    0
 .../selinux/{libsepol_2.1.9.bb => libsepol_2.2.bb} |    0
 ...oreutils_2.1.14.bb => policycoreutils_2.2.5.bb} |    0
 recipes-security/selinux/selinux_20130423.inc      |   12 ------------
 recipes-security/selinux/selinux_20131030.inc      |   12 ++++++++++++
 recipes-security/selinux/selinux_git.inc           |    4 +---
 .../{sepolgen_1.1.9.bb => sepolgen_1.2.1.bb}       |    0
 9 files changed, 13 insertions(+), 15 deletions(-)
 rename recipes-security/selinux/{checkpolicy_2.1.12.bb => checkpolicy_2.2.bb} (100%)
 rename recipes-security/selinux/{libselinux_2.1.13.bb => libselinux_2.2.bb} (100%)
 rename recipes-security/selinux/{libsemanage_2.1.10.bb => libsemanage_2.2.bb} (100%)
 rename recipes-security/selinux/{libsepol_2.1.9.bb => libsepol_2.2.bb} (100%)
 rename recipes-security/selinux/{policycoreutils_2.1.14.bb => policycoreutils_2.2.5.bb} (100%)
 delete mode 100644 recipes-security/selinux/selinux_20130423.inc
 create mode 100644 recipes-security/selinux/selinux_20131030.inc
 rename recipes-security/selinux/{sepolgen_1.1.9.bb => sepolgen_1.2.1.bb} (100%)

diff --git a/recipes-security/selinux/checkpolicy_2.1.12.bb b/recipes-security/selinux/checkpolicy_2.2.bb
similarity index 100%
rename from recipes-security/selinux/checkpolicy_2.1.12.bb
rename to recipes-security/selinux/checkpolicy_2.2.bb
diff --git a/recipes-security/selinux/libselinux_2.1.13.bb b/recipes-security/selinux/libselinux_2.2.bb
similarity index 100%
rename from recipes-security/selinux/libselinux_2.1.13.bb
rename to recipes-security/selinux/libselinux_2.2.bb
diff --git a/recipes-security/selinux/libsemanage_2.1.10.bb b/recipes-security/selinux/libsemanage_2.2.bb
similarity index 100%
rename from recipes-security/selinux/libsemanage_2.1.10.bb
rename to recipes-security/selinux/libsemanage_2.2.bb
diff --git a/recipes-security/selinux/libsepol_2.1.9.bb b/recipes-security/selinux/libsepol_2.2.bb
similarity index 100%
rename from recipes-security/selinux/libsepol_2.1.9.bb
rename to recipes-security/selinux/libsepol_2.2.bb
diff --git a/recipes-security/selinux/policycoreutils_2.1.14.bb b/recipes-security/selinux/policycoreutils_2.2.5.bb
similarity index 100%
rename from recipes-security/selinux/policycoreutils_2.1.14.bb
rename to recipes-security/selinux/policycoreutils_2.2.5.bb
diff --git a/recipes-security/selinux/selinux_20130423.inc b/recipes-security/selinux/selinux_20130423.inc
deleted file mode 100644
index d692a57..0000000
--- a/recipes-security/selinux/selinux_20130423.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SELINUX_RELEASE = "20130423"
-
-SRC_URI = "http://userspace.selinuxproject.org/releases/${SELINUX_RELEASE}/${BPN}-${PV}.tar.gz"
-
-PREFERRED_VERSION_checkpolicy = "2.1.12"
-PREFERRED_VERSION_libselinux = "2.1.13"
-PREFERRED_VERSION_libsemanage = "2.1.10"
-PREFERRED_VERSION_libsepol = "2.1.9"
-PREFERRED_VERSION_policycoreutils = "2.1.14"
-PREFERRED_VERSION_sepolgen = "1.1.9"
-
-include selinux_common.inc
diff --git a/recipes-security/selinux/selinux_20131030.inc b/recipes-security/selinux/selinux_20131030.inc
new file mode 100644
index 0000000..807a37c
--- /dev/null
+++ b/recipes-security/selinux/selinux_20131030.inc
@@ -0,0 +1,12 @@
+SELINUX_RELEASE = "20131030"
+
+SRC_URI = "http://userspace.selinuxproject.org/releases/${SELINUX_RELEASE}/${BPN}-${PV}.tar.gz"
+
+PREFERRED_VERSION_checkpolicy = "2.2"
+PREFERRED_VERSION_libselinux = "2.2"
+PREFERRED_VERSION_libsemanage = "2.2"
+PREFERRED_VERSION_libsepol = "2.2"
+PREFERRED_VERSION_policycoreutils = "2.2.5"
+PREFERRED_VERSION_sepolgen = "1.2.1"
+
+include selinux_common.inc
diff --git a/recipes-security/selinux/selinux_git.inc b/recipes-security/selinux/selinux_git.inc
index 37ea8e8..bb64d0d 100644
--- a/recipes-security/selinux/selinux_git.inc
+++ b/recipes-security/selinux/selinux_git.inc
@@ -1,8 +1,6 @@
-SRCREV = "3f52a123af40bae33bde2a1f2ecfb2320b61f9ad"
+SRCREV = "edc2e99687b050d5be21a78a66d038aa1fc068d9"
 
 SRC_URI = "git://oss.tresys.com/git/selinux.git;protocol=http"
-SRC_URI[md5sum] = "4ec64a0d24aaa77c80b86e74d271e464"
-SRC_URI[sha256sum] = "9c8a8643c9a4dd0eb76fcda1420d636b750b84b27656c6f8bc6886a829d7e520"
 
 S = "${WORKDIR}/git/${BPN}"
 
diff --git a/recipes-security/selinux/sepolgen_1.1.9.bb b/recipes-security/selinux/sepolgen_1.2.1.bb
similarity index 100%
rename from recipes-security/selinux/sepolgen_1.1.9.bb
rename to recipes-security/selinux/sepolgen_1.2.1.bb
-- 
1.7.9.5


