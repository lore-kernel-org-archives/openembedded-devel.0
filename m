Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7830D7E507
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:13:49 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id d5so25134223lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=UawldOYSs1MiBp7oyTas+pDdbTnqHua5stmB8xaUMK4=;
	b=qV1PeHJm0LxoP47H5oPHWygrm+vDNlN+4jyKdlMCncrtRjX7axTnade/+MzadgiOLd
	5zFf8B8QFyqo+wxwAsMhAfTXKfCDzgvIHzOje8XxuHBSEoyVzAucSZNQj6R9JaMyRQcL
	4rESSV5FXNL1NhNzbPvhrHtMKZs1CzE2OckdiZCfMXi1RFLaRceAxJv8pSORVIndq4fP
	S01LgLpDtRj6UM4RMZvJiGb/vrAn624ZRvwZngUag0VSbBHjrYb3CZbKqdFrlmb+QJLY
	ifG1uzx4TdjqBt4ZN90vshxpx+CiL9AqaO4V3ulgTLwILK0fsExTMjD7mk/h8odGSISh
	UK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UawldOYSs1MiBp7oyTas+pDdbTnqHua5stmB8xaUMK4=;
	b=uh0EI0JYyj6qR1Fl7Jb1ROMmmPDC2xQRQlOfPWH74mzZV3rzeB7UqfqQ5L9WWhVsp9
	uoJ2OfRWdG34A5ki1FqwEQtRY6CKU9uthWWOf2v2ZnJlhfp83RRZs/FLUTmaZwqqlWgH
	BANwYtzkfEUfQwO5J2eKiZNGiGCCkhlFVNlRSEQqStxMVX3Wr6g+o7XcgNCifhs79At+
	CiA9cRodw5KzMQ4ZeHZ179+501FXhwEvzF4YdaBOu0Qzm2tLsWKvU744gi8FNgZ4T+Rh
	722WnsMdj7WumCdNEk+XSg41yLU+4GJwkS0CNJKk3Tet301W1enW+kRkXMwMhmNj8wQT
	E8Mw==
X-Gm-Message-State: APjAAAXE1dI46tn+BW0OV0YEjzWRhglQDiotKEIr01pHr0ZZgnup6L+F
	0xULTJe8uxc9XaFj/dFzpTOcKnd2Cck=
X-Google-Smtp-Source: APXvYqzfMqIqFrETq5JuxLH4PF0d9vE2sNLXuDSnXlZXl48Nji09dcRKbyMVMfbVLbWfn0p7WdM/4g==
X-Received: by 2002:a2e:8903:: with SMTP id d3mr22364586lji.192.1568326429687; 
	Thu, 12 Sep 2019 15:13:49 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	k13sm5984686ljc.96.2019.09.12.15.13.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:13:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:13:46 +0200
Message-Id: <20190912221346.17170-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libsocketcan: update to 0.0.11
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
X-List-Received-Date: Thu, 12 Sep 2019 22:13:49 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libsocketcan_0.0.10.bb => libsocketcan_0.0.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/socketcan/{libsocketcan_0.0.10.bb => libsocketcan_0.0.11.bb} (88%)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
similarity index 88%
rename from meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
rename to meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
index 60ca58016..0debe47e0 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
@@ -5,7 +5,7 @@ SECTION = "libs/network"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
 
-SRCREV = "51f1610160a1707f026f8c2d714a6f7aa3ca232b"
+SRCREV = "0ff01ae7e4d271a7b81241e7a7026bfcea0add3f"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
 
-- 
2.17.1


