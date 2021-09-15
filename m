Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.8559.1631783992140920594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P+yS9eh3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631783989; i=@fujitsu.com;
	bh=UZR8Jzx/Khnjcg/M7bbBzWuVWMFZzRl0lDMPL5d1OoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=P+yS9eh3af2yV6Yept2J2FuAnH0FyXiK6oIy/Sfs0kDTlsRwlloEWYIr+fLE6giB2
	 HOBuSrX8oHA9N9/zNgmqnE3s9fkiTze2ikRP9E8OfPPLGCU9Lhm2pJpA14msW1wZa1
	 cAw7eCDtpdioQCdIpX/b0aOtjnzmNueG4saOgKBmOIBMopErxuqREfh6ulAZ8+qKwl
	 MyjjvI5K5x9MkE1g3gjtwXxF4h+fG7yS2kkPcx5KMXKtigdwqJhHY+FZXUyXy72U0z
	 uXBqmS5QkWL5iHgwr5jbCyN4hst+elX+blmViuOcWcDIMJl9rvSZA8LN9Qoh/OsNui
	 J7BbdD3gn0AMw==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id B6/C4-01625-53C03416; Thu, 16 Sep 2021 09:19:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1TXlcU4
  02LtMwOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXiwcjJbwUfeiq6v+5kaGK/zdDFycQgJzGaS
  OLCjgx3C2cMoMeHqYaYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBXwk5nQ8ZQGxWQRUJSad/
  QcW5xXwkJj3fz1YXEJAQWLKw/dQcUGJkzOfgMWZBSQkDr54ARTnAKpRlJg9XR6ivELi9eFLzB
  MYeWYh6ZiFpGMBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sjXSMDE73EKt1EvdRS3fLU4hJ
  dQ73E8mK94src5JwUvbzUkk2MwDBKKThwZgfjqdcf9A4xSnIwKYnyHrzplCjEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgpebwzlRSLAoNT21Ii0zBxjSMGkJDh4lEd4CLqA0b3FBYm5xZjpE6hSjo
  pQ47z6QhABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzuoJM4cnMK4Gb/g
  poMRPQ4iP7HUAWlyQipKQamCKdUjQvmh/Q5Tb9fjsmZCtnzbvSK/Nsfis/8dBvzH+ZWvhr/r6
  JnFaPue+/f1alUt7PLrdMP/qk7vwlH+6ElXcla69/Wr21XG1R3c9Y9cJu25XSp20ul85RTf5l
  /GDp/avTL0xq9Zr9UUX8d/rM4yerj2sJCOXM/eNY/12m7fK1FbXSb5axpM7t+pIVfurs41erO
  k+w9dSsu3X07bsS785/T1dNdyjZk/nlWMG2UwsWtiq7nqnOn12f0zhHpu9B9ZR3Z+p9RBNrq1
  e25Gxc84JpzgG2FyqlN6NnXqiJsdyt5OjHuOWOenbapeoru7v8GqdtXPPgguM/pYrAlNpMrgx
  3C0fNe0eiGrauylG50qnEUpyRaKjFXFScCAATREUmHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-267.messagelabs.com!1631783988!168803!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8350 invoked from network); 16 Sep 2021 09:19:49 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:19:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9Jhkx021546
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:19:48 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:19:42 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.0.7 -> 3.0.8
Date: Wed, 15 Sep 2021 14:30:14 +0800
Message-ID: <1631687414-89214-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Bugfixes
Ignore blank ignored in existing Data Validations
Add support for cell protection for merged cell ranges
Timezone-aware datetimes raise an Exception
Improved normalisation of chart series
Catch OverflowError for out of range datetimes
Alignment.relativeIndent can be negative
Incorrect default value groupBy attribute

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-openpyxl_3.0.7.bb => python3-openpyxl_3.0.8.bb} | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.7.bb => python3-openpyxl_3.0.8.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
index 52489b8543..3d1f46e50b 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
@@ -9,6 +9,15 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6456a3b472e1ef0facb1129f3c6ef00713cebf62e736cd7a75bcc3247432f251"
+SRC_URI[sha256sum] = "4f2770348c029ce9433316ced8f91ed37d2a605e654f8bfdc93a3524561a8ce2"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-compression \
+	${PYTHON_PN}-io \
+	${PYTHON_PN}-pprint \
+	${PYTHON_PN}-shell \
+	${PYTHON_PN}-jdcal \
+	${PYTHON_PN}-et-xmlfile \
+	${PYTHON_PN}-numbers \
+	${PYTHON_PN}-xml \
+"
-- 
2.25.1

