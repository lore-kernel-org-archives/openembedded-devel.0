Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2903.1617102617816678650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 04:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44720 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRCGE-0002f1-OO; Tue, 30 Mar 2021 14:10:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
Date: Tue, 30 Mar 2021 14:10:07 +0300
Message-Id: <20210330111007.2847-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330111007.2847-1-leon.anavi@konsulko.com>
References: <20210330111007.2847-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.6.post1:

- Improvement and refactoring in CI and tests with ``tox``.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
index a7e5443f2..8149d6cce 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -11,4 +11,4 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
+SRC_URI[sha256sum] = "58b5d84e5fbff6cf8e117414b3ea49ef51654c02ee887d155113c5b91d761967"
-- 
2.17.1

