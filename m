Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.4386.1613084808483591030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 15:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11BN6ZQG003428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 15:06:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Feb 2021 15:06:41 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Feb 2021 15:06:41 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-session: increase ALTERNATIVE_PRIORITY
Date: Thu, 11 Feb 2021 18:06:40 -0500
Message-ID: <20210211230640.38804-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

xfce4-session provides x-session-manager. It is also provided by
matchbox-session with the same priority resulting in a conflict.

Increase priority of x-session-manager provided by xfce4-session
to resolve conflict and and give precedence to xfce4-session.
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
index 36b5bc2d0..4f6bde2a9 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "22f273f212481d71e0b5618c62710cd85f69aea74f5ea5c0093f7918b0
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-ALTERNATIVE_PRIORITY_${PN} = "100"
+ALTERNATIVE_PRIORITY_${PN} = "150"
 
 FILES_${PN} += " \
     ${libdir}/xfce4/*/*/*.so \
-- 
2.29.2

