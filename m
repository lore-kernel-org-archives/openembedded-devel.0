Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2709.1623715966619440562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 17:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: ito-yuichi@fujitsu.com)
IronPort-SDR: bWx8/T/EEkUOkbWclT6k77KcnpEqmWT4l5VMBHvhHt9IcIPT7g/nUzPNEEKFXGq9ImVNGPA5S4
 PieuW6SXXz+iJxMslTVpEnjFmbw1kW3WJ1dB7KJeSdeN1uZVEaVjbHjTnSH+DsgaflRQXhtsy7
 +SNo4gC0Y8Xd1yVB/zPdeuPY+SUXfWe0u/7gJGH0r7XY9LmB9no4v4VXoWVKPkIonv0Lb1vYRy
 EK0hbISevnNVhCUs4F1l28Eg5H382BbovqQmUaCj8Jp2JtEC1NiqFODFpjOEYGo9UXOGVmnTuJ
 ZZs=
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="11931604"
X-IronPort-AV: E=Sophos;i="5.83,273,1616425200"; 
   d="scan'208";a="11931604"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 15 Jun 2021 09:12:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A614A80C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 09:12:43 +0900 (JST)
Received: from oym-om4.fujitsu.com (oym-om4.o.css.fujitsu.com [10.85.58.164])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75270E37C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 09:12:42 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by oym-om4.fujitsu.com (Postfix) with ESMTP id 400AA4007FE51
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 09:12:42 +0900 (JST)
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] dovecot: add CVE-2016-4983 to allowlist
Date: Tue, 15 Jun 2021 09:12:40 +0900
Message-Id: <20210615001240.797048-1-ito-yuichi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

CVE-2016-4983 affects only postinstall script on specific distribution, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 19ba2b1fc..26b4f5ee8 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -72,3 +72,6 @@ FILES_${PN} += "${libdir}/dovecot/*plugin.so \
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
+
+# CVE-2016-4983 affects only postinstall script on specific distribution
+CVE_CHECK_WHITELIST += "CVE-2016-4983"
-- 
2.25.1

