Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.38495.1615220304694361615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lJIaH-0005d6-Cn; Mon, 08 Mar 2021 18:18:18 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ruamel-yaml: Upgrade 0.16.12 -> 0.16.13
Date: Mon,  8 Mar 2021 18:18:06 +0200
Message-Id: <20210308161810.21582-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.13:

- fix: could not update() CommentedMap with keyword arguments
- fix: unable to dump mutated TimeStamp objects
- fix: unable to addd comment without starting space
- fix: recursive call to walk_tree not preserving all params
- a None value in a flow-style sequence is now dumped as `null`
  instead of `!!null ''`

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ruamel-yaml_0.16.12.bb => python3-ruamel-yaml_0.16.13.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.12.bb => python3-ruamel-yaml_0.16.13.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
index 7593ce7f5..39795b784 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
 AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
@@ -10,8 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
-SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
+SRC_URI[sha256sum] = "bb48c514222702878759a05af96f4b7ecdba9b33cd4efcf25c86b882cef3a942"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

