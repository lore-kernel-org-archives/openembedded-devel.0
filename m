Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79A2760167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:01:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9881K9B028693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Oct 2014 01:01:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 01:01:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Oct 2014 01:01:19 -0700
Message-ID: <1412755279-22850-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1412755279-22850-1-git-send-email-liezhi.yang@windriver.com>
References: <1412755279-22850-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 2/2] openldap: use PN for PACKAGES_DYNAMIC
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
X-List-Received-Date: Wed, 08 Oct 2014 08:01:26 -0000
Content-Type: text/plain

Fixed do_packagedata error when multilib:
ERROR: The recipe openldap is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   /path/to/sysroots/qemux86-64/pkgdata/runtime-rprovides/openldap-backends/openldap-backends
   Matched in manifest-qemux86-64-lib32-openldap.packagedata
   /path/to/tmp/sysroots/qemux86-64/pkgdata/runtime/openldap-backends.packaged
   Matched in manifest-qemux86-64-lib32-openldap.packagedata
   /path/to/tmp/sysroots/qemux86-64/pkgdata/runtime/openldap-backends
   Matched in manifest-qemux86-64-lib32-openldap.packagedata
Please verify which recipe should provide the above files.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/openldap/openldap_2.4.23.bb    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index b2693b5..198d2d7 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -194,13 +194,13 @@ pkg_prerm_${PN}-slapd () {
     update-rc.d $D openldap remove
 }
 
-PACKAGES_DYNAMIC += "^openldap-backends.* ^openldap-backend-.*"
+PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
 
 python populate_packages_prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
-    metapkg = "openldap-backends"
+    metapkg = "${PN}-backends"
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     d.setVar('FILES_' + metapkg, "")
     metapkg_rdepends = []
-- 
1.7.9.5


