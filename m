Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41345.1597663752398489065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dK7-000361-7B; Mon, 17 Aug 2020 14:29:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-matplotlib: Upgrade 3.3.0 -> 3.3.1
Date: Mon, 17 Aug 2020 14:28:52 +0300
Message-Id: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.1 that contains several critical bug-fixes:

- fix docstring import issues when running Python with
  optimization
- fix hist with categorical data, such as with Pandas
- fix install on BSD systems
- fix nbagg compatibility with Chrome 84+
- fix ordering of scatter marker size in 3D plots
- fix performance regression when plotting Paths
- fix reading from URL in imread
- fix several regressions with new date epoch handling
- fix some bad constrained and tight layout interactions
  with colorbars
- fix use of customized toolbars in TkAgg and WXAgg backends

Add the native recipe for python3-certifi to DEPENDS.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-matplotlib_3.3.0.bb => python3-matplotlib_3.3.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.0.bb => python3-matplotlib_3.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
index bc2054a4d..6273ee2f2 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
@@ -16,10 +16,11 @@ DEPENDS = "\
     python3-numpy-native \
     python3-dateutil-native \
     python3-pytz-native \
+    python3-certifi-native \
 "
 
-SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
-SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
+SRC_URI[md5sum] = "f3a405f340be5b151cb2042c4d8d16f7"
+SRC_URI[sha256sum] = "87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.17.1

