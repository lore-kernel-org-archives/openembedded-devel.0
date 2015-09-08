Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48A6B76AC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 09:37:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t889bAd1008838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Sep 2015 02:37:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 02:37:10 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Sep 2015 17:31:47 +0800
Message-ID: <1441704708-22940-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441704708-22940-1-git-send-email-kai.kang@windriver.com>
References: <1441704708-22940-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Tue, 08 Sep 2015 09:37:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade efivar from 0.7 to 0.21.

* update HOMEPAGE

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/efivar/efivar_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/recipes-extended/efivar/efivar_git.bb
index 18446a0..bf2e6d2 100644
--- a/meta-oe/recipes-extended/efivar/efivar_git.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_git.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Tools to manipulate UEFI variables"
 DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
-HOMEPAGE = "https://github.com/vathpela/efivar"
+HOMEPAGE = "https://github.com/rhinstaller/efivar"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 DEPENDS = "popt"
 
-SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
-PV = "0.7+git${SRCPV}"
+SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
+PV = "0.21+git${SRCPV}"
 SRC_URI = "git://github.com/vathpela/efivar.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


