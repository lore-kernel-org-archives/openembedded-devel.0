Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 49A277C296
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 15:16:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z5so256269wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=72vOyQvNGBUaZ3UfeS6CgN3CLriH0Q1tUPzLkbjeLpI=;
	b=S+7RNQJsRta4cM167eial8Zdi8C5yaMO2H7ftUiPRx+azRkZxvDivudprEDB9awRL4
	N4TBDKP+6NpAEn6ab7xi0yB6tBR+CGnO2lsZzJ60F5HMuyBEe8ao7yzmoKP5i517AH5c
	Naul6PVxfdKGQXz/LiwxffCzCycgtinFz50Z5onXNNylSdsN2daXbcSH9CL+vqreaHx9
	alzObnMXFbJ+Ux3xvw05GnJPCSE/4loJ/TbBgz5E4tqQZPOXvNRC8tP4D9G37fR2Lfgq
	quTyJs0R5i2AMVlaliWcAeNXSiM9z2NCenSE/7C/61MCprr+IEE3mpckMOMeyokR7WGL
	C4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=72vOyQvNGBUaZ3UfeS6CgN3CLriH0Q1tUPzLkbjeLpI=;
	b=g7O2qLFjEoY9ALUThLGTlQ88g5GP+xlz4fLN9W+lEiYB20qY7Tw+MquEmojy9yVBfp
	3k/S7Mqq2WAmNWysqtadJ5hvrem9bxDDgLrR5lBmupLLGX2LStFLSRO1r8rwxX4+oUgF
	QH6ZCM9oNa2khgueXBMVL+VtxdSNalQT6YkOVofeJOoI6YviqH1t9UpHe1U1LMjaEdfZ
	U0BDZMxpnZL6bwGpSd5jzZS2gqR1hMTEviB4DxBI6egdsJ8GNadw7uFqj3cFGMuSDyik
	bHQdAnG5I+q1wYLVRoRXuwZ8Y7hCndnVdmTIIXj0CZKn5GIUi+iEFiFD7q83ZO/scM4F
	1PHg==
X-Gm-Message-State: AHQUAuYSnfJjqfkpHB/Bf87nkPqO3OnaXcAP7oHBm50ZkXZBzBNU0Xtj
	VmQ2qmMWt/7kpZYHkiK8VRvbn7AT
X-Google-Smtp-Source: AHgI3Ib/n8un3coJTGAg2r1BweSVOMkRSap84Mt7P7vGfBFZnb2yXNKC4rOxdKYTE31Q/d2k5p7RMA==
X-Received: by 2002:a1c:7a16:: with SMTP id v22mr12859732wmc.131.1549293364160;
	Mon, 04 Feb 2019 07:16:04 -0800 (PST)
Received: from localhost.localdomain ([5.170.140.54])
	by smtp.gmail.com with ESMTPSA id
	m14sm7924595wrx.59.2019.02.04.07.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 07:16:03 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:16:00 +0100
Message-Id: <20190204151600.31213-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2019 15:16:04 -0000

---
 .../cpprest/{cpprest_2.10.9.bb => cpprest_2.10.10.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.9.bb => cpprest_2.10.10.bb} (89%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb
similarity index 89%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb
index 4bdc5c682..cc9d5e105 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.9.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.10.bb
@@ -10,8 +10,8 @@ EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            "
 
-# tag 2.10.9
-SRCREV= "8f0393dd7be08f2d9b44cc09b8b97f9bafb109a5"
+# tag 2.10.10
+SRCREV= "91f66c625b6361d2edabf76eae30887b326b2447"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


