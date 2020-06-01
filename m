Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.36379.1591016754662760716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 06:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfk8X-0005Vi-HT; Mon, 01 Jun 2020 16:05:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-langtable: Upgrade 0.0.38 -> 0.0.51
Date: Mon,  1 Jun 2020 16:05:31 +0300
Message-Id: <20200601130531.27509-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200601130531.27509-1-leon.anavi@konsulko.com>
References: <20200601130531.27509-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.51.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...angtable_0.0.38.bb => python3-langtable_0.0.51.bb} | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.38.bb => python3-langtable_0.0.51.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
index eb42fe978..8340382d1 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
@@ -6,15 +6,10 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-S = "${WORKDIR}/git"
-B = "${S}"
+SRC_URI[md5sum] = "5d28198fa933dac5c037108d8f5cf3bb"
+SRC_URI[sha256sum] = "8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c"
 
-SRCREV = "35687ca957b746f153a6872139462b1443f8cad1"
-PV = "0.0.38+git${SRCPV}"
-SRC_URI = "git://github.com/mike-fabian/langtable.git;branch=master \
-"
-
-inherit setuptools3 python3native
+inherit pypi setuptools3 python3native
 
 DISTUTILS_INSTALL_ARGS += " \
     --install-data=${datadir}/langtable"
-- 
2.17.1

