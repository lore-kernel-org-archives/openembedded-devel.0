Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2467.1631674302014438267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 19:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k3hBqLOf;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631674300; i=@fujitsu.com;
	bh=uXfU4eEAPSTPdB1seAf1mr+rBBi/r34lfnm16tql10w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=k3hBqLOfZF0rCPNF/swWqXhSc9o55zEBAxrXpjrT5ik3WJNVFWCsoUUM3mpKMZRzL
	 OODT9/8b5vo7mRohwjruL1+VeEW3sZU8Q1T29MDLcQvfIl35CazVmgXX89U3k7SdBR
	 oVXX+ffl+PxRkr7Zl2zH86I9TdmuEuZcY9xzgPCxFMesAmCA3u44Taked8oHM4hYil
	 4Zj/eHQek7mA04kAqpwiCtaHIqI7jVWGe/pPf0WwfybjVqrLXI6Z45oH+HmhHnI88i
	 FDGS8yFcKB9eLDlZgiXnZL23NsaNRXNki0fPGAad7XPHP+SOT9XEpEWJ/Zm4WC9Nlr
	 r3OwW094Y+bVQ==
Received: from [100.112.192.69] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 36/31-08194-BBF51416; Wed, 15 Sep 2021 02:51:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRXd3vGO
  iQeMaZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePStydMBe+5K2ZcWMfUwHiBq4uRi0NIYDaT
  xOOjOxkhnD2MElte3GLrYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBSYvf1q2A1LAKqEpcWT
  gCL8wp4SExe9IIVxJYQUJCY8vA9VFxQ4uTMJywgNrOAhMTBFy+A4hxANYoSs6fLQ5RXSLw+fI
  l5AiPPLCQds5B0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoCcRGZnqJVbqJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgWGUUnCgbgfjg9cf9A4xSnIwKYny+gQ7JgrxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4NWLA8oJFqWmp1akZeYAQxomLcHBoyTCqwWS5i0uSMwtzkyHSJ1i1OW4f
  H3eImYhlrz8vFQpcd4LIEUCIEUZpXlwI2DxdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO
  9zkCk8mXklcJteAR3BBHTEkf0OIEeUJCKkpBqYHvl3nznC5S+xWNX36tH6aQrrKybxRXyQsWT
  nfzk5e1GIp8Qxlymf+tm3zq/cxnHq0Dbd2lMrzfpay+o+B677u3vuVKtJbQ81pyhrOHdarNsZ
  p+I8W0Pn1Gzu3ukuAu3u04SLJbY7md9LNpuw80euRWeBwdG7XU9vst8UKZNda+zg1XHZZr75x
  QtGdrv0JYs2qtaGbTdO7qy9tuDoUs2jzD+2pAqHsz9O9NPa3f4xxSUxarkA44RnfcFX1xXvdJ
  FqDlpinqo6P3XDtJD29X6ZF+9F/TT7VntRyD18zwt7KeXZOyo2FfD3Re6ZvfalvUqKV7nGmuR
  4jad3A+pjeI/mB13LcglarSrwaK1saZ0SS3FGoqEWc1FxIgAf+PVNKgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-267.messagelabs.com!1631674299!99407!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10366 invoked from network); 15 Sep 2021 02:51:39 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Sep 2021 02:51:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18F2pdp7011510
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 03:51:39 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 03:51:37 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 367 -> 368
Date: Tue, 14 Sep 2021 08:02:09 +0800
Message-ID: <1631577729-67594-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

add DefaultOff option to RenderFont resource, as part of
the session-management feature.
add auto-scroll-lock feature (patch by add Stelios Bounanos).
update the window-size information returned via TIOCGWINSZ when
rows/columns are unchanged but the font-size changes (report by Nick Black).
improve session-management feature by saving/restoring the font settings.
update config.guess, config.sub

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_367.bb => xterm_368.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_367.bb => xterm_368.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_367.bb b/meta-oe/recipes-graphics/xorg-app/xterm_368.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_367.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_368.bb
index ee25dc872c..8f6a7ef766 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_368.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
+SRC_URI[sha256sum] = "2ff5169930b6b49ef0bafb5e1331c94f1a98c310442bba7798add821c76ae712"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1

