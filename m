Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8393.1598947922182753012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD1Oa-0002Vq-HW; Tue, 01 Sep 2020 11:12:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-traitlets: Upgrade 4.3.3 -> 5.0.0
Date: Tue,  1 Sep 2020 11:11:44 +0300
Message-Id: <20200901081147.13556-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901081147.13556-1-leon.anavi@konsulko.com>
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.0:

Traitlets 5.0 is a new version of traitlets that accumulate
changes over a period of more close to four years; A number of
internal refactoring made the internal code structure cleaner and
simpler, and greatly improved the diagnostic error messages as
well has help and documentation generation. Major changes:

- Removal of Python 2 support,
- Removal of Python 3.0-3.6 support
- Follow NEP 29, and are thus Python 3.7+ only.
- Remove six as a dependency
- Remove funcsig as a dependency.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-traitlets_4.3.3.bb => python3-traitlets_5.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_4.3.3.bb => python3-traitlets_5.0.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
index edfb3abfa..8aa0ce5ba 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "3a4f263af65d3d79f1c279f0247077ef"
-SRC_URI[sha256sum] = "d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7"
+SRC_URI[md5sum] = "3dec5b73409c07bf48cd5db220431ee9"
+SRC_URI[sha256sum] = "0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-    ${PYTHON_PN}-six \
     ${PYTHON_PN}-decorator \
 "
 
-- 
2.17.1

