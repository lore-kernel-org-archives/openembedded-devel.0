Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.35617.1610378725662100810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4O-0006IU-Mg; Mon, 11 Jan 2021 17:25:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-pychromecast: Upgrade 7.7.1 -> 7.7.2
Date: Mon, 11 Jan 2021 17:25:05 +0200
Message-Id: <20210111152512.23506-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.7.2:

- Use urllib.request instead of requests
- docs: fix simple typo, neeeded -> needed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pychromecast_7.7.1.bb => python3-pychromecast_7.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.1.bb => python3-pychromecast_7.7.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
index ca55740ba..c0ff58cfd 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26"
+SRC_URI[sha256sum] = "aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

