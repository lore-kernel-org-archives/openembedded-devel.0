Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6228.1619700007068592171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ypOPAGA4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619700005; i=@fujitsu.com;
	bh=A7m8fj9539GvmBU7Uaf3OqpIdImfLX1QJCkBb4hOGlo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ypOPAGA4khsf/DyfDCqhbq8EexyeVKSXeypZvFDhMqkJ3H7gxjOLFvqEksnq1a9oS
	 Iq+/0Yp7Ur39iZn9d23CLpfmBtzaZdi5RnbJnBcs4npJMkrs9NiFb4ks/Qg8Vi2iiF
	 ohj2Ep99HDoHp9Q6JzsePeZbYzIahpMVIRjBWVQaR0t2+XVeYGdhzM0WIrSWadyGNH
	 IjvM2UNCKZCKDFHwv9vjRTwaeGgNGU9m1ByjUzkzouJZx3FXwMwcX7VyPsyAEynp/R
	 hdusBQfbTeJfYzm0zrYbFr5keFr00FlUvOGKvkUwa+LVssniCWnfwr8qVIaSFIS9jA
	 rfAdAzT1rQTtA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 4C/AC-38008-529AA806; Thu, 29 Apr 2021 12:40:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0VVd2ZV
  g0LKAw+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzbhy9DNzwUeOit55rUwNjBM4uhi5OIQEZjNJ
  NM+/wQzh7GaUmP7gL3sXIycHm4CuxLnHa8FsEQF9iaWz9zCD2MICDhKfZ05lA7FZBFQlvi5ey
  ghi8wq4S9zsvgIWlxBQkJjy8D0zRFxQ4uTMJywgNrOAhMTBFy+A4hxANYoSs6fLQ5RXSmyfdp
  ZxAiPPLCQds5B0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuqa2RgqJdYpZukl1qqm5yaV1K
  UCJTVSywv1iuuzE3OSdHLSy3ZxAgMpJRC1pM7GCe9+aB3iFGSg0lJlHdLZ2eCEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQlevuVdCUKCRanpqRVpmTnAoIZJS3DwKInw6swHSvMWFyTmFmemQ6ROM
  SpKifO6gfQJgCQySvPg2mCRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK89yBSezLwSuO
  mvgBYzAS1edr4NZHFJIkJKqoFp0angC51rzVMS7n5vlt7i6lVYNOH1Fz5F/ZeL+DVsp398ecB
  eWKc5bi7zDEs31abLt5gmJj01XTC3uUX8cvXZ4PTPIsvP3M4JCdmUzV8Q1hV+/ttF54OMr/7/
  btj/cM0PXYa5mvPzJ+yfajxXKuFDxtzLTwwNbW2NpaPVduSx7JXb5reGeXFoXWbazCqWNLs7/
  Oaz3yXMfZE2bdGmHDHzJ8auK69t8PCTCYnfuCp24763f+OrFvxee7it9dqP7vSnNRatTFFTLh
  5zjp+h9jX94osCl/v7d/LsZLm5Sc/jhfN2939bstpE9T09/R1eZNw77setrhv4xEVES4izJc/
  9evCFyZOnrXSX42sJm3pHiaU4I9FQi7moOBEAfjvfjh8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-245.messagelabs.com!1619700004!266089!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8755 invoked from network); 29 Apr 2021 12:40:05 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:40:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TCe4A5026086
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 13:40:04 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:40:02 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.22.03 -> 6.22.04
Date: Thu, 29 Apr 2021 20:39:55 +0800
Message-ID: <1619699995-5343-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.22.03.bb => tcsh_6.22.04.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.22.03.bb => tcsh_6.22.04.bb} (90%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
similarity index 90%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
index fab626c61..f74f582e3 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[md5sum] = "c9387b7c8cf958956e75b1fa4e59b612"
-SRC_URI[sha256sum] = "be2cfd653d2a0c7f506d2dd14c12324ba749bd484037be6df44a3973f52262b7"
+SRC_URI[md5sum] = "fa2b347fa9ae866eb036e6e4bb85fe1a"
+SRC_URI[sha256sum] = "eb16356243218c32f39e07258d72bf8b21e62ce94bb0e8a95e318b151397e231"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.25.1

