Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id C25D370381
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:21 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id x48so4176595wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U7Vnwm7ZAe9e1PGpJ96jlh+nJUnwcCw5MlyvOItO0JE=;
	b=xpeag2+kBiWe6DAt8Th60X0iKns63pPRgy+eY+2MonPd7oOgwP+cT5ejEdD+AM/Rxg
	ZgWW3y4X59w0pB1C2WI0YxknWhfs3RE9zwjD5fudnH5jNrsZTlUQAyEL0EFJkHkIJgK7
	iuIies+OxMNG8yg7m67eq/IV5k4iQl8ta9zGUVDAHy8ZZJp0BzaJe6ZC/AkQBj36zSOr
	eU4SF+kRz03ATANegfGYptlkMFyVx1NvOYv94xkekkdCHddjNCpY+QP3u7II5VOq30yU
	mP79nNBdTwQBgxr0HB6S0gp7aigT4Iz+0i6D9kvAqLjiPAFImdCkYFyfUc4Hgrbznxjc
	Zcxw==
X-Received: by 10.180.39.33 with SMTP id m1mr36379158wik.82.1404729921297;
	Mon, 07 Jul 2014 03:45:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r9sm113733137wia.17.2014.07.07.03.45.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:13 +0200
Message-Id: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 1/7] claws-mail: Add missing libgcrypt dependency
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:28 -0000

* otherwise fails with:
  | claws-mail/3.9.0-r0/claws-mail-3.9.0/src/common/ssl.c:35:20:
    fatal error: gcrypt.h: No such file or directory
  |  #include <gcrypt.h>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 7072046..2967ed0 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -1,6 +1,6 @@
 SECTION = "x11/network"
 SUMMARY = "Mail user agent"
-DEPENDS = "gtk+ libetpan openssl aspell curl"
+DEPENDS = "gtk+ libetpan openssl aspell curl libgcrypt"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
 
-- 
2.0.0


