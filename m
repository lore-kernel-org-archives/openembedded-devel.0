Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38428.1599227243865589494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3m-0000aK-5Y; Fri, 04 Sep 2020 16:47:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-traitlets: Upgrade 5.0.2 -> 5.0.3
Date: Fri,  4 Sep 2020 16:47:06 +0300
Message-Id: <20200904134713.13164-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.3:

- handle allow_none in from_string

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.0.2.bb => python3-traitlets_5.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.2.bb => python3-traitlets_5.0.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
index 49255fcf5..02908dea9 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "7dc642d19d1268a8268f46f33ff871c6"
-SRC_URI[sha256sum] = "4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640"
+SRC_URI[md5sum] = "66b76cfffd590c39861bc11c247725a5"
+SRC_URI[sha256sum] = "a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.17.1

