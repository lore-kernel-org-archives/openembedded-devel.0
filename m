Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D799371C54
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 16:23:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j16so1943914pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uuLMETnJ4vN261Xpt4jSvNixyo7SDHs6vm4wdEio7fk=;
	b=Oc2COYFFdcAJ0dbXe+yD1osJHk5cS+4z+pM/pC1m59Ke2JlWOkCzPdHZbk40xGAiUD
	dSmpzrhQOfdJBpBfA6spgNlgf7kR7LJZYc4XiJf1IVLcPAR4BmRsssC/lwxL0SyhZh0K
	Y8RtfaiSn/W/yfe1abTP4BNgmW/fjdzOiTQ46Y2cWTmpuVmeN51DVaJiQSa8txJZLeIW
	Q6s7XWXEaLikh7xDquDKVYjo+eufjBG7asmZ/Z/0qXkjdGhFviqHJSd2FyKsWL7jOFEZ
	SK1KrsFZ7xkC2axdyW75LZWZRRzw5U1CxKKkbdrES4XBZjoXZsZK3zoBR9ylcpnMW+Oa
	va8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uuLMETnJ4vN261Xpt4jSvNixyo7SDHs6vm4wdEio7fk=;
	b=PECqzeXrLvvRJRvEwNqW/d3/zoPq/nHGxi91u6fQsTKsBD57QAc0vvRKd2U2h7cs8T
	UddMhmjBsmLsxtKVKVIPKDZRV8gz3NoZNQGcOpx2ru49araiuHEjZH4MTcj+KFLKQE+p
	GS5acZLQ6OYK0vLq0VxQWKFYO/q7YVh8uny/cjMkZTGg2mquEM3qOzzW6lyFwQqTT/LK
	bJWnhrlAlbg64HEwhM7SboKNlRXVC9tMYmZ9PFhKaLFNH8MoNccv29/itXVmfpGe8ZPU
	z1gvR9awVv2kQeW/xvz3MHYSgWFkAGyz0SWR7WePqVXK+1ebA2r7wzk9uLplLUIYBdxO
	GB7w==
X-Gm-Message-State: AHPjjUhgngAyGE4GKUrtgzwV+m429a0TQRoZylScEfAjW+9ljIwLSqrS
	7vN6ddsZYPF0LiZX
X-Google-Smtp-Source: ADKCNb5OKlN1vZ9QvsmY+OWdsM2d2p6bnuhFPpoRqURbIxmVMfZCD59JVsg7K6ToMPSzgwdCZ7t4MA==
X-Received: by 10.99.158.17 with SMTP id s17mr21785919pgd.85.1505406182821;
	Thu, 14 Sep 2017 09:23:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	b68sm33288473pfk.23.2017.09.14.09.23.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 09:23:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 09:22:54 -0700
Message-Id: <20170914162255.43165-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] pidgin-otr: Upgrade to 4.0.2
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
X-List-Received-Date: Thu, 14 Sep 2017 16:23:01 -0000

Check for x11 before building, it has a hard dep on
gtk+, which inturn needs x11 or directfb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ignore_extra-portability_warnings.patch           | 19 -------------------
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb    | 16 ----------------
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb    | 15 +++++++++++++++
 3 files changed, 15 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch b/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
deleted file mode 100644
index db0ad873b..000000000
--- a/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-pidgin-otr: Silence no-extra-portability warnings
-
-Make it build with OE, was not building with warning turned on
-
-Upstream-Status: Pending
-
-Signed-off-by: Jakob Drexel <jake42@rommel.stw.uni-erlangen.de>
-
---- a/configure.ac	2012-09-01 17:03:19.000000000 +0200
-+++ b/configure.ac	2014-01-12 21:59:24.920300215 +0100
-@@ -4,7 +4,7 @@
- 
- AM_CONFIG_HEADER(config.h)
- 
--AM_INIT_AUTOMAKE([-Wall -Werror])
-+AM_INIT_AUTOMAKE([-Wall -Werror -Wno-extra-portability])
- 
- AC_PROG_CC
- 
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
deleted file mode 100644
index e8539c902..000000000
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "(OTR) Messaging allows you to have private conversations over instant messaging"
-HOMEPAGE = "http://www.cypherpunks.ca/otr/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
-DEPENDS = "libgcrypt libotr pidgin intltool-native glib-2.0-native"
-
-SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
-    file://ignore_extra-portability_warnings.patch \
-"
-
-SRC_URI[md5sum] = "eadb953376acc474e56041d4c12aa2c8"
-SRC_URI[sha256sum] = "d56b3f092dbe9ee6597641c7d2dd294884dc04ba47aaf4ec571cd54977df4691"
-
-FILES_${PN} = "${libdir}/pidgin/*"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
new file mode 100644
index 000000000..5a21cd3fc
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "(OTR) Messaging allows you to have private conversations over instant messaging"
+HOMEPAGE = "https://otr.cypherpunks.ca/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
+DEPENDS = "libgcrypt libotr pidgin gtk+ intltool-native glib-2.0 glib-2.0-native"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "https://otr.cypherpunks.ca/${BP}.tar.gz \
+"
+SRC_URI[md5sum] = "7ef14e1334a4bc80e5d530f9a3cfc626"
+SRC_URI[sha256sum] = "f4b59eef4a94b1d29dbe0c106dd00cdc630e47f18619fc754e5afbf5724ebac4"
+
+FILES_${PN} = "${libdir}/pidgin/*"
+
+inherit autotools pkgconfig distro_features_check
-- 
2.14.1


