Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16201.1595414959177092747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJJ-0001ZT-Lo; Wed, 22 Jul 2020 13:49:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-isort: Upgrade 5.1.0 -> 5.1.4
Date: Wed, 22 Jul 2020 13:49:01 +0300
Message-Id: <20200722104905.15499-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.4:

- Fixed issue #1333: Use of wrap_length raises an exception about
  it not being lower or equal to line_length.
- Fixed issue #1330: Ensure stdout can be stubbed dynamically for
  show_unified_diff function.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.1.0.bb => python3-isort_5.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.1.0.bb => python3-isort_5.1.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
index a57b22361..59ff2ffe1 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "9e47f58de573c3fab674a70f0512e9f7"
-SRC_URI[sha256sum] = "b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140"
+SRC_URI[md5sum] = "64d552bbcef48219572cc39649c48fbd"
+SRC_URI[sha256sum] = "145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

