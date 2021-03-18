Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.6459.1616058532913080241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.113.6.176] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id EC/9F-33844-3A813506; Thu, 18 Mar 2021 09:08:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MRqrtIIjj
  B4OkmK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP6hhamgv/sFd3nPzE1MC5g72Lk4hAS2MIk
  cfXATEYI5wSjxNcVa4EcTg42AX2JhvevmEFsESB76ew9YLawgIfE4e1nwWpYBFQl1nZ2soLYv
  AKeEi9/HACzJQQUJKY8fM8MEReUODnzCQuIzSwgIXHwxQtmiBpFie07zwDFOYDsKokjM9UmMP
  LMQtIxC0nHAkamVYyWSUWZ6RkluYmZObqGBga6hobGuua6RsaGeolVukl6qaW6yal5JUWJQFm
  9xPJiveLK3OScFL281JJNjMBASilkf76DcdWbD3qHGCU5mJREef/yBycI8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuA1EwfKCRalpqdWpGXmAIMaJi3BwaMkwpsNkuYtLkjMLc5Mh0idYgzneLN2y
  SJmjrdgsu3eXSDZDiZnLji4mpljFpi8334ISD4AkUIsefl5qVLivCfFgMYJgIzLKM2DWwaL2k
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmrQY7iycwrgbvpFdC5TEDnRvAHgZxbkoiQkmp
  gWhKeqRM9u9qa2yhR5Mdx+TOhNxO5XS79c1+zPNvvW3PM+qLnm45tUzphcG/Dyv/Lrz7J3rB5
  xrrXq/ZkfPF69PzKsubT/13/Fi0Smxd7j6Mx/HVrc/PXVE8Hi8WP206vPxO/8eqhF4ar9myc0
  Z4u8f1un1JyRpPwHP/VTc0eohmdpplWFZ+sHs5MCrlzVfnb/RvrXJTSJe9zHnh4cVuAtZLJGq
  G0409eF6ddOvpR4OWKdz2rN2b9nniJs+Ong/BRnVk7L5dOtVQ7ZvD10dqbnSWXo31P50t7bj8
  +SbZu4T9BFY5rPp5TfHkTBc5432lV2OV9J9rh5dV+Oa6SHUK3pawCHwZwMsq2J9V08t+bc1CJ
  pTgj0VCLuag4EQD0M8kKVQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-245.messagelabs.com!1616058530!2595639!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18224 invoked from network); 18 Mar 2021 09:08:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:08:50 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I98oOJ026290
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:08:50 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:08:48 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.25.3 -> 1.25.4
Date: Fri, 19 Mar 2021 05:08:42 +0800
Message-ID: <1616101722-4799-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nbdkit/{nbdkit_1.25.3.bb => nbdkit_1.25.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.3.bb => nbdkit_1.25.4.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
index cc41e0ee53..37f6a8b76b 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
 "
 
-SRCREV = "1476b82f7e10deedf88364f26186f5945c3d4702"
+SRCREV = "7b04baeb1858fa04f5f4e0d6f2d23bef706e80da"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

