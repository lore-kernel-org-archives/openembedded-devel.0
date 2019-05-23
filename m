Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6957E43C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:55:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so5952026wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YBKr5D2UUzkoSnm9cso5lWGxqyeJh65anz613J5bvlc=;
	b=gVdTRfRayfEiV9uw9mneW73IydVeqmRla8HFNyKhNwKOzkG5bgPZv674HEdNbqfVGH
	5ISd8Tiatz4/CH9A+z7Ymzs9jUO52IdsVzmFR8zV7OKZ7XzxLDzT0oOC/AhtFkt5OAtv
	8BLbc5Rg2C6mPbz2p27acHl+/T1hZ1sijhXKSkP1RVXpRbBp6cegig93tMArC1VoXxk7
	78yE5PkBGIjKNjkq+EpE1NdwCZevMEoVqmFWMa/g3xmo/nKkv225S0EVJ+WHTSWkWCOX
	enmPcBr/bVqIaYzgUDECzEngETvn7kZ6U7VBGdKTbtNvG7QgkxkejmtEOouXdImpCBOw
	ljjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YBKr5D2UUzkoSnm9cso5lWGxqyeJh65anz613J5bvlc=;
	b=k54tHgZMPsG7+rqn+iN+5o/nbWJf11g4XN3t7FF9AwTmLSRmcPZ/8nK+fKcoRdlkzh
	blzpvtBOvQIT6NbaAgSvRpOk4BWc12PqKgaUL8zVwvGEKwJ1UYeZtAUe8niYASJU2uks
	JfLqFe6+W8hf950yAiwLOguX/FNuSzEfEZk2jZ2T/YiBvRB+AiY5EtC60lw0Xo5x5eXz
	frv5LgvMmz5XC8UzSvNYhC0NUl0UxM2OClrLr7xVjCca9Y/xmOcxulbELCXdfvST1b/C
	+/EPJOC6uyWFph3pym4Cxr7VbcV8HO3jKLVqMRLYioGQITXlWiqOSCXHBNJiFjNp2X9C
	fz/w==
X-Gm-Message-State: APjAAAUxeKX3nRWAKnlRfs3Z6E2Q4uze4cDfew5AvuBV2d8iCnMXCG9A
	ZGsiV0+LpAHAquozwbADq96+e/YK
X-Google-Smtp-Source: APXvYqxqJQBMgsTtDArq1/xnv9kSXapaNGbo1FL/aUoo8XvuTqvUAWsKRPAsQJnt6Z/OF0P7J9GD5Q==
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr3644927wrw.170.1558612501015; 
	Thu, 23 May 2019 04:55:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z193sm2727231wmc.20.2019.05.23.04.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:55:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:55:01 +0000
Message-Id: <20190523115505.18245-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/8] hunspell: use git fetcher instead of github archive
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
X-List-Received-Date: Thu, 23 May 2019 11:55:00 -0000

* fixes:
  ERROR: QA Issue: https://github.com/hunspell/hunspell/archive/v1.7.0.tar.gz: SRC_URI uses unstable GitHub archives [src-uri-bad]
* there is developer uploaded tarball in:
  https://github.com/hunspell/hunspell/files/2573619/hunspell-1.7.0.tar.gz
  but it's already reconfigured which we don't need, so I've used git fetcher
  to stay closer to what we already use.
* the diff between:
  https://github.com/hunspell/hunspell/files/2573619/hunspell-1.7.0.tar.gz
  and
  https://github.com/hunspell/hunspell/archive/v1.7.0.tar.gz

docker-shr @ ~/hunspell $ diff -rq hunspell-1.7.0*/
Only in hunspell-1.7.0-archive/: .gitignore
Only in hunspell-1.7.0-archive/: .travis.yml
Only in hunspell-1.7.0-archive/: COPYING.MPL
Only in hunspell-1.7.0/: INSTALL
Only in hunspell-1.7.0/: Makefile.in
Only in hunspell-1.7.0-archive/: README.md
Only in hunspell-1.7.0/: aclocal.m4
Only in hunspell-1.7.0-archive/: appveyor.yml
Only in hunspell-1.7.0/: compile
Only in hunspell-1.7.0/: config.guess
Only in hunspell-1.7.0/: config.h.in
Only in hunspell-1.7.0/: config.sub
Only in hunspell-1.7.0/: configure
Only in hunspell-1.7.0/: depcomp
Only in hunspell-1.7.0/: install-sh
Only in hunspell-1.7.0/: ltmain.sh
Only in hunspell-1.7.0-archive/m4: ChangeLog
Only in hunspell-1.7.0-archive/m4: README
Only in hunspell-1.7.0/m4: libtool.m4
Only in hunspell-1.7.0/m4: ltoptions.m4
Only in hunspell-1.7.0/m4: ltsugar.m4
Only in hunspell-1.7.0/m4: ltversion.m4
Only in hunspell-1.7.0/m4: lt~obsolete.m4
Only in hunspell-1.7.0/man: Makefile.in
Only in hunspell-1.7.0/man/hu: Makefile.in
Only in hunspell-1.7.0/: missing
Only in hunspell-1.7.0-archive/: msvc
Only in hunspell-1.7.0-archive/po: .gitignore
Only in hunspell-1.7.0/po: ca.gmo
Files hunspell-1.7.0-archive/po/ca.po and hunspell-1.7.0/po/ca.po differ
Only in hunspell-1.7.0/po: de.gmo
Files hunspell-1.7.0-archive/po/de.po and hunspell-1.7.0/po/de.po differ
Only in hunspell-1.7.0/po: es.gmo
Files hunspell-1.7.0-archive/po/es.po and hunspell-1.7.0/po/es.po differ
Only in hunspell-1.7.0/po: hu.gmo
Files hunspell-1.7.0-archive/po/hu.po and hunspell-1.7.0/po/hu.po differ
Files hunspell-1.7.0-archive/po/hunspell.pot and hunspell-1.7.0/po/hunspell.pot differ
Only in hunspell-1.7.0/po: it.gmo
Files hunspell-1.7.0-archive/po/it.po and hunspell-1.7.0/po/it.po differ
Only in hunspell-1.7.0/po: pl.gmo
Files hunspell-1.7.0-archive/po/pl.po and hunspell-1.7.0/po/pl.po differ
Only in hunspell-1.7.0/po: pt_BR.gmo
Files hunspell-1.7.0-archive/po/pt_BR.po and hunspell-1.7.0/po/pt_BR.po differ
Only in hunspell-1.7.0/po: tg.gmo
Files hunspell-1.7.0-archive/po/tg.po and hunspell-1.7.0/po/tg.po differ
Only in hunspell-1.7.0/src: Makefile.in
Only in hunspell-1.7.0/src/hunspell: Makefile.in
Only in hunspell-1.7.0-archive/src/parsers: .gitignore
Only in hunspell-1.7.0/src/parsers: Makefile.in
Only in hunspell-1.7.0-archive/src/tools: .gitignore
Only in hunspell-1.7.0/src/tools: Makefile.in
Only in hunspell-1.7.0-archive/src/tools: fuzzer.cxx
Only in hunspell-1.7.0/: tap-driver.sh
Only in hunspell-1.7.0/: test-driver
Only in hunspell-1.7.0-archive/tests: .gitattributes
Only in hunspell-1.7.0-archive/tests: .gitignore
Only in hunspell-1.7.0/tests: Makefile.in
Only in hunspell-1.7.0-archive/tests: hu.wrong
Only in hunspell-1.7.0-archive/tests: nepali.wrong
Only in hunspell-1.7.0-archive/tests: ph2.good
Only in hunspell-1.7.0-archive/tests/suggestiontest: .gitignore
Only in hunspell-1.7.0/tests/suggestiontest: Makefile.in
Only in hunspell-1.7.0-archive/tests/suggestiontest: prepare2
Only in hunspell-1.7.0-archive/tests: wordpair.good

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
index 40da3b4965..c2fb4fa05b 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "b2399a4aa927e8b3e171d9ea6737cc02"
-SRC_URI[sha256sum] = "bb27b86eb910a8285407cf3ca33b62643a02798cf2eef468c0a74f6c3ee6bc8a"
+SRCREV = "4ddd8ed5ca6484b930b111aec50c2750a6119a0f"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext
 
-- 
2.17.1


