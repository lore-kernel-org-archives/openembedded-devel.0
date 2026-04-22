Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A31F9B605
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:07:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78944.1776852421158182341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=EBsfFaic;
 spf=pass (domain: rootcommit.com, ip: 185.246.85.4, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB0984E42AAF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:06:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2B94600DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C547010460B57;
	Wed, 22 Apr 2026 12:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1776852418; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SxSRMlCLMlk3JRgI8P7Vfw7JczVidzRLl/bSBsUMjSI=;
	b=EBsfFaicjmLtU7luyvxzTqvHVp7CMY66cmzxnKDQUUU/3hSY/wPFLCdrvJhN5GDESAXeqD
	qMop4MqrQGJwNnMcu7q+ii4usOjoONFGV2E9i3RCkdewEglnu88YXbcHU+4I065biwlsiN
	gPa1T7iW8LyhqUtJINGJALjPTBara86gmnRnoE1/ywFZQTUeDufOTXlSbf86d+l6LA1kvi
	C7oOfezK5CIEafPNg0cIZXgenX1K+OyVeRzGaN/cZoxhi69xniB70VKmiaE46Qp4dZ5g+E
	I6OasclZs3pgwMIFjldABCqGBoMO5aVDgfqgWHu4eqt3tDR/jxKCpzgTH8aqtg==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][scarthgap][PATCH] kernel-hardening-checker: update 0.6.10.2 -> 0.6.17.1
Date: Wed, 22 Apr 2026 12:06:48 +0200
Message-ID: <20260422100648.2644983-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126545

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Following the update on master.

This version reports more hardening issues:
128 "failures" instead of 113 on the same kernel.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...checker_0.6.10.2.bb =3D> kernel-hardening-checker_0.6.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/kernel-hardening-checker/{kernel-hardeni=
ng-checker_0.6.10.2.bb =3D> kernel-hardening-checker_0.6.17.1.bb} (96%)

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-har=
dening-checker_0.6.10.2.bb b/meta-oe/recipes-security/kernel-hardening-ch=
ecker/kernel-hardening-checker_0.6.17.1.bb
similarity index 96%
rename from meta-oe/recipes-security/kernel-hardening-checker/kernel-hard=
ening-checker_0.6.10.2.bb
rename to meta-oe/recipes-security/kernel-hardening-checker/kernel-harden=
ing-checker_0.6.17.1.bb
index c0ae0f0d3c..b83790ccb7 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.2.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.17.1.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardenin=
g-checker;protocol=3Dhttps;br
 	   file://0001-pyproject.toml-fix-up-license-information.patch \
 	   file://0002-pyproject.toml-relax-setuptool-version-requirement.patch=
"
=20
-SRCREV =3D "0ebece346f187e7d3589883cc1d194fcd1c3cda8"
+SRCREV =3D "afc376f2a935994793343cfeb05953583cc30191"
=20
 S =3D "${WORKDIR}/git"
=20

