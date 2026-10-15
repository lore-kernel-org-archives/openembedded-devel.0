Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E194CC6B2D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:08 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29956.1792027683806959374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ELcfhlzV;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so26318685ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027683; x=1792632483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW/Rif/lEthyNbusgGvSQgvfnI61e06GyrVhso9tbLs=;
        b=ELcfhlzVhiQCT/9X5X8y+qU4o/MriRg9er0+mrBYoxwh8Lv+oaYxfBQe8/4DvxaKEK
         0IA48ote2b3ftvjTyIKKiIRohLHimD4ktP7vUl/Mey+9hg+w60aSFB9VoBS25SwPgY5R
         TO6MhlmFiSNCZ9O5J6UtWfxjXB14mH0QV3ILY4z/FJ7Dy3FUwebaaZreRhGYg/GvW9sQ
         MOgyKrkogwV2o3I6Bg5odqDk/OAS3znwI25boZZclxD6PDUNbbKhgJ4d18oS0ypYOm5x
         w/Bsx9Jmhg2mjPj8+W/1bVJwBqIYXD7fJASbM6ijzcttFksYTmyQ8WZK9vw99+8LwahU
         d2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027683; x=1792632483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bW/Rif/lEthyNbusgGvSQgvfnI61e06GyrVhso9tbLs=;
        b=Bhl6bMMgmQxK5Wh+OqEvqKYGt1B3I/k4Uu4TIbDExzxlj/ifpParG8RNa8+V1exL8p
         fLq5criLWm0MIeLIGulVJN1pSkEg/XWedCzB3JngvWkiW/7TqkUEbeyVrc8PL2vRF9UO
         J60HC68zb5HjTfYASY/cdhhgQnpwavlmjmF+ua/qYc9LlLTatOXWiYECSNZz+WsErgpT
         bUtlCza30UZhh9zw2gQCL5ODM0Nsr6adbX+ydUdyfbuLw2/bl9prckd4/6kQWVXoXyu5
         ZqRbfMKY13OsLKktGF9mVPc+PKmX8aypyOarYBqlJMg9eN9aWRBAO3/6wRv+GsA6Gxqu
         +xyQ==
X-Gm-Message-State: AFq9FYIuAtJT3rbJ1sPfdW/TaXHWCs9rY4V/HomgqtWXXhy5apgNH8br
	ZXfD1ZJ2JFM2ImC+Ij8GMNkrfI54jZfTjikU3B/gBZVw/1FHE61tVhrPoaBfFg==
X-Gm-Gg: AYBFou2dPaHDj0/KdmB1n0huFvc9zpwjST3KSelV4TUZJTuz/FhL6aGRaggfTrcNdTm
	cOj7SKwzc3DIxQzKLBgFhwzDdScEaX8u/XFOmt/awGAIEiUsLut2U1gQg9++5UarClB6oCH8uen
	z2sn7F4KiAbqr8y7DRdof+B8X1L9RQ7oExRbvdmCRVBX6Lel0bMdCyDeZ/xn/bn2xuHV33tUenw
	jvhcRzxcrQm58JkpcEB4ZE6ZSSFJhuLjCn2Tmvxykge9+EFwwWE0zwKOIMurH6FoHKkKiQt1FK6
	gyQji1pYLmh92ry4pdY2K/M8GmGJ32X74WF9YTiyaoYiqRxVKan/VctJGklgXtMBCMM1D9OGsTe
	k3/TXUAs13i0TyFvih2JKA6mB/sz0RDtomKdKGKBQTr8jdvngkybX6Cmff8fA2JN5gyG0n7jugL
	OrJlXhq9HVmc7BYEmrjOwSfTAAeIEzYRjK+enqbIFOQ90F+jR8TQO0kWmbknx9eOXh/I5PddhsU
	jxwKtM6seVNXORGoO9pbyuRJ3UfT3weNtLlDnk=
X-Received: by 2002:a17:903:1b68:b0:2dd:c100:4b77 with SMTP id d9443c01a7336-2e842ce7f76mr148280495ad.46.1792027683107;
        Wed, 14 Oct 2026 18:28:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:28:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] rtorrent: upgrade 0.16.20 -> 0.16.25
Date: Thu, 15 Oct 2026 14:27:48 +1300
Message-ID: <20261015012752.1650544-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130902

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.21
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.22
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.23
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.24
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.25

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rtorrent/{rtorrent_0.16.20.bb => rtorrent_0.16.25.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.20.bb => rtorrent_0.16.25.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
index 29839afcd8..26cf52346c 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "dd3ddf7c391ada92e4ba86fb6afd8a6cc01446b8"
+SRCREV = "15ccae27deb9aa1dc8e46ea0ed218a673ccc5732"
 
 inherit autotools pkgconfig
 

