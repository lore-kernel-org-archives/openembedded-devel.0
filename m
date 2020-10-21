Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.10264.1603278978106517031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6J-0007Sd-Iw; Wed, 21 Oct 2020 14:16:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-urllib3: Upgrade 1.25.10 -> 1.25.11
Date: Wed, 21 Oct 2020 14:16:05 +0300
Message-Id: <20201021111609.28237-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.25.11:

- Fix retry backoff time parsed from Retry-After header when given
  in the HTTP date format. The HTTP date was parsed as the local
  timezone rather than accounting for the timezone in the HTTP
  date (typically UTC)
- Fix issue where an error would be raised when the SSLKEYLOGFILE
  environment variable was set to the empty string. Now
  SSLContext.keylog_file is not set in this situation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-urllib3_1.25.10.bb => python3-urllib3_1.25.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.10.bb => python3-urllib3_1.25.11.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
index db985a2ff4..980f4c53d2 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "94e3d4d472a14e788d4bd1a903fd102b"
-SRC_URI[sha256sum] = "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
+SRC_URI[md5sum] = "d47dd21a6e66a03c3633cac468ffd010"
+SRC_URI[sha256sum] = "8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2"
 
 inherit pypi setuptools3
 
-- 
2.17.1

