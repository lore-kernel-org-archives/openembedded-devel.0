Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 668AA6D666
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 07:38:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t5so8730651wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Iodg+L/eHzQE54nXcQKUpzxNp+vRVEnUwPBrAz5cIoc=;
	b=YeG61hHAFChfkki1qesvOiyDJhFSsoaMvPNERz0PHkPs55CEEmwvFz4+D0FyLkwewR
	iujhY4Wp7Ac4XpHCS1aZ4NyO2ET4BCDRjzfV3rRSQtSj2Aw/NmA+BxsymO0hgn2CoC5s
	IyyL8VIp+B0z73U5gRSTfe9AfdrG2Hsj08XqvJxwhez/Z6+IS+OAHmlHLwhKvEemm9Cp
	PSc15l9Rg+rKN9mXUcRkd7AAOuamo3Lmt+Uv0UUa5YRe6HNVWE9U66YgqKI2GRpHduL3
	SJv5u3otzzgbQSEUKXkorQhpo5gmrehLFq+zKmudVpVEb3lL/RlLIqAuqaxQuE+5X2/C
	K9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Iodg+L/eHzQE54nXcQKUpzxNp+vRVEnUwPBrAz5cIoc=;
	b=W4UH4EpDKcn/qfBplaUovbm5wRvu9Ya2Jkss+tAmk4NFjGdcNFKwgVSxyadd1v8WVW
	oPcKyiKq44fk2ylqv3pM8ca6S2HG7eulacfEzy4GCfAH8pHaWY6MYGutuFKTRc9yAVfr
	VBuStH7M+c8xoE7pXDcdOl0qWgdo/V3YY2NfcFbSlNmUSRuD1X9TOiJ30zqrkk7f31oa
	bAIjGNfgX1TY3G9MMPubfyADxCdkhLxMc08J+nDQReYoZnaQwov8mejCzJ2fahgNYbLn
	VKKoJ9MF3Gq4nIeAihUIbdW5hDuKx6hH2uG3ii97gEBzbnVAgijV5QJFtip910sdgQIN
	w4nQ==
X-Gm-Message-State: APjAAAWAsDUvVLwL1pQQj26fXeFBcqcd0l1Ztc1Heuj1X+f/PIWS3XAx
	djf1NEVv6cFU4MciaFxOKGkRfMg2
X-Google-Smtp-Source: APXvYqxMkRwO6IS7j19NC4/P68aZ0yN5ApmVSr72j+OI9HDn6cMdcyMBg5micZ0ig8e19eoI1O2XRg==
X-Received: by 2002:a1c:3:: with SMTP id 3mr29245871wma.44.1558251516819;
	Sun, 19 May 2019 00:38:36 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	i17sm13949616wrr.46.2019.05.19.00.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 May 2019 00:38:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 07:38:38 +0000
Message-Id: <20190519073838.147-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] opencv: use the same package name in PACKAGES and RDEPENDS
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
X-List-Received-Date: Sun, 19 May 2019 07:38:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
index fa6e06a255..ce60698b2b 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
@@ -176,7 +176,7 @@ SUMMARY_python3-opencv = "Python bindings to opencv"
 FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python3-opencv = "python3-core python3-numpy"
 
-RDEPENDS_opencv-apps  = "bash"
+RDEPENDS_${PN}-apps  = "bash"
 
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-- 
2.17.1


