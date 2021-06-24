Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.1523.1624500064051347673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ucBBpIs0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500062; i=@fujitsu.com;
	bh=1Ysjk0BI8kLOnYfoNDhLcXBJXeK9L5xBPFI7+cKVi2E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ucBBpIs0Z8l/AMzjD+sTjobpoy6ZRqzTHiuaqonXzyAjmZTp+sC7cbELn+EA6WQWZ
	 iI2kt3+0+eY4p+DReb7v2C37sVGdqLYnHYriWxme5/FE1R2154/o+0m+ps0PPKhtcl
	 tRRLZinumbeaITuPbhr5k3FtZ+sWSY89W1viQ20y6hq+ZQFSPmPoy9119fKBJ11+5+
	 v+naYlGWayHPFr2sfquz+Pl6rR0TcnlpKp7Jvv4i9rcU5LpeGK7ezO2FABTTqRAfZI
	 W2zzDQq4JwGY2UAExOvq+rR8fiC/g6FavKbNqXJAotE6lLDCL/YNpztIVoei7BZ00E
	 IBk4FdFYN9eHw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 86/B4-39611-D57E3D06; Thu, 24 Jun 2021 02:01:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0Y19fjn
  B4MV6TYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPj9C72gufsFdNPnmZvYGxh72Lk4hASmM0k
  0Xt3BSOEs4dR4kvTXpYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBewk2iaANHBysAioSpw58
  owNxOYV8JB4+WgPWL2EgILElIfvmSHighInZz4Bm8ksICFx8MULoDgHUI2ixOzp8hDlFRIzZm
  xjm8DIMwtJxywkHQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6poa6iVW6SbqpZbqJqfmlRQ
  lAiX1EsuL9Yorc5NzUvTyUks2MQLDKKWQ0XgH48HXH/QOMUpyMCmJ8pa2X04Q4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMEr8QwoJ1iUmp5akZaZAwxpmLQEB4+SCK/lE6A0b3FBYm5xZjpE6hSjo
  pQ47+OnQAkBkERGaR5cGyyOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5m0DmcKTmVcCN/
  0V0GImoMUKvy+CLC5JREhJNTAtK/WNDv+o7uv3NfqC0rK2jKch57dtWJMQwv/vcG3IL9E1lyd
  U/38/ddXtbIOvrX8WprFNYdb8dbZv855HhWcyPi5gil6ofPTN75fM6zdYpd5n6nD6XZrG7yG2
  Iff8faPP2UGihvLizKrK3EVpeQ8PrVztqvlPtrmjrFiZM8R1Mov6zirVS8GWn23WtJr4f/v3J
  4eDUVnOSaxvg57TxalLv57iXt9yYvNMJqUCk9w3lueyn0TGSnyW+zIj7tEl5Z6umANrFTrT9N
  7XuHlJrXPos2DrOBL33azm2+cEI+s58bd46xu/WiYt7uituPsmkpktMVTNfuNatmDlrTW+rgd
  9VGL1b8sn9T7RmfisQImlOCPRUIu5qDgRAMFXuBseAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-228.messagelabs.com!1624500061!68567!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15221 invoked from network); 24 Jun 2021 02:01:01 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:01:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O210iv020295
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:01:00 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:00:59 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.38.0 -> 1.38.1
Date: Thu, 24 Jun 2021 10:00:52 +0800
Message-ID: <1624500052-82464-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.38.0.bb => grpc_1.38.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.38.0.bb => grpc_1.38.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
index 2095d81d4a..10004b2369 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "54dc182082db941aa67c7c3f93ad858c99a16d7d"
+SRCREV_grpc = "96b73272eadc01afb5fb45b92b408c47e4387274"
 BRANCH = "v1.38.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
-- 
2.25.1

