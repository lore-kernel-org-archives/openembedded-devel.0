Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12704.1600174496139432058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 05:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47684 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kIAU0-0005Ha-N2; Tue, 15 Sep 2020 15:54:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-ruamel-yaml: Upgrade 0.16.11 -> 0.16.12
Date: Tue, 15 Sep 2020 15:54:46 +0300
Message-Id: <20200915125447.14197-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.12:

- update links in doc

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-ruamel-yaml_0.16.11.bb => python3-ruamel-yaml_0.16.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.11.bb => python3-ruamel-yaml_0.16.12.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
index 9b3a2e1d9..ec8545dae 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "020a0140d06b2e32f53944d4335f9877"
-SRC_URI[sha256sum] = "43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771"
+SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
+SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

