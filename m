Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.14326.1594624423368278237
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 00:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06D7Df9V012057
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 00:13:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Jul 2020 00:13:41 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] rsyslog: get alias of syslog back
Date: Mon, 13 Jul 2020 15:10:33 +0800
Message-ID: <20200713071033.3481557-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
index ff6699509..524cd9ead 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
@@ -152,6 +152,10 @@ do_install_append() {
         install -d 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
     fi
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        sed -i -e "s#;Requires=syslog.socket#Requires=syslog.socket#g" ${D}${systemd_system_unitdir}/rsyslog.service
+        sed -i -e "s#;Alias=syslog.service#Alias=syslog.service#g" ${D}${systemd_system_unitdir}/rsyslog.service
+    fi
 }
 
 FILES_${PN} += "${bindir}"
-- 
2.17.1

