Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web10.24835.1627264048588618835
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=Wt3f6mSd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264046; i=@fujitsu.com;
	bh=OSuFManPiaknlHwjDNDnj4VMG9YX0bsAkqSVpGauc28=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=Wt3f6mSde5RIenPO8vuxwXB4dxC5YuRuxNNVgyXOm7GknzP0l9SGDkv+KPY7c/9Oz
	 6h7fxwJ61OgJl4eTuKJRys42jPf2q+ucoh4eIie2U8sbcSsM8qRg92dUCxHCjp4NHb
	 webL1RmuKVPD58lxAdG3yzhx5uuOmGxIlljEImcR6GsC71Q+3le7Fk/z4KfQWmXDlk
	 iAncHX7HrDAj3K76kLvS8MpCs5pVAWQA7HnWi/1t+QoUO4BHe5KGa90erRjkdhLFmL
	 3vGZTfH/P+rVk7vkN0gLVEgB3AmC7rP3ene6m5MwEfByVcfLjf6M4nrnR/yF8UIcOl
	 eIlyWA1i1bo/A==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id F8/A7-07336-E241EF06; Mon, 26 Jul 2021 01:47:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxRVdP5F+
  CwZGDfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bn90a2gk6uik/3ZzI2MM7j7GLk4hASmM0k
  Mf3NQSYIZw+jxJdPr9i6GDk52AR0Jc49XssOYosI6Essnb2HGcQWFvCVmHRuF1icRUBVomdeH
  xOIzSvgLtF5dAILiC0hoCAx5eF7Zoi4oMTJmU/A4sxA9d1HnjJB2PISzVtnA9VwANUrSsyeLg
  /RWiHx+vAl5gmMvLOQdM9C0j0LSfcCRuZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpYWukaGpnq
  JVbpJeqmluuWpxSW6hnqJ5cV6xZW5yTkpenmpJZsYgWGXUnDs+g7Gq68/6B1ilORgUhLl7Vv7
  J0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+l0L8EIcGi1PTUirTMHGAMwKQlOHiURHgjeIHSv
  MUFibnFmekQqVOMilLivPnCQAkBkERGaR5cGyzuLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYF
  QS5nUDmcKTmVcCN/0V0GImoMXB9X9BFpckIqSkGpjU1aIO3A+w1ph2Q+lz+pe4KfatDy67PV4
  XsHXvLj1Fv5saD/KD9hb/EQ3+uDPY9Y+7pPfCG52vHnCVbvKZ2Mu7NLtM6Mwn24dFbdMcnL69
  2lbRq6XlWbdmCUtL1qUdkybez47SuPl1icvRo4yLudesff3v7VPZbjaBvX8ieVyW1vYve/f9r
  9Rx/jiNyAtNDYkb5Myy2UuZWyxeF2Rs9yrTiS4/6nR1ieLBVZmcaw73TjLyPPkwxM72i8+Lq7
  /7mC+aLnjXZqNtF/Knb1/Pq7A1t2o5lvH/ibbsTL9f/r3bZa3N1QVJ3S0MBQcdE6bG/Lg7LUn
  IqctzYpzz49fCR+6YZ0SGSl9Kn/Mn5rmNyColluKMREMt5qLiRADN0dKoNgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-285.messagelabs.com!1627264045!496332!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17875 invoked from network); 26 Jul 2021 01:47:26 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:47:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1lPQj016647
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:47:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:47:24 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 3.11.4 -> 3.12.0
Date: Mon, 26 Jul 2021 18:47:17 +0800
Message-ID: <1627296437-3817-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

We are pleased to announce the 3.12.0 release of PyMongo - MongoDB=E2=80=99s Python Driver. This release adds support for MongoDB 5.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pymongo_3.11.4.bb =3D> python3-pymongo_3.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.4.bb =3D> python3-pymongo_3.12.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb
index 0c07344cb4..e715eb86a0 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "http://github.com/mongodb/mongo-python-driver"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] =3D "539d4cb1b16b57026999c53e5aab857fe706e70ae5310cc8c232479923f932e6"
+SRC_URI[sha256sum] =3D "b88d1742159bc93a078733f9789f563cef26f5e370eba810476a71aa98e5fbc2"
 
 inherit pypi setuptools3
 
-- 
2.25.1

