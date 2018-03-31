Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD2974745
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 09:47:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v21so18635597wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KIZwVfGYW27z3kd8EeNscpTa3rIdWA0A2PHskVhzXsI=;
	b=Eyr76HoC9bWjN6NO6CKKzo6EpMf012vX1GeBT4gOwknmrw1TR2NU4teYcKndJbDlxi
	MT7oeXdQgYXllJ9aQxgWpaQDSjP+m82W7GOUv9YyvcYnFyIr4F1rcD6G7e0a+5Bx6KBi
	DerbmQyFa3DGwgjWHJklS8HLNhZCOGR7yBsKhg2tlgn9NV8k9Rj0vLXqC7BlpZiaQG69
	4vfAWeqnBIpdJ1/HFi0xXY8+dgG/1VFGARrqlBNW4F0phlHAupwFbu47+9Or9cL8VQE0
	pgXzSU6akQfncZ+FreH1qbug3JiZZE/bVIRVP2kBr14A/HlaYNlz48TB/qQBPXO4O6KT
	PL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KIZwVfGYW27z3kd8EeNscpTa3rIdWA0A2PHskVhzXsI=;
	b=dS45C/1GO8/Gg3nmgmy7XeJjMyPU9xLnkFuTagUURX1mGGC6Dx9zgflBUl22rK9utt
	8LNAQAzYg+2BXK1BrE3t6JMJGPG0B2r6VoD25vTRhYxIcbsuj5q81SHUQ27pzP2gjdzk
	NXjpOYXzqt6i1J+pQLlQzE+9UnO+wQxzwsWr6g3/oodbBqR/TNzVNKSW3LRPdI8JVSPk
	UF6rOdLiDwYCcdPg2/5s10XqrgY2YolqRCtJ1aurz0n/BsThW4xOs4UyANNPsFc5Pmxx
	LGFvYNal6h8VDZjclCVVHfx9jt8aPqV+W7eVsIpJq/z8AJeq2zm51i//TICu1pIvl01p
	QXSA==
X-Gm-Message-State: AElRT7FwdaxtRHIaxnupeITN/eKhpm92ujckz7/V+Way7MM1BhIdOC8S
	PgBk+gq8abWEu3GKVDB5Ij4nvg==
X-Google-Smtp-Source: AIpwx4+tnYcLxule20rAmTBeB80b9+kHHKXhkagpotKR+nIJiFVk5PindEhcft8FINo3a45UoGGf3g==
X-Received: by 10.28.69.133 with SMTP id l5mr3985472wmi.152.1522489673687;
	Sat, 31 Mar 2018 02:47:53 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 69sm11132634wmn.9.2018.03.31.02.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 31 Mar 2018 02:47:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Mar 2018 09:47:52 +0000
Message-Id: <20180331094752.19097-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] geoclue: inherit gobject-introspection
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
X-List-Received-Date: Sat, 31 Mar 2018 09:47:53 -0000

* remove gobject-introspection-native dependency which is added by the
  bbclass
* fixes:
  TOPDIR/tmpfs/work/armv5te-oe-linux-gnueabi/geoclue/2.4.4-r0/recipe-sysroot/usr/bin/g-ir-scanner-lddwrapper: 2: TOPDIR/tmpfs/work/armv5te-oe-linux-gnueabi/geoclue/2.4.4-r0/recipe-sysroot/usr/bin/g-ir-scanner-lddwrapper: prelink-rtld: not found
  TOPDIR/tmpfs/work/armv5te-oe-linux-gnueabi/geoclue/2.4.4-r0/recipe-sysroot/usr/bin/g-ir-scanner-qemuwrapper: 6: TOPDIR/tmpfs/work/armv5te-oe-linux-gnueabi/geoclue/2.4.4-r0/recipe-sysroot/usr/bin/g-ir-scanner-qemuwrapper: qemu-arm: not found
  If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
  (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
  reported by world builds since:
  http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180311_083331.log
  http://errors.yoctoproject.org/Errors/Details/170607/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
index 1d531aec70..b31d8eb4ef 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
@@ -8,9 +8,9 @@ SECTION = "console/network"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
 
-DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native gobject-introspection-native"
+DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gobject-introspection
 
 SRC_URI = " \
     http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV}.tar.xz \
-- 
2.15.1


