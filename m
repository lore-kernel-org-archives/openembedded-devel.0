Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id F129772458
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2015 03:20:17 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so14732877ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MFxpjKu+QkicJLMFH/mPjj/3jDlS2yikimWSP3qMUIw=;
	b=nW7ayuue2w4Qwpjan9CuC27qMc0m8sCsVDZ8z3jk43eSZb5ISHecnKSzWImS36iqNz
	fEcFXWf9aqsQOBW2gATLPZDpmppryHlmndYUnMpDf06dayiVp9KC6cuN0xVtXy94Ylwi
	r4JbCGk4M7ZOr7tAhWdRE0zFuRFIcS7YjWzJkI3V1BaXkUB+P7aYPAaAsGc2fwhwJpe2
	oSwSYDee2Qn9udB6sqsTIlomfyBgpfRxSGJswMJkBInFqx7ah3jadPqdTPEupUU22hHK
	ToOU5ud+nYXnhXxlvfB4NH+Ed4GsG5lbRTJwvA0hua2XCSiG1DPYJ3HjSod0SMAMoHMB
	/7zw==
X-Received: by 10.107.170.220 with SMTP id g89mr11133721ioj.85.1427253618545; 
	Tue, 24 Mar 2015 20:20:18 -0700 (PDT)
Received: from nebula.sys.comcast.net (a-96-119-40-215.sys.comcast.net.
	[96.119.40.215])
	by mx.google.com with ESMTPSA id d10sm1213893igo.0.2015.03.24.20.20.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 20:20:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Mar 2015 20:18:14 -0700
Message-Id: <1427253494-17828-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] breakpad: Upgrade to r1435
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
X-List-Received-Date: Wed, 25 Mar 2015 03:20:22 -0000

Fixes parallel build issue with breakpad-native  amongst other updates

Change-Id: Icc26234ccb4ba77543e8dca52b27ceaeb2f77747
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index 2c5941d..00c3637 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -13,7 +13,7 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "r1318"
+SRCREV = "r1435"
 SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
-- 
1.9.1


