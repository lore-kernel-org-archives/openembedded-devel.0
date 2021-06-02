Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13018.1622640980929039004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58062 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1loR2e-0005Zl-Pn; Wed, 02 Jun 2021 16:36:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-django: Upgrade 3.2.3 -> 3.2.4
Date: Wed,  2 Jun 2021 16:36:02 +0300
Message-Id: <20210602133603.32509-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602133603.32509-1-leon.anavi@konsulko.com>
References: <20210602133603.32509-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.4:

- CVE-2021-33203: Potential directory traversal via admindocs
- CVE-2021-33571: Possible indeterminate SSRF, RFI, and LFI attacks
  since validators accepted leading zeros in IPv4 addresses
- Fixed a bug in Django 3.2 where a final catch-all view in the
  admin didn't respect the server-provided value of SCRIPT_NAME
  when redirecting unauthenticated users to the login page.
- Fixed a bug in Django 3.2 where a system check would crash on an
  abstract model
- Prevented unnecessary initialization of unused caches following
  a regression in Django 3.2
- Fixed a crash in Django 3.2 that could occur when running
  mod_wsgi with the recommended settings while the Windows
  colorama library was installed
- Fixed a bug in Django 3.2 that would trigger the auto-reloader
  for template changes when directory paths were specified with
  strings
- Fixed a regression in Django 3.2 that caused a crash of
  auto-reloader with AttributeError, e.g. inside a Conda
  environment
- Fixed a regression in Django 3.2 that caused a loss of precision
  for operations with DecimalField on MySQL

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-django_3.2.3.bb => python3-django_3.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.3.bb => python3-django_3.2.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.3.bb b/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.4.bb
index 7a9611ca1..52504885e 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "13ac78dbfd189532cad8f383a27e58e18b3d33f80009ceb476d7fcbfc5dcebd8"
+SRC_URI[sha256sum] = "66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1

