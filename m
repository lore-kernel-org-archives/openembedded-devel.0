Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6484F7750A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:14:53 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n37so751937qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=slrwtFXCpzMZ8PLjzMfKw+bSS5TTxegAR4P2uKxJhl0=;
	b=flF626DQYZKk4ImMUMXrhNGg1m5sBF+/IosuyYkqeJV6vhr3T/7JtAfuob5alwz7h2
	JdYhhF21IyX8/FBDWdRB9CTS62WEnM6ShEDoHo/CYqw6OpInXnaLwMt+MFOYgEZn6+B1
	rSmnZgExp6z2KW5uE2BnnXt9Kgp6t7mlCli7YthF4APat9yvurVZgGoV9b3fPJ3gvRgw
	GrhULHAYLIU7pk8sN6pwJh+WabbSD7QGAhUyBRdQgpf08Stv5Y4FBl3iRTwGsaOMr3T/
	aq8CR1J552sosDlj0r1wJFSP1uLee/GfKEuCHAHAu341FqkTwSLej5VCm3GbRPOOiw44
	hHtQ==
X-Gm-Message-State: AMke39lK/JqV3p1/Zy27F6NFXV02BpqAmsoS9T3ZI1DnG4p0KD7c8xvcZvrm9DAWhMAJKw==
X-Received: by 10.200.4.5 with SMTP id v5mr16910599qtg.54.1487891694535;
	Thu, 23 Feb 2017 15:14:54 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	w186sm3613166qkw.44.2017.02.23.15.14.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 15:14:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 18:14:42 -0500
Message-Id: <1487891683-11071-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-ldap: remove obsolete recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 23:14:53 -0000

Another current release exists in meta-python, so
this one can be removed.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-ldap/setup.cfg.patch    | 14 --------------
 meta-python/recipes-devtools/python/python-ldap_2.3.9.bb   | 12 ------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-ldap_2.3.9.bb

diff --git a/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch b/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
deleted file mode 100644
index a703d34..0000000
--- a/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- python-ldap-2.3.9/setup.cfg.orig    2009-08-13 11:07:23.000000000 +0200
-+++ python-ldap-2.3.9/setup.cfg 2009-08-13 11:07:37.000000000 +0200
-@@ -1,9 +1,9 @@
- [_ldap]
- extra_objects = 
- extra_compile_args = 
--libs = ldap_r lber sasl2 ssl crypto
-+libs = ldap_r lber ssl crypto
- library_dirs = /opt/openldap-RE24/lib
--include_dirs = /opt/openldap-RE24/include /usr/include/sasl
-+include_dirs = /opt/openldap-RE24/include
-
- [egg_info]
- tag_build =  
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
deleted file mode 100644
index 5a1a93f..0000000
--- a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API"
-LICENSE = "Python-style"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-HOMEPAGE = "http://www.python-ldap.org/"
-DEPENDS = "python openldap"
-
-SRC_URI = "file://setup.cfg.patch"
-SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
-SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
-
-PYPI_PACKAGE = "python-ldap"
-inherit pypi setuptools
-- 
2.7.4


