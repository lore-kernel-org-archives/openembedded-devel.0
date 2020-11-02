Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.28889.1604311397281190959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 02:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kZWgC-0004Pi-Me; Mon, 02 Nov 2020 12:03:13 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-ipython: Upgrade 7.18.1 -> 7.19.0
Date: Mon,  2 Nov 2020 12:03:03 +0200
Message-Id: <20201102100303.2377-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102100303.2377-1-leon.anavi@konsulko.com>
References: <20201102100303.2377-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.19.0:

- Fix to restore the ability to specify more than one extension
  using command line flags when using traitlets 5.0
- Docs docs formatting that make the install commands work on zsh
- Always display the last frame in tracebacks even if hidden with
  __traceback_hide__
- Avoid an issue where a callback can be registered multiple times.
- Avoid an issue in debugger mode where frames changes could be
  lost.
- Never hide the frames that invoke a debugger, even if marked as
  hidden by __traceback_hide__
- Fix calling the debugger in a recursive manner

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.18.1.bb => python3-ipython_7.19.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.18.1.bb => python3-ipython_7.19.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
index 8ee92167d7..d3ce9f5ff4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[md5sum] = "f2db1158dc40d70a31b6bbef86e74789"
-SRC_URI[sha256sum] = "a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e"
+SRC_URI[md5sum] = "33bdc8287c827aae23699751b0ed3f7a"
+SRC_URI[sha256sum] = "cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

