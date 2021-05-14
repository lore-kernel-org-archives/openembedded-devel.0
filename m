Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8146.1620996345320224583
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 05:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E674C1476
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 05:45:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE5F3F73B
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 05:45:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] nss: disable -Werror
Date: Fri, 14 May 2021 13:45:40 +0100
Message-Id: <20210514124541.517318-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-Werror should be used by developers and not packagers, because new
compiler flags or GCC versions can use new warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-su=
pport/nss/nss_3.64.bb
index 1863db131b..119d4ad037 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -96,6 +96,7 @@ do_compile() {
     export NS_USE_GCC=3D1
     export NSS_USE_SYSTEM_SQLITE=3D1
     export NSS_ENABLE_ECC=3D1
+    export NSS_ENABLE_WERROR=3D0
=20
     ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_=
HW_CRYPTO=3D1", "", d)}
=20
--=20
2.25.1

