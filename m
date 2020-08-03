Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7933.1596448704767363797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 02:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40162 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2XEd-0003NX-Lo; Mon, 03 Aug 2020 12:58:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-autobahn: Upgrade 20.6.2 -> 20.7.1
Date: Mon,  3 Aug 2020 12:57:58 +0300
Message-Id: <20200803095759.9591-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803095759.9591-1-leon.anavi@konsulko.com>
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.7.1:

- new: various fixes and improvements to rlinks
- new: proxy worker management API
- fix: turn down log noise

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-autobahn_20.6.2.bb => python3-autobahn_20.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.6.2.bb => python3-autobahn_20.7.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
index 171a6dce4..29f187cf8 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[md5sum] = "bcafb42ea58232308777a265d41c1c98"
-SRC_URI[sha256sum] = "6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01"
+SRC_URI[md5sum] = "1ea21f5e751517a71f605eaaff7f0c38"
+SRC_URI[sha256sum] = "86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

