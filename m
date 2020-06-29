Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9531.1593393090937417847
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 18:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95451757"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 09:11:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BFBC24CE34D8
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2020 09:00:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 09:11:21 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-gnome][PATCH 1/2] Fix build error when enable multilib.
Date: Mon, 29 Jun 2020 09:11:16 +0800
Message-ID: <1593393076-49791-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: BFBC24CE34D8.A9C43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

ERROR: tracker-miners-2.3.3-r0 do_package: QA Issue: tracker-miners:
Files/directories were installed but not shipped in any package:
  /usr/lib64/systemd
  /usr/lib64/systemd/user
  /usr/lib64/systemd/user/tracker-extract.service
  /usr/lib64/systemd/user/tracker-writeback.service
  /usr/lib64/systemd/user/tracker-miner-fs.service

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index b40787f..e2ced39 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -60,6 +60,10 @@ PACKAGECONFIG[libseccomp] = ",,libseccomp"
 # not yet in meta-gnome
 PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
 
+EXTRA_OEMESON += " \
+    -Dsystemd_user_services=${systemd_user_unitdir} \
+"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/tracker \
-- 
1.8.3.1



