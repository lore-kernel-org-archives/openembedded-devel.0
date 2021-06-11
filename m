Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.5722.1623400411313155014
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 01:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: sekine.shigeki@fujitsu.com)
IronPort-SDR: looApbPBeTZTf5EXJ+AL/peMqhXAx54Lh6iOHzvmgZoGMSE4vxyrgKebzMnVt0WSLDdOd+nmxI
 sbv6WvN7FICg28TLcwexA+YowNqDEZCULBdpBTUpU1c5EEn1BlPEAekcrTBKGrXJ0kDa54vqcP
 OlUOT6N3O0kuK5IEnOVP8OJ6VeDjwI3BASwI0zp6XxUW0TAXbqDnkB7XNZpB1SZu2NXvRy4OXl
 xzDAb5QgbXsb+Hlj63MIk5ZnpIV8QZp3FO3Ug3KYKdOQTHSawgIzAaEB1Qn67KSVzhwZeaavwo
 0xA=
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="12794699"
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="12794699"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP; 11 Jun 2021 17:33:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 12F12A80C6
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:33:26 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FC28583E4B
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:33:25 +0900 (JST)
Received: from 7d162709cefb.openstacklocal (bakeccha.fct.css.fujitsu.com [10.126.195.136])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 2DCB0400D506B
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:33:25 +0900 (JST)
From: sekine.shigeki@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] add CVE-2011-2411 to allowlist
Date: Fri, 11 Jun 2021 17:32:34 +0900
Message-Id: <20210611083234.2399-1-sekine.shigeki@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

This affects only on HP NonStop Server, so add it to allowlist.

Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
index 2e0bdceab..0833a9146 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
@@ -40,6 +40,10 @@ SRC_URI[sha256sum] = "89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea6464192e2c1852
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
+
+# CVE-2011-2411 is valnerble only on HP NonStop Servers.
+CVE_CHECK_WHITELIST += "CVE-2011-2411" 
+
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-- 
2.25.1

