Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EAFE909B9
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:39:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13413.1771339178209621475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQ9c9PYJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43621bf67ceso2645463f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771339176; x=1771943976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9IBtsLM5YmJ1jWwu0Vw+8ddmts3wdMxRppYJ5F0mQ4=;
        b=CQ9c9PYJ3JYgyzq629tsqNS6p0TkU8hAxWZP6rzhH1+ldvP7gZou/MnC20fZdiBiv4
         V7xcuMRMl329ydTfqrGpquZImQECuJS2Bux3s9QhtRlx7VQ04s4j4ZYkuV6TCUrNigcg
         A7PrDvk0C5spBw44PeYfDCK4UwDdLV2ER64NUyFAmheosYjNvBjxGOZUUV09E2xJRx2V
         /2jEp2qSVSVYftrY/RUBFODsmYaJoSPLOIE6HRH3P2UnvLM+B3LR0cGLA+0K7krwvPxc
         tHgkXIBy1Teuv4qgPCb1Mbph417iDUB1NzOKN23eIMzUWPM8dU6r+8E9XsSr870ExbVe
         7yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339176; x=1771943976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9IBtsLM5YmJ1jWwu0Vw+8ddmts3wdMxRppYJ5F0mQ4=;
        b=IEAFLvhoGnMGb0bi9XP0g2SBN3ThRAZF1OnMcBqbBuWjRd7NyxBIAG5+RIv6PguZxh
         CE0vfgST0xmXUNd46cwtE7ia7uMSSAZlRR16iK4JFRTMTF2wfs/fyrZZlEYvKmGtNQXs
         Q6XgVYB/xFCD35k/Wlswa5/LMuo1IiJAJaIAGfFKl5Ny5/TxUQrGRVUClZWuiW5VGMAw
         BHyooP98uZbolOjSoxAc7SjXCb2z7h+WeUDek0aO2DmZAM45wX6amML+o+iNFhtnT/8x
         n1okxcWKfuTnNpLiqIox8JoLnMxeTF0nKkwVyJL0Jfvw9SKcZzEs/+cg6h4ByffNgRe2
         Ujgg==
X-Gm-Message-State: AOJu0YyfhX9x2tUYIJTAHNR8qZqo1kDQe2wkHsgTJPYOPq4gTpQFmaPH
	0GbW4vtzGpAKn3qH5gY5JFFYAAxt8yPG80ov1sdiCFpnZfrU93oQCGt0Sd4YaqD4
X-Gm-Gg: AZuq6aK3iV+AQVGxX2C+9j8NAnrbx3xOSXN2JRGDk+afZJ6i+CeOMgfGgNmvHtDYSVb
	OtZe2dF/FG6CrVUs6Gex6uovtZnis4BlMMD0BAc/0GECrTHHuEgnlTXT84BTqgfi1ON4Pa2iFCE
	SJLNnFB35VC5eXSnQ2/YHJ9bT3scbrrzfWgU59X7qCEJFl0Y8d9/gLM06vp7rXDUDVd547vWPNa
	mruRhi38/FlbRjFUivMoifhIELvOBOnZAukxdCLpnNpzRA7RkOxHXB54B6zU01mfbnVYpBm3KxA
	aRgWa3FCQoOjo9dMTxVbArZbQIi4as7H4XhH85N8EliKmeTRzNu+q1tOi+Ov+uc5ut169M1RNEK
	j9AmL+YFebJNVtw41QcCI3xuLtuXuzgfg00qd5FHYAjkRb6BLi9lM2OT4LMUOuEqyeHrUDSGNaW
	qY+5IKU51rA5yS9i3J9Y1zT7wqog==
X-Received: by 2002:a05:6000:40df:b0:437:7168:af52 with SMTP id ffacd0b85a97d-4379db25d28mr21723823f8f.11.1771339176207;
        Tue, 17 Feb 2026 06:39:36 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm36862235f8f.0.2026.02.17.06.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:39:35 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] nodejs: add missing Upstream-Status
Date: Tue, 17 Feb 2026 15:39:31 +0100
Message-ID: <20260217143931.3173999-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 14:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124455

From: Martin Jansa <martin.jansa@gmail.com>

The patch was introduced in:
https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=3f9623aaefed5b070294a0d52a54a50ea709b389
and it's the only one in missing it (as default ERROR_QA in scarthgap
doesn't have patch-status).

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../nodejs/0001-Revert-stop-using-deprecated-ares_query.patch    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
index ae4c316baf..c841f0369c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
@@ -16,6 +16,7 @@ calls. This patch reverts the below linked commit.
 [1]: https://github.com/nodejs/node/commit/22e0d17097fa419cde5fcd5d648fe70aa9fb80e2
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+Upstream-Status: Inappropriate [oe-specific]
 ---
  src/cares_wrap.cc | 24 ++++++++++++------------
  src/cares_wrap.h  | 35 ++++++++++++++++-------------------

