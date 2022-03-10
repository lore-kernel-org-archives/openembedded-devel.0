Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03C5C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9345.1646918727928129300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A68341692
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 567473FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/9] python3-pycurl: fix DEPENDS
Date: Thu, 10 Mar 2022 13:25:20 +0000
Message-Id: <20220310132523.2253188-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95928

By assigning directly to DEPENDS the dependencies in setuptools3 are
overwritten, so python3-setuptools-native is present to let the build
succeed entirely through luck.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pycurl_7.44.1.bb       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb=
 b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
index 0f1ae3caca..c9b3b71873 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
@@ -14,9 +14,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING-LGPL;md5=3D4fbd653=
80cdd255951079008b364516c \
=20
 SRC_URI[sha256sum] =3D "5bcef4d988b74b99653602101e17d8401338d596b9234d26=
3c728a0c3df003e8"
=20
-inherit pypi setuptools3
+DEPENDS =3D "curl"
=20
-DEPENDS =3D "\
-    curl \
-    ${PYTHON_PN}\
-"
+inherit pypi setuptools3
--=20
2.25.1


