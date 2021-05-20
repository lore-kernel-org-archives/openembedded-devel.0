Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.5762.1621501882482285744
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 02:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tx+tdtuC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621501880; i=@fujitsu.com;
	bh=AxamESPIal/wopIRxUxoSqj0YCsvXRja2vY6sRoV6VA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tx+tdtuCqLEuAOwyGE76qydHiZrMGKgJJ3Gvk+XF6vFKR6MIvvh+U58HJAY98VjcP
	 HdyNVT7kO+meXWRuZRcO7hbJ0DjMQowPb0GnwTdnIzhSqaOem72qaMDLnFz+UXvhBx
	 /NQ3YD3VxwBp+IkSKecZdu9pfeqsdr8AN3nwqKl05vCiYdWmHOWIuiwJnSOXAJonUg
	 FmtM+7TSlPw5nbDxDeJOBkjYvHr7PBlTpGbzN8uqPMGPJ+BjZ8XZvxpCQ4KuK5v4o3
	 1Z4/li/X7DxoVmoo9SBO3qiq6cBWshJb+g27kKqQbNh5cn/a9DSklF1U/pC4RHa8Dc
	 TRp18Uf8mp7dQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id D5/E4-25406-8B726A06; Thu, 20 May 2021 09:11:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0d2uviz
  BYN1lE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZr6UsBS84K+a+5G5g7ODsYuTiEBKYzSRx
  5M5pdgjnBKPEki3fmLsYOTnYBHQkOl50s4DYIgL6Ektn7wGLCwv4S6yf84kNxGYRUJU4c72JC
  cTmFXCXWLh6C1i9hICCxJSH75kh4oISJ2c+AYszC0hIHHzxghmiRlFi+84zUPUVEjNmbGObwM
  gzC0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamukamZrqJVbpJumlluqWpxaX6Br
  qJZYX6xVX5ibnpOjlpZZsYgSGUUrBkf87GJe/+aB3iFGSg0lJlNfs/qIEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK8IsDAFBIsSk1PrUjLzAGGNExagoNHSYSXWxYozVtckJhbnJkOkTrFqCglz
  vtOFSghAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryT1YCm8GTmlcBNfw
  W0mAlo8f/GRSCLSxIRUlINTL3ZtrnZl4NvM+67cfKXkbb0NdfpUXe5L/K/Ngvq0NnXlvLDWLl
  tjp/I4e0iN8Lnf7uYy32u/PbjG66KmzQuJy8T+KSRaPr2QU3fUQnp7313AxUTfBT0z3oZsyhk
  yU58c+3KF84j8h/Z9mzb82bV5DtHz76Ifn5H/nO5Wv30cKPt91+seFp1ssGRM1v0+oTNN92T9
  zikXyzefzl60gOm5wEXYpu7PRawMx7lz1c+KCISEan96I5AP8O5yBNmSVa173YWnK8UffG1gv
  fjxLVfz/6bafvl4AunGQbhR6rezZ1S2RKWcmZy5CZpZfc1j+fMjGv3cNn2Q8Vl02LZBLV0g/u
  rZBJYJTatsH9xpPuRq4YSS3FGoqEWc1FxIgBxPlBWHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-287.messagelabs.com!1621501879!224533!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4559 invoked from network); 20 May 2021 09:11:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 09:11:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K9BFD0030170
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:11:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 10:11:14 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 21.3.4 -> 21.5.17
Date: Thu, 20 May 2021 17:11:08 +0800
Message-ID: <1621501868-17634-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...hon3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
index a4455eeb1c..3c0a9c0e5b 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
@@ -3,8 +3,11 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356"
+SRC_URI[sha256sum] = "3f782b3adf6d91b2398504002d248b36aa047bd04d5acd0ae5d4e2d3c8e746a0"
 
-RDEPENDS_${PN} += "pulseaudio"
+RDEPENDS_${PN} += " \
+	libpulse \
+	python3-ctypes \
+"
 
 inherit pypi setuptools3
-- 
2.25.1

