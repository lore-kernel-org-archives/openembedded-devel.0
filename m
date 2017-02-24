Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id C2C84730CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:25:02 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n127so4465576qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3IgvSYU2WlpVkKaAdIyLAzJYG3siK3twrSmSm5DGKS0=;
	b=GwaGCjpOmbogWPgL7wulCoBnXHRSWA0YAZhABWZAbYdpG2WnYMLTNg0iP2aJnDQRsO
	oeh9ToVFdPzepmh1zjWJfvEZKACdB4gHRoxWsfKLQXsDOncNYWXIAlbbP0dbeDcmUhIC
	8zO9nBQGSwkvk4oN2ERkYV3SlQtqXewT2eV9YsdrTfTvsy41n+NH4XGLCueHC0jPCNOS
	ZBs1kjfbwV1sp1/muzh8LPd3fDlEuNgBNK/kl6/49kp0bxFHoAhrHWBBGqK9URBakePG
	oZIwn7PGaEu/k9iHO/3sD0mrvxO7P4MIcYThRmkbcJWcUP/iYZV5mwLIlstuvk3Y58jW
	nhfg==
X-Gm-Message-State: AMke39lXocpuuh8Ghz38zfdsYxH9TpfrGRRJnTimzu3u39Eb3mL8+C9zOalaZAWAYt0Eww==
X-Received: by 10.55.94.198 with SMTP id s189mr4579776qkb.236.1487971503728;
	Fri, 24 Feb 2017 13:25:03 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id d22sm5561451qkj.4.2017.02.24.13.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 13:25:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 16:24:53 -0500
Message-Id: <1487971493-28136-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] postgresql: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 21:25:02 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/131632/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/postgresql/postgresql.inc       | 4 ++--
 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 314c23d..cce513f 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -19,7 +19,7 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
-DEPENDS = "zlib readline tzcode-native gettext-native"
+DEPENDS = "zlib readline tzcode-native "
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
+inherit autotools gettext pkgconfig perlnative pythonnative useradd update-rc.d systemd
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
index 4787e57..5498350 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
@@ -9,5 +9,3 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "1171df0426fe4da5a29f6cdaf2e8b812"
 SRC_URI[sha256sum] = "7061678bed1981c681ce54c76b98b6ec17743f090a9775104a45e7e1a8826ecf"
-
-PNBLACKLIST[postgresql] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131632/"
-- 
2.7.4


