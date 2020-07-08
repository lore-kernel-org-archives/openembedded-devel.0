Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7295.1594201635569017735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6fa-0007zg-1e; Wed, 08 Jul 2020 12:47:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-imageio: Upgrade 2.8.0 -> 2.9.0
Date: Wed,  8 Jul 2020 12:46:54 +0300
Message-Id: <20200708094659.27331-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.9.0:

- More robust loading of FEI SEM data.
- Fix webcam not working on Win10.
- Add a few standard images useful to 3D visualization.
- The timeout used in HTTP requests can now be set with an
  environment variable.
- The DICOM plugin can now used gdcm for compressed transfer
  formats.
- Better support for itk/sitk plugins.
- Test coverage and CI for ARM.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.8.0.bb => python3-imageio_2.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.8.0.bb => python3-imageio_2.9.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
index 9ca30f424..fbe5e2c97 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
@@ -6,8 +6,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[md5sum] = "1e270dbf24c0390c2f4e3e4120904ac0"
-SRC_URI[sha256sum] = "fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf"
+SRC_URI[md5sum] = "d22757338542e3742a335cea6210e419"
+SRC_URI[sha256sum] = "52ddbaeca2dccf53ba2d6dec5676ca7bc3b2403ef8b37f7da78b7654bb3e10f0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

