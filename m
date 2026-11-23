Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48537.1795411868942180875
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=agTtzPUt;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so8806997eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411868; x=1796016668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D16ySYZ+QZjHnZvWtyBJWfzhEtZdku8gVmecxR8OJP8=;
        b=agTtzPUteMrhvDsfb4G9lBzbudza1Iv1XYUUdW25ZPl1P/HiS3sEaXCtp5fB4IIGi3
         bHuh9Mk1mvma+SpfCLn8jaSVOIqWA7Mybads/L2O3Rf2r5y5Xst77ebyYTkO4ytEdSF1
         I+UHcASdZcVgvdOM6DS30j68XMUQpALhunN02XfHmbFIKE902ffRdgeFiUAS+AldiKQY
         wZ2/mc+hT5UvLL/amQQ6tAJidSlX6WiIcNQBpMvo2V/ILJ79X2Egzbh6lnkL7ZG8MQuF
         fR/82PfIJ6byHGXyk1AxwuRBxMVn1LJwtpYtnrn9yxjiBIdiwijrsliprHVv2igrBEfY
         nCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411868; x=1796016668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D16ySYZ+QZjHnZvWtyBJWfzhEtZdku8gVmecxR8OJP8=;
        b=fpX3+KTswMXm67YOqdgq2YesEzyYkVtJlTievww+1c/fGd0DQS05ZkZekpGZLJMlox
         SmVSWi8MhVYCLtgJ3l1zgP83eCTNtioSa1npXQ9iyIPHI2u2CpWCPORikSraGYdvnCI8
         HD37Smei40D7gHvBHqpyRtKqdn2dgfKfmk3j+0ht7RfYP8m4MQLetHYiojVzqnj8cf3s
         nKikGwX441Z3lRUz7j+F2WBjtTBgwYheI3VA2a2RPnl3tZRcPZuPL7h2ABGXkMZK8Yf4
         /l7bNJcgX685LqjKZ4QSD//iK6c5gkiSEWS8K79lUqNxnJzL3ucGVFpmZYsTwPewoeER
         t4fw==
X-Gm-Message-State: APuU4Z9nJim+vrrFNaMU68179TMNOjZwUm8YxFxqdQYMXKw7AZQNEg7z
	qmIg1m6wkk/Jp4W2Jo4EthPlYufjxh+uIXAdXq7mhxPO30Y5iiIdotX3C194GetG+hA=
X-Gm-Gg: AZFdTZd/SX/Jf3xKr/bKi6W2nSTOzjrWLVEeQLAD4kriRJ7nxakj/+KzF3d+hSpd9MK
	VyB7KLKqieXyInEFe7lGM8lPZP0g/1IKEAoYvtIKUliY0oo7h9zbKu/oQG0mWoLdLgdUgwiE93S
	R4hKZvAnuFqy752PZV52pxSqrqWqpAJfYqByH3xTKZGIOZNLFHQJ+ezDv+VtrcA8wkBLKtufKLF
	cusWvwXBnSbbaXnGtw5sBOhEWlgSWz8DmhKEBhIFZodPYikFaPsLECDQE2iY/7Y0JBnPSJgOvOA
	QaYfziJlqh6DnF9UWdyJfHkOgNf4fELGS6bRI6Bi08nT027nH2uykbCdWpp0UW3mR+qSP2m5xFX
	sG73BjM9PsP9kX2OPrrpp8x0KFw9EFi6zyWaa5Nxs7fD+eCOJfg5Tro51f7XZVNRalh5HwSfh/x
	Jz5x8g/C7K0N+P/RKPZUiqu2oL3qkpenAQ4ayppjrvIJLG86SfureL9Oq4Cte/ivT6VzzKPutMa
	ARuDXhj6m4OUrHaXpBVjPSgNlreSpAHgAVBqVCvkNGsbZFhbAJFTjf0IIqpgsP00POosoxYZlxr
	23e1oI20ZiHY6SR7wmJFaa8eBDmAPjGpEy1biTsqRPaJ+sch3nM8JjfL6O25aAiE7c2L2vwwmq0
	yvGZo86SFv+aljobATyNQSIXfwFo0Gvc5h+cGmM/xLdDRfIWqS/1m91rYui3YtcyoKR0CkXAAc8
	2fDZSh98cz1EGR8GGbrArUzuyOFVLXarucD3HX2e/RcEl4OlHGi50w6Kq8plfEg9UNHxmHKjKWK
	zYcCJSy8aDWfbSyt3XM3m03lHwAmpitKi1tNIcJyOpRyMHCYBv4auCc6J98C/ZTkxud82GrywzU
	1ThQ
X-Received: by 2002:a05:7301:df48:b0:386:a5d0:15d9 with SMTP id 5a478bee46e88-386a5d018c8mr4814775eec.37.1795411868251;
        Sun, 22 Nov 2026 21:31:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 31/42] qcbor: upgrade 1.6.1 -> 1.7.0
Date: Sun, 22 Nov 2026 21:29:15 -0800
Message-ID: <20261123052953.3658549-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132846
Content-Type: text/plain; charset="utf-8"

- Reworked build/install/packaging: CMake package files, pkg-config
  file, ABI/SOVERSION handling and new compile-time configuration
  scheme; maximum nesting raised to 35
- Many decoder fixes: GetItemsInMap() with >64 items or empty query,
  nested definite/indefinite arrays and maps, bignum/big float and
  decimal fraction decoding, incorrect recursion on bad input
- Reject uMinLen > 8 in QCBOREncode_EncodeHead(); UBSan fixes

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/qcbor/{qcbor_1.6.1.bb => qcbor_1.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.6.1.bb => qcbor_1.7.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.7.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.7.0.bb
index e16e9fc948..8314c0e757 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.7.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9abe2371333f4ab0e62402a486f308a5"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "930708bb86481e88879eb1d87fd4d664f1d69503"
+SRCREV = "7a2f7e66b3a61cf62444bf981a2c1efc0f5f6faa"
 
 
 inherit pkgconfig
