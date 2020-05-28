Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13403.1590676582334796974
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 07:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57850 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jeJds-0003xq-77; Thu, 28 May 2020 17:36:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-imageio: Upgrade 2.6.0 -> 2.8.0
Date: Thu, 28 May 2020 17:36:10 +0300
Message-Id: <20200528143610.30650-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528143610.30650-1-leon.anavi@konsulko.com>
References: <20200528143610.30650-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.8.0 and get the source from pypi.org.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-imageio_2.6.0.bb => python3-imageio_2.8.0.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.6.0.bb => python3-imageio_2.8.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
index 8fe4b988d..9ca30f424 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
@@ -3,12 +3,12 @@ write a wide range of image data, including animated images, video, \
 volumetric data, and scientific formats."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8b7fdd0dff0fd18f35c05365d3d7bf7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI = "git://github.com/imageio/imageio.git;protocol=https"
-SRCREV = "0b161649b3ee108f80bd99466aeab2e65cf82cd8"
-S = "${WORKDIR}/git"
 
-inherit setuptools3
+SRC_URI[md5sum] = "1e270dbf24c0390c2f4e3e4120904ac0"
+SRC_URI[sha256sum] = "fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} = "python3-numpy python3-pillow"
-- 
2.17.1

