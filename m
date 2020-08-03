Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7797.1596448705350065032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 02:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40162 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2XEe-0003NX-92; Mon, 03 Aug 2020 12:58:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-isort: Upgrade 5.1.4 -> 5.2.2
Date: Mon,  3 Aug 2020 12:57:59 +0300
Message-Id: <20200803095759.9591-5-leon.anavi@konsulko.com>
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

Upgrade to release 5.2.2:

- Fixed #1356: return status when arguments are passed in without
  files or a content stream.
- Update precommit to default to filtering files that are defined
  in skip.
- Improved relative path detection for skip config usage.
- Added recursive symbolic link protection.
- Implemented #1177: Support for color output using --color.
- Implemented recursive symlink detection support.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.1.4.bb => python3-isort_5.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.1.4.bb => python3-isort_5.2.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
index 59ff2ffe1..4aa3a8838 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "64d552bbcef48219572cc39649c48fbd"
-SRC_URI[sha256sum] = "145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c"
+SRC_URI[md5sum] = "2e501eacbf110d1e2c524590b183d339"
+SRC_URI[sha256sum] = "96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

