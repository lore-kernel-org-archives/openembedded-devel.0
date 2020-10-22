Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10995.1603376280469383033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 07:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45090 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVbPg-0002Yk-Rk; Thu, 22 Oct 2020 17:17:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-traitlets: Upgrade 5.0.4 -> 5.0.5
Date: Thu, 22 Oct 2020 17:17:47 +0300
Message-Id: <20201022141749.14950-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.5:

- Support deprecated literals for sets, tuples on the command-line:
  nbconvert --TagRemovePreprocessor.remove_cell_tags='{"tag"}'
- Fix from_string_list for Tuples in general
- Fix support for List(default_value=None, allow_none=True) and
  other Container traits
- Fix help output for nested aliases and tuple traits

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.0.4.bb => python3-traitlets_5.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.4.bb => python3-traitlets_5.0.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
index 194193f63e..53451cd3ce 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "592dde72b6b706d09ea624cce9af3cf5"
-SRC_URI[sha256sum] = "86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b"
+SRC_URI[md5sum] = "2ffe54aee5d0d87890127dd28ce3f6c4"
+SRC_URI[sha256sum] = "178f4ce988f69189f7e523337a3e11d91c786ded9360174a3d9ca83e79bc5396"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.17.1

