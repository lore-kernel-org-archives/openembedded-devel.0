Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF8446B860
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:56 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so185537eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nr1hqjcU9/cB2LYBg2PPoXrVmrbq6RrZpGjWfDXXbnw=;
	b=vzOeceTcvn6I6uxFJ1Pf7rA6KXrS7/S/7qkIxMc2l54QdgSj3B+933vKb1s79x4W2B
	zFKHTetMBNXZS/fDMIZCDgtuh/JtrVJtsm0E2/KLR9zlBnidyBMSL8MShRRGnnjSeCRQ
	/1nuy10Ue8OR5asn1XoWp0jtqNsV3srEjUd7bdxDfR3CzqBI7BCksIAEsi0zNK7aDKrH
	jvP9wo0odj9bZWGHsMQkHQ1Ix0jpeQOTUGlUsWQyuuqQx3/dwJxx2SY3G2h3ITUDzDPO
	raaaDJVRKretRv9TjPJpo2OizcwymIJxlFxzjoHuO1tVzchQcHuAFORuZgv+iDZJURHl
	Qrzg==
X-Received: by 10.14.204.194 with SMTP id h42mr20916422eeo.47.1376551197166;
	Thu, 15 Aug 2013 00:19:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4980702eez.3.2013.08.15.00.19.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:28 +0200
Message-Id: <e2c723f2c646f99a2260fb1098e5ed33c67e1cf1.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 48/60] libav: add PACKAGECONFIG for bzip2 and jack
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libav/libav.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 6e91061..898ecfb 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -28,6 +28,10 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
+PACKAGECONFIG ??= "bzip2"
+PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
-- 
1.8.3.2


