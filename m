Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2167.1617244009227891927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.7.82] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 8E/D3-14281-76F25606; Thu, 01 Apr 2021 02:26:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0U3TT00
  wOPHa1OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZjx2rxgG3fFiWutTA2M97i6GDk5hAS2Mkn8
  3yfYxcgFZO9mlFixZQ8LSIJNwEBi/9kL7CC2iIC+xNLZe5i7GDk4hAUiJDbPDgMJswioSKzZf
  JURxOYV8JaY/38mE4gtIaAgMeXhe2aIuKDEyZlPwEYyC0hIHHzxAmyMhICixOzp8hDlVRJnZ3
  9hmsDIMwtJxywkHQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6xqZGuklVukm6aWW6ian5pU
  UJQJl9RLLi/WKK3OTc1L08lJLNjECQyilkP3PDsbrrz/oHWKU5GBSEuWdMi0lQYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IE7yGt1AQhwaLU9NSKtMwcYDjDpCU4eJREeG00gNK8xQWJucWZ6RCpU
  4yKUuK8XHpACQGQREZpHlwbLIYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlQGZwpOZVw
  I3/RXQYiagxVceJYIsLklESEk1MM1/cKL8rTD3X53bWy3EjBkFTwpFLRW7pxl/bpNdaY2YX9i
  +GLMt6rxvql9HJFwq3vD+7MmC5eurp5Xfcp5rfy/+ooi13H/OtWxbt2Q3Xuovv9fSbaW7/WbI
  VQ2GGNY/qYeKUr794al94lt6ONaTce70PX1/Clc6vNkoz7+kSErbvEf2UXzeccudn479VNVUP
  fg7UWh2U6WU7PSD1vNEgh8En5jpGhz8wsCW/f3207MuXTa2MFnhrs6Tb6vH0NX479fz3YuP66
  5TO2Bm+fPa4xTW9Q1r9jIc35vPLR+uGNLPl2udafsx1cnpWJD7x2trlmy4mXznZsrMP4xRy91
  MAr5em7RewyLnnbnw5sTJe5RYijMSDbWYi4oTASsbcD8cAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1617244006!47525!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6555 invoked from network); 1 Apr 2021 02:26:46 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:26:46 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312QkH5015328
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:26:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:26:44 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
Date: Thu, 1 Apr 2021 18:58:29 +0800
Message-ID: <1617274709-49934-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ger-openvpn_1.8.12.bb => networkmanager-openvpn_1.8.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.12.bb => networkmanager-openvpn_1.8.14.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
index d455a0f06..a1a61bed1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
@@ -10,8 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e8b1210011ece18d0278310fbff45af5"
-SRC_URI[sha256sum] = "0efda8878aaf0e6eb5071a053aea5d7f9d42aac097b3ff89e7cbc9233f815318"
+SRC_URI[md5sum] = "bef67eca77bee68da703609b92f804a0"
+SRC_URI[sha256sum] = "e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1

