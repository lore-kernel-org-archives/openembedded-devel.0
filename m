Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79D6CCA480
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7095.1657802651230791351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C9815A1;
	Thu, 14 Jul 2022 05:44:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 203543F73D;
	Thu, 14 Jul 2022 05:44:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/8] python3-cbor2: add missing build dependency
Date: Thu, 14 Jul 2022 13:43:58 +0100
Message-Id: <20220714124405.2037213-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Jul 2022 12:44:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97823

The build doesn't generate the right filenames without this package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
index 0890b99c08..bbb57a4a9f 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "62b863c5ee6ced4032afe948f3c1484f3=
75550995d3b8498145237fe28
=20
 inherit pypi python_setuptools_build_meta ptest
=20
+DEPENDS +=3D "python3-setuptools-scm-native"
+
 SRC_URI +=3D " \
         file://run-ptest \
 "
--=20
2.34.1


