Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14021.1599140129752009037
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 06:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47596 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDpOi-0007vv-Pt; Thu, 03 Sep 2020 16:35:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-traitlets: 5.0.0 -> 5.0.2
Date: Thu,  3 Sep 2020 16:35:19 +0300
Message-Id: <20200903133520.19437-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903133520.19437-1-leon.anavi@konsulko.com>
References: <20200903133520.19437-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.2:

- update cast_unicode with Python's standard decode method

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.0.0.bb => python3-traitlets_5.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.0.bb => python3-traitlets_5.0.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
index 8aa0ce5ba..49255fcf5 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "3dec5b73409c07bf48cd5db220431ee9"
-SRC_URI[sha256sum] = "0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9"
+SRC_URI[md5sum] = "7dc642d19d1268a8268f46f33ff871c6"
+SRC_URI[sha256sum] = "4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.17.1

