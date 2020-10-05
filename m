Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.32826.1601898573625340225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44260 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPOzg-0000GP-IT; Mon, 05 Oct 2020 14:49:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-nocasedict: Upgrade 1.0.0 -> 1.0.1
Date: Mon,  5 Oct 2020 14:49:19 +0300
Message-Id: <20201005114923.11799-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.1:

- Test: Fixed issue with virtualenv raising AttributeError during
  installtest on Python 3.4.
- Fixed UserWarning about unpreserved order of input items.
- Added checking for no expected warning. Adjusted a testcase to
  accomodate the new check.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-nocasedict_1.0.0.bb => python3-nocasedict_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.0.bb => python3-nocasedict_1.0.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
index dae1ebf30d..af5da52f68 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[md5sum] = "14b405bf7ffe9d0f784aa9c3c39e277b"
-SRC_URI[sha256sum] = "22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04"
+SRC_URI[md5sum] = "93e7f19f73c7cd56c36cd7535b6b9ab1"
+SRC_URI[sha256sum] = "6e5d5bd11de33f93d22545d9ed23a0b98f840f2cdac0d749d2faa4617adc7772"
 
 inherit pypi setuptools3
-- 
2.17.1

