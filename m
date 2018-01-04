Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5863371A32
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 07:19:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w047JsBU010249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Jan 2018 23:19:54 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 23:19:40 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jan 2018 14:58:45 +0800
Message-ID: <20180104065846.20541-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] cfengine-masterfiles: 3.9.0 -> 3.10.2
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
X-List-Received-Date: Thu, 04 Jan 2018 07:19:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade cfengine-masterfiles from 3.9.0 to lastest lts version 3.10.2.

* year info has been updated in license file so md5 checksum changed
* remove remove-policy-of-usr-local-sbin.patch which has been done in upstream already
* correct install prefix

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../remove-policy-of-usr-local-sbin.patch          | 28 ----------------------
 ...les_3.9.0.bb => cfengine-masterfiles_3.10.2.bb} | 17 +++++++------
 2 files changed, 8 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.9.0.bb => cfengine-masterfiles_3.10.2.bb} (64%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
deleted file mode 100644
index 3f8debc28..000000000
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Directory /usr/local is not used for us. Remove the policy that not to install
-binaries to /usr/local/sbin.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/cfe_internal/update/update_bins.cf b/cfe_internal/update/update_bins.cf
-index 1796caa..697af0d 100644
---- a/cfe_internal/update/update_bins.cf
-+++ b/cfe_internal/update/update_bins.cf
-@@ -55,16 +55,6 @@ bundle agent cfe_internal_bins
-       depth_search => u_recurse_basedir("inf"),
-       action => u_immediate;
- 
--      "/usr/local/sbin/$(agents)"
--      comment => "Create symlinks of CFE binaries in /usr/local/sbin",
--      handle => canonify("cfe_internal_bins_files_sbin_$(agents)"),
--      move_obstructions => "true",
--      link_from => u_ln_s("$(sys.workdir)/bin/$(agents)");
--
--      "/usr/local/sbin/$(agents).cfsaved"
--      comment => "Remove all .cfsaved file extension",
--      handle => canonify("cfe_internal_bins_files_remove_$(agent)_cfsaved"),
--      delete => u_tidy;
- }
- 
- bundle agent cfe_internal_update_bins
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
similarity index 64%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
index 9d01c5128..b52e7cc08 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
@@ -1,5 +1,5 @@
 #
-# Copyright (C) 2014 - 2016 Wind River Systems, Inc.
+# Copyright (C) 2014 - 2017 Wind River Systems, Inc.
 #
 SUMMARY = "Base policy for CFEngine"
 
@@ -18,20 +18,19 @@ or wherever `$(sys.masterdir)` points. \
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52cd3d13af93180822888ab0088e9328"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
 
-SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
-           file://remove-policy-of-usr-local-sbin.patch \
-"
-SRC_URI[md5sum] = "b101ddcd546738af6ec91be5c297cb24"
-SRC_URI[sha256sum] = "63dec2f8649f5f2788cd463dccf47f8dbe941522acfcf3093517f983bbfa0606"
+SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "1247ef4e8f3cee5efa98da50c326e5a4"
+SRC_URI[sha256sum] = "5d18a8d71f451d0b5dd1f5e579452b29b99b664f2bb0827dbba9a615f2764df6"
 
 inherit autotools
 
 export EXPLICIT_VERSION="${PV}"
 
-EXTRA_OECONF = "--prefix=${localstatedir}/cfengine"
+EXTRA_OECONF = "--prefix=${datadir}/cfengine"
 
-FILES_${PN} += "${localstatedir}/cfengine"
+FILES_${PN} = "${datadir}/cfengine"
 
 RDEPENDS_${PN} += "python-core"
-- 
2.14.1


