Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584EACAC5BB
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9940.1758801834371409223
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtQKRLsK;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7322da8so171993066b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801833; x=1759406633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOmoyxf3zLqza7ShIz7ub6ZLMWOfdaaeV7c3ZOPqMCI=;
        b=CtQKRLsKaPh1OhLQTUf2IUHsBdrFXoEiZi6Oa7GN+6/JCaV6Ivs3agmG2lbTf2XNEY
         Ta/T/IPf4VsvFRssEkkOixc+H0+NynGcb8vpO8irf++tQA2lX2S1cM6UnbKJU2dZhq2t
         tcLAxeDJMAUt/XHgCcm6oYXzStVvix6gYhKT91SPsGelV3HnNn0+7NgaSx5fsQnO14cB
         a+uW+QScXnoX753FLm4WG8ngPxbe43HCgIScDfvgk9QjdX+fI05sQikPNCHMkxBC+ApX
         A1/KF/fNGh4w/nqVw2OjMo6eBJ6RUhsg9+8LOXLEFaU0nkWB9RvfhWOjkg94EvbKK70d
         +D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801833; x=1759406633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOmoyxf3zLqza7ShIz7ub6ZLMWOfdaaeV7c3ZOPqMCI=;
        b=q3JmLc5ELXvphXUSlFKAcrm+kdqmLS1noZ9zW5ZhOKEucgDo00GBU+4PB3Z6VEeNXG
         jmXIbAQblUPULHzQRI6L1LEDOACr7nv+r51iFkR6/s+wh+AdWvTYDCUXramAMD8aQNSt
         1H/z1CufO4RXIAIi1pxrHgL3IUlfCTM+UQ9jvuUR0vaZRGxtA05+vdId67jsnkSBMWEW
         8xBuvvl6BhqHH8v+c6i2TzM8+9z0Ys1GGv0n/KAtby5VSB4riUT547YdcGv9hE09Ap7n
         jetcgn5Li/y7VpfBlZ93J2NrvIvaQa5vuHDKFYf5X5+md+1HxhhFgUU9h2wjilyo4JQ6
         n8rQ==
X-Gm-Message-State: AOJu0YzK8Ot9mIeqJmKDyx777VTRw1M+0aB34YoEm/LgtRQPEgTwQHAY
	dCSnsZ2wnSIkp5omby9gUThrsmSL3nUsw/GAXTqwUDPLbn3MJao4+sL1RUNS8C3T
X-Gm-Gg: ASbGncvfucFX38O+ZgyyZfl+fzfrU+EQQYlffPkCDc45tJNHWiZDU3Po4nmxWIbqSls
	jyba3m7p9PeOthgPs+O7TSmTUtX+MUjfsVWV5Pp9diNEwGNPf5w3nbLJIuGyko2iQoxw1bWeZxg
	h1Ve2fbbpmtDnWBwFGPOjyZAgJhcqL/z3z6GsyFGDOu7jkWNRxFJs6/NtLWWnxF61RQWECu0ig1
	SIMULRXy5vx2847wh7y4OhrdeNdtcOKkZPLYUODOTo0fcn6FXj5vokbtzqAiQBoHRaStscoX+kW
	MbfHDskTuJyZsXl7Yvtb94kjAsSbGY+YeKWD3FbAJXZ+Rp9HcrQ5LZq1y7L2Um1CT3lF8vNJnzB
	g/3lIW5enY90pGprsSUeu
X-Google-Smtp-Source: AGHT+IF/MmvPM0kPMItoVEbiNJoev8SAdJeOwjMotjOfEmLMeS2xyy1Rf29OCzIpz5dpVL1n/+WFsg==
X-Received: by 2002:a17:906:fd84:b0:b04:274a:fc87 with SMTP id a640c23a62f3a-b34b91a1ef7mr367391966b.4.1758801832584;
        Thu, 25 Sep 2025 05:03:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 11/21] libdc1394: upgrade 2.2.6 -> 2.2.7
Date: Thu, 25 Sep 2025 14:03:23 +0200
Message-ID: <20250925120334.1670367-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119871

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5914277f9091dd38a9f891a553ed40df888fe552)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb} (84%)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
similarity index 84%
rename from meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
rename to meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
index 952ba603ba..8cac780d64 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
@@ -14,8 +14,7 @@ DEPENDS += "libusb1 libraw1394 libsdl \
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://install_examples.patch \
           "
-SRC_URI[md5sum] = "9fad67bbff08fe2818d5ec81802ec89f"
-SRC_URI[sha256sum] = "2b905fc9aa4eec6bdcf6a2ae5f5ba021232739f5be047dec8fe8dd6049c10fed"
+SRC_URI[sha256sum] = "537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f"
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"

