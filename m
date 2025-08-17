Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E76CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:29:02 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.web11.59055.1755458936272218135
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=WWj3gXIC;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3DF7322440
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:28:55 +0000 (UTC)
Received: from uk-fast-smtpout3.hostinger.io (100-96-42-217.trex-nlb.outbound.svc.cluster.local [100.96.42.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 880FE21E5C
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:28:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755458934; a=rsa-sha256;
	cv=none;
	b=VaH+2ZrVM0i75HCy8hFqvf6rGl8lVn8qmw5wlxmqX+q54ZQ0BTPMG3Juu9qh0xuHQGuNVc
	TQUMSt2O6t89xpWoETCKzoAnNrKl2dMks7g4111Uijowy0QXFl+mKiFJmd7OV05ApYq8ED
	4eiimN2sb4usXme/Z3IRzk+LDTr+kiuTogvkRGY+aEFhmd15kOGEx3HQu/2iRmxXOo4ifs
	PU00+bcuJY8+wigEXjCge96lXmafgQKdrampQR2OgzXAr50zxQmIx7WvOl/PaRFicRWnCT
	r4KtTEF9j3Ybr/VqHa1tHVoizATR7jTb5O7p3zsyJsmcbz/vi+XZfe3+Ia/IXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755458934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=mhZL70OOdGCv2kjXund5cC8mRHcwP4ETm0vZ9BDXBts=;
	b=pByRAkRh9DWFLF7Z1ywbu8rc6k8vZvp33ioRINMxa28yDkD/b1FvzcnNC7raefmMbIvFzL
	adkiI2FReNQZlf6wtUPfQKOT03F+rJ/xs9Mrs0X2LLrUw/T4uCwnh9rSM2LCIGVfBtmi+Y
	0TICMXvIn27dgt3J+edw46Nu+2IYC2SaJYxM/4Bq3d38y4MxtK7lxH4pk1L/Vdso1jEIlz
	hwh1hTdlM7VI5+AA/ihFnB/SSBsvBwvczKNn7J/dTfM7aB2KlRSQtZhQp00EIZUC8lz4wp
	z8uPii2H/x0LugQakh2OdpCuJkIYF17Mg70ryL8Md61x1sqZfEwbfthQ0YAtrg==
ARC-Authentication-Results: i=1;
	rspamd-8dfc57599-rhp6g;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Glossy-Battle: 388a35294ddbd925_1755458935069_1862334943
X-MC-Loop-Signature: 1755458935069:1694471762
X-MC-Ingress-Time: 1755458935069
Received: from uk-fast-smtpout3.hostinger.io (uk-fast-smtpout3.hostinger.io
 [31.220.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.42.217 (trex/7.1.3);
	Sun, 17 Aug 2025 19:28:55 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:1022:9db4:c2fd:5d60])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c4m9c3Rf7z2mRcN;
	Sun, 17 Aug 2025 19:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755458932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mhZL70OOdGCv2kjXund5cC8mRHcwP4ETm0vZ9BDXBts=;
	b=WWj3gXICEdEWRwPku0YyUwQ6dlkhwu4485ED2bWmF3JX3zj1xCo5lq79avaVIgC2djis89
	FE3SzjixqiTZZDffCja0e179Y3xJSpI+OsUzTczBKygoeAWS+EqonDdyHlb2oArNNzSoV/
	9TDGP3UDWlTzmm6pO+tvspkWzi8w+YyzXxyIbnwMEs1EyPKXE1JftpvV7w3418txhN50AN
	llJd3URHZ5epZIhGhC4P9FOvIZeLFO5pyBg4YDGEjZ9RH7oA3T1A+9MHIw3PdGLrm/Ej4P
	Mb6t75fTHApNzxyrCpZIuQkldQlt18XAbZkxtHhC/FZa+Cs9P8lIraZiXjFsJg==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] kernel-hardening-checker: upgrade to 0.6.10.2
Message-ID: <20250817192823.3864017-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 19:28:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68a22d74 a=/4B58YW+q9akEXzE1EpPGA==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=NEAV23lmAAAA:8 a=qpvx0Py9g8YHWCuXceAA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfK1o1afDOj8fpNqGyRbXTWG68C0tmF0b3/L2mjV0tipQeU98leu98A0T9Z9B2GmtHwHHF4MqhjtrD4+2AOOBv5Wbf13QwFCG0NLfS0+6kVqXNCyipEuW SmUXYdQtmKb0CyNcj9UrvzY3vRJzA/A05HKC9BU3zBKVUtvSKPqFzCUullUKDdQwRtwuDQ9BmB5blj6eZbBAzRoWfLelpDle2JaJZxuSi/W81p29Ocf2BXd3 1XkMypbkjW2VKyT8JMBsjrSOeTGkMiFMVsUMBg4UI+BiqaW1MjUJas3SOEGcDI1fgBqQ68/lKgeefXKDitXIra9QdyehbM0NQc/SiuKM1nGT1RqRM4ocCsHs 5VXqjQns
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118986

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

