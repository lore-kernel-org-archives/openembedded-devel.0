Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C73660556
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:54:42 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id em10so49115406wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J1A+hB2nFzGyqhgKGpY4zL/8GMcMclgUmXFLCyN9pd8=;
	b=Y+M2CKv2VTl7jWkHMwOKCTG4fywusmC+/1capsv2/l9SaZ83U0xJPsqRfbBmSzyXwI
	1q3lW/yrxjZG7kZrCOFNDsodbm9Og6eIy9ITnT0PyBufSJsVWTxXoE/k96YUa8z1863o
	EvLeNYkw50b1kCr2wNg3UEFFX/rcoSn6AvnbiUt5lwJiZlW6VSMqyyiYgY75R/GslO+6
	JirL2srAfu5+Jsiys+HOAcjK3yqxE5es/Doa5MrtiCoxtUmk0p/omSloLAep2gcgCHyW
	rI8Y0jaROiRL0L5bVO9eWgsIE9sgi4Ra7CwoBnAy0JzwL9RbcJXEwaNeQMdz3SdY3tQB
	wAIg==
X-Received: by 10.180.36.212 with SMTP id s20mr11555364wij.58.1424361283182;
	Thu, 19 Feb 2015 07:54:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y14sm24815182wjr.39.2015.02.19.07.54.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 07:54:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:54:43 +0100
Message-Id: <1424361283-6845-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-handheld][PATCH] keymaps: make sure sysconfdir exists
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
X-List-Received-Date: Thu, 19 Feb 2015 15:54:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/keymaps/keymaps_1.0.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend b/recipes-bsp/keymaps/keymaps_1.0.bbappend
index b3bb193..6d2815f 100644
--- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -26,6 +26,7 @@ do_configure_append () {
 do_install_append () {
     case ${MACHINE} in
         c7x0 | tosa | akita | spitz | collie | poodle | h2200 | h4000 | hx4700 | jornada6xx )
+            install -d ${D}${sysconfdir}
             install -m 0644 ${WORKDIR}/keymap-*.map	${D}${sysconfdir}
             ;;
         *)
-- 
2.3.0


