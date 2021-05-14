Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9414.1621002233256681740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjI-0005Cr-01; Fri, 14 May 2021 17:23:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-ipython: Upgrade 7.22.0 -> 7.23.1
Date: Fri, 14 May 2021 17:23:41 +0300
Message-Id: <20210514142341.22666-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.23.1:

- Moved to GitHub actions away from Travis-CI, the transition may
  not be 100% complete (not testing on nightly anymore), but as we
  ran out of Travis-Ci hours on the IPython organisation that was
  a necessary step.
- We have a new dependency: matplotlib-inline, which try to
  extract matplotlib inline backend specific behavior. It is
  available on PyPI and conda-forge thus should not be a problem
  to upgrade to this version. If you are a package maintainer
  that might be an extra dependency to package first.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.22.0.bb => python3-ipython_7.23.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.22.0.bb => python3-ipython_7.23.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb
index 7bc0d1d00c..492d922b90 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "9c900332d4c5a6de534b4befeeb7de44ad0cc42e8327fa41b7685abde58cec74"
+SRC_URI[sha256sum] = "714810a5c74f512b69d5f3b944c86e592cee0a5fb9c728e582f074610f6cf038"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

