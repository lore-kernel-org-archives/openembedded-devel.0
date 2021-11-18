Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6C9C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2405911D4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1A7C3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/19] python3-gevent: update license
Date: Thu, 18 Nov 2021 16:11:34 +0000
Message-Id: <20211118161138.663375-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94040

gevent is MIT, and it embeds copies of Python which is Python-2.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-gevent_21.8.0.bb       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
index 8fb6e18504..7bdf126dea 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
@@ -2,11 +2,8 @@ SUMMARY =3D "A coroutine-based Python networking library=
"
 DESCRIPTION =3D "gevent is a coroutine-based Python networking library t=
hat uses greenlet to provide \
 a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE =3D "http://www.gevent.org"
-LICENSE =3D "MIT & Python-2.0 & BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4de99aac27b470c29c6c309e0c279=
b65 \
-                    file://NOTICE;md5=3D18108df3583462cafd457f024b9b09b5=
 \
-                    file://deps/libev/LICENSE;md5=3Dd6ad416afd040c90698e=
dcdf1cbee347 \
-                    "
+LICENSE =3D "MIT & Python-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4de99aac27b470c29c6c309e0c279=
b65"
 DEPENDS +=3D "${PYTHON_PN}-greenlet libev c-ares"
=20
 RDEPENDS:${PN} =3D "${PYTHON_PN}-greenlet \
--=20
2.25.1


