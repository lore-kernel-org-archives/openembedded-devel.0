Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.3421.1622097425163157268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QSRxhmVF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622097422; i=@fujitsu.com;
	bh=zI5544y9L33NTIaS4gMcqeKa9+mpN7A5BQtMCIPcrRs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QSRxhmVFqA3PPz6Zgdh6TA0c/fnw55IM/nUOB8U55yPsDQFwg/i2G/ppTriVgzUjH
	 d6pppHyDGVHIP1leWMES2cfPQO/4Mwb3eoDGl8SJLj06PIqu+sj5ASYrHvJ02ICJZ8
	 b5OxesTb9v3H+RhdNkX+Yif0uhubMW+RYdIc5rvr7hxrTFhWx+FU4jRSNa3tsLUNCm
	 ADVuB0vQWlLmmh3TpgeLa/jzPu2g4gvfybJdOWDAXBldGf5OrXKs8fe3pO2tZwdmbZ
	 fuquA7ZdTTLi6j/wSQNuK+7ZkvqzSQScbvMbMLxlNTGb1SPwaRt5Ap+JcBAc+/KX3L
	 9dZL5OZYBk53g==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id B4/0C-15146-D0E3FA06; Thu, 27 May 2021 06:37:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqstrtz7
  B4FuzpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHj5xbWgs8cFWdu/WRuYOzi6GLk5BASmM0k
  0TzBvYuRC8g+wShxouE+C0iCTUBHouNFN5gtIqAvsXT2HmYQW1jAWaLzxgp2EJtFQFViT+sup
  i5GDg5eAXeJPQ2aIGEJAQWJKQ/fg5XzCghKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0jMmL
  GNbQIjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKxrBmTpJVbpJumlluomp+aVFCU
  CJfUSy4v1iitzk3NS9PJSSzYxAoMopZCNawfj09cf9A4xSnIwKYnyTtBZnyDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgjffBignWJSanlqRlpkDDGiYtAQHj5II70RroDRvcUFibnFmOkTqFKMrx
  7O1SxYxc2yYtxRI/r97F0j2Lzi4mpnjZvuh1cxCLHn5ealS4rzBIM0CIM0ZpXlwo2HReIlRVk
  qYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9NkCk8mXklcBe8AjqOCeg4ocR1IMeVJCKkpBqYDqs
  eqNQ8+ujzoQfyu04/ZNFezBR5dMXbc/f+fpKUZlvmm57Ke5Mls13T+L/4XKt9+91V78vncpz8
  97L7xuRkvrc7dnDkL7mkereXN+PiZ75zDpf+LHS8KGO2f7qns22GW9lrXf/QKUXsy9ur/11g7
  uDc1qd3mEX96YfnM5PDQxNOfj2zZO/j2mOzMtsLD/3cLLCi+BKPo9N7fZN1AZEu7e/NJtXvC7
  KcPHnVI6do5ab/Z35lWO/5sV1msks/Y52C45fPjj7ZjvlPnSov6bx9IbZ1yw2Zf5OE9JustjN
  JXnzwVeVqp8UTcfnUPdbM1iHT37lfT5btu/7p8puw5AnewvExH6ILZCY6qsu8UE+5o8RSnJFo
  qMVcVJwIAIEV/chBAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-248.messagelabs.com!1622097421!128099!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9870 invoked from network); 27 May 2021 06:37:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:37:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6at9H019066
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:37:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:36:53 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gexiv2: upgrade 0.12.1 -> 0.12.2
Date: Thu, 27 May 2021 14:36:45 +0800
Message-ID: <1622097405-10267-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../gexiv2/{gexiv2_0.12.1.bb => gexiv2_0.12.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.1.bb => gexiv2_0.12.2.bb} (69%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.2.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.2.bb
index 12ea5938c5..708523ee8c 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.2.bb
@@ -9,8 +9,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.md5sum] = "44a3cfeab1afd83a71e852835d24e656"
-SRC_URI[archive.sha256sum] = "8aeafd59653ea88f6b78cb03780ee9fd61a2f993070c5f0d0976bed93ac2bd77"
+SRC_URI[archive.md5sum] = "4c0cd962f021f937507904df147ea750"
+SRC_URI[archive.sha256sum] = "2322b552aca330eef79724a699c51a302345d5e074738578b398b7f2ff97944c"
 
 EXTRA_OEMESON = " \
     -Dvapi=false \
-- 
2.25.1

