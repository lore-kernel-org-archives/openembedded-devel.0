Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9154.1600160602314471007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rw-0007I7-74; Tue, 15 Sep 2020 12:03:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-matplotlib: Upgrade 3.3.1 -> 3.3.2
Date: Tue, 15 Sep 2020 12:03:01 +0300
Message-Id: <20200915090303.14367-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 3.3.2:

- fix Axis scale on twinned Axes
- fix auto-close of Figures in nbagg
- fix automatic title placement if Axes is off the Figure
- fix autoranging of log scales with barstacked histogram
- fix extra redraws when using Button or TextBox widgets
- fix imshow with LogNorm and large vmin/vmax ranges
- fix plotting Pandas DataFrame with string MultiIndex
- fix scatter with marker=''
- fix scatter3d color/linewidth re-projection
- fix state of mode buttons in TkAgg backends
- include license files in built distribution
- reduce Visual C++ runtime requirements on Windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-matplotlib_3.3.1.bb => python3-matplotlib_3.3.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.1.bb => python3-matplotlib_3.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index 6273ee2f2..a2e7074d7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353 \
+    file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -19,8 +19,8 @@ DEPENDS = "\
     python3-certifi-native \
 "
 
-SRC_URI[md5sum] = "f3a405f340be5b151cb2042c4d8d16f7"
-SRC_URI[sha256sum] = "87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e"
+SRC_URI[md5sum] = "a85791908e78818bd425ba9ab38500fa"
+SRC_URI[sha256sum] = "3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.17.1

