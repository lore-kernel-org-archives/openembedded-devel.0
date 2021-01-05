Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6673.1609859820716145748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4q-0007qz-8b; Tue, 05 Jan 2021 17:16:53 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-pychromecast: Upgrade 7.6.0 -> 7.7.1
Date: Tue,  5 Jan 2021 17:16:35 +0200
Message-Id: <20210105151638.15700-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.7.1:

- Update local http API, re-add get_multizone_status
- Don't throw if socket is already closed when cleaning up

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pychromecast_7.6.0.bb => python3-pychromecast_7.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.6.0.bb => python3-pychromecast_7.7.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
index 52803744f9..ca55740ba7 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255"
+SRC_URI[sha256sum] = "d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

