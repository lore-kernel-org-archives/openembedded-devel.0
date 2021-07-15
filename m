Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.194.1626365357598249506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 09:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41550 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m43vH-0000O5-HW; Thu, 15 Jul 2021 19:09:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-texttable: Upgrade 1.6.3 -> 1.6.4
Date: Thu, 15 Jul 2021 19:09:05 +0300
Message-Id: <20210715160906.26266-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210715160906.26266-1-leon.anavi@konsulko.com>
References: <20210715160906.26266-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.4:

- Fix alignment bug when deco is modified

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-texttable_1.6.3.bb => python3-texttable_1.6.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.6.3.bb => python3-texttable_1.6.4.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb
index 03ebd010e0..6916a72d34 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "68e6b31d36f5c20221da7d5db3eca772"
-SRC_URI[sha256sum] = "ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436"
+SRC_URI[sha256sum] = "42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

