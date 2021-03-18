Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.6508.1616058518417331731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 7F/80-49021-49813506; Thu, 18 Mar 2021 09:08:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1Z0iEZx
  g0HBfzOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfh+ZDNbwWvOiqsvelkbGJs5uxi5OIQEtjBJ
  bJu6iRXCOcEo8eXzeqYuRk4ONgF9iYb3r5hBbBEge+nsPWC2sICnxNzZ91lAbBYBVYnpbatYQ
  WxeoPj1dWfBeiUEFCSmPHzPDBEXlDg58wlYPbOAhMTBFy+YIWoUJbbvPAMU5wCyqySOzFSbwM
  gzC0nHLCQdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamukaGRrrJVbpJumlluqWpxaX6Br
  qJZYX6xVX5ibnpOjlpZZsYgSGUUrBkas7GLvffNA7xCjJwaQkyvuXPzhBiC8pP6UyI7E4I76o
  NCe1+BCjDAeHkgSvmThQTrAoNT21Ii0zBxjSMGkJDh4lEd5skDRvcUFibnFmOkTqFKOilDjvS
  TGghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzVoOM58nMK4Gb/gpoMR
  PQ4gj+IJDFJYkIKakGpjbno1Jf+Y94/PTtL9z4syfLuCmydV+xvO15qekCR6X+TZm9UP7Vc2m
  1412nuo1CPzxcLjjV9XV+mUfU9AdMrJutD55tYBLjqI572vK31WJFuTrDtDlvytV9Z8icSQg/
  le3hopS/z+5Epo+jYePmQHHTyQf3fFlTu+JwnoFDECdT+5mV+/743NE5W/Du5DPTUwXp19hCZ
  KplOPet/8AQyL3wKae4rcWT/jbX0uWLY17uvnNroq2al3aOpZrs2qny/g+YV62tXyNRXPSLNT
  G9Y4bl2drjE/443o61ryn4UxJ5u3fFrKbTs3i59LdYCWtMf91REmHyfHHl/Ksz5l1b3LuLlSO
  Xu3W+kvSj+YfrlViKMxINtZiLihMBSYVxNx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-46.tower-287.messagelabs.com!1616058515!16285!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29030 invoked from network); 18 Mar 2021 09:08:36 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-46.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:08:36 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I98ZpP026153
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:08:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:08:34 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.8 -> 2.0.9
Date: Fri, 19 Mar 2021 05:08:28 +0800
Message-ID: <1616101708-4737-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.8.bb => mosquitto_2.0.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.8.bb => mosquitto_2.0.9.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
index 03a829fc87..97a380117e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "542c30f32c4473b7c50dc2e4a1424cf6"
-SRC_URI[sha256sum] = "b15da8fc4edcb91d554e1259e220ea0173ef639ceaa4b465e06feb7e125b84bf"
+SRC_URI[md5sum] = "b77cee4ee6f0d32ca8816a58167e8b1d"
+SRC_URI[sha256sum] = "1b8553ef64a1cf5e4f4cfbe098330ae612adccd3d37f35b2db6f6fab501b01d4"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

