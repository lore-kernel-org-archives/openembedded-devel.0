Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11925.1597228058067199256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 03:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53212 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5nyp-0001gR-0d; Wed, 12 Aug 2020 13:27:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-rsa: Upgrade 3.4.2 -> 4.6
Date: Wed, 12 Aug 2020 13:27:24 +0300
Message-Id: <20200812102726.4376-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812102726.4376-1-leon.anavi@konsulko.com>
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.6:

- Rolled back the switch to Poetry, and reverted back to using
  Pipenv + setup.py for dependency management. There apparently
  is an issue no-binary installs of packages build with Poetry.
- Limited SHA3 support to those Python versions (3.6+) that
  support it natively. The third-party library that adds support
  for this to Python 3.5 is a binary package, and thus breaks the
  pure-Python nature of Python-RSA.
- To avoid older Python installations from trying to upgrade to
  RSA 4.4, this is now made explicit in the python_requires
  argument in setup.py

The encrypt/decrypt-bigfile CLI commands have been removed in
2016 therefore the recipe has been updated accordingly.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rsa_3.4.2.bb => python3-rsa_4.6.bb}    | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_3.4.2.bb => python3-rsa_4.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.6.bb
index 759214fa3..d2b108635 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
@@ -4,15 +4,14 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
+SRC_URI[md5sum] = "bbf1c954865319bd542600ab07f92aca"
+SRC_URI[sha256sum] = "109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa"
 
 inherit pypi setuptools3 update-alternatives
 
 ALTERNATIVE_${PN} = "\
     pyrsa-decrypt \
-    pyrsa-decrypt-bigfile \
     pyrsa-encrypt \
-    pyrsa-encrypt-bigfile \
     pyrsa-keygen \
     pyrsa-priv2pub \
     pyrsa-sign \
@@ -20,9 +19,7 @@ ALTERNATIVE_${PN} = "\
 "
 
 ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = "${bindir}/pyrsa-decrypt"
-ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = "${bindir}/pyrsa-decrypt-bigfile"
 ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = "${bindir}/pyrsa-encrypt"
-ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = "${bindir}/pyrsa-encrypt-bigfile"
 ALTERNATIVE_LINK_NAME[pyrsa-keygen] = "${bindir}/pyrsa-keygen"
 ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = "${bindir}/pyrsa-priv2pub"
 ALTERNATIVE_LINK_NAME[pyrsa-sign] = "${bindir}/pyrsa-sign"
-- 
2.17.1

