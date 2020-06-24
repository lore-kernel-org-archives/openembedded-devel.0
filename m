Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12089.1593000990602948759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 05:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47508 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo4KL-0001BW-CO; Wed, 24 Jun 2020 15:16:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] lirc: Add python3 to the run-time dependencies
Date: Wed, 24 Jun 2020 15:16:17 +0300
Message-Id: <20200624121617.1816-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add python3 to the run-time dependencies to fix the following
issue with lircd-setup:

env: can't execute 'python3': No such file or directory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index 52d6adb56..2843cdf95 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -82,7 +82,7 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-contrib ${PN}-exec ${PN}-plugins ${PN}-python"
 
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash python3"
 RDEPENDS_${PN}-exec = "${PN}"
 RDEPENDS_${PN}-python = "python3-shell python3-pyyaml python3-datetime python3-netclient python3-stringold"
 
-- 
2.17.1

