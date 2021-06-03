Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web08.5702.1622714357489144975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M1ODzlS9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714355; i=@fujitsu.com;
	bh=6+4NfSvfOeHpMXEGM00gz/4zkAUFblkhZ3paZbxJqG4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=M1ODzlS9urzDo0pr8jHRYkoPInZ53DtKx9dES0r7rSBjDb4MO6QhR1+HDhxOZf/sc
	 u1Y3IiWC3BMFrv3HGiFRPxAPYVnvb3m5VKHidqpemEJKq9Iq+FYmXdaHoioDzKGWEC
	 cL0kdX9ra51qBfmSumKgTwNWjheiD7rLjiwwpnF1LUETaZd6dH3Vs8BRAeH+X/AbR+
	 esImiUdJz5O9in4wQpYADtuf4Mtr+pRaFco3NfH75aqZztNM2w0+Qc+GqSXp/Y9+ul
	 qeYhokdRbaYAfW/0enNm0jcKaBma6ZAGkRKrxqAnH0YXA0B2KkQqr4SyumGyqlel77
	 +rS+UdoMYK9+g==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id F3/5D-55921-3F7A8B06; Thu, 03 Jun 2021 09:59:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxRffT8h0
  JBg+/G1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlfrrczF/RwVdz/ntHA2M/ZxcjFISQwi0ni
  3Y3NzBDObkaJhctes3YxcnKwCehKnHu8lh3EFhHQl1g6ew8ziC0s4CjR0d0LZrMIqEjMnXiHE
  cTmFXCXuPXrCRuILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkJgxYx
  vbBEaeWUg6ZiHpWMDItIrRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0kzXyNBYL7FKN0kvtVS3PLW
  4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwiFIKjlzdwdj95oPeIUZJDiYlUd477TsShPiS8lMqMxKL
  M+KLSnNSiw8xynBwKEnwWi4DygkWpaanVqRl5gADGiYtwcGjJMI7ZTFQmre4IDG3ODMdInWK0
  Ztj5+nFi5g5nq1dAiQ3zFsKJP/fvQsk+xccXM3McbP90GpmIZa8/LxUKXHeKpANAiAjMkrz4B
  bAIvMSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeL5ApPJl5JXB3vAI6kQnoRAGvbSAnliQ
  ipKQamPYx8VV2TjDLsF7NUxKwerF6ZfGaH0rxbov+mp/9dPfc8Qvi5iaMry70zJgTmq39e7Lu
  SuuXJunzGaxWTruQ8/J4Xnlijff3eNH42T9r/y1Z9sAtfF5jyNK0NIMDV9Zt2cc09/ctHeGMs
  6GTrmcKrawqXf10+1e/Uzcju/o/Ct8xDmlPzjixstTUWDBkx/4j7duNV1iHdzW0vfhlPvl/6Z
  THMQ9Vk/Ku9Oea/pa/9nt73aVPljP97776JPDHvEB4+4ePu+9e9+0r52W98vW1mvjGBwGRs46
  w+Ks77PjpfyzjxOWQj5saQs/YvEu7Hvn4299LLJdPb1wqMzk5/Onp5B+pq2V33pjDqSJfFBvV
  Mf+dEktxRqKhFnNRcSIADf568EcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-287.messagelabs.com!1622714354!290135!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28084 invoked from network); 3 Jun 2021 09:59:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:59:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539xEGv030317
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 10:59:14 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:59:13 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] memtester: upgrade 4.5.0 -> 4.5.1
Date: Fri, 4 Jun 2021 02:59:04 +0800
Message-ID: <1622746744-4482-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../memtester/{memtester_4.5.0.bb => memtester_4.5.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/memtester/{memtester_4.5.0.bb => memtester_4.5.1.bb} (82%)

diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb
similarity index 82%
rename from meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb
rename to meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb
index 1a041101bd..1628a0519b 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
            file://Makefile.patch \
            "
-SRC_URI[md5sum] = "674a8a88ff54bdb229ca4148218a41f1"
-SRC_URI[sha256sum] = "8ed52b0d06d4aeb61954994146e2a5b2d20448a8f3ce3ee995120e6dbde2ae37"
+SRC_URI[md5sum] = "1bc22c01e987d6a67fac39dc5656a4d3"
+SRC_URI[sha256sum] = "1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-- 
2.25.1

