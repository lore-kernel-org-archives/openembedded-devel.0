Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34CE371A8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 03:59:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d79so2669138wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TTExXXbmffv7MONgB0qUvIw6Q9c6GwCP98UqCujo1pw=;
	b=nuBOSTMGdAiwjwmjwGBTRwNord0fGv+IC5zDR47J+87ykfKZZ/3trdC/UPpHXr0DGw
	3Q7SIf7AAgsyat/pTl90Ru+ntQ5YUhAqegCOSRc2qyRzQ6PgDNY5eM1L5etd3K40xVlV
	6C36G97u8B4H/1MA9KGYNovBZfgxghbRVkkGugPP52ylOa7OZpjv4Mh84N5MQPRojneY
	f9CyAKD02yB80tXk+twbsX1nrqFEY0vc+ykE0ktMH/Q0AFVU8oEgZuxp85NVxVz4FmuS
	LuOYMCijTUiuI6MXtVz3IbC1OaLgLGzwWS7GzVm1Y2QfnREpD1zq3Z5+1ZFCrrGT1zly
	uKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TTExXXbmffv7MONgB0qUvIw6Q9c6GwCP98UqCujo1pw=;
	b=YHh3NoUsP1yeCDeh1RWmBTOV/XmJyH4Q7CbgUfkSd8UjpNcWwtIr4sareS+EUsOB6v
	wEeMbr4bOmQFC9xyLWNSWqf3g8zuRmM13Fj+SGwiR4fVS55Ct1jHS8lGUuMs2iJc1SHP
	S5+2lvCuMhemCY8pFT61kkiyfurLuVDn1ZbAgPb9INYeLZmQr8XEgu8+d8Dvs2LXpKAR
	Pti3qtc4ld48pO02EWrN+Wwp0klnw7IQT/G1wpPXSMarFlQJXf5IIqqAzq8o5aOPO4Hw
	8N/GKXNhMBzt/5j2/2oCQZykZxZO0LI+ABK2nCnhC6xdntaDaL7/X8DJP+p3lpdHyNcU
	2Gyw==
X-Gm-Message-State: AN3rC/6kY56MypbEFHytAIu9bu0ChXs7/DfLBG/Y8eqbpjgJKdLyyom9
	Y/9VeMhq2IqsoA==
X-Received: by 10.28.143.71 with SMTP id r68mr16468121wmd.61.1492574400557;
	Tue, 18 Apr 2017 21:00:00 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.228.133]) by smtp.gmail.com with ESMTPSA id
	i21sm1422970wrc.50.2017.04.18.20.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 20:59:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Apr 2017 05:59:34 +0200
Message-Id: <1492574374-9290-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH] openjdk-8-cross.inc: tweak PACKAGECONFIG default value
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
X-List-Received-Date: Wed, 19 Apr 2017 04:00:01 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

When x11, cups, alsa is being set in DISTRO_FEATURES, the users might
expect openjdk build with the related options as well. For instance,
they might be confused when the openjdk is still built as headless but
x11 is actually enabled from system aspect.

With this patch, the end users still can choose build openjdk without
these options by overriding PACKAGECONFIG.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 47fe35d..34e1de4 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -16,6 +16,13 @@ PRIVATE_LIBS = "\
 "
 
 PACKAGECONFIG ??= "repack"
+PACKAGECONFIG ?? = " \
+    repack \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'cups', 'cups', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+"
+
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
-- 
2.7.4


