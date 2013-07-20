Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC366AF53
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:26 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2955301eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jdeVYh1D899ssTiPLxINV8uafHkhSQ+QufyZZdGFM6A=;
	b=gplcVUWMzGAt/6Iui/MXzrMQx/zEFIRLZqFedYzEu6fVnIXNW4NJsY5veNq95uTbQt
	Uu2te9PdkIDsVdbHJm1V9WO4+4x8DRaYfc8BMUz8HkitntF+I/JWr2OYhc525qFZUZ+v
	CEZfENZzRTyxYCeGDhzm2yUf6sI84MCz371P/box20S12BMUBidvcjcygzK7lKqMBBts
	TMRRAP//Sg8C1dkULy/SIQTwixiEDtEjVCNqF+2LcQR+NBCNUcxXaxxLXMsT3xYipugt
	fcETlZF9nF5zAD8N9hCBzYsOvv/0z/gP+RTMB/Ygllw5s26zFMOGPpSxgkGUkNmNIJJS
	DB1Q==
X-Received: by 10.15.73.197 with SMTP id h45mr20161166eey.146.1374332906602;
	Sat, 20 Jul 2013 08:08:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm35915424eed.9.2013.07.20.08.08.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:31 +0200
Message-Id: <e0a1ac93f8623dc8eec9a75e9e4cbac9677b9e6f.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/11] lvm2: add PACKAGECONFIG for readline
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:27 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 5de1e3f..1f3b62e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -11,6 +11,9 @@ S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf"
 
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
                 --with-group= \
-- 
1.8.3.2


