Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B27CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:04:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.9943.1758801839643872966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELCdy3vZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b35f6f43351so90013866b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801838; x=1759406638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szDFRfcAOIagM7X/ao50/k7Bh9AaFtQ8csdjE5QIm7I=;
        b=ELCdy3vZdLwEUmUFvjmJfCsQyNvDiTbiz8deDKCobuUrgN2QA0nrPATs34wkLCMDAk
         bA/2C9thZctOLQEtRK91pUJnIds0a3qtOKy9H7XG7hU/TFUe8E2qTEN2x38VubLuEf5x
         lEIa7GpAN2pTYWJbP53nExMtQm5FMAcHAz02q7LLvzKWbueU/Y8dnnlX8DFgtx6IfsrW
         1+8Hlz3ShWWkSGuS0eRSg2+2BsqhdpKk/JFCxCDaMqg7WNy+4O8OBa+bVvWRsiGuKKVt
         yqSQfyPwhkKChovclpbkS94C8kR2gec4vHJBFLYPnY1hesGKUiF/9GqJKsWtBDrK1l7x
         JkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801838; x=1759406638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szDFRfcAOIagM7X/ao50/k7Bh9AaFtQ8csdjE5QIm7I=;
        b=tapIcftnI+TUY6U+rN2aZHpQtz3hjCbBFFRygryVCYamWGa8eahWwC2rhz6uFTWOPU
         6H32dKoIuL9WhM6JQwlYjGWGyUJhmqryAA5nC8CGYoNJyhuC4pvvQuuMG2/9s4NivXoh
         n0jAlYG9RdaTDk0KqJiZui7cQK2/Ffq6aVheWWq1dyqRJ9njRrRalvueWTNaRBtHt2V1
         s8uTRckfVqEZQQB1rBe+ZNgvX8JHs0tsDCShPDcguij6/drWhHgWipbffUNMEKH049o1
         1EeJ5VOUYX+IsTnvxbfKSJKpYyzeWsN2+RuP0NdEvvr8xHDTO18aaeMXxW21j3a45IAJ
         kpVQ==
X-Gm-Message-State: AOJu0Ywej96TR3DcoPAUpfssvfv4+dSoFVnLJfwSFitcpoiymezdo5+Y
	jS2nW+ozsGAHgzTqNQR9D5Wm49TF72jhI0hFQ60mgvfQV46kGcuv9IKoz5GdxTSv
X-Gm-Gg: ASbGncsMWQ65ZLFV42cRU5ZZfO8S0v7ekdG5e2birc//FAjC9hiBswafcjiIuqDpsbi
	FitmpYxfJg4G9iF7UI3XeapmmpsqJNNcAcW/0IwYF4wvpK/PE3ic/xB0dR49WS3hE6ikU0v4zEz
	aDlTn+o5W69XYCXfoRUeQm/DSq99/OoQFcX23u7TOgTqA3BnPG7+4FBCg8a4hFS5oFrA6Wd48B1
	Bor8uiEaIMyJcsyl7xlV69cbBn4jKYqgZhCYi1/fPZPrEd7PuyilBVUQHyaBtKyVY83kOoUfXHR
	XgjQEjjmFRNXGFIpNGwZsLdU0+woijcRcdO4S4OY+rcSyF6/QnR1I2iVyMv/KhI+tT+XPCgB7mA
	YOqgOXxa0h9ejNNHkEdTh
X-Google-Smtp-Source: AGHT+IHW1oNefRC4m/njJ6IsbH0ICn1oBDIsx69Ot+Vb0rHA0h2HNFgkmvIAm4F3M6/e2Eb6XMb++Q==
X-Received: by 2002:a17:907:3fa9:b0:b2b:a56f:5424 with SMTP id a640c23a62f3a-b34b644af52mr343925866b.4.1758801837876;
        Thu, 25 Sep 2025 05:03:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 18/21] autossh: Correct the license information
Date: Thu, 25 Sep 2025 14:03:30 +0200
Message-ID: <20250925120334.1670367-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119878

From: Peter Kjellerstedt <pkj@axis.com>

Correct "startline=" to "beginline=" in LIC_FILES_CHKSUM so that the
correct lines from autossh.c and daemon.h are used. Also remove
autossh.spec from LIC_FILES_CHKSUM as it doesn't really contain any
license information.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 506b6c94119c431edb57ccb22456837734970516)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index 3dc304b23c..de7e2d3e01 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -2,9 +2,8 @@ DESCRIPTION = "autossh is a program to start a copy of ssh and monitor it, resta
 HOMEPAGE = "https://www.harding.motd.ca/autossh/"
 
 LICENSE = "BSD-1-Clause & BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://autossh.spec;md5=80a6701134723fd3420e733b46a0eb97 \
-                    file://autossh.c;md5=76c37acd40ac45050a4ced145b1e2707;startline=7;endline=23 \
-                    file://daemon.h;md5=6bbeaac616b9bc8de7b40049004f4289;startline=7;endline=39"
+LIC_FILES_CHKSUM = "file://autossh.c;beginline=7;endline=22;md5=9ae0c9b04856148d77984ef58536732b \
+                    file://daemon.h;beginline=7;endline=36;md5=839bb7bf781ff48da4a3fec2a62a1a47"
 
 SRC_URI = "https://www.harding.motd.ca/autossh/${BP}.tgz"
 SRC_URI[md5sum] = "2b804bc1bf6d2f2afaa526d02df7c0a2"

