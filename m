Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.34439.1611567045104067838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 01:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l3yCo-0004I9-Hi; Mon, 25 Jan 2021 11:30:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pyyaml: Upgrade 5.4 -> 5.4.1
Date: Mon, 25 Jan 2021 11:30:35 +0200
Message-Id: <20210125093035.6177-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125093035.6177-1-leon.anavi@konsulko.com>
References: <20210125093035.6177-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.4.1:

- Fix stub compat with older pyyaml versions that may unwittingly
  load it

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyyaml_5.4.bb => python3-pyyaml_5.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.4.bb => python3-pyyaml_5.4.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
index e46b608f7..c3025fdc6 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "PyYAML"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a"
+SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.17.1

