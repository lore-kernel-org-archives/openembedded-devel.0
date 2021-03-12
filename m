Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.378.1615566382410223599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36668 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lKkcB-0007yZ-PJ; Fri, 12 Mar 2021 18:26:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyscaffold: Upgrade 3.3.1 -> 4.0
Date: Fri, 12 Mar 2021 18:25:58 +0200
Message-Id: <20210312162600.8335-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312162600.8335-1-leon.anavi@konsulko.com>
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0:

- Cookiecutter, Django and Travis extensions extracted to their
  own repositories
- Support for Python 3.4 and 3.5 dropped
- Dropped deprecated requirements.txt file
- Added support for global configuration (avoid retyping common
  putup's options)
- PyScaffold is no longer a build-time dependency, it just
  generates the project structure
- Removed contrib subpackage, vendorized packages are now runtime
  dependencies
- setuptools_scm is included by default in setup.cfg, setup.py and
  pyproject.toml
- API changed to use pyscaffold.operations instead of integer
  flags
- Allow string.Template and callable as file contents in project
  structure
- Extract file system functions from utils.py into file_system.py
- Extract identification/naming functions from utils.py into
  identification.py
- Extract action related functions from api/__init__.py to
  actions.py
- helpers.{modify,ensure,reject} moved to structure.py
- helpers.{register,unregister} moved to actions.py
- New extension for automatically creating virtual environments
  (--venv)
- Added instructions to use pip-tools to docs
- pre-commit extension now attempts to install hooks automatically
- A nice message is now displayed when PyScaffold finishes running
  (actions.report_done)
- Removed mutually exclusive argparse groups for extensions
- Progressive type annotations adopted in the code base together
  with mypy linting
- Simplified isort config
- pyproject.toml and isolated builds adopted by default
- Added comment to setup.cfg template instructing about extra links
- Generate tox.ini by default
- Replace pkg_resources with importlib.{metadata,resources} and
  packaging
- Adopt PEP 420 for namespaces
- Adopt SPDX identifiers for the license field in setup.cfg
- Removed deprecated log.configure_logger
- Add links to issues and pull requests to changelog
- Add an experimental --interactive mode (inspired by git rebase -i)
- Reorganise the FAQ (including version questions previously in
  Features)
- Updated setuptools and setuptools_scm dependencies to minimal
  versions 46.1 and 5, respectively
- Adopted no-guess-dev version scheme from setuptools_scm
  (semantically all stays the same, but non-tag commits are now
  versioned LAST_TAG.post1.devN instead of LAST_TAG.post0.devN)
- Fix problem of not showing detailed log with --verbose if error
  happens when loading extensions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyscaffold_3.3.1.bb => python3-pyscaffold_4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.1.bb => python3-pyscaffold_4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
index 9bebcedd3..1ad33c10d 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69"
+SRC_URI[sha256sum] = "7012ae5f9c95b910a39a099824104dc888beb932de86b07514882f3511bc6c74"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

