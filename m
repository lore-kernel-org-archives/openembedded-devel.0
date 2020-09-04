Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38426.1599227242280170503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3i-0000aK-KU; Fri, 04 Sep 2020 16:47:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-ruamel-yaml: Upgrade 0.16.10 -> 0.16.11
Date: Fri,  4 Sep 2020 16:47:04 +0300
Message-Id: <20200904134713.13164-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.11:

- workaround issue with setuptools 0.50 and importing pip

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-ruamel-yaml_0.16.10.bb => python3-ruamel-yaml_0.16.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.10.bb => python3-ruamel-yaml_0.16.11.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
index 076721a09..9b3a2e1d9 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "02774e7ed3273b3d8eee6c08326b91c4"
-SRC_URI[sha256sum] = "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
+SRC_URI[md5sum] = "020a0140d06b2e32f53944d4335f9877"
+SRC_URI[sha256sum] = "43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

