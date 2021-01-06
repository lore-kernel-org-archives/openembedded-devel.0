Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1144.1609970838633331514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxY-0004lA-DT; Thu, 07 Jan 2021 00:07:16 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-humanfriendly: Upgrade 8.2 -> 9.1
Date: Thu,  7 Jan 2021 00:06:55 +0200
Message-Id: <20210106220702.10483-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 9.1:

- Added on_macos() function to detect Apple MacOS
- Changed format_number() to properly support negative numbers
- Changed pluralize() to generate “1.5 seconds” instead of
  "1.5 second"
- Enhanced concatenate() to support conjunction and serial_comma
  keyword arguments
- Added pluralize_raw() to select singular or plural form without
  prefixing the count to the text that is returned

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-humanfriendly_8.2.bb => python3-humanfriendly_9.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanfriendly_8.2.bb => python3-humanfriendly_9.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
rename to meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
index 61c969d760..fb6a7e3b6d 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
 
 PYPI_PACKAGE = "humanfriendly"
 
-SRC_URI[md5sum] = "e6064a6fe099c4231c3e969ca5fea335"
-SRC_URI[sha256sum] = "bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12"
+SRC_URI[sha256sum] = "066562956639ab21ff2676d1fda0b5987e985c534fc76700a19bd54bcb81121d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

