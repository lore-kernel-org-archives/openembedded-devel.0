Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web12.5566.1623735374066544822
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 22:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: hayashi.satoshi@fujitsu.com)
IronPort-SDR: ShAN2NzahAfIBAsp6XcFuEUD9cN63VZsF9C0YPmfRaZlu5V05kuILzd7kdaaSn8PT+MuTYd465
 ol2qqpmLrDLfk+rvhE2/HHIKw1mVx+mWHUbpkXxTURIHi7Xz88UsYODPUB88tugMlSeyObzTYC
 cF2igXxFCUuUAsmgJqRD5OkVUUJpdjyv3ukJyqu15kox2ej1nqt3wwri1YoAMNGRjTitdO9iiv
 1tLmj6f3YC0/w4mi0rA3cCNnSotR//B76IBcR7O8NQqPsnbvm0MSRQZSS5OMB08SzAi39z8OZK
 Z8U=
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="33149612"
X-IronPort-AV: E=Sophos;i="5.83,275,1616425200"; 
   d="scan'208";a="33149612"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP; 15 Jun 2021 14:36:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E8271DF250
	for <Openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 14:36:10 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 30EDF3273B7
	for <Openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 14:36:10 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 0F79D4007EB20
	for <Openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 14:36:10 +0900 (JST)
From: "hayashi.satoshi@fujitsu.com" <hayashi.satoshi@fujitsu.com>
To: Openembedded-devel@lists.openembedded.org
Subject: [PATCH] dracut: add CVE-2010-4176 to allowlist
Date: Tue, 15 Jun 2021 14:36:06 +0900
Message-Id: <20210615053606.855233-1-hayashi.satoshi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

CVE-2010-4176 affects only using plymouth-pretrigger.sh script on Fedora.

Signed-off-by: Satoshi Hayashi <hayashi.satoshi@fujitsu.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index ce975f5a1..4d702dc56 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -66,3 +66,6 @@ RRECOMMENDS_${PN} = " \
                      busybox \
                      coreutils \
                     "
+
+# CVE-2010-4176 affects only Fedora
+CVE_CHECK_WHITELIST += "CVE-2010-4176"
-- 
2.25.1

