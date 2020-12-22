Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.512.1608674263909507759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 13:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39252 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1krpey-0006qW-1A; Tue, 22 Dec 2020 23:57:42 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-gmqtt: Upgrade 0.6.8 -> 0.6.9
Date: Tue, 22 Dec 2020 23:57:26 +0200
Message-Id: <20201222215727.25166-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222215727.25166-1-leon.anavi@konsulko.com>
References: <20201222215727.25166-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.9:

- Handle unexpected errors while reconnecting
- Improve tests: Increased the time for waiting of the message

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.6.8.bb => python3-gmqtt_0.6.9.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.8.bb => python3-gmqtt_0.6.9.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
index 6219d20093..73c0ae0acf 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
-SRC_URI[sha256sum] = "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
+SRC_URI[sha256sum] = "0e98a964393834e724c93b5dce9524c9f1255c338c0d972188794f54c6559f04"
 
 inherit pypi setuptools3
 
-- 
2.17.1

