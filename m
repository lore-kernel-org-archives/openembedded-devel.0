Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.146.1626711887050394426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 09:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34994 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m5W4S-00080h-LI; Mon, 19 Jul 2021 19:24:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pyusb: Upgrade 1.2.0 -> 1.2.1
Date: Mon, 19 Jul 2021 19:24:37 +0300
Message-Id: <20210719162438.3504-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.2.1:

- core: make Device hashable again

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyusb_1.2.0.bb => python3-pyusb_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.2.0.bb => python3-pyusb_1.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
index 777aa2bc79..30b2c6d886 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
@@ -9,7 +9,7 @@ RDEPENDS_${PN} += " \
 	python3-logging \
 "
 
-SRC_URI[sha256sum] = "d68597d2cf7df766bdf816b1a337b72ab8233c19825e170ae18714f16b838cbc"
+SRC_URI[sha256sum] = "a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d9de7b9"
 
 inherit pypi setuptools3
 
-- 
2.17.1

