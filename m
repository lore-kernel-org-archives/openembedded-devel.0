Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.20789.1625663363937968569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 06:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m17In-0004Cr-Bn; Wed, 07 Jul 2021 16:09:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cmd2: Upgrade 2.1.1 -> 2.1.2
Date: Wed,  7 Jul 2021 16:09:13 +0300
Message-Id: <20210707130913.13459-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707130913.13459-1-leon.anavi@konsulko.com>
References: <20210707130913.13459-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.2:

- Added the following accessor methods for cmd2-specific
  attributes to the argparse.Action class:
  * get_choices_callable()
  * set_choices_provider()
  * set_completer()
  * get_descriptive_header()
  * set_descriptive_header()
  * get_nargs_range()
  * set_nargs_range()
  * get_suppress_tab_hint()
  * set_suppress_tab_hint()
- Now that set_choices_provider() and set_completer() have been
  added as methods to the argparse.Action class, the standalone
  functions of the same name will be removed in version 2.2.0.
  To update to the new convention, do the following:
  * Change set_choices_provider(action, provider) to
    action.set_choices_provider(provider)
  * Change set_completer(action, completer) to
    action.set_completer(completer)

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.1.1.bb => python3-cmd2_2.1.2.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.1.1.bb => python3-cmd2_2.1.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb
index e663b9c815..38f050a044 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "a45f6a50b6081c5767b0e410da3f9cebdf6d8fb2aff80fab07d633c6eaaa6d70"
+SRC_URI[sha256sum] = "25dbb2e9847aaa686a8a21e84e3d101db8b79f5cb992e044fc54210ab8c0ad41"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,7 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-pydoc \
+    ${PYTHON_PN}-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

