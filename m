Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B843CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.7970.1759409986227354509
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NI8KWboo;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so1740242a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409984; x=1760014784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyHxt0nwy6JYROADTaD/AJRF5Ij8hLK1yRBTT0khH8k=;
        b=NI8KWboo04MXDhw7F4F1yNkGKwFglB7wFyGZ0h8stRUD93btammn762eLGDDeSuQ8R
         px8YYyx1u0tt2h4npb6FfLBsZrKm3Igco4pHuuEBYTylUBICfviYycYEVOUqaEJASIKd
         o640HjWiJ9gThkYnQL8oUbPZyYUT4a8MRJHpQsWCh2nOH6OZe/3GW5JtZtUdMgVzKeXn
         bQnMx7lh/CD3zCDvq4yFfZ8L1CsfGxibxSw2tAfVfhosTdnsPdi4oHVsOtiRPWzP/NdE
         dhwFf/f+8aB7DrSmMlBD0MGTz1Rwa230c/C26S9Fo5xMcJz97UajszY33/s0MBPZ1C/Q
         ePGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409984; x=1760014784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyHxt0nwy6JYROADTaD/AJRF5Ij8hLK1yRBTT0khH8k=;
        b=Zez6jePwWxY/PNLC/7guvQgw10VtXSijBw9DV0dVvkq9IGEdHKjOxW5UzHSfavY8zP
         NPRappa4EKPYwVWFoG/UE1J2/ujbv9qpVjBW4nVv1K1aVFqc7K5Stii9oO9k3LFOvvBu
         AwfpV2W1q8AJDbfW+yl3yDytU/H9wf49EOpDmOp4abzlb0xBb9vWOzYugKaC5Y28CfZu
         T3iZpkWg5tIwrotpGTfc8h5lZyxB4fnPHwCTMRJe0ZgUu1PVoOY0FMP+jcw74jqeGtFU
         0Q6tSdAWqfOuGGrx5seuAJ/syoCVxC15kSy772Vm1rEFQrprZmbckkkjK98j8HdDKFw3
         DmcQ==
X-Gm-Message-State: AOJu0YzIgNp4FWlWAUYKpAA8on9EIeGwOarTY4CXlk7Ztr3MT/MwMHYv
	0TmNSNZnFGHuANh+Y4+QfT3axqQ0DszVgA4GpqaViIk9oMsy7Qbg9jGjWUWghw==
X-Gm-Gg: ASbGncv9dSWvs6DQtHFDPcmeNZ8mdUQ/LPPkZ4j1JMLifkOfi68JDcHQBrRntM+T0gL
	+3HwkUx87Jh5EE+aTLHL+OUNRh/EVBcnD3NQOpyMcjGsg+FchsyszvRcsCKs+QoRPXYA7eapBl+
	P7CV1EPLDqCX/3TAXus5tmWVgrCNT9tHR3M6n+cuwYLNaZB1bDreZ0fLoTX9egVCXcVF5drloq6
	+WqB6tSyc99SePV58wO9eHNM1VlMMyeoIIk4NMdi2MLgw+/9hbP+yBmSNhjsXZeNayiS/DhtmPu
	emQts0OdH4DhkTiyvgyNFJA3FotPqni9bk53ydbO3Vtt3rp+s47CpPcY//X+K/8pE9yri8l5Nin
	CcKUKvHmLb93keYLA9gIQTqFG+7Vyx+XWouDSHyrn+9OZunYqSIqvoEwZucTXGSHH1Q==
X-Google-Smtp-Source: AGHT+IHFjN/yiLy4RwDugl/hbc9v4hzDTH2r+LcwH6z1F4153+yM8bSwr/CUeoN9CN7mcfWxw0e2Dg==
X-Received: by 2002:a17:907:9494:b0:b3e:c99b:c78a with SMTP id a640c23a62f3a-b46eafcc2d1mr967933666b.54.1759409984420;
        Thu, 02 Oct 2025 05:59:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 23/26] python3-thrift: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:23 +0200
Message-ID: <20251002125926.2624522-24-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120192

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e015b0e996aa0e442cc4e64a4ff21ae717f0ee24)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
index 6eb896d1d2..f720537e70 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
@@ -11,6 +11,7 @@ PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-scons \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \

