Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16986.1593432770481539030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseW-0001kP-CQ; Mon, 29 Jun 2020 15:12:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-jsonrpcserver: Upgrade 4.1.2 -> 4.1.3
Date: Mon, 29 Jun 2020 15:12:28 +0300
Message-Id: <20200629121233.27026-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.1.3:

- In the case of a method returning a non-serializable value,
  return a JSON-RPC error response. It was previously erroring
  server-side without responding to the client.
- Fix for Python 3.8 - ensures the same exceptions will be raised
  in 3.8 and pre-3.8.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-jsonrpcserver_4.1.2.bb => python3-jsonrpcserver_4.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.2.bb => python3-jsonrpcserver_4.1.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
index e23720c3e..98db23039 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
-SRC_URI[md5sum] = "fd4091bc19eb18579c15b97af70714eb"
-SRC_URI[sha256sum] = "73db55d1cf245ebdfb96ca05c4cce01c51b61be845a2a981f539ea1e6a4e0c4a"
+SRC_URI[md5sum] = "e73b0bd90e99115d3f9e0ac42882c5b7"
+SRC_URI[sha256sum] = "649680c293facb6ae7c3f5c8028e4623c55195db5216847e9f25f85cba2d443a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

