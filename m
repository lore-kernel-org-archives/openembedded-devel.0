Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 254776B387
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:16 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so216592ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hCeddocJrDYiJawARLxbrGSjJw9RR+MHeJMCOlp30GM=;
	b=MVJGhNK74ogoaFHx2RFefZXXR6ht3g/RMpAX3X5sRMeYfTpqSaNRyoKgyhVAuqHFVZ
	p4qPyMqiN+IOEZak+ppUMTJ7x4O66bHcK+eLoY+KujwqgcHT+rFake7IvreQ2NMZ0h8N
	P1pefk43PcwOMrhic+QPDmpQh3xlweayrOt7W0poE9eGG4FxgR3nFO8v41WBUYbjFjGx
	Vaehd/ACs17kWYj00sCP5wBxDouHcOU5naIo4c0YU91QpqDrPBn2ldB9pDiW1uqGM79V
	n3jzk1ejmC3DpzB7R560+OKQP310gHvQP5uOUyGk6TA5HakAgqO9wi8JhzJyk/pOfJDy
	ldUQ==
X-Received: by 10.14.48.5 with SMTP id u5mr2015804eeb.89.1374669677602;
	Wed, 24 Jul 2013 05:41:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm65833233eeo.14.2013.07.24.05.41.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:01 +0200
Message-Id: <bcd22e8c9a3eabf456052feed40ed80112726de1.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/29] libav: add PACKAGECONFIG for bzip2 and jack
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libav/libav.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index a2fbe6c..0155b4b 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -28,6 +28,10 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
+PACKAGECONFIG ??= "bzip2"
+PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
-- 
1.8.3.2


