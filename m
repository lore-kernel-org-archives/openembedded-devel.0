Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6768.1594372264681675166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 02:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06A9B3op013455
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 02:11:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Jul 2020 02:10:44 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] rsyslog: get alias of syslog back
Date: Fri, 10 Jul 2020 17:07:45 +0800
Message-ID: <20200710090745.1126890-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

since upstream rsyslog commit
https://github.com/rsyslog/rsyslog/pull/4317/commits/7a671da74f78047b3fd0eb65203f045de28cec0f
, Alias=syslog.service is removed from service file, which will make
systemctl restart syslog fail since Unit syslog.service not found when
we set rsyslog to default syslog.

And upstream have change the solution about pull 4317, so during next
upgrade, we need to add our own rsyslog.service, refer
https://github.com/rgerhards/rsyslog/commit/83d5710f074b34263322cd53fa1112aafd25b985

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
index ff6699509..263a86e5c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
@@ -152,6 +152,9 @@ do_install_append() {
         install -d 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
     fi
+
+    sed -i -e "s#;Requires=syslog.socket#Requires=syslog.socket#g" ${D}${systemd_system_unitdir}/rsyslog.service
+    sed -i -e "s#;Alias=syslog.service#Alias=syslog.service#g" ${D}${systemd_system_unitdir}/rsyslog.service
 }
 
 FILES_${PN} += "${bindir}"
-- 
2.17.1

