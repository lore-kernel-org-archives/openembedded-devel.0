Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1214.1585723839145484109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 23:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0316obt4001622
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 23:50:37 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 31 Mar 2020
 23:50:37 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] netkit-telnet: Use alternatives to avoid manpage conflict
Date: Wed, 1 Apr 2020 09:49:06 +0300
Message-ID: <20200401064907.18586-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix the following manpage installation conflict:
 * check_data_file_clashes: Package netkit-telnet-doc wants to install file /usr/share/man/man8/telnetd.8
   But that file is already provided by package  * inetutils-doc

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index cf9934138..ffd3b48e8 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -57,6 +57,9 @@ ALTERNATIVE_${PN} = "telnet"
 ALTERNATIVE_LINK_NAME[telnet] = "${bindir}/telnet"
 ALTERNATIVE_TARGET[telnet] = "${bindir}/telnet.${PN}"
 
+ALTERNATIVE_${PN}-doc = "telnetd.8"
+ALTERNATIVE_LINK_NAME[telnetd.8] = "${mandir}/man8/telnetd.8"
+
 SRC_URI[md5sum] = "d6beabaaf53fe6e382c42ce3faa05a36"
 SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00"
 FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
-- 
2.17.1

