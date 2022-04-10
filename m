Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E6EC38A02
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3740.1649837434207649059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i9Z2s0xN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649837432; i=@fujitsu.com;
	bh=NMbSuvqDJhkRO/MqU8U/Ru0k4190HoFmfkywrDR5zFg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i9Z2s0xN3V6GDSBoJpTYl0cd5GBVmQIawrLVRoBM72AJmUChF91ZhmLZZRDkyTbBe
	 geB13aS4vA+28DnEKspx4hBSSBjAMKBIWYaIkNpBCi8SIEGjWQyF9xeY2SYMEq+AOg
	 7qdXgwVIItChcMyByfuJntUd4Hhcco1aPao4QFf0xrGJVNMSGtT4zIH1VBmlYZh/jv
	 ods2klsDC/GL2wmFC8QIQdKaokmABeqkUpNG9Uv6F8pgUvctjbzYj742ShIkdrAaa6
	 KlKyNn4oon8yoR/dWxNAaM22SAtJgdE8VjUw1CkDiMUjpJLJ/9YTCvWCdkKn/yfntv
	 u4T7Q+6yFYNJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRolvRGpZ
  k8HMOm8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHm+k2Wgn1cFccmXGNuYFzD2cXIxSEkMJtJ
  4v7yq0wQzh5GiYcnfgM5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC9hLzP97H
  CzOIqAqMf97CyOIzSvgJDHt/UewORICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYxWiUVZaZnlOQmZuboGhoY6BoamuoaG+kamuglVukm6qW
  W6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQGWUqxAt8OxuZVP/UOMUpyMCmJ8l6vCU0S
  4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7siksSUiwKDU9tSItMwcY8DBpCQ4eJRFe9wagNG9xQ
  WJucWY6ROoUo6KUOK95C1BCACSRUZoH1waLskuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhH
  n7QKbwZOaVwE1/BbSYCWjxt1WhIItLEhFSUg1MQSwmqetbOHsmbrpweLGM8JeTNb1TioWc5hr
  8v9mmvknnYoXayUXHWk7Ya/i5S3u94p0/u9K8Nn9PhMDh5dceXpdTv/NoXjNT0fbFd10lOrqf
  peh6tTwt7T/yJp/ZWuVD+1lGlqQnBcWlN88duV6jdMkrspA3uerca3mVo3wch3t0NCas55u88
  5Lhzrfnav/ZO3QeCa3c/sdSTjd4xglGg/vZSQ93MSRt95/T23dCrW7q/trdp6Ouv1t4rn5FgV
  Rp7qfTfz7WGK1/ytKvEuP1ZN/quXOXMcivadMMs9ef9KhpVVhzsYDgP2Hv64s+338x72bHqmf
  Xtsxqj5lrbed3xrBIgeNEe59VYmDZZYNNSizFGYmGWsxFxYkA/3K5aS0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1649837431!89692!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24267 invoked from network); 13 Apr 2022 08:10:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:10:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23D8AOt6018439
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:10:31 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:10:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libvpx: upgrade 1.8.2 -> 1.11.0
Date: Sun, 10 Apr 2022 23:06:57 +0800
Message-ID: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96610

Changelog from 1.8.2 to 1.11.0:
https://chromium.googlesource.com/webm/libvpx/+/refs/heads/main/CHANGELOG

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.8.2.bb => libvpx_1.11.0.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.8.2.bb => libvpx_1.11.0.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb
index 0e12587a20..8fd4f698d7 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.11.0.bb
@@ -7,9 +7,9 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "7ec7a33a081aeeb53fed1a8d87e4cbd189152527"
-SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=master \
-            file://libvpx-configure-support-blank-prefix.patch \
+SRCREV = "626ff35955c2c35b806b3e0ecf551a1a8611cdbf"
+SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
+           file://libvpx-configure-support-blank-prefix.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


