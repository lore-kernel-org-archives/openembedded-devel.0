Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id C2D136AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:22:10 +0000 (UTC)
Received: by oba1 with SMTP id 1so23449802oba.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tpXncIK2CNQSpI7wSPpxTbecdt3J56drxO5eRWidJpE=;
	b=J6EqP4D0vgmThsSCBJ1XW1V0nlcECskzg9j1hMDMdbkg1V/A8WZHMaEBDfjamKEsCy
	xCsF+fXQE2w3uJ7QhmU8/1uHcDWmq0UaMwRefu7q7M55/+32pO+wsFo3KnwL+UPaxrhG
	V7AfM+oqsGe2FgvzZxBzP99I86KQL3eSI4XPZQvpXmhsNGTU7UoNESY+52+4VlvaAWyk
	VZq5CrTm9kuyFlOCDEFlLAanvhPW7h+DwXYkFCX2O93922gb1Fy+mK7DJjVBQXOggvaN
	Af7zCiPci2EPKZcILe/eyCpIFNOZCRQwW3mEj9gy+VFwUivU1Wekj4g/+mvLVb5dmwxl
	HaPw==
X-Received: by 10.182.85.194 with SMTP id j2mr7692183obz.44.1449199331283;
	Thu, 03 Dec 2015 19:22:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ct9sm3533633oec.15.2015.12.03.19.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:22:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:21:54 -0800
Message-Id: <1449199316-14048-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
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
X-List-Received-Date: Fri, 04 Dec 2015 03:22:10 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index a3225f2..0625634 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -57,4 +57,5 @@ EXTRA_OECONF = " \
 #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
 #...
 #| make[3]: *** [equalizer.lo] Error 1
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
1.9.1


