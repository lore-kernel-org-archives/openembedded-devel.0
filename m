Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5272A746B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id s16-v6so3921922edq.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PWAmvhDiqfIewQOd66mXpnmXA10wxps6JE/fj1PIphE=;
	b=jCQKBxid/8j5eDVX49qeHw6vR30KHx0+NbVSFovYieejapZYIyJAmuAEP58cxrFNdM
	nmG8HZgWqjK5eZplxKheKjeOBIZlWBIm+gt0Euf8giMW0tCN56wWq3IPr8Rxd18LWO4O
	5jS3u2zh+GVoQOipMnmBYgh7h4AF1/w0uq/UcJKRE95xSCADie768omozmlO+oPSo+q+
	lvLHqK8ua8ZhFGxBHYrUv7aRLCARKYltuQk8VPeLhQSAvHhG0S6MgPnlfjzf72UL7bFn
	Oex2aKulBKCGc9D3yAupcDO4Ij6aOT/mxHl1omTWLpTjLwoLOCCzsaLq9G+nXICv7rNk
	eY1Q==
X-Gm-Message-State: AOUpUlGfrFy5rMJzXCZlMqRXEsdA/Xs4mzr3R9J7JHE/UcKRp+5spble
	cRrj0PfoGxCDrHXAkIy03a2K2jz2
X-Google-Smtp-Source: AAOMgpd1JlKnWwgna80KpG9dFVMtE6FcoSBdXLvgtvFJAjEg62H64hHy05208lOI7hPsqBDVzkeHsw==
X-Received: by 2002:a50:b8c5:: with SMTP id
	l63-v6mr7254550ede.80.1532698171807; 
	Fri, 27 Jul 2018 06:29:31 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:23 +0100
Message-Id: <20180727132923.15149-7-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 7/7] ca-certificates-java: switch to more generic / more correct JAVA (R)DEPENDS
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This recipe here actually depends on Java7 upwards, not Java2 upwards,
so state that dependency correctly using the newly introduced (virtual)
RPROVIDES of the OpenJDK8/OpenJRE8 recipes.

At the same time, we can remove hard-coded references to openjdk-8 and
openjre-8, and thusly make the build more flexible.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../ca-certificates-java_20180516.bb                   | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index a2d7abd..2ae7352 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/javac-native fastjar-native"
 # We can't use virtual/javac-native, because that would create a
 # keystore that can't be read on the target (as virtual/javac-native
 # usually is either too old, or plain incompatible with this)
-PACKAGE_WRITE_DEPS += "openjdk-8-native"
+PACKAGE_WRITE_DEPS += "virtual/java7-runtime-native"
 
 SRC_URI = "\
 	git://salsa.debian.org/java-team/ca-certificates-java.git \
@@ -31,12 +31,6 @@ B = "${WORKDIR}/build"
 
 JARFILENAME = "${BPN}.jar"
 
-python () {
-    runtime = d.getVar("PREFERRED_RPROVIDER_java2-runtime") or ""
-    if not runtime in ("openjdk-8", "openjre-8"):
-        raise bb.parse.SkipRecipe("PREFERRED_RPROVIDER_java2-runtime '%s' unsupported" % runtime)
-}
-
 do_patch_append () {
     bb.build.exec_func('do_fix_sysconfdir', d)
 }
@@ -99,7 +93,7 @@ pkg_postinst_${PN} () {
 }
 
 RDEPENDS_${PN} = "ca-certificates"
-RDEPENDS_${PN}_append_class-target = " java2-runtime"
+RDEPENDS_${PN}_append_class-target = " virtual-java7-runtime"
 
 FILES_${PN} += "${datadir_java}"
 
-- 
2.18.0


