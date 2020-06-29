Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9626.1593393105059224755
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 18:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95451769"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 09:11:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D55840925DD
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2020 09:01:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 09:11:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-gnome] [PATCH 2/2] tracker: Fix build error when enable multilib.
Date: Mon, 29 Jun 2020 09:11:33 +0800
Message-ID: <1593393093-49829-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2D55840925DD.A5460
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

ERROR: tracker-2.3.4-r0 do_package: QA Issue: tracker: Files/directories
were installed but not shipped in any package:
  /usr/lib64/systemd
  /usr/lib64/systemd/user
  /usr/lib64/systemd/user/tracker-store.service

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
index ae90771..b36e66b 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
@@ -41,7 +41,9 @@ do_write_config_append() {
     echo "sqlite3_has_fts5 = '${@bb.utils.contains('PACKAGECONFIG', 'fts', 'true', 'false', d)}'" >> ${WORKDIR}/meson-tracker.cross
 }
 
-EXTRA_OEMESON = "--cross-file ${WORKDIR}/meson-tracker.cross"
+EXTRA_OEMESON = "--cross-file ${WORKDIR}/meson-tracker.cross \
+                 -Dsystemd_user_services=${systemd_user_unitdir} \
+"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
1.8.3.1



