Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A495C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:03:27 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web11.7379.1637593405762647802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o9tk1hVp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593398; i=@fujitsu.com;
	bh=6C29BimMO8d8rY5Shjk5PByLo5Ib77lBfiuht0RJgaQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o9tk1hVpEpexwogglGOJ1+ESb/Ge/D98l6tfgNhPOdQSgqO5KgSkoZcziFocLlDJ8
	 f7MUiRkcjufue5e/91Fy9CNWc9HZVgJYSaP64uQHYzVmVT9fZ+xbxhs9xa4kEz7ou0
	 MKcDV2aOnBmykw1zDBLzWX2EoaGUCzF8Dh2u7ilD82tiYGFlgbJvIQ0AgFqEz4oOkd
	 tgswKxGgWrBz/8vmgTHSwj142GddArB+IBKmik+pPL3vnfzG4R8+j/i3y4wmw8gEJY
	 dyLoggZrm//ggfno70L9dy9GrO6KyYM1sruhzvHVGBLNY1weY3DmxWjgc8ds0ce/S7
	 M+9fMmX/X9olA==
Received: from [100.113.3.195] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 3F/29-11692-631BB916;
 Mon, 22 Nov 2021 15:03:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxRdd04+x
  Eg7eTjC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owfT/8wFeziqni49xpjA+NZzi5GLg4hgZlM
  EvNmbmWHcE4wSrw9sZ2xi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e4AaODiEBQIkf
  v6MAwmzCKhK/Dx1jQnE5hVwkth2/wmYLSGgIDHl4XtmiLigxMmZT1ggxkhIHHzxghmiRlFi9u
  VmFgi7QmLWrDamCYy8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6hrpGxmV5ilW6
  iXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwwFIKGd/sYPz6+oPeIUZJDiYlUV6j2bMT
  hfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwPl4HlBMsSk1PrUjLzAEGO0xagoNHSYTXASTNW1yQm
  FucmQ6ROsVoz/Fm7ZJFzBxt9+4CyZkLDq5m5rjffmg1sxBLXn5eqpQ478ENQG0CIG0ZpXlwQ2
  HReYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8qkCk8mXklcLtfAZ3FBHTW6ePTQc4qSUR
  ISTUwhR2RS7z9QOJLhpHiJe3YIzoP3u7Mnjjz6GO/kHsH3tTYRh9ee09xbtPcT7si9kRo7VRt
  7FvHtGP1ojPHGmz/cpxZe//Dv2rz0OmV/E/6vdZ53Lx55GHjxBfxLW/z/52pXM6svrhbVYXB+
  U1Io47Awjd//rx9pTgr0DCO+U1PsFbzvvnr1tu+8lvOs1uVb8qL47/nRG27I9h1ZuIxjht/+/
  wW6X+f6qc+p+h19PvQ7mUiK9545i/jrJi1xqP9AEu2/s6at8632oy21t0PcnXqELrGsyXnp7L
  3gZU2JwyWHvZimLrl/fwFTcaf2lVOeP6uPPA92l0010vvnEfLyQdJEyXXrmOVP13AcS700ZH4
  q/OUWIozEg21mIuKEwE91PqvSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-232.messagelabs.com!1637593397!234718!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9166 invoked from network); 22 Nov 2021 15:03:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:03:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMF3HnP005594
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:03:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:03:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libnetfilter-log: upgrade 1.0.1 ->
 1.0.2
Date: Mon, 22 Nov 2021 23:03:05 +0800
Message-ID: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:03:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94096

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
index 994825cb7e..654448a328 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
-SRCREV = "ba196a97e810746e5660fe3f57c87c0ed0f2b324"
+SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
@@ -13,3 +13,5 @@ SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+PV = "1.0.2"
-- 
2.25.1


