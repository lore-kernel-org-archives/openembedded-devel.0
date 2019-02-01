Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35D097C4B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:17:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m22so6202346wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QB3403nqCpi6hiZA+JaYa7IVp+XMC46my1LoWeQgAPM=;
	b=ARFhaXzeLc9Mny+3AN4yx12l3XM+yKyZwTS7SUC7UYobsxcMs3MHplgCvaaUwXNEDh
	9Aw0Wf+IUsX6BucSk65F+M5fQn4sOgbRdaQHU8T31MsE8sf+0IYKGGz5/eG8ia673tdB
	MEb9HmmNdCwVY8LxcEIa7gjiLCo7WzlZ8xTta0yefcgTULTtGiQU3hcVzKbzoHT9L4LK
	nN/0n9v2X+w07qqGmpo5TB9uZmGG2wwenef3jZQdFCOELHojyry6xkzp0KcdFrB7T2+6
	PZTCh9H7CBoJGic8VCQwmmX3v7nzybf5Ar1YG92nHIAdpDz8PQmzwuiJz0CUndrLerpz
	FHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QB3403nqCpi6hiZA+JaYa7IVp+XMC46my1LoWeQgAPM=;
	b=AnAhc/iwBLCQOZh6U7xNWDKY1O00QSJTPibs5cOkseaATe/LkjJMO+srq+h07PDwZO
	3M3KdVAdIevikmyyibmv8FG/iCvUeDWfWY7dsQO+b8x0FkUV7BRim9GEUW77QviBNqrh
	5UuMdBbUbdD1CaS+/3h0ak8vNam5E3pr4k2KN2DfKhCVMJj6tyQksyM7tQJ0AX9xESV4
	qStt3iy3azgyBgFtvwwKDzuwYR7rSz7Tef66qMWTNm39j0gJD4R1x53E3Ux3LBVfdq9L
	+wKcBET91LRd2p6/kC8rTgZdXBIIyTu2cvR1ZhrgNjHJNE4BKXBLwK+5N4b0r9PHVfWC
	/5Jg==
X-Gm-Message-State: AHQUAuajGnrD3ezYX0qM+xnwH52k0hC01kSZ+V2Y+nMJVDwIk78jxnTo
	WG6AAvhlrynq02XJI7vlidbQ7rL3
X-Google-Smtp-Source: AHgI3IbnNzuFewgLPuHksfvTNL2jSBTtZpo3Ez0aZXKuPywGref0TpbhDzMXXZyiusveyDp2b68mMA==
X-Received: by 2002:a1c:650b:: with SMTP id z11mr2418971wmb.23.1549027077276; 
	Fri, 01 Feb 2019 05:17:57 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id r12sm9163060wrq.3.2019.02.01.05.17.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Feb 2019 05:17:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:17:47 +0100
Message-Id: <20190201131747.11388-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201131747.11388-1-schnitzeltony@gmail.com>
References: <20190201131747.11388-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libwebsockets: upgrade 3.0.0 -> 3.1.0
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
X-List-Received-Date: Fri, 01 Feb 2019 13:17:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libwebsockets_3.0.0.bb => libwebsockets_3.1.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.0.0.bb => libwebsockets_3.1.0.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
index 70e7c78a1..50620d99e 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce87f3facb6f911c142c8bef9bfb380"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "eaa935a80adb38b5cc4d09ce06ec987b87dcddfa"
+SRCREV = "89eedcaa94e1c8a97ea3af10642fd224bcea068f"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;"
 
 inherit cmake pkgconfig
-- 
2.20.1


