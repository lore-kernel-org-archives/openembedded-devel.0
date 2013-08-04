Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id A187D605A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:09 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1281216eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YCk316KsNE3tGnGdPomo2d2MQO2leASHfimE7LkdHUQ=;
	b=P1F8Y9ler+hPbuCnIf67M5qBxW9Y66DfXtoCkIlGdmDrCSrv2CdRGBzg91XuQ1dhGA
	SxrLnax1w/iqvp/b64rlRL4aoxiqyt3xSOm6tGMfw0eEtUUarzvaJwA5W4sQM6tX7+Pn
	0ofjFGT4z4IbuWAYh1eVnyxEEL5I8C/WprAKKQJ3SshBE0TMQYr34OkyBxrDUbjmk1xi
	Th9/JLO57h59il2Y6RjbOCkvdqZtnDt5hOU7IO/jHpJAXIy2G11wy+X7Ng91v5f5xOJR
	8tlwpqH2k5J0gJq94c6fVNvnCQ/+j6JfakVeBodoFFbSCRS86D4CnOzmQ9GZ4bEVzZHz
	QoBg==
X-Received: by 10.14.42.1 with SMTP id i1mr6576809eeb.79.1375652829517;
	Sun, 04 Aug 2013 14:47:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v41sm28781668eep.10.2013.08.04.14.47.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:33 +0200
Message-Id: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH 01/15] ecore: add PACKAGECONFIG for wayland
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Aug 2013 21:47:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore_1.7.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
index 56c682a..0f09160 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
@@ -117,5 +117,8 @@ SRC_URI = "\
     file://fix-ecore-fb-initialization.patch \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[wayland] = "--enable-ecore-wayland,--disable-ecore-wayland,wayland xkbcommon"
+
 SRC_URI[md5sum] = "5a8ca096d8c15647b2493d4664a4b895"
 SRC_URI[sha256sum] = "26cb1dc02213a221fdec32ef4ea4ece608e5239bdbd19c9d62b09cf931863738"
-- 
1.8.3.2


