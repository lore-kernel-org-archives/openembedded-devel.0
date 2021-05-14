Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web12.3604.1620958375933744166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qiPLYbyo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958374; i=@fujitsu.com;
	bh=OzH7qeFU1rYojL27rBACW0H7Ga2pqTbPGD7CbS3/Yb0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qiPLYbyosgRxcWP0cvnXwaT1hpQE/JY1N1OeP+8bo+tYER1vyShxufD+65c1WT3Nn
	 JDiztWNSWNHc5FLkqY4tcgJTlcH6RUw8Hiv32UU0XcfwWn7anIUDyjJv47uK1Tuyj5
	 UmvAArTKORqX3EXN3v3x50utm/jTO5TX/WoEaF1s6eU+SYqk9SLhA3/IzwBRtQcvBk
	 V+5TQyDPqCu2RTOVripuLyfjdvRUvt/6fEn+hnVOlctlumSlbW32/LGq3r1kRX1DkF
	 fslmBHcBHGvWo347rDb4U3cFCc73br2AmzxV5CUUD3UTF1jsJ7iic7skm8ujt66BNZ
	 dzeTuhE00Ok/w==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id E7/AE-55921-5ACDD906; Fri, 14 May 2021 02:12:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MxVXfpnbk
  JBveWKlpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBl/t5sX/GGv2LQ5qIFxLnsXIxeHkMBsJokH
  SzYyQjjHGSW2P3jF1sXIycEmoCPR8aKbBcQWEdCXWDp7DzOILSzgIXFp7WKwGhYBVYkLTQ1gN
  bwCbhJ7T1wFsyUEFCSmPHzPDBEXlDg58wlYnFlAQuLgixfMEDWKEtt3noGqr5CYMWMb2wRGnl
  lIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJC19DYQC+xSjdJL7VUtzy1uETXUC+
  xvFivuDI3OSdFLy+1ZBMjMIhSCo417WA8+fqD3iFGSQ4mJVHek56zE4T4kvJTKjMSizPii0pz
  UosPMcpwcChJ8H6/NTdBSLAoNT21Ii0zBxjQMGkJDh4lEd4/IGne4oLE3OLMdIjUKUZ7jjdrl
  yxi5mi7dxdIzlxwcDUzx/32Q6uZhVjy8vNSpcR5hW8DtQmAtGWU5sENhUXgJUZZKWFeRgYGBi
  GegtSi3MwSVPlXjOIcjErCvFdBlvNk5pXA7X4FdBYT0Fk3ps8COaskESEl1cC00Jcrh6GKQ+K
  bB+/2UMenG6aF5t378JXtqNG58NeKeUt9pryc8c1s7pVAlQdbqxNKCsLnKj7Sizn3T2yZTn1P
  Vml2Wv+ZhNvay36HfIw88yXezM99Jvv2w3KXhL3W5q8NS268tGLSxOvfp/7sVBQQWfa1Nc3PK
  nFzzbVtNbe4uk/v+fzDvKN64tfFm1ZeWSmTxqZwUJp1c3Xs41kaR7aJ770hnCKla9tqOlXbMU
  rQJyDF5uSyDyvdYp2391S+fi5yPOnynt0Cb6Ydf3npI+NVv+Ud5kJCJx+nnJYRkmPralHJsLi
  y42YVvzzrvZieD20dOXZ6zl8fnrl2vkdL+N6sRz6vo+RCk7M2moSenyqoxFKckWioxVxUnAgA
  9RBfTjsDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-285.messagelabs.com!1620958373!310642!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15028 invoked from network); 14 May 2021 02:12:53 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-10.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:12:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2CrLu027545
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:12:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:12:51 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.25.6 -> 1.25.7
Date: Fri, 14 May 2021 10:12:45 +0800
Message-ID: <1620958365-7915-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.25.6.bb => nbdkit_1.25.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.6.bb => nbdkit_1.25.7.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
index 067911b4ea..9dceb0f26f 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.6.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
 "
 
-SRCREV = "023dac3e09a0e39d6f91dea4b7f8efb8f5faae36"
+SRCREV = "babc2e2717c9025392dce613006a6ecae5886a57"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

