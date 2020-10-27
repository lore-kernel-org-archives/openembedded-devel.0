Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.12227.1603795223612541299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXMOs-0001vr-CT; Tue, 27 Oct 2020 12:40:23 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-sh: Upgrade 1.14.0 -> 1.14.1
Date: Tue, 27 Oct 2020 12:40:13 +0200
Message-Id: <20201027104013.11394-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027104013.11394-1-leon.anavi@konsulko.com>
References: <20201027104013.11394-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.1:

- bugfix where setting _ok_code to not include 0, but 0 was the
  exit code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_1.14.0.bb => python3-sh_1.14.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.0.bb => python3-sh_1.14.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
index 7724f4be08..c7b50c21a4 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[md5sum] = "4cbbcb85c081d78f4b0f00d634db9bb9"
-SRC_URI[sha256sum] = "05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59"
+SRC_URI[md5sum] = "50fc0a2953930ed8d0f6570835e88abf"
+SRC_URI[sha256sum] = "39aa9af22f6558a0c5d132881cf43e34828ca03e4ae11114852ca6a55c7c1d8e"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.17.1

