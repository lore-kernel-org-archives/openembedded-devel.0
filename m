Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5442.1628584282246156462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53578 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDNAO-0005EL-GE; Tue, 10 Aug 2021 11:31:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-distro: Upgrade 1.5.0 -> 1.6.0
Date: Tue, 10 Aug 2021 11:30:58 +0300
Message-Id: <20210810083058.29524-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810083058.29524-1-leon.anavi@konsulko.com>
References: <20210810083058.29524-1-leon.anavi@konsulko.com>
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

Upgrade to release:

BACKWARDS COMPATIBILITY:
- Deprecated the distro.linux_distribution() function. Use
  distro.id(), distro.version() and distro.name() instead
- Deprecated Python 2.7, 3.4 and 3.5 support. Further releases
  will only support Python 3.6+
ENHANCEMENTS:
- Added type hints to distro module
- Added __version__ for checking distro version
- Added support for arbitrary rootfs via the root_dir parameter
- Added the --root-dir option to CLI
- Added fallback to /usr/lib/os-release when /etc/os-release isn't
  available
BUG FIXES:
- Fixed subprocess.CalledProcessError when running lsb_release
- Ignore /etc/iredmail-release file while parsing distribution
- Use a binary file for /dev/null to avoid TextIOWrapper overhead
RELEASE:
- Moved repository from nir0s/distro to python-distro/distro on
  GitHub.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-distro_1.5.0.bb => python3-distro_1.6.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-distro_1.5.0.bb => python3-distro_1.6.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-distro_1.5.0.bb b/meta-python/recipes-devtools/python/python3-distro_1.6.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-distro_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-distro_1.6.0.bb
index aaaee0deee..8aa2255670 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.6.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 PYPI_PACKAGE = "distro"
 
-SRC_URI[md5sum] = "0ed68b4064709bdaaf6cce69780ddc51"
-SRC_URI[sha256sum] = "0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92"
+SRC_URI[sha256sum] = "83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424"
 
 inherit pypi setuptools3
 
-- 
2.17.1

