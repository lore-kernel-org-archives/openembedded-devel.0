Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAE3C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 19:13:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.376.1647544396074720507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C79A516F2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:13:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75CC53F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:13:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] sanlock: update patch status
Date: Thu, 17 Mar 2022 19:13:11 +0000
Message-Id: <20220317191311.411049-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 19:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96043

This patch has now been upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch b/=
meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
index bc2c68c1c5..c375e10f75 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
+++ b/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
@@ -1,6 +1,6 @@
 Switch to setuptools as distutils is deprecated.
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [https://pagure.io/sanlock/c/75758fc10db2354dd=
a397d3aba63c7b72a420982]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/python/setup.py b/python/setup.py
--=20
2.25.1


