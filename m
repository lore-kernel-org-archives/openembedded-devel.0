Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 03F867CF98
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:47 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id p10so3428399pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ep70kDE/UoXv3QVa1F/spHpWvzD7bihV75XXb/U4usI=;
	b=gq0Zvmhhuadg81J+4fuza9bBVkZ2zB1Le9XJRocRlhdH5aeiP/v25DmOMmFfuuOwmu
	V8g9cupcLEXWEEPfBTJNRFLPLn1v1oh1OWmu9gMBm2AlmZJuk/Z5DrwCqmfiXmu9x4LX
	rhBKC+WTlX9zT2tHe1vx/st5H0S4K3Y+ETRKOSORu5JBHziJLK9LAD91boslHzEBMemd
	t+C0MVyvd6Gk8bsaHUDsW7qQAjxPN0ur0aN916kuHP3ZVD8bofIc+rXQzP74PNAFP0ps
	3CTEfxz9Xs9CZ5G8shIawpYLrb0UUN2E6hsdAC6INdbXmsogtP5RpRfRLdptboSV5Qyt
	cIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ep70kDE/UoXv3QVa1F/spHpWvzD7bihV75XXb/U4usI=;
	b=fIWUaQ11RV7Yvr+wq0QDAcDNqRWa9wXZMAH2oCVIS/80c+FHW7F5Gpg6KHFJtGBS1j
	q6YYpK18SkmaaMP8iGp4Qj/B+/v4wV2xxvm3g9Px0IjdbrgqKQ7TQt2dsXNgkAcXvj5O
	b5KuDU9m5jTxM/wPWz1sSlzBgppw2zd5Izdh6z36Dru2RybzwbKBqid+hYeXK0gPGXnV
	w2us5knBIZB0Q9I9GIMaLgaz8zHRQ1Esq3j9sG0OHqTxKLjUrNQn37PwnLzVyjPxaQK/
	Z593LNYfbRZmGO9vc3UW5AoclZSVRIX3M8Oiz6KpUHwZAnQ05Io3TVybRBQ5SaGn7LGM
	fbBQ==
X-Gm-Message-State: APjAAAUhVblSmJ2WIV90Su4ZdKwZGF9S1/Ag8gDn7fZQEX7gJqqloRmy
	GSAp+pMGODKTJY0xX1gbIbIiQW3Y
X-Google-Smtp-Source: APXvYqwG8Fk5+92cHqHTaY7WZEACgV4n4iRF/s1IQsf44PKzexJJ1amyFo+8iF96DGmFLvorOI1OCA==
X-Received: by 2002:a17:90a:9b08:: with SMTP id
	f8mr17537328pjp.103.1560621469110; 
	Sat, 15 Jun 2019 10:57:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:23 -0700
Message-Id: <f2a4c4eab38fd07983bd08f6f3f415d69f831251.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 19/23] leptonica: fix SRC_URI
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:48 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* leptonica.com now only redirects to www.leptonica.org, so it only downloads
  the HTML home page instead of the source tarball

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
index 91fa00c..249e96f 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
@@ -3,7 +3,7 @@ DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=34aa579294e8284b7b848c8d5d361e8f"
 
-SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
+SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
 SRC_URI[md5sum] = "4f32be9bd2e2c142ba018037ab5d746f"
 SRC_URI[sha256sum] = "29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b"
 
-- 
2.7.4


