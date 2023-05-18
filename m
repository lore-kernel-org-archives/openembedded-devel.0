Return-Path: <alexander@amelkin.msk.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4955DC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 20:43:24 +0000 (UTC)
Received: from mail.fiord.ru (mail.fiord.ru [62.140.247.50])
 by mx.groups.io with SMTP id smtpd.web10.3750.1684442597294083167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 13:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: amelkin.msk.ru, ip: 62.140.247.50, mailfrom: alexander@amelkin.msk.ru)
Received: from [89.207.88.249] (helo=cinnamon.bbmc.yadro.com)
	by mail.fiord.ru with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
	(Exim 4.94.2)
	(envelope-from <alexander@amelkin.msk.ru>)
	id 1pzkSv-002k5T-E9; Thu, 18 May 2023 23:43:13 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Amelkin <alexander@amelkin.msk.ru>
Subject: [meta-oe][PATCH] ipmitool: Update links
Date: Thu, 18 May 2023 23:41:08 +0300
Message-Id: <20230518204107.11647-1-alexander@amelkin.msk.ru>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAMKF1spcReLzKP=s0PMmoNbYZ96=4qz2+g9xEFdJ7EZjMAq0gQ@mail.gmail.com>
References: <CAMKF1spcReLzKP=s0PMmoNbYZ96=4qz2+g9xEFdJ7EZjMAq0gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 20:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102665

The project has been moved to CodeBerg.org.
Update the links in the recipe and also bump to the
latest revision (1.8.19.13).

Additionally fix the link to the IANA PEN registry as IANA
has changed their URL scheme some time ago and the old link
started pointing to the HTML page instead of the text file.

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 0340901c2..ab9074bba 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) information, reading and \
 setting LAN configuration, and chassis power control. \
 "
 
-HOMEPAGE = "http://ipmitool.sourceforge.net/"
+HOMEPAGE = "http://codeberg.org/IPMITool/ipmitool"
 SECTION = "kernel/userland"
 
 LICENSE = "BSD-3-Clause"
@@ -22,14 +22,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
 
 DEPENDS = "openssl readline ncurses"
 SRCREV = "19d78782d795d0cf4ceefe655f616210c9143e62"
-SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
            file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
            "
 IANA_ENTERPRISE_NUMBERS ?= ""
 
 # Add these via bbappend if this database is needed by the system
-#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
+#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers.txt;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
 
 S = "${WORKDIR}/git"
-- 
2.28.0


