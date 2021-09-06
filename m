Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.16860.1630890749598171596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DiBPtGDW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630890747; i=@fujitsu.com;
	bh=wPK1I8qWMv2TmJbWqweFQEkINDe/nbC79r4YXmwE/Mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DiBPtGDW2BLM9C+FpmT+GYJLcC2CQ+MOFIo96YlA1AQ8c8Hr/+IFzHgNol2NK3J39
	 A0wR2ILEWXas6UAjpHQRk4FhGtdaMojg4XcqlXFZM9GGcGnMMK/h1oD8VHBEOHF5iP
	 UOs5Ae8sJ0t0yWip8xtxJMl5fX93C9XA9r2ewkJVL8UAUhlf/V/YEamdm3Cu8TD8Er
	 w2WsPWgeTs+vWlWJNjD95OMKZ0freQj+O+dzHOg+MXrBWNYdOM5lxT/y0TNSaBN34X
	 IjR+4lMA/W4GhXnrrQiDRecN2X0RTyqJNWzuTCzcOgU164LyDI/QmaeSoGaxWsS1Mz
	 aK28XhYhADJPA==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id B2/DF-21838-AFA65316; Mon, 06 Sep 2021 01:12:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRovsryzT
  RYOEpAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP5v23sBTc5K+Y0fWVvYPzM0cXIxSEkMItJ
  4urtK+wQznFGiQM7HzJ1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D1ADB4ewgKvEn
  AO1IGEWoPCOnRAlvAJOEq9mz2MHsSUEFCSmPHwPFucUcJbYOHEaI4gtBFSz7+57Foh6QYmTM5
  +wQIyXkDj44gUzRK+ixOzLzSwQdoXErFltTBMY+WchaZmFpGUBI9MqRoukosz0jJLcxMwcXUM
  DA11DQyNdQ0sLXUNjA73EKt0kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwHBMKTjWtIPx
  5OsPeocYJTmYlER5NexME4X4kvJTKjMSizPii0pzUosPMcpwcChJ8JalA+UEi1LTUyvSMnOAs
  QGTluDgURLhvZQJlOYtLkjMLc5Mh0idYlSUEuc9AJIQAElklObBtcHi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd7WeKApPJl5JXDTXwEtZgJa3PbQBGRxSSJCSqqBif1Cs3t2pehMGc6
  b6ffnuT/cumfZ9v+nAg4pnFPbG2pT/L85LEipaMl/yQzHmj8Kqw8YKN/41fP78//0CpWZZyZ7
  ynXf3LtJ4OffI6z7bS8/Ub7tEhgrs859calCyefbH84canz84n/WNPv5BkeWXvE8Oqf+yvoqw
  4XTVrGXHovdJhGpznpSIzx782yl3anKTpfniutNVvdYpSbWk/VQbmfnw5Pn1u2qtv/WUD3H90
  24af/3lR6fK/d+2J35ab0Q0zTrHtuAhw7T29o+i5XJuzK9S7hyLT3568otLXpbvb6nddVo2TX
  O3bqFr9smseJBm8+bHkOXlTVFORYelm6s/8042LoXzfs3V7vBY90GLiWW4oxEQy3mouJEAAmN
  t3ZCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-291.messagelabs.com!1630890745!223472!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14341 invoked from network); 6 Sep 2021 01:12:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:12:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861CNa4020658
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:12:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:12:22 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libwebsockets: upgrade 4.2.1 -> 4.2.2
Date: Mon, 6 Sep 2021 09:11:59 +0800
Message-ID: <1630890720-12064-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
References: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

ss: sigv4: disable ctest until new auth available

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libwebsockets_4.2.1.bb => libwebsockets_4.2.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.2.1.bb => libwebsockets_4.2.2.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 8601a2c042..a5fcb8d72d 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c8bea43a2eb5d713c338819a0be07797"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "8a580b59b23d204ca72028370e97a8f6aa0c9202"
+SRCREV = "8d605f0649ed1ab6d27a443c7688598ea21fdb75"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
-- 
2.25.1

