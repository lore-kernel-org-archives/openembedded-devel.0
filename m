Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3052CC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:34:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.29432.1652085279453870778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lpoh291B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085277; i=@fujitsu.com;
	bh=BLNm+nH6P8sSS5y9mwB0R5d0bO9L9QTqzN0pYqNxc1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Lpoh291BH/aTKH2fV5LY06ijlmvtCUZqJXOpLA9N1DXnVCd9lVItjpq9N0AMwZJHX
	 LfGkUQnQF8fXW1Z07IKrWIe1yb64R6HqUUO26p1GCqzv/Wo+kkplfOBFd1dI1lUpxF
	 CfcD2ySJjWFvrHvDZtt+PslPDjn8fnVEFQ1Sz8i3a1mqMMPxdPQSbqZPhvaeCd4rhc
	 1sRK1A01GTvjtOEHkaVAvVZv8mDMRdUchciK6fG5bAKkpiChmbmyGS/FU6ODsBdLQb
	 z+SJ89SlFSKoP0OshxcddCSm8/Ym9fizae/oTWuCceO+CTTkEHxhrlfCMnWQcd8tGv
	 Uab1EVksmYtvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSVf2UkW
  Swb3TihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+xdfYC/byVkyaYtvAeJK7i5GLQ0jgCaPE
  8jUH2CGcC0wSHx9tZYJwdjNKnGw6ydzFyMnBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAUeJl/ungsVZBFQlbvWsYwSxeQWcJA693gcWlxBQkJjy8D2YzSngLHH79kawmUJANddaVr
  BC1AtKnJz5hAVivoTEwRcvoHoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hcwMq1
  itE4qykzPKMlNzMzRNTQw0DU0NNU1ttA1NDLXS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxN
  zknRy0st2cQIDOOUYrX6HYwvVv7UO8QoycGkJMpb2VSRJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCN+QcUE6wKDU9tSItMwcYUzBpCQ4eJRHeuyeA0rzFBYm5xZnpEKlTjMYcdxfu3cvMsebVxb
  3MQix5+XmpUuK8py4AlQqAlGaU5sENgsX6JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvDU
  XgabwZOaVwO17BXQKE9ApHwNKQU4pSURISTUwlT2au2ju+bICMd6PWzu4D5y+saR5XnXMEnux
  M9EHGiudv4TXfu2rDNS56t978c7PfzdsrvovKmfpfjf3Vdsy09P/5xhde9gV9Jhz6o6/YkcrR
  NorV7/mec0waxYH1/NTJZ4XPzBJy3+QC+O/ru97nFvlz6mo828lPh61VL6U6pLa+flC1Qfm2f
  naHlFrL/53+1x46kbLsRNKKxV1mituLZg266eTfet0mV+zlVo+LfzaLBOgblf90uu/9rYr3dn
  pjxxXc34pOxB3t2521m72O+xNgdvYDvPzzD5Yu/7nnsW32DbVr60Rmv5QOnmq+Y/MfzeYmXok
  4u6G8O/RtfWKfOv3oSh8yydtISm5yGVn3imxFGckGmoxFxUnAgBM5LU4cAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1652085277!421274!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1210 invoked from network); 9 May 2022 08:34:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:34:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 30736100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 23CC1100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:34:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] unixodbc: upgrade 2.3.9 -> 2.3.11
Date: Fri, 29 Apr 2022 16:16:33 +0800
Message-ID: <1651220195-27553-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
References: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97008

Changelog:
==========
    * Add connection pooling via wide connection functions
    * Remove "#define VERSION" from unixodbc_conf.h
    * Call driver functions through prototypes 
    * Add connection pool limit option
    * Add fseeko support in cursor lib
    * Try and prevent logging buffer overflow
    * Add 'echo' option to isql/iusql
    * Alter isql/iusql buffering
    * Alter unicode to ascii conversion in SQLGetDiagField
    * Fix pooling problem when user name and or password is not provided
    * Fix a couple of reported buffer overflow conditions
    * Fix iconv leak with timeout in pooled connection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unixodbc/{unixodbc_2.3.9.bb => unixodbc_2.3.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.9.bb => unixodbc_2.3.11.bb} (89%)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
similarity index 89%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
index c194739cb..c7d23d120 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool readline"
 SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
-SRC_URI[sha256sum] = "52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207"
+SRC_URI[sha256sum] = "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


