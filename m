Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA3CC3A5A3
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7621.1649745019956701673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hKp0fZV3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649745018; i=@fujitsu.com;
	bh=i2tniRJmbDMyzt5/tjjxqQsTohvdsIgf7Vwup5hYagI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hKp0fZV3ExHnutsp+wuaXrfN6133zqdZyYtjaBDdcHXiOSohp06ZNewFl+k4NoJlr
	 UrQ5I/+FWYJJ1QNrgeqCrf0tjiRrgABggvyHgVfgGzOs9twPosS0BdnEeiTfnCR9Eq
	 V2n9Fl31UCde+mz6N4krs8jNtFhsUsenrxhyds1Zrrm5cYt+frLcRHCS6Jo1F5B7tj
	 YQUgGYsoVJpnY7PUSD0rGkYRx5PD/bLu+Dkz0x5KbpkG4DkwK/i2+VJ2t0F2WjF2Wf
	 5mxYR9YJ8XhDw4g6DLSeWvLg3hNtcwlmovBbRQ/zZBYFmEvUQLLUmYMcKNP9maXW//
	 khIhWLHYJsK9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSbdSJjT
  JoP23qsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHjxWKmglWCFQc2XWBqYFzD38XIxSEk8IRR
  YvL/lawQzgUmiQM/+lkgnD2MEisnvwbKcHKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw87i
  C0sYC+x7e4lRhCbBSi+c+JRti5GDg5eAUeJH88MQcISAgoSUx6+B2vlFHCS+P9sJxuILQRUMu
  PbRzCbV0BQ4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNdUlFmekZJbmJmjq6hgYGuoaGprpmZrqGpqV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1
  uFivuDI3OSdFLy+1ZBMjMJhTip1m72Dc0fdT7xCjJAeTkiivAU9okhBfUn5KZUZicUZ8UWlOa
  vEhRhkODiUJXgdJoJxgUWp6akVaZg4wsmDSEhw8SiK8KlJAad7igsTc4sx0iNQpRkUpcV5daa
  CEAEgiozQPrg0WzZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNWg0zhycwrgZv+CmgxE9D
  i0G2BIItLEhFSUg1MukUTE4VWaumXr9yxq2HW2e/Xbn9rkqi58KTsaY5Ki3Zz67yeAzUx83aa
  qSblHTtu2X221rZkQ2nkqb7t23qrar05PjtNk5pxquyq/fzXUVe8tXbysdbdDNp/o/2ecuikO
  l/2+HkP9/pealCp3xHUUbnw3AQtzaNXRBYwuFRLBe2Xn6o648T33ocCDLl67Q7sGkrp69TnsP
  2e+vXHc2trhp5d36ee0ti+w6VA8FHEjrmTzx7UmBQkI/G6Ts/gfeQZexHh1MJFfUxnWkuX9eq
  LBMyq+Z/VubYz1ECru1x58i4VsYi12UlLbwr+WBhWdyhE2/mIpqnf3mvzc6bHbxEVPb9ut7yw
  VHKVVdOPOFElluKMREMt5qLiRACdP+rQYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-545.messagelabs.com!1649745017!38018!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20378 invoked from network); 12 Apr 2022 06:30:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 06:30:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 29E2210045F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:30:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1CFA91000FF
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:30:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 07:29:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] libmtp: upgrade 1.1.18 -> 1.1.19
Date: Sat, 9 Apr 2022 21:26:22 +0800
Message-ID: <1649510782-4563-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
References: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96563

License-Update: Copyright Marcus Meissner <marcus@jet.franken.de> year updated to 2018

Changelog:
==========
- Lots of USB ids added, especially Garmin devices
- use a local libusb context, not the global one
- various bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmtp/{libmtp_1.1.18.bb => libmtp_1.1.19.bb}    | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.18.bb => libmtp_1.1.19.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
index 8a27cf9b90..b4cbb792ce 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
@@ -7,11 +7,10 @@ compliant operating systems"
 SUMMARY = "libmtp is an Initiator implementation of the Media Transfer Protocol (MTP)"
 HOMEPAGE = "http://libmtp.sourceforge.net/"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=0448d3676bc0de00406af227d341a4d1 \
-    file://src/ptp.c;beginline=3;endline=22;md5=303cc4422fd549ef8689aded20434a9a \
-    file://examples/albums.c;beginline=5;endline=21;md5=84f4e55dfec49e898b7f68a828c15620 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1 \
+                    file://src/ptp.c;beginline=3;endline=22;md5=80fd2d5904c4c1f5455d8f4bf515292f \
+                    file://examples/albums.c;beginline=5;endline=21;md5=84f4e55dfec49e898b7f68a828c15620 \
+                    "
 
 BBCLASSEXTEND = "native"
 
@@ -21,8 +20,7 @@ DEPENDS:append:class-target = " ${BPN}-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch"
 
-SRC_URI[md5sum] = "7915496daa3f4ea3e095f0161f83d4d4"
-SRC_URI[sha256sum] = "7280fe50c044c818a06667f45eabca884deab3193caa8682e0b581e847a281f0"
+SRC_URI[sha256sum] = "deb4af6f63f5e71215cfa7fb961795262920b4ec6cb4b627f55b30b18aa33228"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.25.1


