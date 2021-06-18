Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6731.1624016690463095020
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: sekine.shigeki@fujitsu.com)
IronPort-SDR: pyV+iBpm6H0FDjTtxuDGkyG/ZPt/T+cv+tYwD6AC6tvFuazcsl4hGcS5IdsEp8od1OwwBCtXRr
 2dVLqKTdNNHPx/ZOfh8WYP0tsOpgu1xUghARjg2SejI9fHXxj1+CWpu4Uub9f9WJZrEu7FdJ0k
 gPISr2azPsF/i5wiZj9pMpxUGWWi30gxgjp0TRaZrsbdvHWPyyBamFiWYqYSUWcA8O9VRZEE2/
 /gRvfa4WcoHP8F0SUF3WW9oHfwAisq61TGEGOC7EWzAHX6zcp6hx24CCj11G73echukzIY1SJv
 MHE=
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="21565944"
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="21565944"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 18 Jun 2021 20:44:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 491DF1F50C0
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 20:44:46 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84603C9CD1
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 20:44:45 +0900 (JST)
Received: from 7d162709cefb.openstacklocal (bakeccha.fct.css.fujitsu.com [10.126.195.136])
	by oym-om3.fujitsu.com (Postfix) with ESMTP id 4C317403D4E0D
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 20:44:45 +0900 (JST)
From: "Sekine Shigeki" <sekine.shigeki@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] ntp: add CVE-2016-9312 to allowlist
Date: Fri, 18 Jun 2021 20:43:45 +0900
Message-Id: <20210618114345.4555-1-sekine.shigeki@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 7e168825e..e668113c5 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -26,6 +26,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
+# CVE-2016-9312 is only for windows.
+CVE_CHECK_WHITELIST += "CVE-2016-9312"
+
 inherit autotools update-rc.d useradd systemd pkgconfig
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
-- 
2.25.1

