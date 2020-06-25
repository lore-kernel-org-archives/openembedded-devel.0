Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6714.1593076109991619621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNrw-0005y7-GM; Thu, 25 Jun 2020 12:08:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/12] python3-ruamel-yaml: Upgrade 0.16.5 0> 0.16.10
Date: Thu, 25 Jun 2020 12:07:14 +0300
Message-Id: <20200625090719.16068-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.16.10:

- updated image references in README to sourceforge
- update requirements so that ruamel.yaml.clib is installed for
  3.8, as it has become available
- fix typchecking issue on TaggedScalar
- fix error in dumping literal scalar in sequence with comments
  before element
- fix empty string mapping key roundtripping with preservation
  of quotes as `? ''`
- fix incorrect state setting in class constructor
- adjust deprecation warning test for Hashable, as that no
  longer warns

The year in LICENSE has been updated and LIC_FILES_CHKSUM changed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ruamel-yaml_0.16.5.bb => python3-ruamel-yaml_0.16.10.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.5.bb => python3-ruamel-yaml_0.16.10.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
index ba095648f..076721a09 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.10.bb
@@ -2,14 +2,14 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
 AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=caf8bd842440b537c044e131785a4666"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7d5a5b0a7621a1247b081cc8e4978354"
-SRC_URI[sha256sum] = "412a6f5cfdc0525dee6a27c08f5415c7fd832a7afcb7a0ed7319628aed23d408"
+SRC_URI[md5sum] = "02774e7ed3273b3d8eee6c08326b91c4"
+SRC_URI[sha256sum] = "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

