Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0C0B71A05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 01:45:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9J1jNRp029932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Oct 2017 18:45:23 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 18 Oct 2017 18:45:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Oct 2017 21:45:16 -0400
Message-ID: <1508377517-102153-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-oe] libpwquality: fix Nothing RPROVIDES 'lib32-python3-libpwquality'
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
X-List-Received-Date: Thu, 19 Oct 2017 01:45:23 -0000
Content-Type: text/plain

While multilib enabled, if other recipe RDEPENDS python3-libpwquality,
it failed with:
...
ERROR: Nothing RPROVIDES 'lib32-python3-libpwquality'
...

Do not use python3-${PN} could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
index daf6604..2c96063 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 DEPENDS = "cracklib virtual/gettext python3"
-RDEPENDS_python3-${PN} = "${PN}"
+RDEPENDS_python3-libpwquality = "${PN}"
 
 inherit autotools python3native gettext
 
@@ -36,7 +36,7 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
 
-PACKAGES += "python3-${PN} python3-${PN}-dbg"
+PACKAGES += "python3-libpwquality python3-libpwquality-dbg"
 FILES_${PN} += "${libdir}/security/pam_pwquality.so"
 FILES_${PN}-dbg += "${libdir}/security/.debug"
 FILES_${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
-- 
1.8.3.1


