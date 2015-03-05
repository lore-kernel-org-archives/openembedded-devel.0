Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC70738B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:30:49 +0000 (UTC)
Received: by wesu56 with SMTP id u56so9845196wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LOvrJViFr+66R6qOioZLqCzJHPw5ws+ydmi0lXI3EeU=;
	b=ooBK5K/+//Slhp+66pEp3oEqbNtHFgUabByy/HGvX2dJvSS3o535AmxAlnrSXnE9Mj
	V9J8x+OyVAuGjfXTeVgKzd6BFbrs2Wn/iI4lWK3dKEr4imfcQ4e0tT8I8QgaQR1C3fow
	jsMpixnwEWZQRRTYbkGpD/OiQomcIne1E99gsrych/x/mOzw20P1LunGEwTy8/L3BPQc
	Pcu1nelaxNtGDQVOSNxRX7ClsKW2aA2L2hVWE5BHKmWChICtGhDkaEAYoVMG0QzGMKd9
	WKHd+PohSxDWSNJ6JWXcDNWtBOYH847BuBGo9+d+6U2ULxgVYJd2zT3Q0o7lPn4Tdw6z
	q6dw==
X-Received: by 10.180.104.66 with SMTP id gc2mr66208873wib.34.1425565850616;
	Thu, 05 Mar 2015 06:30:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj5sm10762602wjb.28.2015.03.05.06.30.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:30:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 15:30:52 +0100
Message-Id: <1425565852-31349-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <54E74711.30202@mlbassoc.com>
References: <54E74711.30202@mlbassoc.com>
Subject: [meta-oe][PATCH] mplayer2: set REQUIRED_DISTRO_FEATURES and LICENSE_FLAGS
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
X-List-Received-Date: Thu, 05 Mar 2015 14:30:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 2de26b0..8c5f4eb 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -10,6 +10,12 @@ PROVIDES = "mplayer"
 RPROVIDES_${PN} = "mplayer"
 RCONFLICTS_${PN} = "mplayer"
 
+# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
+REQUIRED_DISTRO_FEATURES = "x11"
+
+# because it depends on libpostproc/libav which has commercial flag
+LICENSE_FLAGS = "${@base_contains('PACKAGECONFIG', 'postproc', 'commercial', '', d)}"
+
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.3.1


