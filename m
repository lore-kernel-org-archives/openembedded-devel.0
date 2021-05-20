Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2570.1621474782193672767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sNaFGexJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474780; i=@fujitsu.com;
	bh=UIpsdal2qqKdGjffPXdcO1cJOOHiddX/SmX5PwsoNo8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sNaFGexJ6vhL5qHrJSkSru/5rYT+cEeKmM+QmfhSy4QMrl+1HvN5NOOLDheptctBl
	 BKSQv4r/HIr1yyAielxHcEvYvS3YiUaLSsm4ARvBOWorWaHkmFkEmRSQTTSpq5oQwc
	 2XgbbR0X3IAGCJgUuKVUq6dp8InzsuwRbyPOKIIHYITmD5K0BbzRNfqxR3yeOshUXT
	 ZlcsZUTHSdOPc/5gRlyuBsgW33qK3T/IRiQ/QnkUMxpjYOQ+7B9F7ANdY+J8Mkxe+z
	 AVOzWwTWPFrxKXBzkVFa6pNB7dWFsOgpX/PuMOS1PkrDamnRFpnjUnUoi5FK/bM60t
	 TmSKWLLdIhYtQ==
Received: from [100.112.192.186] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 0D/8B-27560-CDDB5A06; Thu, 20 May 2021 01:39:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0b2zd2m
  CQdcJZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePdoi+sBS85Kn62bGBpYGzj6GLk4hASmM0k
  cXDXA3YIZw+jxM4rq1m7GDk52AR0Jc49XssOYosI6Essnb2HGcQWFnCQuLLhMVgNi4CqxKppU
  9lAbF4BT4meGXfBaiQEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDlFRIzZm
  xjm8DIMwtJxywkHQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWgKxiYleYpVuol5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAYpRQcmLCDcf/rD3qHGCU5mJREec3uL0oQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMGrBgxMIcGi1PTUirTMHGBIw6QlOHiURHj/bwNK8xYXJOYWZ6ZDpE4xK
  kqJ8xaD9AmAJDJK8+DaYHF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79o9QFN4MvNK4K
  a/AlrMBLK4cRHI4pJEhJRUA5OSRcr27dcTHZ5sTAhiYOpKd3v/vHJL0Y8N29tv/dp2kjlS2fu
  I2YX31mVPlrMs+XL2rdjCA7LHtf/ud+Q+0LqX404gO3uF665NTo4RTQc37MhiPBO+gfOXl+Cn
  04FHWd/tdTCr7rmR2Pi5/NS+i5MX6h+6GC6UZap4037finfB+sxbtXyLdFqeVu7ZJNnha2278
  6RAjHBAaY+Y7yd/NY8gGT2zR9+1565v/OZwX3bnzPMTjG/cdXq6WXYdW8qBc8czaz1+NCQ+2L
  K++/KDr0v+brVomLn/jFrnWdZk4yvb7Q5N3+r67715i2/i5NeV2ncPnjj28K6bj8fOVVa+L43
  NtrY49bPLrHxvZHeU2yBHiaU4I9FQi7moOBEAvhbwWR4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-267.messagelabs.com!1621474779!216693!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5483 invoked from network); 20 May 2021 01:39:40 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:39:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1dd2H008517
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:39:39 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:39:38 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.28.2 -> 1.28.4
Date: Thu, 20 May 2021 09:39:34 +0800
Message-ID: <1621474774-127740-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libqmi/{libqmi_1.28.2.bb => libqmi_1.28.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.28.2.bb => libqmi_1.28.4.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb
index 9be48b75f2..c6422c3921 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.4.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783"
+SRC_URI[sha256sum] = "3b14cd2ab5221a7adbb39fed16ef697538ea1c79308821ad2d19b505e1daaea0"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1

