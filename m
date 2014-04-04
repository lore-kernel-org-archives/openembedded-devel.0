Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 36D6E6AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Apr 2014 22:48:12 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so4050180pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2014 15:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oq9gxgEG7kBUUrbvMD2mCOiikyHBAYHhyljpVnTg2QU=;
	b=GGiVu1a2GDv8/IcF3m//55z5VvHpz1CdYnjbBTlwgDgpf5mianGzZzSwxB46Rd2taf
	lBmhbwAPRqyHasFJeFCIkC07SFk3Os/tja/Wat4EWP0S+6U5uOQNNiZwinGxAw1Qwn8O
	M5LcijvRKc4w1ZeniwlgUl4aZBLEBxdEj1V9KtHKRNuWsmOnLw4fWNSoo9jPn52kDeAU
	4E3/IL4NLsTqUJsUUM475p1sCYR0CqIJFSWJ5pxUlUkrF78q8hTtO3kAKSp59WVMHpMa
	nm3ma3bRbbeP46doiGC9hV+szl8625M/sL4qKT1fuAYG9ghSFSuOnQDQwbFoNGZbuD1K
	JT7g==
X-Received: by 10.67.14.69 with SMTP id fe5mr17792768pad.120.1396651693502;
	Fri, 04 Apr 2014 15:48:13 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	aj7sm46410312pad.29.2014.04.04.15.48.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Apr 2014 15:48:09 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Apr 2014 15:47:55 -0700
Message-Id: <1396651675-32469-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] gpm: sets D equal to DESTDIR instead of ROOT in do_install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Apr 2014 22:48:18 -0000

This corrects a gpm install failure due to ROOT being used instead of
DESTDIR, resulting in DESTDIR being undefined.

Upstream-Status: Inappropriate (distribution/packaging fix)

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index e35e50e..a30a891 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -40,7 +40,7 @@ CFLAGS += "-Wno-extra -Wno-error=unused-but-set-parameter -Wno-error=unused-but-
 CFLAGS += "-Wno-error=int-to-pointer-cast -Wno-error"
 
 do_install () {
-    oe_runmake 'ROOT=${D}' install
+    oe_runmake 'DESTDIR=${D}' install
     install -m 0644 src/headers/gpm.h ${D}${includedir}
     install -d ${D}/${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
-- 
1.9.1


