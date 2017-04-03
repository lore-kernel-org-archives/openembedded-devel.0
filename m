Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id CEBD777D11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:37:36 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p52so35984250wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EPRq8G0AGrgXKMARE6ZA31p8cAbjqT6hNpjEVMH6VLw=;
	b=DdQ3u+OZraXMFYRxmMPQTJZxImevD47gy0PAlBfwrGIF3onAjFxc0aHcVM2fSeR6gv
	UlHmK7wNZGpBXnPS1C7YmYs0TV3oPuNSGERk6leCa+YsMW4xsprFR65wdOQaBPtd3Bmf
	0+aox2zDoa7HCVKVEbDr+uFXYfMknIKaIx/Wh6jFmEPL3aoF+E6Bw3XiCGnDdzDp7eLq
	Q7O0xUcSWfAKKvlElSehJAmsS/mUB+HKnTD1zKh0Dw5aqeX3BDzUvT4o0JqOEae9SShu
	YkjgPjYZud1ZgMzB+ZafBb5GiBK6278ESLvhU0QLTpMtAKee8eOaqwS3vXgX3aRxUYPD
	gGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EPRq8G0AGrgXKMARE6ZA31p8cAbjqT6hNpjEVMH6VLw=;
	b=hfB1qPUSm95EPs00uXboZAMELrpsUCr2G+2mbc9XAtt1ERNbQ4VATr8HImegDliQ0i
	T7jS/AmbPmzPJXwP9WvUPtnyWpshYzMqLGDc8ecO6CKL5SKSFoMMYNNbVTeJ681nAFky
	+GQhBVH8qpdWMRY13S7ydBH5fiQK3XhE8PNijxx0pWpYTXuxe5rzNq5M59tl78wErP9y
	QWzsLYjIBRzwgzaGQyrBLy0wxMyANY1Bc3vGQ2iiGn19IHVSf6fTDs1sTH8POQKZ1yzJ
	xpZTLtHHx7wOyDUWyP3XF3jhN62q+f2zYrazXjD8sXcfYT7GTDjPiokcMARxeIaBaiC9
	PPHA==
X-Gm-Message-State: AFeK/H2zXdKBT/R7ZqbarxucvYQl916cZOVG7XdkBdO5YuVhs7IvB9Ls+eBE3dcYp9P0Pw==
X-Received: by 10.223.160.5 with SMTP id k5mr18127087wrk.123.1491244657572;
	Mon, 03 Apr 2017 11:37:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 92sm19278494wrh.8.2017.04.03.11.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:37:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 20:37:35 +0200
Message-Id: <20170403183737.14791-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170403183737.14791-1-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] pngcheck: respect LDFLAGS
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
X-List-Received-Date: Mon, 03 Apr 2017 18:37:37 -0000

* fixes:
  No GNU_HASH in the elf binary:
  '/tmp/work/armv5te-oe-linux-gnueabi/pngcheck/2.3.0-r0/packages-split/pngcheck/usr/bin/pngcheck'
  [ldflags]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index d523b7a8f..6d0dfff93 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db256
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_compile() {
-    oe_runmake -f Makefile.unx INCS=-I${STAGING_DIR_HOST}${incdir} LIBS=${STAGING_DIR_HOST}${libdir}/libz.a
+    oe_runmake -f Makefile.unx INCS=-I${STAGING_DIR_HOST}${incdir} LIBS='${STAGING_DIR_HOST}${libdir}/libz.a ${LDFLAGS}'
 }
 
 do_install() {
-- 
2.12.2


