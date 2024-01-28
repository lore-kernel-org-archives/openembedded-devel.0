Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAE9C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 13:45:10 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.37474.1706449504381402185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jan 2024 05:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id 5C15426B9E
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jan 2024 14:45:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.42.112]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rU5T3-04RX0L0; Sun, 28 Jan 2024 14:45:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] system-config-printer: fix runtime for system-config-printer
Date: Sun, 28 Jan 2024 14:45:07 +0100
Message-ID: <20240128134507.99009-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1706449501-2FFFC9FB-90D84C64/0/0 CLEAN NORMAL
X-TOI-MSGID: 10cec94a-f6f1-402e-a7df-455d6ac1a67d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jan 2024 13:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108478

https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D76e0113299bb65b840b2dd1409e31c67cc66d4b5
breaks runtime for system-config-printer, as it changes the way the cupsh=
elpers module is installed and thus
prevents system-config-printer from finding it.

Install the module in a way it  can be found.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../system-config-printer/system-config-printer_1.5.18.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
index cee907884..bff16b441 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -23,6 +23,9 @@ do_configure:prepend() {
 }
=20
 do_install:append() {
+    cp -rf ${B}/cupshelpers.egg-info ${D}${PYTHON_SITEPACKAGES_DIR}
+    cp -rf ${B}/cupshelpers ${D}${PYTHON_SITEPACKAGES_DIR}
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg
     for f in __init__.cpython-311.pyc cupshelpers.cpython-311.pyc \
         config.cpython-311.pyc ppds.cpython-311.pyc \
         installdriver.cpython-311.pyc openprinting.cpython-311.pyc \
--=20
2.43.0


