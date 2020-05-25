Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.28635.1590400882303010116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 03:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04PA1J31003360
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2020 03:01:20 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 25 May 2020 03:01:00 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] plymouth: disable systemd-integration for sysvinit
Date: Mon, 25 May 2020 18:00:56 +0800
Message-ID: <20200525100056.20209-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build plymouth for sysvinit:

| ERROR: plymouth-0.9.4-r0 do_package: QA Issue: plymouth:
   Files/directories were installed but not shipped in any package:
|   /poweroff.target.wants
|   ...
|   /halt.target.wants/plymouth-halt.service
| Please set FILES such that these items are packaged. Alternatively if
   they are unneeded, avoid installing them or delete them within do_install.
| plymouth: 17 installed and not shipped files. [installed-vs-shipped]

Because systemd is not installed for sysvinit, the value of variable
'SYSTEMD_UNIT_DIR' is empty and causes the failures.

Disable systemd-integration if 'systemd' not in DISTRO_FEATURES.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
index 8b71c2bd6..78c1cb444 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '--disable-systemd-integration', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge','--without-system-root-install','--with-system-root-install',d)} \
 "
 
-- 
2.17.1

