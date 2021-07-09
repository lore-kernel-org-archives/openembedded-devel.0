Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.5292.1625794272701851394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KQEEqQBI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794270; i=@fujitsu.com;
	bh=XzgQZfHcGRR3amZgZ+kn5yxsMd/K1MtQZr1SE3N/rMg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KQEEqQBI6HsNNGRW6pKswyHYvqdp57s++edC3jMUMbL7SGHtlSdXA/lcKNcP/NReP
	 7kfcoECpdg4t8Q2yMelbE/9dvRNYG0/UcB66oQBJWNEs4yBwJMKLzElKoPCxrGoSls
	 4MCwK1DuGZou2srxaOSOZSNeElkepX5JvXKg3ViILaXYuX31pqMOangfMg4OwEFxnL
	 CI9hUu4+C5NRSpUIkymfM7jc9d3VCJSlN45NM53bZffDIFfhlOeQgLj5MZ2veJ5NS3
	 u2CRj2octjXNsZbf5dpdCtBMT2KPncswuvaAeV/KSCLW5LsZDF6N0D1M6dnmeG0Ubf
	 P5m0TcuUGAoSw==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id EE/71-07274-ED6A7E06; Fri, 09 Jul 2021 01:31:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0b237Hm
  CwamPTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bS1U/ZCu5xVhxp2svWwPiLo4uRi0NIYBaT
  xPeNnYwQzm5Gia8TFrB0MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAv8fjccTYQm0VAReLao
  uVgNq+Ap8TND3MYQWwJAQWJKQ/fM0PEBSVOznwCNpNZQELi4IsXQHEOoBpFidnT5SHKKyRmzN
  jGNoGRZxaSjllIOhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tDTSNTIw0Uus0k3USy3VLU8
  tLtE11EssL9YrrsxNzknRy0st2cQIDKOUggNndjCeev1B7xCjJAeTkiiv1oznCUJ8SfkplRmJ
  xRnxRaU5qcWHGGU4OJQkeI8sAcoJFqWmp1akZeYAQxomLcHBoyTCy7kIKM1bXJCYW5yZDpE6x
  agoJc6ruRQoIQCSyCjNg2uDxdElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK810Gm8GTmlc
  BNfwW0mAloMcPhpyCLSxIRUlINTMu7Mz1dWQplKzbvZZpmV/2ukK9Z5vi0RK//7c8f7C5YqPB
  pea9Rrfm5+UaFTBy2uUwrJv6IDHTab6Ho7NGkdTj5W1rogZzHF50XO3JKGYlXBXj87/1yL2/P
  RzMBBjbvCzuzZJrnfzwXfvyb27Lkb6tsPm8+qbzPegbffP+Sji5h5tl8/3Pm7rjk5fbhmtVPh
  bb8J07VLY5hq46FFef053XdWefJs/FlfODmZT3vdXRtrrBnFrjxXxd6/PTA5tvGZXKKa21/On
  szGdyb7deZ56F82OyNSXyF7oJ2pS9/las8W5kfHVmb1m1ziqNeWGmb3byP0ffbXt44FPHvg8e
  Xl602voKdwcw7l5w/EHFCiaU4I9FQi7moOBEAVGMFDB4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-265.messagelabs.com!1625794269!78316!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14531 invoked from network); 9 Jul 2021 01:31:10 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:31:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691V97w016483
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:31:09 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:31:07 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2021.4.4 -> 2021.7.6
Date: Fri, 9 Jul 2021 09:31:04 +0800
Message-ID: <1625794264-102867-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import regex.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-regex_2021.4.4.bb => python3-regex_2021.7.6.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.4.4.bb => python3-regex_2021.7.6.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb b/meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb
index 177b06b97c..458236d557 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb"
+SRC_URI[sha256sum] = "8394e266005f2d8c6f0bc6780001f7afa3ef81a7a2111fa35058ded6fce79e4d"
+
+RDEPENDS_${PN} += " \
+	python3-stringold \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

