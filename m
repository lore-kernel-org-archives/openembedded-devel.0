Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4517EEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:36:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11048.1689694572553072749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9AC2F4;
	Tue, 18 Jul 2023 08:36:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94AF63F67D;
	Tue, 18 Jul 2023 08:36:11 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cherokee: add CVE_PRODUCT
Date: Tue, 18 Jul 2023 16:36:10 +0100
Message-Id: <20230718153610.2046168-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103948

From: Ross Burton <ross.burton@arm.com>

As per https://nvd.nist.gov/vuln/detail/CVE-2019-1010218, Cherokee uses
to use cherokee-project:cherokee_web_server.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta=
-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 7100ef4341..3dc4ca8bbb 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -75,3 +75,5 @@ python() {
     if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires meta-python2 to be present.'=
)
 }
+
+CVE_PRODUCT +=3D "cherokee_web_server"
--=20
2.34.1


