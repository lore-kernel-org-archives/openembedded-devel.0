Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.3425.1618537498031827915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JFOvtMKG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537495; i=@fujitsu.com;
	bh=EHEBXpVgCWRcmVBVilZy+74RlqB/4WUaOMn5ny19jZk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JFOvtMKGzfdm8doP81KKSVmhA2f/hEXyyjxCv+fFQ7YWNLV736yxoeUrK9oe4cK6C
	 IlU8BM5pJMBUY2kIubEz02NBH5sLIqxCVGacC+eW2CeOKoTPVwcmFtwEwG87dEEZeG
	 jxtIdVL9Bo5INg5HTspEZN1XgY2mK1A8j3j8IObuOSLwVfwGnRk8XopcA539ptdIKy
	 wxjpuDlVP2hoD5bXfYktalwf7C3yOV9Vh1zWQMzRcUAsiCV+BvD7s9ffSI3/fdIj77
	 f/ZD0++BD6pL54cxG1s8ZaXRqfOrDuZ8rMjlLPQ8qZ2Uto0O8v/m+F7fOv1fjMMX3+
	 J7YJq5erxGUpA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 19/88-23163-71CE8706; Fri, 16 Apr 2021 01:44:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRoiv+piL
  B4NlBKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaO1qY2x4Bd7xdOJB9kaGGezdzFycggJzGaS
  +H8kr4uRC8g+zigxadMNZpAEm4CORMeLbhYQW0RAX2Lp7D1gcWEBD4kldw+B2SwCqhIfZ38Bs
  3kF3CTu9K4HGyohoCAx5eF7qLigxMmZT8DmMAtISBx88YIZokZRYvvOMywQdqXE9mlnGScw8s
  xC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhsa6ZroW5nqJVbpJeqmlusmpeSVFiUBJvcT
  yYr3iytzknBS9vNSSTYzAMEopZAvfwXjm9Qe9Q4ySHExKoryHVpQlCPEl5adUZiQWZ8QXleak
  Fh9ilOHgUJLgvfCqIkFIsCg1PbUiLTMHGNIwaQkOHiUR3g8vgdK8xQWJucWZ6RCpU4zhHG/WL
  lnEzPEWTLbduwsk28HkzAUHVzNzzAKT99sPAckHIFKIJS8/L1VKnPclyDYBkHEZpXlwy2Axe4
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8xkCk8mXklcDe9AjqXCejcilWlIOeWJCKkpBq
  Ytv+w5tS08DxoNW15ncNaQV2uVPldav3nLy//fFKIO+LgjR+PDptMa895N+fCr/ev/twxX7Vj
  nZpR/rsFR5YuMlZ/9jGYX2FdgLGJdLzScn3Vd1MbtfKuH534avJskbbzb28HqK11v6bv1yXbW
  p5Ruj9SeNHUgPAqew6ZG463Y7+zfRXctyftrpqh5tn7qQ3uKWuKk0V/66Wsj7u/9n33z7UJgd
  HnRfO/aD5gEpy1Vu/GwiszRSX+/2zevtj3h1vQ85tJ5/umTdp7IivDREvQZIe1c96k3fNj+uU
  TxILKF6WxWwh0My1Wsj96NNdpVX/I5L0hp2Q+ex8qXF6YmTubk7vu2xXr3v5zBxtXOOrtUmIp
  zkg01GIuKk4EAEclYyFUAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-238.messagelabs.com!1618537494!2548680!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2514 invoked from network); 16 Apr 2021 01:44:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:44:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1isP2020297
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 02:44:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:44:53 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.25.5 -> 1.25.6
Date: Fri, 16 Apr 2021 09:44:46 +0800
Message-ID: <1618537486-7512-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.25.5.bb => nbdkit_1.25.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.5.bb => nbdkit_1.25.6.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb
index a6070ccf8..067911b4e 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
 "
 
-SRCREV = "c828c6d48ff6b69454cad98054a1920d03c4b4c7"
+SRCREV = "023dac3e09a0e39d6f91dea4b7f8efb8f5faae36"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

