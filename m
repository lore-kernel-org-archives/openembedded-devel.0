Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.191368.1598260509368597105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37652 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kA8ZH-0005wO-Ot; Mon, 24 Aug 2020 12:15:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-networkx: Upgrade 2.4 -> 2.5
Date: Mon, 24 Aug 2020 12:14:56 +0300
Message-Id: <20200824091457.3360-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824091457.3360-1-leon.anavi@konsulko.com>
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5:

- Dropped support for Python 3.5.
- Add Pathlib support to work with files.
- Improve performance.
- Updated docs and tests.
- Removed code designed to work with Python 2.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.4.bb => python3-networkx_2.5.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.4.bb => python3-networkx_2.5.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-networkx_2.4.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.5.bb
index 5708e35b5..70573828b 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728"
 
-SRC_URI[md5sum] = "63e3fdc9d3a46bcabc776acc5ea5fe48"
-SRC_URI[sha256sum] = "f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64"
+SRC_URI[md5sum] = "21f25be1f4373e19153a9beca63346e7"
+SRC_URI[sha256sum] = "7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602"
 
 inherit pypi setuptools3
 
-- 
2.17.1

