Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E408C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26368.1785138316564994121
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rWckmR4S;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad4170e8eso35370775ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138316; x=1785743116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOpQCa5QRji0lYHcp36TKoaHDe2e1oZKj3NTolr5wa4=;
        b=rWckmR4ShUerf7MkJiulhfmIfSrbaplLAiV6TBBQJ1qA7jWa4oBYYeJS2YT4lAARgJ
         IcOVbfdMuWzlEaf1FwKdnGN3GN7dovUVezFznSDE0B0P8xr2hrR9WRrTSQzbdd/Mw9uU
         KyKYZ/uZkM1Z/F8KDLfMgK9WEiXZsPNH43Z+yPg1aMhAcH5dB9cavgMX52Aa/LHHY+FE
         hrfNq4BrvhMWHTYiik1JwSwnxSMkuHYVPmqEAl73kpSNLUvXx/ABwOzjYav4QFVyHCCq
         aEptGSXUVZRi9T4JR/WOLjEvKhM0Si0pwlCBB9rvw4bgPXSCFicwvUuD4HfECf71rdJu
         NGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138316; x=1785743116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOpQCa5QRji0lYHcp36TKoaHDe2e1oZKj3NTolr5wa4=;
        b=tK1JXHWkWn0XP8jAIYcvvXSvuLHHUyMxWqKKJzaaUMPyMd4rxBlfcvGzL9myev/Lra
         E8fKJhtjcPh6xI2achb1zCTI3TMqW9lAeLABbyztnvw3VKm5f9lyR+C/et+McBrawgmp
         zD3L84jcJStwVxo8Pu4miopwFW/eZ3zVmUvlbO8N1BARBszBld146KEinIcdADHxZUS4
         NFsmlXcrjoGnsOGdHV3ZUhxgthXDTru4Hafsbvsu8sf+Ik3ajPNvXJKPX5ZuUBMsZ2tD
         55gJsl2va0jypWGHNRa7LLNycbuFLEIo2mQTlGsmybzquQ0EguBebRJenbGt3w1F8LQe
         DhwA==
X-Gm-Message-State: AOJu0YyjdGdx7Hei+1BiTGb/MBYgRLrqsxstqZFJPDCNAbZWxa4L4grs
	718cuXm5Dn0yyBWckh7KvyU3Ab+QWAd5l57LE0Z/jD24WywgpsP3GHqwZYFoFQ==
X-Gm-Gg: AR+sD12jOIJAGfgBdtUFF562252AB+VZr8rYsAVjiO5lsobzAi3NK+TiSKwbZ5wmloB
	mmAUgsfNQktYyzFQU8DENHA9NjQryNoyxRfXwCC9tY18MNx8YVQJB6G3uJe2DN3oKuyZGWVgyBM
	/7Vx6Z1IC00eMxqeTPwNFC6dVtbQosYAKtSJA+4Lzl9bVn6qmtAkbb89a/WgL8PHGRI5allLP6X
	Vfs8hXbTA2m67Iyd5/VYPgP8a35lCYXVS7LIARrAU4JLcErCc1WRuBByJWJ8YYKFaYpgrOVnQVx
	OnHYitCUGUSxx8IGqqgExKiZPcuAbwzKiXTbNGvmtlKgMVeSvFopTo1YyQeCbs4H0ULLXxYNH8Y
	rLIr/HCFfHinQGMqhEllDB1+Dxp5dSkwTTT0icrezm47F89xDsI2hrAnWtoirnm45iNuRZb0LLG
	r+uvp7oaFKhlXkSQ8=
X-Received: by 2002:a17:903:38d0:b0:2ce:8551:318c with SMTP id d9443c01a7336-2cfde88170amr68081265ad.40.1785138315838;
        Mon, 27 Jul 2026 00:45:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] transmission: upgrade 4.1.1 -> 4.1.3
Date: Mon, 27 Jul 2026 19:44:59 +1200
Message-ID: <20260727074501.3707659-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
References: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128458

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/transmission/transmission/releases/tag/4.1.2
https://github.com/transmission/transmission/releases/tag/4.1.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{transmission_4.1.1.bb => transmission_4.1.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.1.bb => transmission_4.1.3.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
index 4bf33d8330..b2f1704d1f 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
 	file://transmission-daemon \
 "
 
-# Transmission release 4.1.0
-SRCREV = "56442e2929cf4e9e20c8604a229e99fbb352190c"
+# Transmission release 4.1.3
+SRCREV = "838877323facc4cc2b677fe817e203779c437bb1"
 
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg

