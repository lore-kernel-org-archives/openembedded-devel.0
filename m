Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5701CCA5FFF
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31266.1768811285077990600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8m+ri/e;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f0f875bc5so27839645ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811284; x=1769416084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imuFr1gkAuGVwWlvTO5rGr+vRYTiVzbDzJBqB/wvpGI=;
        b=U8m+ri/e9xsrYOYTfqdBbjbliYhCxCcOw7kSPx5JOrQexjUmkwhxnZqkFS6XIyD9R2
         OofJMvxUIkAji2cyIMlabnQZJC3g4mJu8cHw+looIFe2a1la671U2vxY8e/V1VBk0/kT
         3i2WPWn00Sa97DHsn6cSPUQE99QoMMulcDc3Sw4auurZdygVXQaboRm6ReZOlnBfmS3z
         /RtK0EGjOE1zjAHMkkMQdGbtDnnDcp1Ur08AaPqslMlekMCQSaIkX0g52yhx/CoY8bUR
         DtzRxCzUpzcw5hspgX8+OqAvgt4L4N1PBCrPBwggauOtMRxkA+wJjW7Oqb2LfgL3VG5f
         HNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811284; x=1769416084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imuFr1gkAuGVwWlvTO5rGr+vRYTiVzbDzJBqB/wvpGI=;
        b=QY3gsY/dWDR1ajUnYuXS1sU/2Qare6fCD1tE8gzslIhJwgNpk/LPgDaaUwU1BrbhMM
         /8r0BN2VC+bOEI+Rmw1n9vhRrxtwkr67FH1ayuOyAYarA8ZzIa81cHAo0ZEZVysTDsDW
         BvM05QlihL6TXf1h37IiZCnni9teOpoSMSCiCB7LNyr2Vpgof+Xwixii10APiTNCVeH+
         tUqfpBsapgMzVO+Z+2LYe4nXY2MAO9sDdraMQjDAq66Q/z8GXsZMK5h3fJ/RX3pEwsyx
         liGRoq5EoGpd4IHPqMj/3kWVws6U/kKczh3qJUfaavrB2jW1lv/5OdtSxB2jYznmRbMC
         yhtQ==
X-Gm-Message-State: AOJu0Yxjm6KyOQCvzHKXjofJcgKx5wXF4WL/gek9EipxSR77fMQ/39KO
	+/gGaSHAAeEFs7o918cHBKkiv+LWXCUJTr+SaD7Vv0JKT5R3KPfNX5xwAUh7SA==
X-Gm-Gg: AZuq6aKrCMt3STamHIgNqHMzQ4QQPGfpXIvmHqVeXXdLfyyfB3gCkjhktU1nguJSJpn
	DLYCGOP4nZFqV3m3xvZckik++SJ1NGeelASrV/DSRvqIPeM7GabkUMt+wNPjQ45cDpRnQRiah1G
	m9PFMQFwoO7DtSZkG6QOrWT9HuepstUY3BzV+xI2k2Hc/lik4iwLV4j+tTMpMAFK+C7tV5a7oF1
	t2qgBuQUOf0NBtwZXQGdvVrIOSaZ4d7Yl1aqVHrm9Teo/1hxU7a14WEuTdDkf2lW62wzg1trXS9
	gkMn7y+gI6RGeMMxgmW/0LI/eIZFfIxXJa90sxWsq7sLt2sDEJ9NQUNQ9cK9FU4uxDGwqFyDEZO
	DnaqPpLnlckdAeSQ/+O8ej2Qoq/GZAKVUc7l5HPErUgmy22FWbzfy4ghGTUCT/69LYQFS97E4hb
	G2Fn39q5TrV3U0TlBXMsIrI4s=
X-Received: by 2002:a17:903:1a0f:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a71740af3fmr88442395ad.0.1768811284087;
        Mon, 19 Jan 2026 00:28:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 02/28] parallel: upgrade 20251022 -> 20251122
Date: Mon, 19 Jan 2026 21:27:24 +1300
Message-ID: <20260119082752.4120991-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123596

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c9c4b5a88718822697ad41d86b8b89961fb23c10)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20251022.bb => parallel_20251122.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20251022.bb => parallel_20251122.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20251022.bb b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20251022.bb
rename to meta-oe/recipes-extended/parallel/parallel_20251122.bb
index 9fa1b6052d..c2775472d7 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20251022.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "474326d59688d2fc078cf89a7b0b4a11cc9684229b3fa0158fe8bc03f1b69ee1"
+SRC_URI[sha256sum] = "368d1982cfd9dbebb8cd0e444de6199559df94ac2dd1edf95f74350f0af1e84d"
 
 inherit autotools bash-completion
 

