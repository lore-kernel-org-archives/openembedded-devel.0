Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 52B47771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l6so16767099wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OwEwp+/VMdCSBbcGlln0lh7aihVk36KfhQO+X4qKfNI=;
	b=yDPKxOynWgnT+kEGPuB1unkoiGqOnWKlzap+zl+ghwtQYBxlxteeufFCwiZ2Z62wGU
	XVR0CJdSN/E9MoDYc/w3+Vneg70Yuzf4zv1D6stjUNpXZqoxDRU9EA62epUK37/vU9/F
	u9oXEEGw6lcmSuXxczRdwkf9U4O71J0sxhA1UQ9m5bMX9qTm8FesglNMCulOenZfsZMO
	FWTwTfGlmc7MCGe3PqCu+7dnj+XUYFH6Hd/6oQ8dEiMSaLrvec4TxLH/F1DvC/S88mbE
	hNl5H7HqP3H0fQVJcyd6CyLQQRjWOHj/FH21pZQReR4TtiTuLYHWAjZW77ALzERX2+/Y
	uO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OwEwp+/VMdCSBbcGlln0lh7aihVk36KfhQO+X4qKfNI=;
	b=iBt7nmMkTajAx0GODVVzrtNJLkxLK1kDH11dfrWirg90mhgV/Sc/hYMqi81nP6+2Sf
	whXQr1LwEgF4tzX6GrPuWozH42Ku/saX8R1C8TLvZPfqsdGX/9/OclwIyS4ODq+APssu
	mWb/ZsuVMXvH82m6q4zr9ngL75Wf+kTI6iB4ITKwkvanESKFSajeWWqzZRa07Uam+sV4
	g4efmWSGPwBvfbWkRFS1Soj74nHAlC8dL/Vbh1Q6gCKdY1sQdzyEy9/BRojRtvc0hSNs
	hZVrP6ipz3DZHDnjzfp3R0NjOZBg39+NBQl8zwidOVrgq0u1f5XinIHL7n9y968lcUgu
	7Fjg==
X-Gm-Message-State: AD7BkJICLEXAb+I8ZRUh0efPWjPqhLT6YFVuWG4CezRaNqUedo04pUIgdEZPH23wOcgzOA==
X-Received: by 10.28.225.198 with SMTP id y189mr14990018wmg.34.1460317317971; 
	Sun, 10 Apr 2016 12:41:57 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:13 +0200
Message-Id: <1460317290-4787-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 14/31] qtsvg: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtsvg_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index d2699f7..83abbe6 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a9ac71a443260de66f720f0184646847b03fcb46"
+SRCREV = "38777ea7451d55e9c3d32d88d46063016013f60c"
 
 SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
-- 
2.5.5


