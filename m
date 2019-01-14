Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id AE24B6D196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 18:45:26 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id w4so30227plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HShFU1O/A36keKp2jr2E0LjA7yQgObqjvSsBzVM7IOI=;
	b=SW2/HFx5KD1ozKn3Iyj7TLoBk/HkyLhDxeAsulfzqZubiHOp+ffq0j61J/qg03BqCD
	iUovjAnYNwHaEhGH+mbM6C1SCK8cFoeOdNSStDur8COLuwSGio2c+paKEx5LRkrd93ft
	80F+vcx/NjAjfmquSNcTpY2HJbRQifjn8JMS0WA2h+ZmZLwuPaI7K5m9aRUpOgqfWbxf
	kTKkdzEOf5OrEsr6IQ/X/IHGejuvAWsMn9uV7kePhe9P/Qat1PE+JxykpVfeZ8YBFsTq
	NSYc+WZk+FidCZxSgTLuDScnF2hFG3vQ/Jnsa1wu7GSIf9+z7P4YXp8I0EWoFSWQDws2
	2DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HShFU1O/A36keKp2jr2E0LjA7yQgObqjvSsBzVM7IOI=;
	b=OpbECTKIuFyj2PofUkqSAKyLHuG+Jvw5OvouUdoGvEB6u6S+Dat8euwqEQG3hWuabd
	fow57FuUeu3c9iGMHfAM13WvYc83hNh4Kypsu73Pu1tSzhTqnIhDV9ZSsoMzgInAEmt5
	YTD9TulWT+GbIWuM+ZDee2O3Z/2sKTrLxn3UBkNhZmYRRk/PZqsUDV8apa5E/tO5REJw
	iWbi6f9vAsTvBQdZ1YdneveBzHlHFEPeABO9yg9Cb/u/hTfPpGna7ARp1Iyxuelss4Lj
	e2ipdtz0Eojdz+/Q52N7bWEvJ1ztW5XTi8HIuIZgo9ELml0cWxHN6pAN3VP12Ke8zxvj
	GqSg==
X-Gm-Message-State: AJcUukdUvvPdvE2v6e3Z+ld4CDohOCkUrPhjrvSYuqhbnjNHfqlqea3N
	iARLqQO9aMK9PNfTiK6q1ElPO+lkEgE=
X-Google-Smtp-Source: ALg8bN74B6dGMCEcWy+FLRE/8/eBym1k50EMOVhT1i+4Q016luC9uCewfrBWv041lEWxwkVP2WEmDg==
X-Received: by 2002:a17:902:bb05:: with SMTP id
	l5mr27296810pls.230.1547491527326; 
	Mon, 14 Jan 2019 10:45:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	x27sm1431554pfe.178.2019.01.14.10.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 10:45:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jan 2019 10:45:17 -0800
Message-Id: <20190114184517.39683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] haveged: Upgrade 1.9.4
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
X-List-Received-Date: Mon, 14 Jan 2019 18:45:26 -0000
Content-Transfer-Encoding: 8bit

Upstream release mechanism has switched to using github
Forward port and update patch status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ged-init.d-Makefile.am-add-missing-dependency.patch | 10 +++++-----
 .../haveged/{haveged_1.9.2.bb => haveged_1.9.4.bb}     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.2.bb => haveged_1.9.4.bb} (83%)

diff --git a/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch b/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
index 36fd57c9bc..020ac2c3b8 100644
--- a/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
+++ b/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
@@ -3,13 +3,14 @@ From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 27 Mar 2018 10:21:09 +0800
 Subject: [PATCH] init.d/Makefile.am: add missing dependency
 
-install-data-hook should epend on install-exec-hook, or the
+install-data-hook should depend on install-exec-hook, or the
 haveged.service might be installed incorrectly when build
 with -j option.
 
-Upstream-Status: Inappropriate [no upstream mailing list]
+Upstream-Status: Submitted [https://github.com/jirka-h/haveged/pull/13]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Khem Raj raj.khem@gmail.com
 ---
  init.d/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,12 +22,11 @@ index 5940f78..07bcdf7 100644
 @@ -33,7 +33,7 @@ if ENABLE_SYSTEMD
  install-exec-hook:
  	$(do_subst) < $(srcdir)/$(src_tmpl) > haveged.service;
- 
+
 -install-data-hook:
 +install-data-hook: install-exec-hook
  if ENABLE_SYSTEMD_LOOKUP
  	install -p -D -m644 haveged.service $(DESTDIR)`pkg-config --variable=systemdsystemunitdir systemd`/haveged.service;
  else
--- 
+--
 2.11.0
-
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
similarity index 83%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
index bf1367391b..32aab59f16 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.2.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
@@ -5,14 +5,14 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://www.issihosts.com/haveged/haveged-${PV}.tar.gz \
+# v1.9.4
+SRCREV = "faa40ff345af194d3253f5fb030403e3c9831c36"
+SRC_URI = "git://github.com/jirka-h/haveged.git \
            file://haveged-init.d-Makefile.am-add-missing-dependency.patch \
 "
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "fb1d8b3dcbb9d06b30eccd8aa500fd31"
-SRC_URI[sha256sum] = "f77d9adbdf421b61601fa29faa9ce3b479d910f73c66b9e364ba8642ccbfbe70"
-
-UPSTREAM_CHECK_URI = "http://www.issihosts.com/haveged/downloads.html"
+UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
 
 inherit autotools update-rc.d systemd
 
-- 
2.20.1


