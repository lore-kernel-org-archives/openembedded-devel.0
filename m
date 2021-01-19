Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.14805.1611077878702620650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux3-0001eq-Gc; Tue, 19 Jan 2021 19:37:58 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-pyscaffold: Upgrade 3.3 -> 3.3.1
Date: Tue, 19 Jan 2021 19:37:41 +0200
Message-Id: <20210119173746.24694-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 3.3.1:

- Code base changed to Black’s standards
- New docs about version numbers and git integration
- Updated pre-commit hooks
- Updated docs/Makefile to use Sphinx "make mode"
- deprecated setuptools extensions/commands python setup.py
  test/docs/doctests
- New tox test environments for generating docs and running
  doctests
- New built-in extension for Cirrus CI
- experimental get_template is now part of the public API and
  can be used by extensions, issue #252
- Updated setuptools_scm to version 4.1.2 in contrib
- Updated configupdater to version 1.1.2 in contrib
- precommit automatically fixes line endings by default
- deprecated log.configure_logger, use log.logger.reconfigure
  instead

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyscaffold_3.3.bb => python3-pyscaffold_3.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.bb => python3-pyscaffold_3.3.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
index 87ecb5606..9bebcedd3 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "28c77ec70e727944a42ba2494bdd5c912ec38511ac76281dd28fcb9805799025"
+SRC_URI[sha256sum] = "1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

