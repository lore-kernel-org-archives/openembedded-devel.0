Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5208.1599046104239357133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQwA-0000FC-6Z; Wed, 02 Sep 2020 14:28:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-absl: Upgrade 0.9.0 -> 0.10.0
Date: Wed,  2 Sep 2020 14:28:05 +0300
Message-Id: <20200902112808.18547-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
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

Use PyPI and upgrade to release 0.10.0:

Added:
- (testing) _TempDir and _TempFile now implement __fspath__ to
  satisfy os.PathLike
- (logging) --logger_levels: allows specifying the log levels of
  loggers.
- (flags) FLAGS.validate_all_flags: a new method that validates
  all flags and raises an exception if one fails.
- (flags) FLAGS.get_flags_for_module: Allows fetching the flags a
  module defines.
- (testing) parameterized.TestCase: Supports async test
  definitions.
- (testing,app) Added --pdb flag: When true, uncaught exceptions
  will be handled by pdb.post_mortem. This is an alias for
  --pdb_post_mortem.

Changed:
- (testing) Failed tests output a copy/pastable test id to make it
  easier to copy the failing test to the command line.
- (testing) @parameterized.parameters now treats a single
  abc.Mapping as a single test case, consistent with
  named_parameters. Previously the abc.Mapping is treated as if
  only its keys are passed as a list of test cases. If you were
  relying on the old inconsistent behavior, explicitly convert
  the abc.Mapping to a list.
- (flags) DEFINE_enum_class and DEFINE_mutlti_enum_class accept a
  case_sensitive argument. When False (the default), strings are
  mapped to enum member names without case sensitivity, and member
  names are serialized in lowercase form. Flag definitions for
  enums whose members include duplicates when case is ignored must
  now explicitly pass case_sensitive=True.

Fixed:
- (flags) Defining an alias no longer marks the aliased flag as
  always present on the command line.
- (flags) Aliasing a multi flag no longer causes the default value
  to be appended to.
- (flags) Alias default values now matched the aliased default
  value.
- (flags) Alias present counter now correctly reflects command
  line usage.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-absl_0.9.0.bb => python3-absl_0.10.0.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.9.0.bb => python3-absl_0.10.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
index a8f47ba4c..5be00ccb4 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/abseil/abseil-py.git"
-SRCREV ?= "06edd9c20592cec39178b94240b5e86f32e19768"
+SRC_URI[md5sum] = "9cb38ddf7a2f000e2c92e5d9dfa36ffa"
+SRC_URI[sha256sum] = "b20f504a7871a580be5268a18fbad48af4203df5d33dbc9272426cb806245a45"
 
-inherit setuptools3
+PYPI_PACKAGE = "absl-py"
 
-S = "${WORKDIR}/git"
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

