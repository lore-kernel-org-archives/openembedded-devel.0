Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6297BCA601A
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31280.1768811341854633108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DzrxqDAL;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a12ebe4b74so39123295ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811341; x=1769416141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPkPe2fETam+vWqo2m7t4KbVRQ0ahUa5DwSyBoEXmjo=;
        b=DzrxqDALUfW1UBk29hE8YmKNWgG6aUSw6tzvZPoRj8Ma8IAhFaNIy7StuByHdz/k11
         d+6DrR7BQGDksFFwnE3/xihfnc1dE76c1YkhKUZXXtFWV+alUEen23P8eH3Cm0ZnAwR1
         AigUpCwaLbHvwRQkscJqOrJmVrCm1N5JnfXi7uyJIAd5KTbgM9jo9D1iASQGJwJmbs4C
         Ui4kMryBMlonEDOT/ZINgxlzTHA0BDBk8gyAYEt4OzPudxsOGOmXAtxUG/WOqO5qlpxa
         U1+9bqwq+Gy+QRZOim6S2dK89jK7Z7ChKbrDUOSgvFmk/3Z+BsDVQvNMnhvmwR3opa3j
         ny6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811341; x=1769416141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PPkPe2fETam+vWqo2m7t4KbVRQ0ahUa5DwSyBoEXmjo=;
        b=hO7L9DinoNQkx5vlckZ4gIYkgkEdXj9opBDw4bdE8b+XAqR4y4ERy83PIJHMprZC6/
         /SVz3aGbVCp7dC9hgTiK4i27rnA2fKEuP78tr//KGvPIm4a2J5tu42pBQZ8GG6wntrZ/
         s86dP5GcogDJK++zCDTnOZs1YqT9VpRQpcuNAL+8jZUqKLdMqA+8rWGJScUD2mXyEALz
         JhBwY45ExOz2RRkhf0VQjKpWJNMzMnlyL3Je6k+6qrE3UG+JeAwf7JGML3J4eR/fs+/J
         8K3uJRhI/bO+th4eAxr5WsOGR5bSFPseOF9Mp4Q7hpQ2gGFJ2wpz1+4n8i/w9hTIjA6y
         QzEQ==
X-Gm-Message-State: AOJu0YzCwVtFcxPdJ9E3EKbTtpwcYTSsxyGAYNddR4t4iabNQ2/KTSG9
	vMp84bgu1rXJP2SInPVYHQ9li0rxY3Ch/4ks0SX1S57Dv6vaMubU5jx7d3DzDg==
X-Gm-Gg: AZuq6aL4Uurkj88HnF2XZTKuhK7bTr5ccpvtCRYcQjHMK0Yq5vl0W0It4ev9wDSU/cP
	NCEbni+OrRNuRiXhXFyZU8RJP0UllbKvQmnrcpcWiyXSP0cUZ9KeqO2cvZ65ef9JWXrBL5p9rfF
	6svx3ExwjSpqUIfPzeqrEg83+R7W/keMFrfOEqyL//WMFHsRjZBRDuPo8IfzSbMaY49y8Fc6swi
	QICnt2nwKxFalQlBZas6BN7FMfAmOJq34As0k7rChhrwI5SzZKejZPEiSvBjyJZ+JWRv1kqvz3z
	WOyijuAmm/4jde/ItJThINq+1Ix+dzoPDlDhNsHnPo0TF4reI1nguiyVAtrix/vvtDvTnGIJ8aE
	D6XBepsKcFWe/bUzLmyMu0VkXi2VC+1p1QnIpJMfWnskqrII6FKOWBhSi0/w0nmILtmtlVE0cwx
	/h8aEWL/n24jwYlB25soTIZig=
X-Received: by 2002:a17:902:e54f:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a7177cc87cmr97328315ad.40.1768811341116;
        Mon, 19 Jan 2026 00:29:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 23/28] asyncmqtt: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:45 +1300
Message-ID: <20260119082752.4120991-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123617

From: Gyorgy Sarvari <skandigraun@gmail.com>

The CVEs are tracked with an underscore in the product name:

sqlite> select * from PRODUCTs where product like '%async%mq%';
CVE-2025-65503|redboltz|async_mqtt|10.2.5|=||

This patch sets the correct CVE_PRODUCT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4da079d7f572efed610bdf1291e838d0a5fc45cc)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
index 6a73543821..47de7a7344 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
@@ -4,6 +4,8 @@ LICENSE = "BSL-1.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
+CVE_PRODUCT = "async_mqtt"
+
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
 SRCREV = "cb3d37dc3432b9c03fe631eeba2d548de7457bf9"
 

