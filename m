Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2020D7198D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 14:29:46 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so3728554qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KI1PG2ujO0qTFbVIyCwwj3eVdZua17KbBTG0T1OZcwc=;
	b=vyVSvlAKot9bpNKG7iVw2334jixP6rEBV93ui4zQlY2bIO4Tx9IKC2IqMjTCSrHdwf
	yusEeAVbOxmyvwo1v4PbBVRXrn94VF/6dbI/NpGdFCq7iNLK0fugRYTU4D1u7nwsI4/L
	r5T5VuqcN150C70rQp2X1Qpv7NsJQMCsl/0zCrtMu8rFVGr2dMiGUw/pyabPKa40gIip
	odbD7LgD6WscuPEGa2d/KkTSkDT93ne5DwbulDryGKukpb98QtTfVxn1KJsni2K5MNIr
	wYFxzD5guW83PdgqryVt0EMwCYuE3K8GChYDz5itwZ074j5EHrXYjZJJZk7P2lUoYr2r
	pKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KI1PG2ujO0qTFbVIyCwwj3eVdZua17KbBTG0T1OZcwc=;
	b=W491qoy98nOtY0WmAZqQ6eKszbCB/yM2/j9Z4V87aYKrJxCQxkGxBleWh+Vg1dJx8m
	8uvNo/kPt95asLgpcpIoe/0wMVBuG0Z0eZlvIVkCaCIf83Rp0vVoPqhKdeD8Z/aSWcPh
	4c2OgtktXfIi8cUxFVpCAUoZz+k3pEKqxs9EORt+pfh6B5rchcps35gGGpsmKum613Jp
	/Tj/tYhJ56o9nv3nEswU5MZYqvVe1MNSlmbIHeaxvRPthQtvGCJcjP9B+KdlWSNQcfZa
	Hfx19nkx66jJOHGcLcULAw6BnTCVfG60MjIQvlxg2CZxeZgMB0UN5vn+umpJ3l8OrThE
	Pl/g==
X-Gm-Message-State: AA6/9RkiUewP+/4Z/std0vQQh2TOujgTIOESEkx8mTP2UrgQ1xATR0gmNE5og59EZU0v7g==
X-Received: by 10.194.235.34 with SMTP id uj2mr1886796wjc.144.1476282587400;
	Wed, 12 Oct 2016 07:29:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	pe5sm13381673wjb.15.2016.10.12.07.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 07:29:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2016 16:29:45 +0200
Message-Id: <20161012142945.6272-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-oe][WIP][PATCH] gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now empty EXTRA_OECONF
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
X-List-Received-Date: Wed, 12 Oct 2016 14:29:46 -0000

* this will fix mongodb build for x86
  http://errors.yoctoproject.org/Errors/Details/90392/
  which was failing because of missing --wiredtiger=off in qemux86 builds

* also we can drop DISABLE_STATIC, because now it's not leaking through
  EXTRA_OECONF

* it will also resolve again autodetected dependencies on bluez, qt and
  tcmalloc as shown in bitbake -e output:

env.gpsd-before:EXTRA_OESCONS="     sysroot=/OE/build/oe-core/tmp-glibc/sysroots/qemux86     libQgpsmm='false'     debug='true'     strip='false'     chrpath='yes'     systemd='true'      "
env.gpsd-after:EXTRA_OESCONS="     sysroot=/OE/build/oe-core/tmp-glibc/sysroots/qemux86     libQgpsmm='false'     debug='true'     strip='false'     chrpath='yes'     systemd='true'      bluez='true' qt='no' "

env.mongodb-before:EXTRA_OESCONS="--prefix=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0/image/usr                  LIBPATH=/OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/lib                  LINKFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'                  \
  CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0=/usr/src/debug/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux= -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/qemux86= -fvisibility-inlines-hidden'                  \
  TARGET_ARCH=i586                  --ssl                  --disable-warnings-as-errors                  --use-system-pcre                  --use-system-zlib                  --js-engine=none                  --nostrip                                    mongod mongos"
env.mongodb-after:EXTRA_OESCONS="--prefix=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0/image/usr                  LIBPATH=/OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/lib                  LINKFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'                  \
  CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0=/usr/src/debug/mongodb/3.3.0+gitAUTOINC+aacd231be0-r0 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux= -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/sysroots/qemux86= -fvisibility-inlines-hidden'                  \
  TARGET_ARCH=i586                  --ssl                  --disable-warnings-as-errors                  --use-system-pcre                  --use-system-zlib                  --js-engine=none                  --nostrip                   --use-system-tcmalloc --wiredtiger=off                  mongod mongos"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb   | 3 +--
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 4ff6d91..b7b8968 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -46,9 +46,8 @@ EXTRA_OESCONS = " \
     strip='false' \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
-    ${EXTRA_OECONF} \
+    ${PACKAGECONFIG_CONFARGS} \
 "
-DISABLE_STATIC = ""
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
 
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index cb6c1b3..f1a6555 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -43,9 +43,8 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --use-system-zlib \
                  --js-engine=none \
                  --nostrip \
-                 ${EXTRA_OECONF} \
+                 ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
-DISABLE_STATIC = ""
 
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} || \
-- 
2.10.1


