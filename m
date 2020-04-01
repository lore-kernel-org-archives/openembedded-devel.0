Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1215.1585723839227884934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 23:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0316odaZ011745
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 23:50:39 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 31 Mar 2020
 23:50:38 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] tftp-hpa: Use alternatives to avoid manpage conflicts
Date: Wed, 1 Apr 2020 09:49:07 +0300
Message-ID: <20200401064907.18586-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401064907.18586-1-ovidiu.panait@windriver.com>
References: <20200401064907.18586-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Fix the following manpage conflicts:
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man1/tftp.1
	But that file is already provided by package  * tftp-hpa-doc
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man8/tftpd.8
	But that file is already provided by package  * tftp-hpa-doc

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 132972b33..413950be1 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -82,10 +82,15 @@ INITSCRIPT_PACKAGES = "tftp-hpa-server"
 INITSCRIPT_NAME = "tftpd-hpa"
 INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 1 ."
 
+ALTERNATIVE_${PN}-doc = "tftpd.8 tftp.1"
+ALTERNATIVE_LINK_NAME[tftpd.8] = "${mandir}/man8/tftpd.8"
+ALTERNATIVE_LINK_NAME[tftp.1] = "${mandir}/man1/tftp.1"
+
 ALTERNATIVE_${PN} = "tftp"
 ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
 ALTERNATIVE_PRIORITY = "60"
 
+
 SYSTEMD_PACKAGES = "tftp-hpa-server"
 SYSTEMD_SERVICE_tftp-hpa-server = "tftpd-hpa.socket tftpd-hpa.service"
 SYSTEMD_AUTO_ENABLE_tftp-hpa-server = "enable"
-- 
2.17.1

