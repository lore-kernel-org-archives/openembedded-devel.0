Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id C533961EF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 19:31:17 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so3577833eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OcW+5CEehYfI5yINbq94/Cnwq1d9OU3GHZcAUYIe7y4=;
	b=gWj5MZAYGGTSHjTbXqHqGwjP1V3k45uNbebhjBT8qwEVciS8BosLvMFxwBd1z28zXA
	uoMabjluoh5blyssdxbCgfAZZcxNhF8rTihXi4dfxTu/t0U5IGK3b3yXuZy20wyI/+m6
	JWY6YGJrw/4j3oODvg937lfVZ04frGkqRqJz1IrL4jgSvoRmKdDE2x5mktv/HpKXMI7g
	/w/MhrO2PmjEEFZxn0Vv9FWdXmxPWYGag+1OHIxCQDE74GIYKJxCn/EYXIaU3BL0V5K7
	qVbg7b6sobRWgzEzv6kFw51UAdTLMXV93Bn1vkUUviZTYBKSlJhPaav3QfF1l8JfJW3P
	kfSw==
X-Received: by 10.14.107.68 with SMTP id n44mr48885379eeg.26.1380655878427;
	Tue, 01 Oct 2013 12:31:18 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id v8sm16597766eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 12:31:17 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2013 21:31:10 +0200
Message-Id: <1380655870-4120-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] nandlogical: remove unnecessary EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 01 Oct 2013 19:31:18 -0000

This is cruft from development: the recipe simply calls klcc

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb b/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
index 0fb6e2c..6ef4193 100644
--- a/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
+++ b/recipes-bsp/zaurus-utils/nandlogical_1.1.0.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] = "0d02edc12509f6dc98cded37c68238f939c522cbd398fd527785a1e7e3
 
 S = "${WORKDIR}/survive-1.1.0"
 
-EXTRA_OEMAKE_class-klibc = "-static -I${STAGING_INCDIR}"
-
 do_compile () {
         ${CC} ${CFLAGS} ${LDFLAGS} nandlogical.c -o nandlogical
 }
-- 
1.8.1.5


