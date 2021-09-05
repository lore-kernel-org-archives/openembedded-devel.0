Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.19807.1630917986841277259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sBz2fMn3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630917985; i=@fujitsu.com;
	bh=Jo9WsBq2NS1UUt7jfxE8JRPjjoAPtOKUwKiF2kSlHC0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sBz2fMn3mu73SxYeEQ8OC9/98iSBsBb2bbkavmP9SVefY+rUqsWgAk4jCqaWCVL1s
	 3+smb5pn0+quhYpZslFG9m+NAtjqs0mDoFxDJw0a+Dpb68tlsFEfpIuI7wirAseDDG
	 8b4D5lzvNLp2Pxntfmu/wfWFS80IqzhdDT+sY05GvRK9VvxwvmNZQEh55o1WZVD5zB
	 sOoliZ/wkbTnQoKbhZW/GpVWlDf3wgccSdpaIOp8Wip5P5mtF7L4HluiYkxIX1O3sr
	 r25nglrMwi89jH4dxPjm7337dTwM4nUxnwjduvElFW/GKB6bYk9VHsRkpmnZOATJfm
	 BWq+yvnDSOwVA==
Received: from [100.113.6.150] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 21/33-15923-165D5316; Mon, 06 Sep 2021 08:46:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxVTfhqmm
  iQftZfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePC1OVMBc84KibvmsHcwNjG0cXIxSEkMItJ
  Ytrc5+wQzm5Gif6XT5i6GDk52AR0Jc49XssOYosI6Essnb2HGcQWFvCWuD1tMwuIzSKgIvGs/
  xKYzSvgIbHwylGwXgkBBYkpD98zQ8QFJU7OfAJWwywgIXHwxQugOAdQjaLE7OnyEOUVEq8PX2
  KewMgzC0nHLCQdCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa65rpGpkY6CVW6SbppZbqJqfmlRQ
  lAmX1EsuL9Yorc5NzUvTyUks2MQIDKaWQ7cMOxilvPugdYpTkYFIS5X120DRRiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgTvxUtAOcGi1PTUirTMHGBQw6QlOHiURHhjLwOleYsLEnOLM9MhUqcYY
  zm+rFqyiJnjzVoQ+RZMtt27CyTbweTMBQdXM3PMApP32w8ByQcgUoglLz8vVUqc9zDIUAGQoR
  mleXArYRF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73+QKTyZeSVwl70COpoJ6Oi2hyY
  gR5ckIqSkGpi2q2tUetqkzHuTOKM3eO78e1mf/4of6Jr/bnve1f+NXx78Lp/SVx85p1cvy23P
  i2nnKzpObIlk323y0PxKpZ1b3NQHy+o2OrFfTv9o/lxnzUcuHlOB6GVzZnzXZXz0jFNCKelCS
  +X01yLK893E9/ROWnfZ83qORp/ExOPxC47MU3FfJHJW1jU7yTrcqzkpOnn3nItztmxbImCduN
  Q4T1qutCR+kku5Pb+cT6HagUL5TPt/T54sc1bSsPatfrJPbkZ99U9D3xP5njUdZ3+/qfm775q
  BbDrrm1DV12elBH8Jfzw4+fT17ph3MX929hq/eN0/z9t0jr9D06XQXUEVB5fXWTRx/7gi/11p
  W3Ug/0clluKMREMt5qLiRADKqd82WwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1630917984!255449!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8761 invoked from network); 6 Sep 2021 08:46:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 08:46:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1868kOjW022149
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 09:46:24 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 09:46:23 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210815 -> 5.9.20210905
Date: Sun, 5 Sep 2021 13:56:52 +0800
Message-ID: <1630821412-49048-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Units, docs(web): add cases for testing direction flags of langdef
option.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210815.0.bb => ctags_5.9.20210905.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210815.0.bb => ctags_5.9.20210905.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
index 1d8a7ecf6f..3289436fa2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "24f852441bb12e2cfe4f6066bf85827b934e1469"
+SRCREV = "ca81123303640582358ce7b8a4e466615950a1f7"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

