Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 077927FD3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:19:59 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id n96so201171pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SSYSTtLIJ6WtrlINo6OZbl7PETb3Cc4tEPfjhOudBU8=;
	b=bbWrVC7mIKTvAWttQX+iaDKueslvKsOdwp0jPTIC7RdJjG5BoHcPt4ciw9peZscs9w
	SMdXstC33Y+GzY9lXt4QrU0x+klBWLBlLrasha0+wQ5J8/0AY36JITXpY6GKn6cnBpjD
	Hgy4FvTsXpLMjnA5hFzUP13LRv+fSL2NOyXIeOMBw+TS2mCe2wXlPWz/lcE8GI1Jf6aF
	ggu92mNfPyB69oj58tCALI/C+pPcbcmBljyQRTYtg7XSfij3Wd27sfnAana2dZhRr0hK
	wiJkfMKHL7WZH3XmcWK0uSRmKsXj6haHKdq7CsNL3+7u+yVc+YB9eIFawODnt1Dxn6xf
	8PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SSYSTtLIJ6WtrlINo6OZbl7PETb3Cc4tEPfjhOudBU8=;
	b=kMn10zMyrcUib70++Ct4ERI6Iccd1a8A+9BgrthVqtUi5IaitqKP814MmV8BSY0x3T
	j7FpAic6nLMzVVo3+JhJbPSnl8ynxV4VSC0WQHWBtC1VDo3WdXScV8rG6UTVqMPAw9NE
	sXfu9Wh+df7ihUHX8k1oWZNv3l6gpQVDe/pNSRxBPiaV2FlsvoxNsa4EAUOokhEMI2gz
	7Pb/PAStr2phdp1Tjh5K3D6J1f7ZW88AghybNbiVXU6FasPFUHHR8kinMFaUynw7YuI6
	NTko7FSGxUyL7J9XaBCZhqQ+qgDfci+SOkXJ4GfQxaofjgsPPx/3pJQEveL32uSSYOe3
	Ux0w==
X-Gm-Message-State: APjAAAV/os48yt+Zav5ZkL6Z3REjYSsCZ5E3tXfxQ4la9P9sxVQlsAYf
	sxy5LtsKKOuaGmrlmr+aDYhKsC+yH/c=
X-Google-Smtp-Source: APXvYqzXK0q4Ov3grns5hvsaW8JCUcZo75uPm47FCABdgxwY0g6/c+DZDhujf8O3ilCSeJhaeuwLsA==
X-Received: by 2002:a17:90a:a416:: with SMTP id
	y22mr803791pjp.114.1579731600577; 
	Wed, 22 Jan 2020 14:20:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id d14sm8284pjz.12.2020.01.22.14.19.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 14:20:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:19:58 -0800
Message-Id: <20200122221959.1407586-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122221959.1407586-1-raj.khem@gmail.com>
References: <20200122221959.1407586-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] recipes: Turn inherit classes from meta-py2 to conditional constructs
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
X-List-Received-Date: Wed, 22 Jan 2020 22:20:00 -0000
Content-Transfer-Encoding: 8bit

helps parsing without meta-py2 in mix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb | 2 +-
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb                | 2 +-
 meta-oe/recipes-devtools/guider/guider_3.9.6.bb                | 2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb              | 2 +-
 meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb                 | 2 +-
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb       | 2 +-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb             | 3 ++-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
index 42ce3301f5..ec45653012 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
 SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index f1c2b7701c..e125ae4447 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit ${@bb.utils.contains("BBPATH", "meta-python2", "setuptools", "", d)}
 
 python() {
     if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
index 397e0cb9a3..1fd7e111a7 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
@@ -16,7 +16,7 @@ SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
 S = "${WORKDIR}/git"
 R = "${RECIPE_SYSROOT}"
 
-inherit distutils
+inherit ${@bb.utils.contains("BBPATH", "meta-python2", "distutils", "", d)}
 
 GUIDER_OBJ = "guider.pyc"
 GUIDER_SCRIPT = "guider"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
index d87a7513da..5d7ed4410d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be4d5107c64dc3d7c57e3797e1a0674b"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig pythonnative
+inherit pkgconfig ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
index e229bf424c..f648332b43 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "9f453c8cc5669e46e38f977764d49a36295bf0d023619d9aac782e6bb3
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
-inherit autotools pkgconfig perlnative pythonnative
+inherit autotools pkgconfig perlnative ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
 
 inherit features_check
 CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 1ee6b346fe..4a1b6bba69 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=75859989545e37968a99b631ef42722e"
 SECTION = "System/Management"
 
-inherit setuptools
+inherit ${@bb.utils.contains("BBPATH", "meta-python2", "setuptools", "", d)}
 
 DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
 
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 8e5986bd9e..8895a9e158 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Datera/lio-utils.git \
 SRCREV = "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
 S = "${WORKDIR}/git"
 
-inherit distutils
+inherit ${@bb.utils.contains("BBPATH", "meta-python2", "distutils", "", d)}
 
 EXTRA_OEMAKE += "DESTDIR=${D}"
 
@@ -70,3 +70,4 @@ python() {
         raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
 }
 
+
-- 
2.25.0


