Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.50782.1612265204519311346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 03:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41580 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6tpR-0007Xh-WA; Tue, 02 Feb 2021 13:26:42 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pywbem: Upgrade 1.1.0 -> 1.1.3
Date: Tue,  2 Feb 2021 13:26:33 +0200
Message-Id: <20210202112636.30651-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202112636.30651-1-leon.anavi@konsulko.com>
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.3:

- MOF compiler: Fixed bug where MOF compiler did not correctly
  install a CIM schema in a non-default namespace because it tried
  to get the qualifiers from the default namespace.
- Test: Changed dependency to ‘typed-ast’ to match the needs of
  ‘astroid’ and to install it only on CPython. This allows
  re-enabling PyPy3 on Travis.
- Test: Pinned psutil to <=5.6.3 on PyPy2+3 to avoid an
  installation error.
- Test: Increased the minimum version of ‘pyzmq’ on Python 3.9
  to 19.0.0 to avoid an installation error.
- Test: Circumvented unicode issue with
  lxml.etree.fromstring()/XML() on Python 3.9 by passing in binary
  strings.
- Test: Adjusted _format()/_ascii2() testcases to PyPy3 behavior
  with binary vs unicode results.
- Test: Disabled leaktest in travis also on PyPy3 (in addition to
  PyPy2).
- Fixed a DeprecationWarning issued by urllib3 about using the
  whitelist_methods parameter of Retry.
- Fixed issue on GitHub Actions with macos by no longer running
  “brew update” in pywbem_os_setup.sh. (issue #2544)
- Docs: Fixed incorrect attribute name ‘provider_classnames’ in
  method provider example. (issue #2564)
- Mitigated the coveralls HTTP status 422 by pinning
  coveralls-python to <3.0.0.
- Migrated from Travis and Appveyor to GitHub Actions. This
  required several changes in package dependencies for development.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pywbem_1.1.0.bb => python3-pywbem_1.1.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.1.0.bb => python3-pywbem_1.1.3.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
index d68ae9abf..fd7341953 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
@@ -16,8 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[md5sum] = "6ade0cda6a997542d61f15713c2dd971"
-SRC_URI[sha256sum] = "4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe"
+SRC_URI[sha256sum] = "2abb6443f4debae56af7abefadb9fa5b8af9b53fc9bcf67f6c01a78db1064300"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1

