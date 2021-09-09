Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.5262.1631181429822072392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PyHq6xk8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181427; i=@fujitsu.com;
	bh=eHUNZOSYad5aYjLYSj3Vh+ApJDaI2rkQMMWozrdHxSI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PyHq6xk8xzXBVJpD0zhVYWE5FApv6uh33UIPtP++6EZKY32CK/pw3zbvVqV91sYqP
	 bPgvbfio4rk23YjtFgu2qJTfJlE1192LZfh8YcOHzYrG5MQKqR2Uo8rawhM5BE48h0
	 /14z1lDLR9C+LVbCe83lwPyLnec6fGBRAC7WkPevD9oRuWUi3DVi9mTQVCFd4AJufB
	 QQRu2BKc7FYHZTGjAvBtqPuKYffSUJWTmK1LqulQdj/PirsGwc4E3/7qIojWb0jckz
	 0T9PF86fo4KsY33cmg76iRlqTwYPrQM4Qr24/7QAXqPbJR/Cb+WjQ3K27bHthNytfq
	 WJ+cw4FKLisCw==
Received: from [100.112.196.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 65/F3-30018-37AD9316; Thu, 09 Sep 2021 09:57:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1S2+ZZl
  osGu6iMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFh2gWmgpXcFQdnH2JpYNzF1cXIxSEkMItJ
  YtuhR4wQznFGiSuHdzB3MXJysAnoSHS86GYBsUUE9CWWzt4DFhcW8JdYf2E5O4jNIqAqcfLeM
  aA4BwevgJvE9G/xIGEJAQWJKQ/fg5XzCghKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0i8Pn
  yJeQIjzywkLbOQtCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmua2agl1ilm6SXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYRCkFR212MH54/UHvEKMkB5OSKK/ZTctEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8CdeBcoJFqempFWmZOcCAhklLcPAoifCqgaR5iwsSc4sz0yFSpxgVp
  cR5LUFmCoAkMkrz4NpgUXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvYZApPJl5JXDTXw
  EtZgJa7HvNAmRxSSJCSqqBacmlhV+mzni72XujzGKtqCUlrsfFry79Y/Jb9v/X8Dj+dXO6rY5
  P+XvKssZIaZLQzKw1UaZuspYxVZ98tN6vO+ia9V88/pX+5NsK/d8vm89dq3bSfWmK/p663U/u
  pVsdEHvYG/jp1Nd/rZs2nn6YPOP9e5Z7PdPyjkS+/sUwQdJF4vqWy8FCvyZ8qZvsVmV7/tc1A
  8GYDwt+iZzKsllvGmaxJfVXY3/aLT/DqakMUVtb7r6y0rO1tNhQeinWfbrrh4nmK5c/Nk6VWR
  +Ys+XPuifJVzhN9t44ozsretIhtxPhHiyfWCsPiiuHGG0VNeqcO1tjVWTKXE8fhhnV2odyXc0
  O3NdewnJGMuP25eJrp7uUWIozEg21mIuKEwEZRWlyHQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1631181426!149358!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13527 invoked from network); 9 Sep 2021 09:57:07 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:57:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899v6Qq020795
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:57:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:57:05 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-lrparsing: upgrade 1.0.16 -> 1.0.17
Date: Fri, 10 Sep 2021 05:57:00 +0800
Message-ID: <1631224620-4633-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

  * New: Default to everything using python3
  * New: Port to Debian bullseye

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...on3-lrparsing_1.0.16.bb => python3-lrparsing_1.0.17.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lrparsing_1.0.16.bb => python3-lrparsing_1.0.17.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
rename to meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index 85a54af30d..24e4e2671d 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -8,8 +8,11 @@ BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
 UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
-SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
-SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
+SRC_URI[sha256sum] = "7c060d9f03cf582fdbc0ae0fef0ea2ff6fd56251047ba7e425af97e23f46f582"
+
+RDEPENDS:${PN} = " \
+	python3-crypt \
+"
 
 inherit setuptools3
 
-- 
2.25.1

