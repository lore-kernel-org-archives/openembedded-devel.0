Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10194.1603278977701255837
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6I-0007Sd-62; Wed, 21 Oct 2020 14:16:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-humanize: Upgrade 3.0.1 -> 3.1.0
Date: Wed, 21 Oct 2020 14:16:03 +0300
Message-Id: <20201021111609.28237-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 3.1.0:

- Declare support for Python 3.9
- testing/docs: Include doctests in testing
- Allow custom "now" in naturaldelta and naturaltime
- Represent with a zero if the delta is too small

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.0.1.bb => python3-humanize_3.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.0.1.bb => python3-humanize_3.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
index 92831bf135..43b882cb84 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[md5sum] = "53faa88dedddba1227f9c41d65440c54"
-SRC_URI[sha256sum] = "8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5"
+SRC_URI[md5sum] = "bde0a033cf200f2874e6e3fc860bed48"
+SRC_URI[sha256sum] = "fd3eb915310335c63a54d4507289ecc7b3a7454cd2c22ac5086d061a3cbfd592"
 
 inherit pypi setuptools3
 
-- 
2.17.1

