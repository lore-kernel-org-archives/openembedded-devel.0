Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id E485D6B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:21 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so211913ead.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oOiDNfTEJHFQdIih6obtZypnHiYotP8ndJE6im14tHw=;
	b=jRF73YDx9vFvGLm5yrYWrCKw1c9nz98ddaPUB0QrAMPLqDkP/OaNSeWMbYz7J2mpVy
	73+OuHLX6q+fkkqf9BCnef98VibCngMpQ2WxrxDbmk8rXcSMH2Keto96eunyAlRXKkZR
	zmY8udkf/FkSXoPiENxeW9l3hfQMC8qtcvG4szR6SqaFt2P5MbArXsm1LRsb9tfVHoRX
	LPDJA7RYE+rLhu2XJm7O+WCEQe36OAJ4bj/R3h0/bo5QTrUwGdREm/6iThJFkk9MVZ/A
	pDtN6OUlPX5/fKutSPs6oBNnU4zuV1D8q0WEaZDMybUFKeI2R78Ig6zWpshHRWE3Ndnu
	3NGg==
X-Received: by 10.14.110.9 with SMTP id t9mr37575583eeg.115.1374669682384;
	Wed, 24 Jul 2013 05:41:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65905020eev.3.2013.07.24.05.41.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:04 +0200
Message-Id: <4cbfcc646812651c0c813d868b21f52c4f14e6a8.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/29] x264: explicitly disable swscale
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:22 -0000

* it's creating circular dependency on libav when explicitly enabled
* and sometimes it's autodetected when x264 is rebuilt after building libav

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
index 5222d1d..c767ffd 100644
--- a/meta-oe/recipes-multimedia/x264/x264_git.bb
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = '--prefix=${prefix} \
                 --enable-shared \
                 --enable-static \
                 --disable-lavf \
+                --disable-swscale \
                 ${X264_DISABLE_ASM} \
                '
 
-- 
1.8.3.2


