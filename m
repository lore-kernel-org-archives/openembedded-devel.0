Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6911.1611235041468476260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2Zpv-0002jH-9d; Thu, 21 Jan 2021 15:17:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pykwalify: Upgrade 1.7.0 -> 1.8.0
Date: Thu, 21 Jan 2021 15:17:08 +0200
Message-Id: <20210121131709.27097-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121131709.27097-1-leon.anavi@konsulko.com>
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.8.0:

- Dropped support for python 3.5 and below, including 2.7
- ruamel.yaml is now the default and preffered yaml parser
- Dropped support for pyyaml parser
- Update minimum version of ruamel.yaml to 0.16.0
- Update minimum version of python-dateutil to 2.8.0
- Added new cli argument "--encoding ENCODING" that specifies what
  encoding to open data and schema files with
- Enum error strings now output all possible values for easier
  debugging
- Removed deprecated imp module. Dynamic imports imght be affected
- Implement new type email that uses a relative simple regex to
  validate email addresses according to RFC 5322 Official Standard
- Implement new type url that uses a relative simple regex to
  validate url:s according to RFC 1808
- Add new argument "schema_file_obj" to Core class. Allows to pass
  in StringIO or similar interfaced objects to use for validation.
- Add new argument "data_file_obj" to Core class. Allows to pass in
  StringIO or similar interfaced objects to use for validation.
- Fixed a regression from 1.6.1 where ruamel.yaml safe_load would
  break for all built-in custom python tags.
- All normal python tags should now be possible to use again.
- Fixed an issue with regex values that was not converted to str()
  before regex mapping was attempted.
- This should validate things like integers and objects that support
  str() conversion better.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-rule.py-fix-missing-comma.patch      | 34 -------------------
 ...fy_1.7.0.bb => python3-pykwalify_1.8.0.bb} |  7 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
 rename meta-python/recipes-devtools/python/{python3-pykwalify_1.7.0.bb => python3-pykwalify_1.8.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
deleted file mode 100644
index 689355eea..000000000
--- a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mart=C3=AD=20Bol=C3=ADvar?= <marti.f.bolivar@gmail.com>
-Date: Mon, 13 Jan 2020 08:42:05 -0800
-Subject: [PATCH] rule.py: fix missing comma
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A line in the defined_keywords list is missing a comma. Add it.
-
-Signed-off-by: Martí Bolívar <marti.f.bolivar@gmail.com>
-
-Upstream-Status: Backport [https://github.com/Grokzen/pykwalify.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- pykwalify/rule.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pykwalify/rule.py b/pykwalify/rule.py
-index 7ac2c9e..f044b69 100644
---- a/pykwalify/rule.py
-+++ b/pykwalify/rule.py
-@@ -340,7 +340,7 @@ class Rule(object):
-             ('matching', 'matching'),
-             ('matching_rule', 'matching_rule'),
-             ('name', 'name'),
--            ('nullable', 'nullable')
-+            ('nullable', 'nullable'),
-             ('parent', 'parent'),
-             ('pattern', 'pattern'),
-             ('pattern_regexp', 'pattern_regexp'),
--- 
-2.18.2
-
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index 2e1bff4f2..aa14cdd4b 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -2,12 +2,9 @@ SUMMARY = "YAML/JSON validation library"
 DESCRIPTION = "pykwalify is a schema validator for YAML and JSON"
 HOMEPAGE = "https://pypi.org/project/pykwalify/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaf57328ad29ea2e0ed31a57f0914dc"
 
-SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
-SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
-
-SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
+SRC_URI[sha256sum] = "796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884"
 
 PYPI_PACKAGE = "pykwalify"
 
-- 
2.17.1

