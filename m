Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.6672.1628157100286078224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i6snz3L7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157098; i=@fujitsu.com;
	bh=TaredCJYSOwqTwTtd5vqbmi6pu+PDc+eGesbPrecjWI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i6snz3L7b2Oqz7Z3uDnztN830QY8ns1Qx0FQknHCfZeL2vQnYcUjEMbwBl9ekW90/
	 EpKgkqxtps7FSiQIkC5iDDEhO72ttL9def6ftt/SWdhKJAmF9KjUwfBQcub8sbF4Us
	 BLxfzUXqlEMoX8hJITR0jj7g1KNM+kSxTyh+mUP7RyGIIBYKQFEJkZOx/0GWOGisIS
	 1vpEnN7agYE66ClGXfoqn1hlC6QaFC+zMisaCYUacQZH2VGXp4zwhr8+qeY7G4aVl8
	 Wn4gltxgUkPPZXiFE7bfjLU7kcm9ewHKEt/4owPmiU77X+WHEAUZy9ey+Blsac8Vwq
	 qd0d0iGUSlx2w==
Received: from [100.113.4.199] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 7C/EE-29721-AA4BB016; Thu, 05 Aug 2021 09:51:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYortyC3e
  iwf9dhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZPx0PmgiXcFbsXTWJuYJzD1cXIxSEkMItJ
  4tDUdlYI5zijxPGu/4xdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAr4SE2d8ALI5OFgEVCQar
  xeChHkF3CQefV4F1iohoCAx5eF7Zoi4oMTJmU/AxjALSEgcfPGCGaJGUWL7zjMsEHaFxOvDl5
  gnMPLMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuqa6RiaGeolVukl6qaW6yal5JUW
  JQFm9xPJiveLK3OScFL281JJNjMBASilk/biD8dDrD3qHGCU5mJREefV7uROF+JLyUyozEosz
  4otKc1KLDzHKcHAoSfCqbAbKCRalpqdWpGXmAIMaJi3BwaMkwrt4E1Cat7ggMbc4Mx0idYpRU
  UqctxUkIQCSyCjNg2uDRdIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8hSBTeDLzSuCmvw
  JazAS0+EIsJ8jikkSElFQDEzePNbOFq2RleivjtQX8tTOD9cTlFfT9w+4cWFg/67P63GCnlHe
  Sgt++n+wX+n3XLVcpY7viql8q6ZrropatNzkYJtg41zeqxs+vTdfSsk+yhGXp7LdGF82svNIe
  /9NrWaS0L6Tvxcfk1YvL8icp88XuS3cSjDisl+T0oPh5+/+YS0UZ/7JvTrDW/VwSeNHgpM3cN
  51y53rT2qded17MFnTmGce8X8kXH22WndKUfLlLS7mnTGnTHb2Qp9vLy4xeHqtWveHya1IL/9
  RK5c01lk18ixWY1sw2EfZh/+nUfJRjGXPLfvt1PwOjk/6L5qftXlglLHGQSbbVtXxpiLttcPt
  STb2ICe0Krq/XqCqxFGckGmoxFxUnAgD5M+KnHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1628157097!118533!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3164 invoked from network); 5 Aug 2021 09:51:37 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:51:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759pbsA002588
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:51:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:51:34 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-twisted: upgrade 21.2.0 -> 21.7.0
Date: Fri, 6 Aug 2021 05:51:28 +0800
Message-ID: <1628200288-4727-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Twisted 21.7.0 (2021-07-26)
===========================

Features
--------

- Python 3.10b3 is now supported (#10224)
- Type hinting was added to twisted.internet.defer, making this is the first release
  of Twisted where you might reasonably be able to use mypy without your own custom
  stub files (#10017)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-twisted_21.2.0.bb => python3-twisted_21.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_21.2.0.bb => python3-twisted_21.7.0.bb} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb
index 67c6c976f0..4e9472793b 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31"
 
-SRC_URI[sha256sum] = "77544a8945cf69b98d2946689bbe0c75de7d145cdf11f391dd487eae8fc95a12"
+SRC_URI[sha256sum] = "2cd652542463277378b0d349f47c62f20d9306e57d1247baabd6d1d38a109006"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.25.1

