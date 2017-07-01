Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E178B77D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 21:33:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d193so678899pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G0lqH1Dwm4myhq+VmsL7xHX+kPhrZ0l2QXyKyoL2rAk=;
	b=pA+7vwcKjkapAdKsmXi7za0DheTFhNPUNKHYGQX9IuDQ5W/15KaMIqweKGF3h+yPJ4
	bpJ4XwFUNOxe5G2HqvVR5DKTQu0gnJRq34aS/pZSVsupp0ChkoeazZCk2P9WbV0ruYQa
	GflfSCAHg/DW7CbaYwAwunqP1gwJ0cW/g19AR5UVfjOnbdLVHQT0oDBmUsqKUgYxqppj
	UdUH9+GgrjN0MRy0uVOPVRS7U6zBOIgwLzwN3YVakmVbjVvbmb55VTF76i244lNIq2Lw
	aoy/91YgNmZ8yODwB+XcFKMvc2tKRdp1MMGTsss0Km0vwiY+bDWF2lug7xC5/DH0r4Yg
	CiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G0lqH1Dwm4myhq+VmsL7xHX+kPhrZ0l2QXyKyoL2rAk=;
	b=cErn6gUPce68Wzd0wqHIpt4f7e92ugbaLfUJ1X0GfS/azAT2iE5VmKJsFS0YLqH2zm
	PvyyWIkr0mObIj9KEjMez7aB+Zvd6u2yufcOZ9EkEdys+v6v5X71fevd2Z68ioKW0XPV
	gtmuwGbz1FZe+pLCb3BupkSVfexzGlJG6AI+/jLQBphQhHM58U0BpJxW4sbV573TaG2c
	/kY/4+KV0YbNLzVa6ygXwq07rwD9W7eiQyvXnRyUbS3JykisCXJqyjW+FfNCbpjV7zT5
	HKfQJePAJi7IOsRpI3mRDoLhTGBRIrK+GdR+nc1bD2GiWxuUpnuUUCjliEFjf8iQSKeK
	UlCg==
X-Gm-Message-State: AIVw110TPPaPSgKkBhswtN/S/Xmrc4g4CIeA6zdP46/KOythVwTJffbx
	ysS/jWorqlqBsN1u
X-Received: by 10.101.88.8 with SMTP id g8mr2464208pgr.137.1498944811421;
	Sat, 01 Jul 2017 14:33:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	k129sm26060081pfc.87.2017.07.01.14.33.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 14:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 14:33:10 -0700
Message-Id: <20170701213310.18913-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170701213310.18913-1-raj.khem@gmail.com>
References: <20170701213310.18913-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] kodi: User external crossguid
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
X-List-Received-Date: Sat, 01 Jul 2017 21:33:31 -0000

Prune our .pc directory when looking for configure.ac files
Tighten the search regexp to look for just .ac or .in configure
files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 19806a12a..3bc2eb591 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -18,6 +18,7 @@ DEPENDS = " \
             avahi \
             boost \
             bzip2 \
+            crossguid \
             curl \
             dcadec \
             enca \
@@ -150,13 +151,12 @@ def enable_glew(bb, d):
 do_configure() {
     tar xf ${WORKDIR}/${BPN}-${ADDONSPV}-generated-addons.tar.xz -C ${S}/
 
-    ( for i in $(find ${S} -name "configure.*" ) ; do
+    ( for i in $(find ${S} -name configure.ac -or -name configure.in|grep -v ".pc") ; do
        cd $(dirname $i) && gnu-configize --force || true
     done )
     ( for f in ${S}/xbmc/interfaces/python/generated/*.cpp; do
        touch `echo $f|sed -e 's/.cpp$/.xml/g'`
     done )
-    make -C tools/depends/target/crossguid PREFIX=${STAGING_DIR_HOST}${prefix}
 
     BOOTSTRAP_STANDALONE=1 make -f bootstrap.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
     BOOTSTRAP_STANDALONE=1 make JAVA=/bin/true -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
-- 
2.13.2


