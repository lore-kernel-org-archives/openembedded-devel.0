Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2FDC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:49 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2353.1787029361784416256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XA/O0PwG;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so4519018b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029361; x=1787634161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebAV05wmODUQZ5K4e6OW9Vq1GuJy+7fn4A6gHuD0qDA=;
        b=XA/O0PwGORNS0X2oSpSDoZMDseSN8EaTj5nlr7NCUef1ZK62j4kWsEE/hDalzvgRsk
         HjR2CGRYTm6iKwANSVYMZd1M7NWu3Lt+87FdxbJZHj6VadzFLtKulFiL0C+S8+EZAA1m
         VULiuTqF62r8qyykr5Hb2sZft9iHJrHLqRmAvYQF8FxXATPFM3Sr+V9FhNsrlhEhESMx
         BQWz6w5ZsJ7dH4MCExs2v3yVaHXx7kLFXiZxn8HVe5zBcYzbOmkVqV3m3uIzbsH5v9Ix
         stoNjWVY71wxqUoViI43GDg+J/UwycWdE9dk+nFma55mnCG+9s4PSNlyJQn+ZXetPeTZ
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029361; x=1787634161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebAV05wmODUQZ5K4e6OW9Vq1GuJy+7fn4A6gHuD0qDA=;
        b=eoWAZ6Py64LcWOah/5tfucMAI6ovMaotifYC5FshxvIfD5ic4L50hc9yUrvzo+kgOl
         4FqDwU18EhoP5XZwo6LsNLhO1cUnfXWv9tqqCLkXcfHWqJr6ato4+HiVl65Y2oVgEcHn
         JEnDxOFrW4TWOoMI6VDVFssK3muMWfi5wnOE+hAPkjBARWUvW+KHeJHnu4sMB32PUGtw
         5LEjE3H6W2EaYzJSQ9+RrE492FURCuYmaGfBKo3FIv6TWtgj3T9Uihn/SOhSy5FeG5d+
         kyNT3wUmYbPfxnyiU0c3bVMhVXKLMndTllgGvYd96VcTjhkGGsVtPaddbGclXGYqsWU9
         LIfA==
X-Gm-Message-State: AOJu0YxVi//Pi8skbS4AAz5AADXPXd9qZZ55t4wQiYdToPgb/VT8Flx6
	Vdx3n5FGv+4zMEEDAaT0InqJnlqQ3FvCwdF9SAvAyXOjofW6Xc+yRVw5cOah8wdR
X-Gm-Gg: AR+sD12CQhyiqMOPhjaNN9Hk3wr0lz98MQARgjakk5nJLJhafcNxaNHi8v0AW39FtXr
	zxCl+R3Fr9a3gTMInLGdLk4v5eP1TCDCYBWrNCmuqELHLh5dCOMbMTLniF21aJv2t1801KvrXBd
	TVs3QkdBGowzFXM7oBaSjnnScZW5BV5ZsUmlKsYf1YKV7dV35HKAnAxcy58Fs0tQACuURDwvnvJ
	RoVCdF3BNVEcQqCKpzYLeAuYvh7Eq8zPTpyPaeSeBMSFiD1ss4gh9KAbgrxo/iqMBfuTTV/saaw
	3AagxFCd+kEvXfH3Amr61u6kYMPaM6Pu3xuwW0K8GDJhxhWe18m9Tl7B0YCfIeLUlj6P0wbQfo7
	rBKwcB4ks99I2w06W7ZniKM5F3q3SgI0KQgllRn5BxNpe8QZc2sxR1Wjg66XzfNdy9uyMrTx0tV
	l7PJGBIy6dZM8Z4VtRqOjOwE50Ss8krJiHcQ4S3XapuE5sdolnPghaFzOSXTumk/d5Xyuw7uPX+
	QUkFsTw3SF3IQ==
X-Received: by 2002:a05:6a21:62c7:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3ccda918634mr7550872637.5.1787029361065;
        Mon, 17 Aug 2026 22:02:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 23/27] open62541: add UPSTREAM_CHECK variables and include tag in the SRC_URI
Date: Tue, 18 Aug 2026 17:01:18 +1200
Message-ID: <20260818050123.2901739-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129222

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version open62541
...
INFO: Current version: 1.5.6
INFO: Latest version: 256

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
index adb500c954..8126132773 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
@@ -14,12 +14,13 @@ SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"
 
 SRC_URI = " \
-    git://github.com/open62541/open62541.git;name=opcua;branch=1.5;protocol=https \
+    git://github.com/open62541/open62541.git;name=opcua;branch=1.5;protocol=https;tag=v${PV} \
     git://github.com/troglobit/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mdnsd \
     git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=latest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/ua-nodeset \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mqtt-c \
 "
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake python3native
 

