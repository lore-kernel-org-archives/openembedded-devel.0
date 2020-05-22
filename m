Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9378.1590136432894111475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 01:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53908 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc37n-0000wd-0d; Fri, 22 May 2020 11:33:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-toml: Extend with native build variants
Date: Fri, 22 May 2020 11:33:29 +0300
Message-Id: <20200522083330.6934-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522083330.6934-1-leon.anavi@konsulko.com>
References: <20200522083330.6934-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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

Extend toml with native and nativesdk build variants because it is
required as a dependency for other recipes such as python3-zipp.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-toml_0.10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
index 5a7b04c9e..b72753b80 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05
 
 inherit pypi setuptools3
 
+BBCLASSEXTEND = "native nativesdk"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
 "
-- 
2.17.1

