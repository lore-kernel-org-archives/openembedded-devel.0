Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14832.1611077878126023475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux2-0001eq-Nw; Tue, 19 Jan 2021 19:37:57 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-cheetah: Upgrade 3.2.5 -> 3.2.6
Date: Tue, 19 Jan 2021 19:37:40 +0200
Message-Id: <20210119173746.24694-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.6:

- Fixed use of uninitialized variable in _namemapper

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cheetah_3.2.5.bb => python3-cheetah_3.2.6.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.5.bb => python3-cheetah_3.2.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
index 6fa088f59..a7e5443f2 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
@@ -11,5 +11,4 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "fc735d4ca7997df2a2da1cae0cf89a1e"
-SRC_URI[sha256sum] = "ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1"
+SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
-- 
2.17.1

