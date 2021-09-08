Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.12637.1631112397569758228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kQ2waV6t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112395; i=@fujitsu.com;
	bh=Ir+QmSE6I16pfMf7V4GXE+izCV89XNCrtU5XEih6/i8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kQ2waV6t4MeFuBvaKpXcXJuyaTQwQNT/wihSY2Q4pf8Lxn4w+kKroxzHbzQ4cMOfH
	 9XLDulLzNs8klyvhc6CH4mSxR9+ouoXEBHrgCtp5X70eUZgRgMbyvJMUOpxv/b7aw5
	 BEI0yHwT6VxXqwzhFZ6YkGIQXl35Fu/MzOkCZJnJZrqywpugRZtjQqnlNFnDHL2iVP
	 gjNq9goiqjetvxtCgJoX0YTgJWLQJV9VrD+Hy+C40UEE0APw3rli7Qq06ohq4oocJd
	 SrCJ9qPmG6Kbvf0uqUsV/Kmm8Pqbev2OCrIftrJUpl6S29NPYtWXypx6TBrPJ78x2y
	 r/LYdnT/4/VTg==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 8B/BD-09251-BCCC8316; Wed, 08 Sep 2021 14:46:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRonvqjEW
  iwbYf2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNZTOZCo5yVXw8eou1gfEGZxcjF4eQwCwm
  iSPHnzFBOMcZJaZ1zmbtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8edhBbWMBNYsnP0
  ywgNgtQvOPwNjCbV8BJ4vnts2C2hICCxJSH78F6OQWcJeZMbwPrFQKq+XXzJyNEvaDEyZlPWC
  DmS0gcfPGCGaJXUWL25WaoORUSs2a1MU1g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQ
  NDY11TXWNDAz1Eqt0k/RSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgSGZUsh6cgfjpDcf
  9A4xSnIwKYny7tptkSjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJglfzFFBOsCg1PbUiLTMHGB8wa
  QkOHiURXqcjQGne4oLE3OLMdIjUKUZFKXHeuaeBEgIgiYzSPLg2WExeYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTM+wRkCk9mXgnc9FdAi5mAFrc9NAFZXJKIkJJqYJp/zn2S15Z5l96kCb6
  50eQ245mb23FruaA4jWiDFXLsQq1fV8U9cj9d9614enqKzH3uD3d37Z2hH/Vg9eStyoZnV7tc
  3y+h/Vqc+U+c6f42u9pbbdwlMRPTN4WKTfNYMqs7RPbtpIpF4hNO6L9s43PqF/KVXX/dJ0xkg
  m9w/xytiYGLHE4LOTLv+yGm1qBdr75z5/7AtLTCl/2rdyxeZPbmn6PCBMlzx3q3HN4paxMtvF
  mP+d9+wbBgmauLdwkfuXr5g2TUFfnZgsH9X7besQi0mmTEzb0zeopN9Z54vieb/X9ExH7yzD/
  xL7si0bzowqtsXfHiuuj5Dr1e730KV5fI17VeWnUg+NWhuymMj5VYijMSDbWYi4oTAShRVi9E
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-248.messagelabs.com!1631112394!54238!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10404 invoked from network); 8 Sep 2021 14:46:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:46:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EkYwc021346
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 15:46:34 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:46:32 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler-data: upgrade 0.4.10 -> 0.4.11
Date: Wed, 8 Sep 2021 22:46:03 +0800
Message-ID: <1631112363-19399-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
References: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler-data_0.4.10.bb => poppler-data_0.4.11.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.10.bb => poppler-data_0.4.11.bb} (90%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
similarity index 90%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
index 7574c7b5b1..3b65083d0f 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
@@ -18,8 +18,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
            ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
            ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
 
-SRC_URI[md5sum] = "a7f15fb2f26c60a7a92093cfdf2378d5"
-SRC_URI[sha256sum] = "6e2fcef66ec8c44625f94292ccf8af9f1d918b410d5aa69c274ce67387967b30"
+SRC_URI[sha256sum] = "2cec05cd1bb03af98a8b06a1e22f6e6e1a65b1e2f3816cb3069bb0874825f08c"
 SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
 SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
 SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
-- 
2.25.1

