Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9DB07BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:45:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f2so2608061wrs.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ywUAlyTuYGXZMEvPRfXFpi/FrkwACTEW1N4hOzPLPlk=;
	b=Er0ZQhFkBNPmyA19sU7PoHWUIs2/lWFuPc6ePQZZLQFNL1JXW6SIXYSHo0LTzNukmL
	VfKtQjahA3sbElUmuisgiw0B+Aec5M8rAF7vRgwJgG61/WVXApCAWZB3Ulb3NlgjSm6Y
	2pqUZfGh5rAiOvh58NlIcv6uZwensAXpTUYadITQiAJmZL0VfB9s7/HCIxqa73xIXB3D
	fHFebjIYi5dw30X4TZTVgXfKnXkQZPoy5vPRwNirumdWhIMz1BLumDEwCABZ2l4WwhFJ
	ahU1unr49g+Sx14ainNksfjgd4Szz9yBs7rHKbTnZnlLWBUyCxGqP1SId/I11EJa4Mx8
	Gn/g==
X-Gm-Message-State: APjAAAXhAVahg5N63KHQRBojwJ1ddoceMudSKgeRP6548rN4LRZXsI/J
	I64Qib+xOL0UnuM7Lpy6ywFtBy6b
X-Google-Smtp-Source: APXvYqzrEJgsmnIzIqlrW1x5RPAZRA8GIruGNb8F5RGiIxeS/jN6AzGEfKa9zVGTxTbzyOecgXo6mA==
X-Received: by 2002:adf:e9c7:: with SMTP id l7mr2457637wrn.57.1573127104326;
	Thu, 07 Nov 2019 03:45:04 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b1sm1698431wrs.74.2019.11.07.03.45.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:45:03 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:45:03 +0000
Message-Id: <20191107114503.1145-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: allow use of system nghttp2
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
X-List-Received-Date: Thu, 07 Nov 2019 11:45:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can't enable this by default, though, as nghttp2 is
in the meta-networking layer, which might not be enabled.

At least this gives people a simple way to do so if
they want.

Signed-off-by: André Draszik <git@andred.net>

---
Note that this commit depends on the nghttp2 updates
being merged to meta-networking first.
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 4afe341f9..be3cbf04f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -54,6 +54,7 @@ ARCHFLAGS ?= ""
 PACKAGECONFIG ??= "ares icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
-- 
2.23.0.rc1


