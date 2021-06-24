Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web09.4171.1624519505613450093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 00:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: chikazawa.akifu@fujitsu.com)
IronPort-SDR: T3jJEXWOWSosZtHk7W/+LkDXN+BGHIRT4VnMOAR8Sps8JdVX+egaSrPpWr+/84Vf6Ws9LejYhj
 dOMehTsjXpKMLxusRT5w+DTyIXlZr5PhPqId6rGkwgkOXp+CtOGJ1CePwHC2le3377VNvOz6dd
 UlOXU6N6z4GsgpaTNL9oFQtsvreLdf0cuSbycQvgHbXu826K9nxS0+Qy5N+oS4/tLAFBeN1+LT
 OIdZiG+KZdVLlAPKUznw0L6dKnkX51SXy6TQHhSxqFmjvl+h8S3vHv8/36zKtA4V3RoyFjy2At
 4sM=
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="13896232"
X-IronPort-AV: E=Sophos;i="5.83,295,1616425200"; 
   d="scan'208";a="13896232"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 24 Jun 2021 16:25:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61F9A32F7C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 16:25:02 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EDD1B4E37
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 16:25:01 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 65E424007F301
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 16:25:01 +0900 (JST)
From: "Akifumi Chikazawa" <chikazawa.akifu@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
Date: Thu, 24 Jun 2021 16:24:57 +0900
Message-Id: <20210624072457.674372-1-chikazawa.akifu@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client,
not for openvpn.

Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
index f82107dbe..646f0387a 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
 SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
 
+# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
+CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
+
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.25.1

