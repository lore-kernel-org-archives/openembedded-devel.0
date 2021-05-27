Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6795.1622121606331809593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFva-0003sv-Qd; Thu, 27 May 2021 16:20:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-flask-restful: Upgrade 0.3.8 -> 0.3.9
Date: Thu, 27 May 2021 16:19:47 +0300
Message-Id: <20210527131952.20082-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.9:

- Compatibility with Flask 2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-flask-restful_0.3.8.bb => python3-flask-restful_0.3.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.8.bb => python3-flask-restful_0.3.9.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb
index 3de916afd..4b83158a7 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/flask-restful/flask-restful"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
 
-SRC_URI[md5sum] = "e8051ff104ab4b3b867ba18d28953fae"
-SRC_URI[sha256sum] = "5ea9a5991abf2cb69b4aac19793faac6c032300505b325687d7c305ffaa76915"
+SRC_URI[sha256sum] = "ccec650b835d48192138c85329ae03735e6ced58e9b2d9c2146d6c84c06fa53e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

