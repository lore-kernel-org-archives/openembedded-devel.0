Return-Path: <alexander@amelkin.msk.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843EBC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 11:13:29 +0000 (UTC)
Received: from mail.fiord.ru (mail.fiord.ru [62.140.247.50])
 by mx.groups.io with SMTP id smtpd.web10.46658.1684322007174234403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 04:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: amelkin.msk.ru, ip: 62.140.247.50, mailfrom: alexander@amelkin.msk.ru)
Received: from [::1] (helo=mail.fiord.ru)
	by mail.fiord.ru with esmtp (Exim 4.94.2)
	(envelope-from <alexander@amelkin.msk.ru>)
	id 1pzF5v-0029is-C4
	for openembedded-devel@lists.openembedded.org; Wed, 17 May 2023 14:13:23 +0300
MIME-Version: 1.0
Date: Wed, 17 May 2023 14:13:23 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ipmitool: Update links
In-Reply-To: <CAMKF1sqfE0Q5vwC+2sG5wGHeadoabqQHhSSy=y4aQVjPDOrfgA@mail.gmail.com>
References: <CAMKF1sqfE0Q5vwC+2sG5wGHeadoabqQHhSSy=y4aQVjPDOrfgA@mail.gmail.com>
Message-ID: <ba0f0a849c0c2eedd3d1bf04635ae5ea@amelkin.msk.ru>
X-Sender: alexander@amelkin.msk.ru
X-Remote-Browser: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58
X-Originating-IP: [185.174.110.9]
X-RoundCube-Server: 62.140.247.50
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 11:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102644

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

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb 
b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 0340901c2..ab9074bba 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) 
information, reading and \
  setting LAN configuration, and chassis power control. \
  "

-HOMEPAGE = "http://ipmitool.sourceforge.net/"
+HOMEPAGE = "http://codeberg.org/IPMITool/ipmitool"
  SECTION = "kernel/userland"

  LICENSE = "BSD-3-Clause"
@@ -22,14 +22,14 @@ LIC_FILES_CHKSUM = 
"file://COPYING;md5=9aa91e13d644326bf281924212862184"

  DEPENDS = "openssl readline ncurses"
  SRCREV = "19d78782d795d0cf4ceefe655f616210c9143e62"
-SRC_URI = 
"git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
+SRC_URI = 
"git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
             ${IANA_ENTERPRISE_NUMBERS} \
             
file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
             "
  IANA_ENTERPRISE_NUMBERS ?= ""

  # Add these via bbappend if this database is needed by the system
-#IANA_ENTERPRISE_NUMBERS = 
"http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
+#IANA_ENTERPRISE_NUMBERS = 
"http://www.iana.org/assignments/enterprise-numbers.txt;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
  #SRC_URI[iana-enterprise-numbers.sha256sum] = 
"cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"

  S = "${WORKDIR}/git"
-- 
2.28.0


