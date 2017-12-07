Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD616601F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 06:09:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB769fDc014196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Dec 2017 22:09:41 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Dec 2017 22:09:40 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Dec 2017 13:50:51 +0800
Message-ID: <20171207055051.22129-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] passwdqc: add pam-passwdqc to RDEPENDS
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
X-List-Received-Date: Thu, 07 Dec 2017 06:09:41 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Some basic function such as password change invoked
by programs such as passwd depends on pam_passwdqc.so
which is provided by subpackage pam-passwdqc.

Add pam-passwdqc to RDEPENDS for passwdqc.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
index b8f923c29..198db3ce7 100644
--- a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
@@ -59,5 +59,5 @@ FILES_lib${BPN} = "${base_libdir}/libpasswdqc.so.0"
 FILES_pam-${BPN} = "${base_libdir}/security/pam_passwdqc.so"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
-RDEPENDS_${PN} = "lib${BPN}"
+RDEPENDS_${PN} = "lib${BPN} pam-${BPN}"
 RDEPENDS_pam-${BPN} = "lib${BPN}"
-- 
2.13.3


