Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13097.1610474209488193248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 09:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45176 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzNuR-0003G6-2c; Tue, 12 Jan 2021 19:56:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pyscaffold: Upgrade 3.2.3 -> 3.3
Date: Tue, 12 Jan 2021 19:56:40 +0200
Message-Id: <20210112175641.5003-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3:

- Code base changed to Black's standards
- New docs about version numbers and git integration
- Updated pre-commit hooks
- Updated docs/Makefile to use Sphinx "make mode"
- deprecated setuptools extensions/commands
  python setup.py test/docs/doctests
- New tox test environments for generating docs and running
  doctests
- New built-in extension for Cirrus CI
- experimental get_template is now part of the public API and
  can be used by extensions
- Updated setuptools_scm to version 4.1.2 in contrib
- Updated configupdater to version 1.1.2 in contrib
- precommit automatically fixes line endings by default
- deprecated log.configure_logger, use log.logger.reconfigure
  instead

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyscaffold_3.2.3.bb => python3-pyscaffold_3.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.2.3.bb => python3-pyscaffold_3.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
index dbd222f54..87ecb5606 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
@@ -12,7 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[md5sum] = "6769d2a26a9d1f3038944b8fbfe728ff"
-SRC_URI[sha256sum] = "96c3e7f5529df0b5b351e879a141e1e5c9f26211f30d493c23d8c09d9d610a6f"
+SRC_URI[sha256sum] = "28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

