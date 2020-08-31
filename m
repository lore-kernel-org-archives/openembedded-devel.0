Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.48196.1598857431601014431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdr4-0006cW-AA; Mon, 31 Aug 2020 10:03:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-ipython: Upgrade 7.17.0 -> 7.18.1
Date: Mon, 31 Aug 2020 10:03:15 +0300
Message-Id: <20200831070318.6573-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.18.1:

- CRLF is now handled by magics my default; solving some issues
  due to copy pasting on windows.
- Requiring pexpect >=4.3 as we are Python 3.7+ only and earlier
  version of pexpect will be incompatible.
- Minimum jedi version is now 0.16.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.17.0.bb => python3-ipython_7.18.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.17.0.bb => python3-ipython_7.18.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
index ddcddd60b..8ee92167d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[md5sum] = "1f2257d771de9d2fb40d9e3cfcea429d"
-SRC_URI[sha256sum] = "b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28"
+SRC_URI[md5sum] = "f2db1158dc40d70a31b6bbef86e74789"
+SRC_URI[sha256sum] = "a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

