Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5657.1593171003541915091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYT-000568-M4; Fri, 26 Jun 2020 14:30:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/12] python3-pybind11: Upgrade 2.4.3 -> 2.5.0
Date: Fri, 26 Jun 2020 14:29:44 +0300
Message-Id: <20200626112944.25569-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.0:

- Use C++17 fold expressions in type casters, if available. This
  can improve performance during overload resolution when
  functions have multiple arguments.
- Changed include directory resolution in pybind11/__init__.py and
  installation in setup.py. This fixes a number of open issues
  where pybind11 headers could not be found in certain environments.
- C++20 char8_t and u8string support.
- CMake: search for Python 3.9.
- Fixes for MSYS-based build environments.
- STL bindings for std::vector<...>::clear.
- Read-only flag for py::buffer.
- Exception handling during module initialization.
- Support linking against a CPython debug build.
- Fixed issues involving the availability and use of aligned new
  and delete.
- Fixed a resource leak upon interpreter shutdown.
- Fixed error handling in the boolean caster.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 9efa2db75..dc3b8f6ad 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
-SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
+SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
+SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
 
 inherit pypi setuptools3
-- 
2.17.1

