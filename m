Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.46460.1597070610888746541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591N-0008Tw-93; Mon, 10 Aug 2020 17:43:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-argexec: Upgrade 1.0.2 -> 1.0.3
Date: Mon, 10 Aug 2020 17:43:13 +0300
Message-Id: <20200810144318.17106-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.3:

- Handle calls to decorated functions from non-__main__ modules

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-argexec_1.0.2.bb => python3-argexec_1.0.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argexec_1.0.2.bb => python3-argexec_1.0.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index 179e07127..a26835b60 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
-SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
+SRC_URI[md5sum] = "448635948823309312ea9f70b30b6c2d"
+SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c98c3bf"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS_${PN} += "\
-- 
2.17.1

