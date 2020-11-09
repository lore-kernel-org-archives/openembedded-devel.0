Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8205.1604905931223901580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 23:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101083392"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 15:12:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 56BEF48990FB
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 15:12:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 15:12:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tmux: upgrade 3.1b -> 3.1c
Date: Mon, 9 Nov 2020 15:11:57 +0800
Message-ID: <1604905917-64071-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 56BEF48990FB.A2C2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.1b.bb => tmux_3.1c.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.1b.bb => tmux_3.1c.bb} (83%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.1b.bb b/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
similarity index 83%
rename from meta-oe/recipes-extended/tmux/tmux_3.1b.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.1c.bb
index f5078e923..7cac48eb6 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.1b.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[md5sum] = "2cdacbf06ac4980d3f5312ad23b37f9b"
-SRC_URI[sha256sum] = "d93f351d50af05a75fe6681085670c786d9504a5da2608e481c47cf5e1486db9"
+SRC_URI[md5sum] = "7301d3fa12f35051edb185496766c745"
+SRC_URI[sha256sum] = "918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 
-- 
2.25.1



