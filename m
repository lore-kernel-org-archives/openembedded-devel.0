Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id C68CC72491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:13 +0000 (UTC)
Received: by wesq59 with SMTP id q59so22725639wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cA1n+dVVR5Ua4tl+c9+cMU1Zpw3fgz/23yIJ1iDScRQ=;
	b=Y++uGWW8enIaf5OebJgBkdNkcXHhSzItJWuJ/dykZjBfH3JOaoghTNv5x3LeX9T1hB
	PfVKyBhfopN+7wagH1c0OkpcQbRo2WbKuCM5KmWisa+7pJqGYKHcJsY+rHj1tI4jMpu9
	MtGjJ5Zn4rw7IJ7WwWN9+b2eHEuKcw3/5Szkfq8WcfUmN+mlfP6FMUF9Mqy4SIym+D9C
	wYskhgGoI5DX67jZjdo/jY/DpaosnrRxzeqiuvDISZ28tWzBAjKREnbjLFu8pL5bA13U
	1HewgnUDPYDx0FMM8GpR46VGDzw3aPNSDFwbKTCxu6BQN/Qq6EolA3jAYpySmzU92r62
	7JLA==
X-Received: by 10.180.90.237 with SMTP id bz13mr10265589wib.45.1425070573949; 
	Fri, 27 Feb 2015 12:56:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n1sm4380465wib.11.2015.02.27.12.56.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:25 +0100
Message-Id: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-qt5][PATCH 1/7] qtbase.inc: mention that qtwebengine requires qtbase with accessibility enabled
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index fd3e681..4bb1a69 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -65,7 +65,7 @@ PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
 PACKAGECONFIG[tools] = "-make tools,-nomake tools"
 # only for completeness, configure will add libs even if you try to explicitly remove it
 PACKAGECONFIG[libs] = "-make libs,-nomake libs"
-# accessibility is required to compile qtquickcontrols
+# accessibility is required to compile qtquickcontrols and qtwebengine
 PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
 PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
 # use either system freetype or bundled freetype, if you disable freetype completely
-- 
2.3.1


