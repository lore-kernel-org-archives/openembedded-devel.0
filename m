Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9345B790A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 15:12:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id o18-v6so9919274wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iOE8p5xvSnE0dK3egn1qnWBBV+NhTqs8gQIe/9572zQ=;
	b=WX8X3nblFezMOTkJnWpESGuSP2Udbj/rgviDyNKXQJ+zF1CCCWvzcfwMTH+i4JpKtX
	3ASRBcW6R92OOvvgT0wit258SAAD9Df6fg0HLZ9Qi/5QlqVFx5AEfQEf0ROld4+6A5Zo
	se0XB6E5wDsccCuzg0s69F7xJyaq18RHMoR7hQcTlKN8bDIPcfWJlZClYWD3+XAEhCvT
	eGn6IJ6WakEZwX7dFvl8q1K42KEnGG/dLcki3Wg6lVnOxyC/4oSCLP6pLhJaXByk3z+3
	FxMp7V/akMxWQ6+xlMvG31LXepVqFXCNqteAmhf2tiS/3KB6lj9xDQF0TAKlNkAXLxU3
	yXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iOE8p5xvSnE0dK3egn1qnWBBV+NhTqs8gQIe/9572zQ=;
	b=WpMmv591w1X5MU48D4znrNjTkV8p1tNmw+gQeeigerJdEl1WtLlgeHdB4Qup9RZcAT
	hj3GK0gMtwVgs4fvN+3bmFV6MSYrTBR5Evs6el46WzgQm7EIRtDIfNRjneKTemkcDIl2
	8rcM29MpMVLCNDXAoa2pmeOXSkzwOXdsn47DgFBAIRgc4jMESA6GTIqCw+YHGtVfKcZ/
	SshwMbSImDaHR8qaaiTuSUHemag6VXaXQgPXfk/FmIny0YHdw4ejGpId/R07HOZabIBD
	IzVyoAd9128yPI+Fs8WApL3Ome0oK28QVPnnGMSRjq8/GC+GPZ3HOJhrjxIcm8z7r1VG
	Sntw==
X-Gm-Message-State: AOUpUlHBbjSr0/Zkz7Wrxn0dRb74gd0USMzJwjOE/trPeQYK9ed7eV93
	aBT4YwZ9J3QLx13JiyZvhzh2SSd7
X-Google-Smtp-Source: AA+uWPzhL0cH2ebYVcizLP1WeH+sjB7nmXTervY22uImwioAhYY+L++eWA5xGnDd1hIqN5wwoEw59g==
X-Received: by 2002:a1c:3503:: with SMTP id
	c3-v6mr18923499wma.46.1534605141052; 
	Sat, 18 Aug 2018 08:12:21 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g2-v6sm14238693wrd.71.2018.08.18.08.12.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 08:12:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 15:12:17 +0000
Message-Id: <20180818151218.6980-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] fwts: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 15:12:20 -0000

* fixes:
fwts/18.05.00+gitAUTOINC+b0ec7aa2ef-r0/build/src/acpica/source/compiler'
m4 -P -I../../../../../git/src/acpica/source/compiler ../../../../../git/src/acpica/source/compiler/aslparser.y > aslcompiler.y
flex -i -PAslCompiler -oaslcompilerlex.c ../../../../../git/src/acpica/source/compiler/aslcompiler.l
yacc -v -d -y -bdtparser -pDtParser ../../../../../git/src/acpica/source/compiler/dtparser.y
flex -i -PDtParser -odtparserlex.c ../../../../../git/src/acpica/source/compiler/dtparser.l
yacc -v -d -y -bprparser -pPrParser ../../../../../git/src/acpica/source/compiler/prparser.y
flex -i -PPrParser -oprparserlex.c ../../../../../git/src/acpica/source/compiler/prparser.l
/bin/bash: yacc: command not found
Makefile:3684: recipe for target 'dtparser.c' failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index defe31ddff..d3fb644dfd 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-DEPENDS = "libpcre json-c glib-2.0 dtc"
+DEPENDS = "libpcre json-c glib-2.0 dtc bison-native"
 DEPENDS_append_libc-musl = " libexecinfo"
 
 inherit autotools bash-completion pkgconfig
-- 
2.17.1


