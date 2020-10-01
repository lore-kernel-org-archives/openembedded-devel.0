Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7651.1601540421583135776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 01:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52088 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNtp3-0007uO-A1; Thu, 01 Oct 2020 11:20:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-isort: Upgrade 5.5.3 -> 5.5.4
Date: Thu,  1 Oct 2020 11:20:02 +0300
Message-Id: <20201001082006.21365-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.5.4:

- In rare cases isort changes the content of multiline strings
  after a yield statement.
- Support case where known_SECTION points to a section not listed
  in sections.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.5.3.bb => python3-isort_5.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.3.bb => python3-isort_5.5.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
index 00978ec59d..0c5842790f 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "5200f5b09a2a648775d0e8dbf0c0d3c8"
-SRC_URI[sha256sum] = "6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843"
+SRC_URI[md5sum] = "6b90dd55851a8ccb3a19fe2cb82cb82f"
+SRC_URI[sha256sum] = "ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

