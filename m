Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.12])
	by mail.openembedded.org (Postfix) with ESMTP id 035726C6B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:49:03 +0000 (UTC)
Received: from [216.82.249.147:39918] by server-12.bemta-12.messagelabs.com id
	85/F1-10790-1E998225; Thu, 05 Sep 2013 14:49:05 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-29.messagelabs.com!1378392544!28296671!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20790 invoked from network); 5 Sep 2013 14:49:05 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-2.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	5 Sep 2013 14:49:05 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 09:49:13 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Thu, 5 Sep 2013 09:49:04 -0500
Received: from log-cln-jviguera.digi.com (10.101.1.79) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.327.1; Thu, 5 Sep 2013 16:49:03 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2013 16:49:01 +0200
Message-ID: <1378392541-2166-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.4
MIME-Version: 1.0
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-oe][dylan] net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 14:49:04 -0000
Content-Type: text/plain

Use patch from master branch to fix:

snmpd.c:459: undefined reference to `netsnmp_sd_listen_fds'

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---

Notes:
    Adapted patch from Thomas Fitzsimmons in master branch (the path for
    net-snmp recipe changed).

 meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch b/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
index 18955f2..e19153b 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
@@ -7,12 +7,14 @@ fef6cddfdb94da1a6b1fb768af62918b80f11fd3
 0641e43c694c485cbbffef0556efc4641bd3ff50
 76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
 bf108d7f1354f6276fc43c129963f2c49b9fc242
+3692875172352f72cf3afd0d35f355e83d7e421b
 74412748067c685e1d8ab6ed3bcc3ca9c2774844
 86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
 63557cf8986a33dba1d4429b583a901361052c4f
 
 Upstream-Status: Backport
 
+Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
 diff --git a/README.systemd b/README.systemd
 new file mode 100644
 index 0000000..f731851
@@ -89,10 +91,10 @@ index b177d5b..08bdfc7 100644
  #endif
  
  #ifndef WIN32
-+#ifndef NETSNMP_NO_SYSYSTEMD
++#ifndef NETSNMP_NO_SYSTEMD
 +    /* check if systemd has sockets for us and don't close them */
 +    prepared_sockets = netsnmp_sd_listen_fds(0);
-+#endif /* NETSNMP_NO_SYSYSTEMD */
++#endif /* NETSNMP_NO_SYSTEMD */
 +
      /*
       * close all non-standard file descriptors we may have

