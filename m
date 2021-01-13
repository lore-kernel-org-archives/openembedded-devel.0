Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8718.1610548000802916537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6d-0000Li-7Z; Wed, 13 Jan 2021 16:26:39 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-wheel: Upgrade 0.35.1 -> 0.36.2
Date: Wed, 13 Jan 2021 16:26:25 +0200
Message-Id: <20210113142626.27599-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.36.2:

- Updated vendored packaging library to v20.8
- Fixed wheel sdist missing LICENSE.txt
- Don't use default macos/arm64 deployment target in calculating
  the platform tag for fat binaries

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wheel_0.35.1.bb => python3-wheel_0.36.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.35.1.bb => python3-wheel_0.36.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
index b4e77ea84..9d9a441c0 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "7ec7c435cc73eefebd9f0af43c120044"
-SRC_URI[sha256sum] = "99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f"
+SRC_URI[sha256sum] = "e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

