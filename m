Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A095965D40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Oct 2014 03:48:17 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so2226132pad.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ufmN5DZelZVnwd3s1slRSWlehQORgn0cX3nyn94IY2s=;
	b=WkCOAF+JzJoyb85aRf/+0TQRtPWicurWQut43G7VNjNWEYyFsl52Rgen86n1htHz/W
	POuPKVzz/Pql6YsV2Q3JKFuRKwUSkFNTQZXY9tp4cMGwMN10atRfGB3omT80JeH11G0G
	qB5z9bdjL8XHUnM8605vCELbOdu2qDDIbLZn+8/SVxsOf86JTIhoof9jy+s3XuDLUyPF
	OEhS4xP9HLsipd63GB4/00R5ckgZJyvLPuyazWuzd9Fv/RclzOP4sd8IPJHxqLXVdlKF
	XOpJqx9b6xoDQrzvKer3thNVDrRdhKL3SrkAHovTjeYkoTkoa9KoyIdMub9vC77K5IZj
	rZOg==
X-Received: by 10.70.43.141 with SMTP id w13mr8653571pdl.3.1414208898540;
	Fri, 24 Oct 2014 20:48:18 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	oq10sm5104405pac.47.2014.10.24.20.48.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Oct 2014 20:48:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Oct 2014 14:47:58 +1100
Message-Id: <1414208878-14039-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-qt5][PATCH] qtwebengine: whitelist supported architectures
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
X-List-Received-Date: Sat, 25 Oct 2014 03:48:19 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebengine.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 397be70..940fdfb 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -10,6 +10,12 @@ DEPENDS += " \
     libdrm fontconfig pixman openssl pango cairo icu pciutils \
 "
 
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
 inherit qmake5
 inherit gettext
 inherit pythonnative
-- 
2.1.2


