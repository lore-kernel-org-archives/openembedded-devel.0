Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 019B96018D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:25:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO9PXxt010981
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 01:25:34 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 24 Nov 2015 01:25:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Nov 2015 17:25:24 +0800
Message-ID: <101abb28ad2f36bb9220b4726d7bc3a8579ad0af.1448356894.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448356894.git.yi.zhao@windriver.com>
References: <cover.1448356894.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 1/3] pam-passwdqc: fix the hardcoded libdir
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
X-List-Received-Date: Tue, 24 Nov 2015 09:25:35 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
WARNING: QA Issue: pam-passwdqc-dbg: found library in wrong location:
/lib/security/.debug/pam_passwdqc.so
pam-passwdqc: found library in wrong location:
/lib/security/pam_passwdqc.so [libdir]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
index 4add367..4e8b7d8 100644
--- a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
+++ b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
@@ -23,12 +23,13 @@ S = "${WORKDIR}/pam_passwdqc-${PV}"
 
 DEPENDS = "libpam"
 
-EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW""
+EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW" \
+                SECUREDIR=${base_libdir}/security"
 
 do_install() {
 	oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "/lib/security/pam_passwdqc.so"
-FILES_${PN}-dbg += "/lib/security/.debug"
+FILES_${PN} += "${base_libdir}/security/pam_passwdqc.so"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
-- 
1.7.9.5


