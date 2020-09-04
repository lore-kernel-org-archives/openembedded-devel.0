Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.28813.1599182651642751701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 18:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,387,1592841600"; 
   d="scan'208";a="98892031"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Sep 2020 09:24:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 894A148990DE
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2020 09:24:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Sep 2020 09:24:03 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] purple-skypeweb: upgrade 1.6 -> 1.7
Date: Fri, 4 Sep 2020 21:23:58 +0800
Message-ID: <1599225840-4801-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 894A148990DE.A3325
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
index eacd4abc0..277d12057 100644
--- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
+++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "pidgin json-glib glib-2.0 zlib"
 inherit pkgconfig
 
 SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
-SRCREV = "77f94b55bfb8b0dbc7fafa7461057d33b6802236"
+SRCREV = "b226d1c457d73900ae89b8a7469247fbe33677a6"
 
 S = "${WORKDIR}/git"
-PV = "1.6+git${SRCPV}"
+PV = "1.7+git${SRCPV}"
 
 do_compile() {
     oe_runmake -C skypeweb;
-- 
2.25.1



