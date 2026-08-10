Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66542C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:16:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27339.1786360612944930689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ngiI1HlU;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12391275e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786360611; x=1786965411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp8kzwt7GjS7LtF9aItnKPa7qUDd1LB/y18n2Y2Xwq0=;
        b=ngiI1HlU2n8ZXNR/HvYCNx0vW28BYUjZzgdUR3JcCGFEEjzn35SNY2YGcLwX5QN+J8
         L8Yt5fuE3M4mISeqCjR226f3fKF84PGhogKqJusUvIU4rXc+NuyMyAzvHsC/JaUT4bO4
         2AlR80aAF7sZpuejZtSg98dLJ5wWtlH3VPYUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360611; x=1786965411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp8kzwt7GjS7LtF9aItnKPa7qUDd1LB/y18n2Y2Xwq0=;
        b=kA6mTpWULFe6hE8ETMSdk9VnwvqABd88WWiKUFOouyWh56hYYsjJBTcnE8jssdEVs7
         UZi+/5qYYTJnu3kC8Zvid71I+xi8idMwYU4MqHH42Hmarg2NPJeQzqVQ0/kEYOkyMRp5
         MxSKhYp+2fc0YH37i6sVmzpp3pxm91jJUlogM/dd44o0g4WIZIwhZutRJZVexHbr7cjb
         ZKpLFRRX0dMX+4LIbUyLAco2RRrUyZUmHJmHJRLCRxT/rcHF58SHd7NYOjNizyG/mTHN
         fZtUxRkGThnbdHGMKETpSF2sArz3qyfVgl338Lve1cuLBP8Z/QnG0WE61LtikoJz3Ibl
         Trig==
X-Gm-Message-State: AOJu0Yyi4GDQwVR9Dw/mlAArqkZkdE0mB4XglQVp/x2mljhZ+/aQXvpO
	FuaWcZHkzvaE4352Iu6abIgo1YEI/guUkbM1ezaCN0h1Tc97kCd5h9x9BmNMlgUyAVPomJSsFje
	YBy8q
X-Gm-Gg: AR+sD1154ncr3MxYE4kzC2f5Bai+PXxXfc8vSygT4m5nFcnVtf+Qe91zkYSVSFfharz
	4COFYNXeAfL16j8OaZH+EMptWHC0cxZTPAjWPyESUWCPdxYa0ilJ56jiioOCN5eqZsmZc8VYVtT
	H8nkF4/WV7J7essbf1XFH4cvmHH2cC6vlahHa5WhLlMqRbz/xlYTJmPBlvS6BcoBVGQSWuy5Q4l
	hO5JGSTMCT/3Zvi8DWaMSHfSVKxuiPVHJot/RTAORBxTgxZyarwTsDpmWNQKwSZP2OPJvhQtDHk
	ulS6BjGzbcyp4vv13FShpyI4Tq7PY/9FsPRZNvJLTFpEBVIlKgsMbfG7bxHtZD7GidBDMMcB87f
	KvEBvLhC3+geb229v219F/RpxiEmxUAIxg6sNJK6Jiy9c9fr7KdaUBKCsFWnDvStlkBSrJ9utiz
	/j6aKQLsUge3ediKTREoAZT96eFgiFJfuSm86mwwoIvuOre5+yPXUWa8ufVg2+auSsd6ap67z9M
	CCkFGPIGEEdkKmYsN426CzSBENxHwsmofjECV8WqXLs3utRX6yOgaXWdkdpP4gefpEENVYGcJCD
	JXjwCKfU522Qdw==
X-Received: by 2002:a05:600c:4f8c:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-499726d57c9mr13075195e9.0.1786360611212;
        Mon, 10 Aug 2026 04:16:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220727bsm35271853f8f.33.2026.08.10.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:16:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 3/3] ramspeed-smp: Upgrade LICENSE syntax
Date: Mon, 10 Aug 2026 14:16:45 +0300
Message-ID: <20260810111645.1136923-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810111645.1136923-1-leon.anavi@konsulko.com>
References: <20260810111645.1136923-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 11:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128880

Upgrade LICENSE syntax. Fixes:

WARNING: ramspeed-smp: LICENSE is using an old syntax and should be
upgraded to: "LicenseRef-Alasir"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb b/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
index 8a1d9468ca..1e55bcf87e 100644
--- a/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
+++ b/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "RAMspeed/SMP cache and memory benchmarking tool"
 DESCRIPTION = "RAMspeed/SMP measures cache and memory bandwidth on multiprocessor systems."
 HOMEPAGE = "https://github.com/cruvolo/ramspeed-smp"
-LICENSE = "Alasir"
+LICENSE = "LicenseRef-Alasir"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=92cffec6695a20eab8d0e4770f4e9353"
 
 SRC_URI = "git://github.com/cruvolo/ramspeed-smp.git;protocol=https;branch=master"
@@ -16,4 +16,4 @@ do_compile() {
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ramsmp ${D}${bindir}/ramsmp
-}
\ No newline at end of file
+}
-- 
2.47.3


