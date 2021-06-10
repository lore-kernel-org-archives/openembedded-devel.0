Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.7752.1623318700790157202
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VX8UFSFu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318698; i=@fujitsu.com;
	bh=av1owD6hACOYlYvA6ryVcA26Zld/aCYpIJ6RT7jZH1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VX8UFSFutpirmUb2U4WpjDVzO6tdL9+B98Sxk0zxTPUApATDmkJpJKc0yuo/4C8SY
	 wqlt+CRB0nh26wk7Wbg9zsrS2ryK7WvVgjXKbGhbXuMp0nbRgzfS+9UMA2FXOeTU3p
	 41Bh8HMxt8hXJk0mDdyiu0qDtcIjOs4Pl+vKAdYmj6b5BeSql6NUoTAN+3O6jfbEGT
	 X/nL+t1SotgOFCUvkcDUSwot2kGUzb9UbEB2SxVJRZQmxUwJmvQ2ETgALfDiHtq+Cy
	 gnimivP+I9Pc0Ghql7kXkap33teRBXgjmdsB20LCp3jtz9nlxtAvhEWV1fqiboIK3d
	 5vy1FhakEAkdw==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id C4/37-27273-AA0E1C06; Thu, 10 Jun 2021 09:51:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYorvqwcE
  Eg9Oz+C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oydO3vYCh5yVqzqaWJuYGzi7GLk5BASmM0k
  MXleYhcjF5C9h1Hi4+cTLCAJNgFdiXOP17KD2CIC+hJLZ+9hBrGFBVwlvvz9xgZiswioSnx72
  ggW5xVwl9j76wRYvYSAgsSUh++h4oISJ2c+AZvJLCAhcfDFC6A4B1CNosTs6fIQ5RUSM2ZsY5
  vAyDMLSccsJB0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmuoaGRjqJVbpJumlluomp+aVFCU
  CZfUSy4v1iitzk3NS9PJSSzYxAsMopZD15A7GSW8+6B1ilORgUhLlbb96MEGILyk/pTIjsTgj
  vqg0J7X4EKMMB4eSBK/VPaCcYFFqempFWmYOMKRh0hIcPEoivPrAsBbiLS5IzC3OTIdInWJUl
  BLnzb4PlBAASWSU5sG1weLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3kUgU3gy80rgpr
  8CWswEtNjReB/I4pJEhJRUA5Pig/UGIlJsuptnBEpkcZ+MU5iw98MJvq0pAhsn/HP3fxreOPW
  QYW3Kedf24H3zF/aKbL3xucS35e4ibzuugMZlxdOUbDddf1e9re3KuZo++fXyLXFTpjM1K5fF
  tIl2TtxsUskyLWRjUt9Mbq/wD0mFy8/x1Buxeuq/LeeO//ZmsT9f/Qte1+vay2ff6pyn94oji
  VVuacXmgyvY1xj/3PFn3mrzmamKC3gLXly5+LbRVnROXEFPgPn3TRM27F684nq/yEWbnOnbFE
  5612pEvrI9to3Z2/PI/EvsotYaTtw2Z19tOXNG5iTLyQY95YVrpnnKd8aylf79NHWx89On1bq
  nL4l/+7Bja266VMivNFYlluKMREMt5qLiRAD5geIYHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-245.messagelabs.com!1623318697!13940!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3610 invoked from network); 10 Jun 2021 09:51:38 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:51:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9pbHm015451
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 10:51:37 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:51:36 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] graphene: upgrade 1.10.2 -> 1.10.6
Date: Fri, 11 Jun 2021 02:51:23 +0800
Message-ID: <1623351083-4607-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../graphene/{graphene_1.10.2.bb => graphene_1.10.6.bb}     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/graphene/{graphene_1.10.2.bb => graphene_1.10.6.bb} (63%)

diff --git a/meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb b/meta-gnome/recipes-gnome/graphene/graphene_1.10.6.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb
rename to meta-gnome/recipes-gnome/graphene/graphene_1.10.6.bb
index ef1898610d..2e0d502684 100644
--- a/meta-gnome/recipes-gnome/graphene/graphene_1.10.2.bb
+++ b/meta-gnome/recipes-gnome/graphene/graphene_1.10.6.bb
@@ -9,8 +9,10 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.md5sum] = "a2c26c4f44a02ca053e0e9afb63cc94c"
-SRC_URI[archive.sha256sum] = "e97de8208f1aac4f913d4fa71ab73a7034e807186feb2abe55876e51c425a7f6"
+SRC_URI[archive.md5sum] = "390139e704772b915ff2b7cac56c24ae"
+SRC_URI[archive.sha256sum] = "80ae57723e4608e6875626a88aaa6f56dd25df75024bd16e9d77e718c3560b25"
+
+PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1

