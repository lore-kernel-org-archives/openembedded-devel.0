Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FCC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 08:07:30 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5092.1634112449749594477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 01:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19D87SIu008300
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 01:07:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19D87N9Z002659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 01:07:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 01:07:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 01:07:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-security][PATCH] sssd: re-package to fix QA issues
Date: Wed, 13 Oct 2021 16:07:19 +0800
Message-ID: <20211013080719.23008-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 08:07:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93276

From: Kai Kang <kai.kang@windriver.com>

It packages all file in ${libdir} to package sssd, including the .so
symlink files. Then it causes QA issues:

| ERROR: QA Issue: sssd rdepends on dbus-dev [dev-deps]
| ERROR: QA Issue: sssd rdepends on ding-libs-dev [dev-deps]

So re-package sssd then the .so symlink files and .pc files are packaged
to sssd-dev which should be.

File ${libdir}/libsss_sudo.so is not a symlink file but packaged to
sssd-dev too. Then causes another QA issue:

| ERROR: sssd-2.5.2-r0 do_package_qa: QA Issue:
    -dev package sssd-dev contains non-symlink .so '/usr/lib/libsss_sudo.so' [dev-elf]

So create a new sub-package libsss_sudo to package file libsss_sudo.so
and make sssd rdepends on it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-security/sssd/sssd_2.5.2.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/recipes-security/sssd/sssd_2.5.2.bb b/recipes-security/sssd/sssd_2.5.2.bb
index 76d6e03..da1a5c3 100644
--- a/recipes-security/sssd/sssd_2.5.2.bb
+++ b/recipes-security/sssd/sssd_2.5.2.bb
@@ -125,10 +125,12 @@ SYSTEMD_SERVICE:${PN} = " \
 "
 SYSTEMD_AUTO_ENABLE = "disable"
 
-FILES:${PN} += "${libdir} ${datadir} ${base_libdir}/security/pam_sss*.so"
-FILES:${PN}-dev = " ${includedir}/* ${libdir}/*la ${libdir}/*/*la"
-
-# The package contains symlinks that trip up insane
-INSANE_SKIP:${PN} = "dev-so"
-
-RDEPENDS:${PN} = "bind bind-utils dbus libldb libpam"
+PACKAGES =+ "libsss_sudo"
+FILES:${PN} += "${base_libdir}/security/pam_sss*.so  \
+                ${datadir}/dbus-1/system-services/*.service \
+                ${libdir}/krb5/* \
+                ${libdir}/ldb/* \
+                "
+FILES:libsss_sudo = "${libdir}/libsss_sudo.so"
+
+RDEPENDS:${PN} = "bind bind-utils dbus libldb libpam libsss_sudo"
-- 
2.17.1


