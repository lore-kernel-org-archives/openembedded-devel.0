Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC656B50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:20 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1273859eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rOSE4G0XGZGCfg6I5yxMQs/JDkaOkdVg7a8lDHu7Vo4=;
	b=SZIVzg0wTEMlGde5TZnG9J0ZnLPNH8lU3a2iSGsVnhNt1K9UmcRM7iWl0t2RqvCgSP
	ug62C9zICzdYR7YAhqcn9sXmI8Ei7uZ4mpSM3ivYKG8EkHsC9da96d++tVbxvjyffRl4
	Xp+0jxcaOYyA6nT1/gmUdfjTEVyMM+Ff3B40evuRbRf+TSSwu1E67bhehYjT3V59HzJy
	pO2J/V72cfSibzKtLCvXGOi9Z/FAHeqaNJjYlsY4100Fp0y2jEkl/DUlDgKaeE9jBY6V
	fqLwRlD1MxTJIgpApiN54c/sVeZEFRt9QUx3QYJ5cuNwfG/9c7tEENsdM5jfRHHTZehs
	2UlA==
X-Received: by 10.15.111.136 with SMTP id cj8mr14181153eeb.91.1375652840204;
	Sun, 04 Aug 2013 14:47:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm19355811eel.12.2013.08.04.14.47.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:40 +0200
Message-Id: <1375652867-10498-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Bob Ham <rah@settrans.net>
Subject: [meta-oe][PATCH 08/15] python-edje: Fix building by preventing attempted use of examples
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:20 -0000

From: Bob Ham <rah@settrans.net>

The examples apparently require compilation of .edc files to .edj
files using a program called edje_cc.  I have no idea how the upstream
Makefile is supposed to work but it contains no such instructions and
errors out without this configure option.

Signed-off-by: Bob Ham <rah@settrans.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-edje.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-devtools/python/python-edje.inc b/meta-efl/recipes-devtools/python/python-edje.inc
index 473b92e..2e2e1f2 100644
--- a/meta-efl/recipes-devtools/python/python-edje.inc
+++ b/meta-efl/recipes-devtools/python/python-edje.inc
@@ -3,3 +3,4 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS += "edje python-evas evas"
 RDEPENDS_${PN} += "python-evas"
+EXTRA_OECONF += "--disable-examples"
-- 
1.8.3.2


