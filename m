Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1905.1610101707601376547
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44762 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxp0K-0000kU-L2; Fri, 08 Jan 2021 12:28:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-jsonrpcserver: Upgrade 4.1.3 -> 4.2.0
Date: Fri,  8 Jan 2021 12:28:12 +0200
Message-Id: <20210108102814.9560-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108102814.9560-1-leon.anavi@konsulko.com>
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.2.0:

- Add ability to use custom serializer and deserializer
- Add ability to use custom method name
- Deny additional parameters in json-rpc request

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-jsonrpcserver_4.1.3.bb => python3-jsonrpcserver_4.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.3.bb => python3-jsonrpcserver_4.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
index 75a0926f0..53f01f622 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
-SRC_URI[md5sum] = "e73b0bd90e99115d3f9e0ac42882c5b7"
-SRC_URI[sha256sum] = "649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a"
+SRC_URI[sha256sum] = "0c9e5b9445621138521e912016ae39b3badadd2607140dcbb0c8062934ab4854"
 
 inherit pypi setuptools3
 
-- 
2.17.1

