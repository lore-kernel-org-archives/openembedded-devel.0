Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B0CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:33:32 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.web10.59428.1755459205884447351
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=re4ReIH6;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 17F5F4457E
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:33:25 +0000 (UTC)
Received: from fr-int-smtpout25.hostinger.io (trex-blue-7.trex.outbound.svc.cluster.local [100.96.43.79])
	(Authenticated sender: hostingeremailsmtpin)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6F97C445F7
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:33:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755459204; a=rsa-sha256;
	cv=none;
	b=98aEI/qQZTzYTfletV3+cE8h6Si3De091ZPQMKAG+SMEKA+A6afFr+uoCKOMOwv6wt4lK0
	8Ziv70dL78uITSgKxM6GqjnziRgEkHZJBd69xZbsP43LbD98v+M+dR9IaCPAFK/pc3Bo0u
	A2M8YoUJse4DOFp9DttxWRu3AxJndGYMl4MU9dbhjHVdbczcsi0o26VtFistVaoqW2V5E9
	sTK/zv6RzpmZSiCvCSYTyXu5IfbO8huOJbXZeCypWtSTKuRH6CEgYZ2RzKSbIKp61Q0wr/
	g9shzKWOQuStehGkBTE7Qgz5YP5DoSQA6gmQdyzM5RtN5kO1wURGzFohlXgCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755459204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=mhZL70OOdGCv2kjXund5cC8mRHcwP4ETm0vZ9BDXBts=;
	b=ozJjeVz+uB3MABQZ1bQgXVtAO7jfcfDJLfSD08D8ykLktSkIT4b3oOHsoFRjIGYFi8Oz/T
	mXtOjw8JzI1d+L4Up8oXsyhZqsppjHghL7Z5NNu08K8i0EBHEoNAMVVdoyJD3U8uk7qL1f
	z92wviBjQ/WNoi7MQYeVp1eEtOxF45yE/o8064SqsDZim9yDN8gGyZYxsmlzU1IeGtXYSR
	4cdt8aEgJXYV2uOoNozDzAElXRka2Qk41WLDNGa7CMmE7v56U/FvlvG3wk0i1zwSB5H41z
	eUPTFFuJSXCB9wph8fia2NEqDRtZnmJiHWEFowhfgFR13BHzlUUqUR1W9hHNJQ==
ARC-Authentication-Results: i=1;
	rspamd-697fb8bd44-ft9ql;
	auth=pass smtp.auth=hostingeremailsmtpin
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremailsmtpin
X-Industry-Plucky: 74cd87a36479f676_1755459204980_2883135492
X-MC-Loop-Signature: 1755459204980:3527957321
X-MC-Ingress-Time: 1755459204980
Received: from fr-int-smtpout25.hostinger.io ([UNAVAILABLE]. [148.222.54.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.43.79 (trex/7.1.3);
	Sun, 17 Aug 2025 19:33:24 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:1022:9db4:c2fd:5d60])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c4mGp31pGz1xn2;
	Sun, 17 Aug 2025 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755459202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mhZL70OOdGCv2kjXund5cC8mRHcwP4ETm0vZ9BDXBts=;
	b=re4ReIH68mYqOKVN+InYXhkG/fm1Y8OB4J6GmKdhr0UXiDqXn35AIBPjlyOI+kve0Q5wkd
	lIz2cAZRmbBzrVfWAz0YhkpD9uiEPwu6AN4aITt7JO1Rdn+L2Sav/KD9eJfeu1wXf5D183
	t+JTzo7/hO52A28m29iDPljQkDKxia3C/QKMWnVbbbmfrE4egJkCZIcFTkQdIXhBfHPJi0
	mi5Qm5XDHZK5YLD3rN7UOMWmP8cjexvzSLjFQJtq24NBFpWx29F2uFuO9sq0Imnq2OpKNy
	lDUFSFd8iREkE78HBGdwYnDi+VhKvIEvEa3Fxje/9e1L144QjLcsS+ibJgpR9A==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][PATCH] kernel-hardening-checker: upgrade to 0.6.10.2
Message-ID: <20250817193310.3864975-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 19:33:22 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LaRu6Sfi c=1 sm=1 tr=0 ts=68a22e82 a=/4B58YW+q9akEXzE1EpPGA==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=NEAV23lmAAAA:8 a=qpvx0Py9g8YHWCuXceAA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfK1tVazFJ0y0BVnz79Yew6bm/F9egyF3criHmsec7i7y2Jk3K4Buy0BgCXcn29/XLRnOVbpgyP1cugMf5auL+pmV8OuZXrWcuIb2WwM2UPAcVtfLUt2O AvMd91pCOtiZ6pUXqSS+ARf68MCdZ2CPd0MMfT4dMf0872fSwtAznHV9Ec9T5dDIXwfoPg2Tb9VlUkS+yOZGmSJXsROitbaXo8a+MrhA/okEOLg8Q59//3QC elUCP5vFynkkKM6N2FVl5nqnZ05otU3aavtjkK8YkSWgYrLD2AORBCZG5KuCZ1lZ2GW5BrDCWbEgf5MFos64X6XgRIrlcs3EoK2hD7j6Xjw5LMrBrhN1lVDz 525rYnMR
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118988

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Major upstream changes (not a minor release update in terms of features):
- RISCV support
- New "-a" option: autodetect and check the security hardening options of=
 the running kernel
  You can now just run "kernel-hardening-checker -a"
- Require Python 3.9
- Replace setup.py by pyproject.toml
- Many fixes and new features

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...cker_0.6.10.bb =3D> kernel-hardening-checker_0.6.10.2.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-security/kernel-hardening-checker/{kernel-hardeni=
ng-checker_0.6.10.bb =3D> kernel-hardening-checker_0.6.10.2.bb} (91%)

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-har=
dening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-chec=
ker/kernel-hardening-checker_0.6.10.2.bb
similarity index 91%
rename from meta-oe/recipes-security/kernel-hardening-checker/kernel-hard=
ening-checker_0.6.10.bb
rename to meta-oe/recipes-security/kernel-hardening-checker/kernel-harden=
ing-checker_0.6.10.2.bb
index e7610ac785..559a15a009 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.2.bb
@@ -13,13 +13,14 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
=20
 SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardening-checker;protoco=
l=3Dhttps;branch=3Dmaster"
-SRCREV =3D "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
-
+SRCREV =3D "0ebece346f187e7d3589883cc1d194fcd1c3cda8"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 RDEPENDS:${PN} =3D "\
     python3-json \
+    python3-misc \
+    bash \
 "
=20
 # /boot/config is required for the analysis
@@ -27,7 +28,7 @@ RRECOMMENDS:${PN}:class-target =3D "\
     kernel-dev \
 "
=20
-inherit setuptools3
+inherit python_setuptools_build_meta
=20
 # allow to run on build host, if you don't want it in the image
 # oe-run-native kernel-hardening-checker-native kernel-hardening-checker=
 ...

