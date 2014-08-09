Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D10D670A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:04 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2340778wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ia3FqnPO3ZWPq1wyC210Bi33Z/cRHmr4BO4e/BnjSE=;
	b=YndvrGTUNHHmSf6JZZhnmWB17+zBuuOkIx7J0eJOTNVy7AbYG9BYiqlg5qKPnyPIvb
	KfXF8544EzISZ6gJTYrlsdzieF0iF+Z5Rx/HzwBi3H6Eo9g96zaTfDNi4MYMO8G8Vd+u
	XTz0PfuLPS+R8JwcYZYH4YNj7IT4rkd6k6nPJI2wIU5eEEhZDrd65MhredARzJavoItQ
	4IzkPvu1adrLifIL7UxoBwEnUUq+2rMZNKc9pESdPOiCNg8LFwnNcAH5PGmJNPGiwUo9
	EzkcFilj87lgX68ErwG1MLRGgUsJMKGf7ZZqmyIhi1/ppg+OhboEOwLu28uBXq2qZfts
	6v2A==
X-Received: by 10.194.6.101 with SMTP id z5mr40932548wjz.79.1407600545441;
	Sat, 09 Aug 2014 09:09:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d2sm20434610wiy.13.2014.08.09.09.09.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:52 +0200
Message-Id: <1407600537-10857-31-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 31/36] synergy: add dependency on libxinerama
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:05 -0000

* fixes floating dependency:
  synergy/synergy/latest lost dependency on  libxinerama

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
index c73582e..642845f 100644
--- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
 LICENSE = "GPL-2.0"
 SECTION = "x11/utils"
 
-DEPENDS = "libx11 libxtst"
+DEPENDS = "libx11 libxtst libxinerama"
 
 SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
 
-- 
2.0.4


