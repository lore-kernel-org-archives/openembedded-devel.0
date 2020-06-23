Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3654.1592905909642336242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfam-0006Iq-2F; Tue, 23 Jun 2020 12:51:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/11] python3-setuptools-scm: Upgrade 3.5.0 -> 4.1.2
Date: Tue, 23 Jun 2020 12:51:29 +0300
Message-Id: <20200623095136.24854-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.1.2:

- disallow git tags without dots by default again
- drop jaraco.windows from pyproject.toml, allows for wheel builds
  on python2
- include python 3.9 via the deadsnakes action
- return release_branch_semver scheme
- undo the devendoring of the samefile backport for python2.7
  on windows
- re-enable the building of universal wheels
- fix handling of missing git/hg on python2.7 (python 3 exceptions
  where used)
- correct the tox flake8 invocation
- trigger builds on tags again
- Add parentdir_project_version to support installs from GitHub
  release tarballs.
- use Coordinated Universal Time (UTC)
- switch to github actions for ci
- fix documentation for tag_regex and add support for single digit
  versions
- document handling of enterprise distros with unsupported
  setuptools versions
- switch to declarative metadata
- drop the internal copy of samefile and use a dependency on
  jaraco.windows on legacy systems
- select git tags based on the presence of numbers instead of dots
- enable getting a version form a parent folder prefix
- add release-branch-semver version scheme
- make global configuration available to version metadata
- drop official support for python 3.4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etuptools-scm_3.5.0.bb => python3-setuptools-scm_4.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_3.5.0.bb => python3-setuptools-scm_4.1.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
index 036477d1e..4ebbac6b6 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "86ec1eb9ec02ba018b097787e98897c5"
-SRC_URI[sha256sum] = "5bdf21a05792903cafe7ae0c9501182ab52497614fa6b1750d9dbae7b60c1a87"
+SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
+SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.17.1

