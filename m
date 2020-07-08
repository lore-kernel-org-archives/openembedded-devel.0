Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7251.1594201640768767405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6ff-0007zg-6T; Wed, 08 Jul 2020 12:47:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-luma-oled: Upgrade 3.4.0 -> 3.5.0
Date: Wed,  8 Jul 2020 12:46:57 +0300
Message-Id: <20200708094659.27331-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5.0:

- Drop support for Python 2.7, only 3.5 or newer is supported now

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-oled_3.4.0.bb => python3-luma-oled_3.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.4.0.bb => python3-luma-oled_3.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
index ee3b00e7f..39bc37fda 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "2944155b2242b9d2ddeb6e139c6083b8"
-SRC_URI[sha256sum] = "2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439c01bc7c2902823889552"
+SRC_URI[md5sum] = "64436aaa7a05a205430b38d2f9a9bec7"
+SRC_URI[sha256sum] = "ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

