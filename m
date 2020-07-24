Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2935.1595584275187687562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 02:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; 
   d="scan'208";a="96851465"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 17:51:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CFEE4CE505C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 17:51:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 17:51:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] purple-skypeweb: upgrade 1.5 -> 1.6
Date: Fri, 24 Jul 2020 17:51:02 +0800
Message-ID: <1595584262-85677-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6CFEE4CE505C.A78AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
index 092e6059b8..eacd4abc0a 100644
--- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
+++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "pidgin json-glib glib-2.0 zlib"
 inherit pkgconfig
 
 SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
-SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
+SRCREV = "77f94b55bfb8b0dbc7fafa7461057d33b6802236"
 
 S = "${WORKDIR}/git"
-PV = "1.5+git${SRCPV}"
+PV = "1.6+git${SRCPV}"
 
 do_compile() {
     oe_runmake -C skypeweb;
-- 
2.25.1



