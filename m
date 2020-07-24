Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3471.1595586933386120675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv35-0006km-St; Fri, 24 Jul 2020 13:35:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-matplotlib: Upgrade 3.2.2 -> 3.3.0
Date: Fri, 24 Jul 2020 13:35:15 +0300
Message-Id: <20200724103515.21420-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.0:

- Provisional API for composing semantic axes layouts from text
  or nested lists
- New Axes.sharex, Axes.sharey methods
- Turbo colormap
- colors.BoundaryNorm supports extend keyword argument
- Text color for legend labels
- Pcolor and Pcolormesh now accept shading='nearest' and 'auto'
- Allow tick formatters to be set with str or function inputs
- New Axes.axline method
- Dates use a modern epoch
- Improved font weight detection
- Axes3D no longer distorts the 3D plot to match the 2D aspect
  ratio
- More consistent toolbar behavior across backends
- Toolbar icons are now styled for dark themes
- Cursor text now uses a number of significant digits matching
  pointing precision
- Functions to compute a Path's size
- savefig() gained a backend keyword argument
- Saving SVG now supports adding metadata
- Saving PDF metadata via PGF now consistent with PDF backend
- NbAgg and WebAgg no longer use jQuery & jQuery UI

Create setup.cfg with configuration to use the copy of FreeType
installed on the system.

The line and the checksum of the license in setup.py has changed
but the license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...atplotlib_3.2.2.bb => python3-matplotlib_3.3.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.2.bb => python3-matplotlib_3.3.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
index b32177d9b..2e88efb56 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753 \
+    file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -18,8 +18,8 @@ DEPENDS = "\
     python3-pytz-native \
 "
 
-SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
-SRC_URI[sha256sum] = "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
+SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
+SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
 
 inherit pypi setuptools3 pkgconfig
 
@@ -34,4 +34,9 @@ RDEPENDS_${PN} = "\
     python3-pytz \
 "
 
+do_compile_prepend() {
+    echo [libs] > ${S}/setup.cfg
+    echo system_freetype = true >> ${S}/setup.cfg
+}
+
 BBCLASSEXTEND = "native"
-- 
2.17.1

