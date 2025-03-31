Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE3CC36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3930.1743454889306172847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YD7FSB6x;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25d2b2354so783444366b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454888; x=1744059688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWbLZ/0V9ZMQHoYKbMH+ntdaNQ2d0bc9g8/V+jf5zaU=;
        b=YD7FSB6x3/qezOWSc1p2nhD8kD2sK7/sdk4ZS3dnHQ6OZAdadieoy5Oe0pIX58iTXd
         HaDTgXlBKwN7jN3P5n6M0kCVcIAbIBGt5K2ZMjqqAIj6NJ/lmbac9uL6DSixiPU6GZW7
         pn3eBr4caxcfji6XNF96zIPoWWwApRdaM57ApEF/f+lQc+L03wdeReRfNfr2N6+/r58l
         c+s11ExJqlbMrOeSz5N0mITT6TI6ozv7j9dP5bDG4oam9624KSkupDf1qbfE9NffuHl9
         sDLKspbZuYvfuC4FDn+b861+tdS4KVGw9p6KyJT/q2INEDJWIuTOVjuSEtAddTEZc52q
         i45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454888; x=1744059688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWbLZ/0V9ZMQHoYKbMH+ntdaNQ2d0bc9g8/V+jf5zaU=;
        b=f+lcE9hP5jtIJi75AoEGfxHcoQQMdnjlTHJp5EJ20nf9IiYX62/2N34p8iGM8ekQp6
         Y6OFdIT3iRCEkzpuCHJ3VvV4XSqZ/zkfhmqh0aF+/BW8qws5sVSsxFGwf4XY+3tkFylQ
         C0TJo1X6WgZR6nKKS1XYGiB0N2+P3sNU9Mb5PIpq1xWqCtoByHm7vYoberLxI7REo6BX
         a6jRLxvnGAlLOUTgJP2xsKlZNTLIMxyTQ0b/lVpemFcfp40yc6jApLEPXm5tJ9cAyb8k
         DWspXfUP1QTFWEIypmMtisJanc3hZ0WmgNW8raUbN+xaHGS4v9Y4xB8yhGgSiysvK6Dm
         +jRw==
X-Gm-Message-State: AOJu0YznzHO/h9kBBwrshzVeCs3BCKmtcU4DRoXQrKGs7BD2Ap/Wfbm8
	22yuGC/19g6kZ7D80Xkmd7kJvjVubfJbTv4fxY9bGp8XNZixDP+ggiRsKf1v
X-Gm-Gg: ASbGncvxF7cBqVixtHqHRfyNTCKL4iyNoKuke5a/zShASRVY3UiT+8jyQFhP6Fs4WDd
	PrFRNSsN1rwbu7Y07zOBl7iagPBrT8pbPpr6Vo6LOqrsLfpI3R5WMdPRQ4Dw4fyZIwRv6dQ87k+
	Ue/47qNjvZbdHc42wHddIp1A9UpBk6+8/WghK9bIkEFjG00JqXlh2/etiX+uz+iln+DaPBV5pa/
	RwLH/akbFTxnJ9sZpovZyU63hxwIYyrnm/LiRw/bfTkg0Qz1CwqlS8XKSVpAdABzZwGesgfa7CG
	fCJYLGSN2fn6pUYSjKEtxLXrqt2tWEx+9GuOjarQR1U08dYSbuzp0GyiEISDr3s2YvmDRkSsPKA
	f8A==
X-Google-Smtp-Source: AGHT+IH0WJA4b0hF8Nwk7xZaCYedSdEXwK9abIY1xJtAs1VkpcwAScijYFWBrbOf9AVf5WyanwFlKA==
X-Received: by 2002:a17:907:da4:b0:ac7:1350:e878 with SMTP id a640c23a62f3a-ac738bc0a0dmr803468866b.46.1743454887524;
        Mon, 31 Mar 2025 14:01:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac719220358sm668987466b.36.2025.03.31.14.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:27 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 15/21] nana: Fix buildpaths warning.
Date: Mon, 31 Mar 2025 23:00:55 +0200
Message-ID: <20250331210101.3460858-15-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116451

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: nana-2.5+git-r0 do_package_qa: QA Issue: File /usr/bin/nana-c++lg in package nana contains reference to TMPDIR
File /usr/bin/nana-clg in package nana contains reference to TMPDIR
File /usr/bin/nana in package nana contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/nana/nana_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-extended/nana/nana_git.bb
index 7c748bc49b..d292bb8827 100644
--- a/meta-oe/recipes-extended/nana/nana_git.bb
+++ b/meta-oe/recipes-extended/nana/nana_git.bb
@@ -42,3 +42,9 @@ do_configure:prepend:class-nativesdk() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana-c++lg
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana-clg
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana
+}

