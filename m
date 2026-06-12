Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D734ACD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73367.1781278467300013270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Tre6y0Wb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3e03939so9675965e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278466; x=1781883266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEuD61F6bgh8+R8Esw5QNLkY4eQo8LISVzDaiJZc3R8=;
        b=Tre6y0Wb2SuCAgSEL84opuUV3nLYCnVfxtAgrc1jIwWM7wTOPeA1/e8xb4MQyD+IOf
         WenuUe4Rxgnb7vaqMrvVnv/i89FmtyNJiypOIr90AvgQ+gBgehLvrLAifuy0AWRL0y3m
         vTboeOodcgzXJg1xOhTx05cRs2x6DrXphdsew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278466; x=1781883266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEuD61F6bgh8+R8Esw5QNLkY4eQo8LISVzDaiJZc3R8=;
        b=rvJlufVSYQCBcgR4oy2NeIw/QlHf6bJ0Clm2AaSSk9MeHSssGq74ahZspm+YjkvrRq
         bb5QjYYxAcnE1fZbY8YcPLJglp9fRMw6HNT0yiAFA35xetxf1AEdzTSmFJ29e23Ggn+d
         VzORIMdm2aozr3o5jRA8cdumyQ1sKVg3JUaaqexDZokztR/fY6NjfkmzYstNNP1H0pXC
         JmaGzLUntL5+6uG4Frc1Ihy76XEUluWv0rPv2MGSdY8GtPytVXvfgoxMNNPwzb/7cqx+
         9EQWk67uWnvpeANia5CdDKiObh1DlVNSpEo6U1QvawbStbrEeWELwnBMXrQlItwn+fKZ
         J4Iw==
X-Gm-Message-State: AOJu0YyK1x2VNSWUtc2sDRCuoyFk9bLDleglP0YkjGHV4z+Fo6h4tNti
	CggONKdQtfSDzF2nDzvO9ILlGdlv+B6unVFTr29nEY2VgfdakpQqmZEnewOM7HghuYwl5UCToUn
	4oHno
X-Gm-Gg: Acq92OE6mbY9eH32dRVh0vo2CsYR2WEzPibY8UCpOb/BTuNaY2pRJeku2tsxdKyKMNU
	3FFurj6GeI4A5EsWmdQJ0sU217vsiH3Eya/le4HUbv6zYBgqC9hPZSzTiCD0gxGFqalpQPkuvVJ
	S+W/g7vcDj1oJm5EALOMQm8E0GpOf88nBHtjaB9EMRMlY9XeY8rs9wTBzO9xlqb2kPDPLXMLi8f
	wx+vwL8m5iOJVZU+nQB2v9xA4htnug82uQUFXb6QN3Rxb2nZvAQ3VitbeKwIcV5mJHgftnHucuA
	SrFRwNxIZ5oeFQGKKJ5ASGDZ1821gPKU8AzJcbUnfBAyg6XmPzZX4p1NftxCeB3d9j8IW9nXQjA
	rs0PVLDA5UZQRf1cEqh6uKCd8neir7zHhnK01BoE2+gWYcnzqBItyojlyVzC0N1gNWWFfIM/H58
	CsPfv5srOpPShdQ5h3ppfXaKWI/NbfpioB16VO
X-Received: by 2002:a05:600c:138b:b0:490:5000:917 with SMTP id 5b1f17b1804b1-490ec480f21mr39519065e9.1.1781278465762;
        Fri, 12 Jun 2026 08:34:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/8] python3-dunamai: Add recipe
Date: Fri, 12 Jun 2026 18:34:02 +0300
Message-ID: <20260612153404.3213552-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127548

Add recipe for release 1.26.1:

- Fixed: The highest_tag argument was ignored in Version.from_any_vcs()
- Fixed: Compatibility with Pijul 1.0.0-beta.11

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-dunamai_1.26.1.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb b/meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb
new file mode 100644
index 0000000000..a94120c740
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Dynamic version generation"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=059eed55dbfd3fea022510ea62c95dc1"
+
+SRC_URI[sha256sum] = "3b46007bd65b00b4824ead0a1aee365fd22d0ec2b9c219497d4fd48f52860c8b"
+
+inherit pypi python_poetry_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


