Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABF9CCF2E7
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33753.1792414589023970287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o4vbfHVG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso1585877f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414587; x=1793019387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+pwcr+QBfzsgOcjTBthCRSliS5GussFMEVcutrS86U=;
        b=o4vbfHVG8x00NpleqZTbG+KZvrBE3Jv9UjWFTfQ8z2lscOg+1Jfo2CxrwPkY1/Cqu3
         MOXkHBExN7Z08R6Aj1LFPfUydwHQaQ345NL8h2JViVho2fJyQzYooQ7u7QrhuZT15DP2
         Fzithoi3SRpLKcIILz4TA50YRlW9t5eseNOGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414587; x=1793019387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+pwcr+QBfzsgOcjTBthCRSliS5GussFMEVcutrS86U=;
        b=wGZn4/fBK2Db5BrnbhFw+ZpheBkJntqNjPnQu780TSV6gGggbBh0A999qxzft3ojd+
         lPYKJq3OlT5LAb3FE9tp6oqpsbv20NcMUDH5TrK4l/rkkH7ZR0VhZugyecxsubVga0sj
         SqgAgD7LBEvVChiXepdQpUM5fbdM/WZPJMSdH1oRC2/ATwoCZZk1A/YQhYwESdkjyFxy
         LheMhDoRff4P3tDew5AlGfkKrukdIONgLTp0ZAWk9+kqaQuf6nB6oj4nxKcfjd1/jC83
         cOOpz4pyczhEXBQDgkPQ14J944ytHsTyFo/Ws8t/m1fjAWII/byW7loOuuCB3pulbtCD
         rK0A==
X-Gm-Message-State: AFq9FYKCxEDiDM+30P6ga80nO+nJAjR3iOrdSNBCFHoP6vLx9c4xSGbq
	2HMsoH8JpBwSI2MwPsnbtyQyM1Nu1REbKCcK87N6EN3eYWDvZLbwsJpxyIK5Y7tnUxUdQcgh+5D
	ICkJH
X-Gm-Gg: AYBFou2ABto6q1hfBkXBO11jlyLMC2F1tFU82EHp3Pry+k+/qDGX9lcAFkT1FfKWDFu
	wcmFnuggQG51EPs36lRC1Zqra7/YY2ygDr4nCTGi1uhI2WNbRmsRUZb0MdJTsuuL7Fw7dd1mEph
	dp1B6fZkjsbWcofHvqMFZVqDPRNjzm3cz4TxKtFYIRCSejpXqnqeMTbh63uJNAJtxBpw7d5y4IU
	p9kYf85KiE8724SA54AMrEGN2dFsek+pUOoIs7ATV7stsbaYVdTw40iypMijD164rJuEy48AbEE
	QuinJY3wSEs8TFtex4WDmVnTABMKXC2cdRGJd9Nd/Zq801gQdR+gJVMPHVFXw9VoHsgM3PIs3ml
	H5brqIdKhNYjePvYGfyaiUXafJdauuAD4acJez0809vWW78C2QEMpxaKHTnFybkRLe9WzgXq7Rh
	gRZNRvjSgrTdTt1W4/TOqHhul47fwFzekP59qP3sLxSWSkjzonrK9dQH8srK8mjCUBR7zl+KmKO
	UWA1SvjHlCM6Xn8W9CZGRE1pVljWXD2T+HZxBN5Cm8+KyEFnlmzp5HFyoMAQqjaxJsSkl6YERnv
	jwbpobpnu6V6qsmHwIy0Nys=
X-Received: by 2002:a05:6000:2f83:b0:48e:b8f:f7d9 with SMTP id ffacd0b85a97d-48e1419e06amr7323204f8f.6.1792414587358;
        Mon, 19 Oct 2026 05:56:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-cchardet: Upgrade 2.1.7 -> 2.4.0
Date: Mon, 19 Oct 2026 15:56:14 +0300
Message-ID: <20261019125616.3888504-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131123

Upgrade to release 2.4.0:

- Supports Python 3.15, including the free-threaded CPython 3.15
  build, with tests and wheels for Linux, macOS, and Windows.
- Publishes Windows ARM64 wheels, and builds Linux aarch64 wheels
  on native arm64 runners instead of under QEMU emulation.
- Tests every supported Python version on arm64 Linux and Windows
  in addition to x86-64.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cchardet_2.1.7.bb => python3-cchardet_2.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cchardet_2.1.7.bb => python3-cchardet_2.4.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
rename to meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
index b59c289c51..0aefe92942 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyYoshi/cChardet"
 LICENSE = "MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
-SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
+SRC_URI[sha256sum] = "7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.3


