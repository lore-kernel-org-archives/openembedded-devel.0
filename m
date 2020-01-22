Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id E91589146B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:31 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s64so2916226pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OmnZwBB0lc+7smyzvTrjBrnfMBa/eCB/awG0CcDFZlI=;
	b=FGIREMlMIIy52s0wOyCZS1tR0swMprxqj1zZdpv4YOibUMEaAPOvJCrMcm70YWjmXw
	G9CzZeUMwtkds3sdLTDQazil+raaukrX+vInIdAiFkE03OlZo6yslJ8GXqAw8WaVu6P6
	e871tHX0Dj9b0clWdsESZwBxRda2vOvz8kFdYv5YnPfqicLJuhaiR1S/xPVIW2zXSkcW
	F75PxPVPqh/pNFGbsTpwLqIpTwj2tyg3CWjO17KVLFIlznw1wtxfLeT+bL5ioX8wjlTL
	jX0EYRjaPOq6Qt3JJS7xS5VEIkGPujLiKCwotjlkNVMp6+GQEFhCzzVIoCAAIWLujWKC
	Pw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OmnZwBB0lc+7smyzvTrjBrnfMBa/eCB/awG0CcDFZlI=;
	b=aogkU4H2hiD3HHKpBA7ZVJDtS2w0XSRd2p63DL4rMSyQJBzv1nzYsp0cMX3Xlc91s3
	9/x4AsQzp8xrGsorwqkifUmXhLscn4ldyBycGpTEtmlCHDItGMjFSHmsxswnix/jx2xb
	nC9cYtcXJVLFCM1YSCmyAisDROv7wgGPRs7tsSf0WjCuD0Fqw2NdTA3+x5A47y3nA5/2
	3w5urXo+YNvyQGgx46hH9k/mIEGzSa50WI2Kw+upPBlQ3yfiA8+KsJiH7nuIenJHu3px
	eFcSCxn2gt1UTKxEXCUubbI7+UcT7WMNHrX4ZdlcKAnaN6Y4WUe6WHxc/tuVurzwB+9F
	e6OA==
X-Gm-Message-State: APjAAAVV6TPiXD3fP5dav4LGXoJDJXOnvTu5vRRZGDUVx3/ZZXUE3zHE
	BhsCJh9lcV3oiSbhFs+GpCb5hGkz+II=
X-Google-Smtp-Source: APXvYqyTbKoew2Z8kRHtVUXqMrrplXrp1uMT2sVSzv0Kw062FNrAHi4vfiprSmHtSuDPDJR02Ob5pg==
X-Received: by 2002:a63:d249:: with SMTP id t9mr9798599pgi.263.1579675112478; 
	Tue, 21 Jan 2020 22:38:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:21 -0800
Message-Id: <20200122063823.242098-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 10/12] nodejs: Build only when meta-py2 is included
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb          | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6dda3005e7..60276468fd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -113,13 +113,14 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
-    mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
+    mpich msgpack-c nlohmann-json openocd pax-utils \
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
     protobuf protobuf-c python3-distutils-extra \
     python-cpuset python-distutils-extra python-futures python-pygobject \
     rapidjson serialcheck sip3 sip tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "nodejs", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
index 5c50187253..d87a7513da 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be4d5107c64dc3d7c57e3797e1a0674b"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig python3native
+inherit pkgconfig pythonnative
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -150,3 +150,8 @@ FILES_${PN}-systemtap = "${datadir}/systemtap"
 
 
 BBCLASSEXTEND = "native"
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
-- 
2.25.0


