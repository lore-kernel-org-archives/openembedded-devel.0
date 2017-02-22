Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B69CF72FBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:09 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 89so2144773wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BqNEXSxXE9fTmLebTTuHk5YYEa5sEev9tBDP1CRZscM=;
	b=Rf5ixS2XVunPwuERq5GCekDz8atT0gkBFrrmBBZo6esVA6Rw+Vc1++bdiWE9kztZBf
	nwg4M8UkzakA5EOC8x2sLXgTzScxEvEIDPGNG5lp2Zje9oeKhqjbkh9VqH2jctowTzPo
	nMR3f2CNuzfgPQF0EXZZwsD4J0cIUnU9arweof2hHofqZ+iDluPF1MWMsh0udegQvSYV
	iWTiJzsqdWTvTIzpmqWBtQqysHQmwr7b2IwOLs1WZYn+aeKLbnnRQ5qAmYghZNaiNZH/
	V/9jvmvXDmK1y2GzotgwC9ZcOA8Pee4TqdM13Zw3Axt+lIggcs0fUFS2oSZgm0l9qV1i
	/4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BqNEXSxXE9fTmLebTTuHk5YYEa5sEev9tBDP1CRZscM=;
	b=K+mdU4GfxZ/3gcmb5vyggIY0mqElH3O2YtnGkN1I+zBs9Jkg1xSL/EdsuVHPkHKgsE
	gkEgwfy9559v+qxYi1GbidwisrDd/ys6l2Arm0SpmvCKOcr/dgXfPfEkIqrhksh2JvL6
	oO7xOd0N4oXIa99GouQW6FjexclFbDl+JiV7rx+Ab/IHZFcd0wnc1h41vMhrrwcMk0Ek
	0pXe5kxmQIlRc/DATlaVjRTcw3EpMVvBPWAPDLaTCvrpuTEqZ/ZMX5fQ+3sk4A1kDeox
	wE3quZLSc/3qcyes68kM4e9sxeTUnbcd1XwEBPHjyoEtcox1qJEtREqK2jknOguWXLBf
	fqcw==
X-Gm-Message-State: AMke39mQiOrH9MnklVTKWBxC3nJzC98cC4xG8q1dvCZysCAEfXTSIeGiTNMAQT1l+qvYmQ==
X-Received: by 10.223.149.137 with SMTP id p9mr26693144wrp.89.1487804590463;
	Wed, 22 Feb 2017 15:03:10 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:47 +0100
Message-Id: <20170222230250.30288-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] postgresql: use gettext bbclass and aublacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Although I reomeve gettext related packages from my build machine, I could not
reproduce error mentioned. Let's hope my asumption is good enough.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc       | 4 ++--
 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 314c23d..dd41188 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -19,7 +19,7 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
-DEPENDS = "zlib readline tzcode-native gettext-native"
+DEPENDS = "zlib readline tzcode-native"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
+inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd gettext
 
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
2.9.3


