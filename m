Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4383.1624520493707014861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: jp.fujitsu.com, ip: 68.232.139.139, mailfrom: ambai.masaki@jp.fujitsu.com)
IronPort-SDR: eFmFUTTo0yxhVfCTEcTfrYZJsCVHaG8XG5PD2tRWMzTQpghaz2IEJlcy04xLXmUwByRXGTLYtu
 wjafastmCn0TPJ9EbKs0fbZ1rN8LqYhFDIoxzcEBPT1vMzLOc6/lnAueGzzIAPfX6AFz762MPt
 FeZe/2C0XjLlMT/X2YH+yJyrWZaUsxZcbO87QjUja4PiAnQD0dWjQpfiBahe2gifrJN4bTFaAN
 aZlfN2qq4lvy1pcgOyBeg7CEx2434NU51Y9mbpgks/4t4AzdHji8mohU4QVzoobH8HiLAbFupp
 Q+4=
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="34309029"
X-IronPort-AV: E=Sophos;i="5.83,296,1616425200"; 
   d="scan'208";a="34309029"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 24 Jun 2021 16:41:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AF30147F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 16:41:30 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C13501C178
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 16:41:29 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om2.fujitsu.com (Postfix) with ESMTP id B4F3C400C23C8;
	Thu, 24 Jun 2021 16:41:29 +0900 (JST)
From: "ambai" <ambai.masaki@jp.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Masaki Ambai <ambai.masaki@fujitsu.com>
Subject: [PATCH] nss: add CVE-2006-5201 to allowlist
Date: Thu, 24 Jun 2021 16:41:26 +0900
Message-Id: <20210624074126.674884-1-ambai.masaki@jp.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

From: Masaki Ambai <ambai.masaki@fujitsu.com>

CVE-2006-5201 affects only using an RSA key with exponent 3 on Sun Solaris.

Signed-off-by: Masaki Ambai <ambai.masaki@fujitsu.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
index d4d7a8733..98be21d40 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -279,3 +279,6 @@ FILES_${PN}-dev = "\
 RDEPENDS_${PN}-smime = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2006-5201 affects only Sun Solaris
+CVE_CHECK_WHITELIST += "CVE-2006-5201"
-- 
2.25.1

