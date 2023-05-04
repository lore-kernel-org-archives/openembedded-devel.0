Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955FDC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:16:55 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.45511.1683191806265515019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 02:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id A16D8A459
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 May 2023 11:16:44 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.175.157]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1puV4t-25GMPC0; Thu, 4 May 2023 11:16:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 2/2] python3-pillow: add libxcb to RDEPENDS for x11
Date: Thu,  4 May 2023 11:16:21 +0200
Message-Id: <20230504091621.2607413-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504091621.2607413-1-f_l_k@t-online.de>
References: <20230504091621.2607413-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683191803-08FF6C01-6833E02E/0/0 CLEAN NORMAL
X-TOI-MSGID: d94237f0-6574-4f2b-bef5-9e37a1a4b67b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 09:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102307

This fixes:
ERROR: python3-pillow-9.5.0-r0 do_package_qa: QA Issue: /usr/lib/python3.=
11/site-packages/PIL/_imaging.cpython-311-x86_64-linux-gnu.so contained i=
n package python3-pillow requires libxcb.so.1()(64bit), but no providers =
found in RDEPENDS:python3-pillow? [file-rdeps]
ERROR: python3-pillow-9.5.0-r0 do_package_qa: Fatal QA errors were found,=
 failing task.
ERROR: Logfile of failure stored in: /home/flk/poky/build-intel-sway/tmp/=
work/corei7-64-poky-linux/python3-pillow/9.5.0-r0/temp/log.do_package_qa.=
2328146
ERROR: Task (/home/flk/poky/meta-openembedded/meta-python/recipes-devtool=
s/python/python3-pillow_9.5.0.bb:do_package_qa) failed with exit code '1'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb =
b/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
index 76b3a82db..7ec43c60d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.5.0.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcb', '', d)} \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
--=20
2.34.1


