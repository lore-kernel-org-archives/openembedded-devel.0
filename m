Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB7FC7E8DB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l19so3400519pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wIyn74LDC4SUJLEJ3sb9ZEvu00jX+RARb2fvWovKxYg=;
	b=MTkdNRUsy7XbpQ7KOecGNw3R23pPCaVc5HihzHV2vXCHEXPT+WdvYBXbMkSrf0F/Kt
	kx8pvMrw6L4S5b6zmSVAMVBRmdU8QkQvMiwSoPRT/4P/d30tJKh/CqJUzPzYO29Fr5Iy
	UbmLFU+EckIpFxNPcdtcbi6qr5ccKLj8P6C5uNEf/XRyFTfopZNLuRFCB6Olq/CCGKd4
	7bU0/8mR7E2SKgogY8ChKxFCW2pKW0UanDHXVsu8DYtg8ueh7QAbdwoC0c9EQCnt6ojv
	IHo9i0nVyhG2ffucoEGypHBbnebYtZ9quZhfdFJcnCp/nWXOi4V1FsuXjTnWcADSSeWD
	ejFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wIyn74LDC4SUJLEJ3sb9ZEvu00jX+RARb2fvWovKxYg=;
	b=KxGKpoIYcGueo+CUNoGDaWM1Ro5aEJZ7Wq156EprKADFbJKVyhi44irzZUWgqRt3O3
	ucgDH+oKkD8KPikP8neF15mDMc0dFFIwEnu6uVbrLBzBKwsV6eX5SpQ9D+yJ4h8/YWph
	Hvv7KeQg+WfLna+a/fLvXXQrYHeH78XYoO6x9uLCzLL1Z0k8m5bfIBH3w4qyY9eZihhy
	gPKTSrz4yd8HnFOCDLtAE1BdbHaUNBJ7JTxzpFxE/zBQ93B1ipiJaqPn7ZIswQp2/tsB
	+ysQN0KSTVhcJur+SARlpQeyProS/IEMWhgl4d2HUZRlVysnk3SZkCYz8nZTPhKWCfQN
	4WcQ==
X-Gm-Message-State: APjAAAV1sI/e7XfMh6V9a2TzkySaUloWbteyCpPyK3xgTnq1+gSVP/NI
	0S5bG+gTJDhW0FkFlbE2RhsEGH3W
X-Google-Smtp-Source: APXvYqx1RsvlNmGzLoM1vJmVRPzKihmBd+Uwh6Qsudjk1bqTnGlWi6Q54VWcPtbtIQmqUJJwc6dCyA==
X-Received: by 2002:a63:234c:: with SMTP id u12mr41959828pgm.264.1560621464876;
	Sat, 15 Jun 2019 10:57:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:18 -0700
Message-Id: <d102c4e29e4bc5af10422aa9161a869e32c116b0.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 14/23] hunspell: use git fetcher instead of github archive
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:44 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
index 40da3b4..c2fb4fa 100644
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
2.7.4


