Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6581.1593076114943918032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNs1-0005y7-Ab; Thu, 25 Jun 2020 12:08:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/12] python3-matplotlib: Upgrade 3.2.1 -> 3.2.2
Date: Thu, 25 Jun 2020 12:07:16 +0300
Message-Id: <20200625090719.16068-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.2:

- Unit converters recognize subclasses
- imsave accepts metadata and PIL options
- cbook.normalize_kwargs
- FontProperties accepts os.PathLike
- Gouraud-shading alpha channel in PDF backend
- Kerning adjustments now use correct values
- bar3d lightsource shading
- Shifting errorbars
- Improvements in Logit scale ticker and formatter
- rcParams for axes title location and color
- 3-digit and 4-digit hex colors

The line in setup.py for determining the license has changed.
The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-matplotlib_3.2.1.bb => python3-matplotlib_3.2.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.1.bb => python3-matplotlib_3.2.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
index f6d8c53d0..b32177d9b 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=250;endline=250;md5=2a114620e4e6843aa7568d5902501753 \
+    file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -18,8 +18,8 @@ DEPENDS = "\
     python3-pytz-native \
 "
 
-SRC_URI[md5sum] = "6c018a644a88120886cc7211f7c826f0"
-SRC_URI[sha256sum] = "ffe2f9cdcea1086fc414e82f42271ecf1976700b8edd16ca9d376189c6d93aee"
+SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
+SRC_URI[sha256sum] = "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.17.1

