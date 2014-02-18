Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA0E6D14A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 10:26:03 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so7694155eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 02:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oAy3eEex/6Ud6BA9AKmFEinI0+YMd0EbPzM30Q2332s=;
	b=BH7T+jsm9omhjDF+rbUPc/dwecGIPoihXpe87LGIs7DhSwKEiDGzjEslpe6o1xUROg
	+85yUuCEH08kBW23bXo1IVP4ZqXdDn3hF4lTqiVXhOZ6zyUKvQZPHORfC5exquY44PZp
	nGIhWLtFxMr8WufSJ+YuH2tzTqq7qsMZzPPEpWIf3x4kcgmNer+/2mgOCe192W/6BE09
	mUmkysitlwI/sSs+s16dOjVxUC84L7fScCE94Hs/B6kXJ92qZ3TrRgb2ig2/g3ZqxX9L
	ABAWcAMMmW1kiwmAACUDOKCH3UZN4vCIA85jMJ40DnHHRD2WTYsE7rvXrX8mHjkIbXKG
	HLgQ==
X-Received: by 10.15.55.193 with SMTP id v41mr3182987eew.80.1392719162856;
	Tue, 18 Feb 2014 02:26:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm68443960eef.12.2014.02.18.02.25.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 02:26:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 11:26:25 +0100
Message-Id: <1392719185-11585-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for mtdev
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
X-List-Received-Date: Tue, 18 Feb 2014 10:26:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4c1c6dd..116c86f 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -101,6 +101,7 @@ PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb,libxkbcommon"
 PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
+PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
 PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
 PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
-- 
1.8.5.3


