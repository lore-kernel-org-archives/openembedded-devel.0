Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41D3CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:24 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.7187.1758700637332269392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTRQHyqK;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-4248746aabfso25631005ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700636; x=1759305436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn06av4p33HspWbBRbVcuUWD3Vz5nEHlka6l6BWWGvI=;
        b=HTRQHyqKs8zhYm56huYBmmfGCB4yEsi0VwJAAmh65OnsmU6HlA6aUBDEhoUT1S/qFb
         PUIjTKvZ78FnsZP8NWI6bu4Ki8huBot9pxesiYCIeHTuVsGprABP4yLFf8/tPAmyM7et
         MYijaw4Yji/8IXFh6wHvCXLC8hE1EYDkaSkeCtok6yJ/e8XmMboXH2CemNkBZtaEJKjm
         +2immRWNxoVQhRmjZsFe7Yp0EygEAluimF1bsWEk3gG+QfrhwV4lAtzhftyYUzWue+I3
         9X/yY0+i91jLVhzdxDTxjRN2e82SEPCF7bgcWQBpybsP6W7frQO53OrEy7r6JnyFTh/l
         XD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700636; x=1759305436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn06av4p33HspWbBRbVcuUWD3Vz5nEHlka6l6BWWGvI=;
        b=Zgfl1Vfyr056xYpPDD9pZ9rGUmIFd1cFOYh54qsJVs6s6lq7RYApczRdV+4gWWJBEk
         nU+I0+wIxbLr5NeZ2aDvdp+QTrsPi3sFrqmLUI0aVQK1ZZB1ShvE8HuYRpQRxAvB5y5f
         qLSfLz67NglGjV47va7Azk4NQN1BRvDQAPXCFjRBvqn9h4wixciKWM76R4022WD6WD13
         5FkaWzFnFo+9Wo/guf6CSX8tGprRpc3K4WjUFbFAPQdHRdAzqBZ+/GDKnxW80YPrr5WT
         W1VCIQSgKSiIN6M6BK9YNEoK4i/IdFgHYmyV+yoVqBGSqP6dQ1a8qB9fbdLsck2z1IgK
         ylHA==
X-Gm-Message-State: AOJu0Yzl/32brasYfQSeUbITW1oXyXk+zDhqqIUXbqVz3NLIQ19haI3e
	UFvG8IP4KV0l8qlKV28GB4XcSaYKbPYCiHekz3Dm1xSXjYMC0VI9F2wPtaACwQ==
X-Gm-Gg: ASbGncvbh/Xe1zoN5f8wMzfl5QS9KkK4UlIf4L1+unVxpnJtpA+I+rGZ84XC+RIM7RW
	IKfXGdctvdXkc33veD+MMkZv/swE25PBYN8gE0IKBMMH1KGt9SWkUriwa4SbuHgXKQ5JfjIilU1
	DgK0YjMJd6weXeUrWkxg1Eq8jWlwvcnULIC3v+5Aapw9uQfbgDaWCFenGzYh+h36TaRnXQH1qZ9
	A3NU7zEu+R/RDEqkIMcZ21T9jfYtLDNcMenr5a0Y+679JKQMT3b7AuAatkpCygGBg8/dQ+bgBE5
	euhFrlVPG5RPQA07K8+xsZB0ZAv9Au+vVdSqdJkdmP4ofVsveRLW0+CQHu79XeatOPlNO2dz8xy
	iAi+LNjQnGFG55Hw9ChyO67PnqQNS0GYGx62gF81FE+BYbiI3s/eE3en2sVxqSSc=
X-Google-Smtp-Source: AGHT+IF2tyHPLwbSQnFCNGPISKaxmYDhbhkPMaJPblQqmgxKVJ6WmN5bQ2AhPZkKrTAFRSp32AGtRQ==
X-Received: by 2002:a05:6e02:2509:b0:425:79a0:94d3 with SMTP id e9e14a558f8ab-42581e2ddb6mr89639035ab.12.1758700636168;
        Wed, 24 Sep 2025 00:57:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:57:15 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 6/6] lsscsi: upgrade to version 0.32
Date: Wed, 24 Sep 2025 19:56:43 +1200
Message-ID: <20250924075643.2047506-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119761

From: Changqing Li <changqing.li@windriver.com>

Upstream changelogs:
https://sg.danny.cz/scsi/lsscsi.ChangeLog

Changes in this commit are referenced from 51e410a84eaa9742ea8881435925a242fb5529cd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51e410a84eaa9742ea8881435925a242fb5529cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
similarity index 63%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 63b94e9d6e..127be8fbfa 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
+SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-${PV}r154"
+S = "${WORKDIR}/lsscsi-${PV}"
+
+UPSTREAM_CHECK_REGEX = "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"

