Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC6C7548E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v90-v6so5980492wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FGbGV0cXSiNeW9yopFle9CFisIKheJNNEOz/ViOg2mA=;
	b=Bvj1QCQj5twscArxvKf60lxaru4opM7SxIL6f5a3cLMJAaA41rXN21qMHFG9ZZagTs
	zrUXbBV9NqOKx7hi3EJeHvaNLXH2i/upOjig+irj04k3Z3uO9q7QZGn+4HNyyu9Cgdgc
	V2QUf2fN7yXE1p5iKqeyUoqF1ni1MxdSZ4ghDVCEdjXK1GPD50hMK52gsijqX6R6FTct
	JGht/yGUNCtrLSuqRbmHa95g7+kDW4nq6BqGH4LKtvs5W8c2tXQots+KozxesZVkApUr
	DGvM1Cpb9v0firSjpjXcj2FvkvrGmVPMCWWpByFm7vuSPXb079ghCKonh04s1bsNSmFw
	CjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FGbGV0cXSiNeW9yopFle9CFisIKheJNNEOz/ViOg2mA=;
	b=KPzny9IPgSqT3KUJsNRHey5DV2EMMAVFHLVA3Pmjr6KpByvb6DrNcQ5eBmWkQGAjTg
	Bx5tBGyryYWME7yIfvlA16GK0nC/rdx2rpV+8h1uyxVRM0ceBOvg3WG5ba5W19lUtAfR
	dM75PjJXnCU3EGbJHYKaj/UpRbWjdooc5MSNtDXSXowzvvrjCewRlAwwuMj4VqKUWm9J
	rzjfEh/nQnF8eqU1ZWvig7cV/XDVy5sSUCs/OMQVg3VYJaShz8Sr685EXSJr9zLWH6BR
	lvANQDU6f2ifXW9ypecLGOvxGGHygNy40K28NX2L/u2J5y04TfVDBOKba+CWu3NTI/35
	43Xw==
X-Gm-Message-State: AOUpUlHUEo8igrOKCLyThTG/0+aYLRb6x5q0xj5Mv6zJH98PHaS1EW2v
	8wS/8mlfg5fWpaPr1TgRDQt9X8le
X-Google-Smtp-Source: AA+uWPwy/ugn8kikeYrXeMB27ZX0mLvU8aFQswhZNiY1gVLK+XsxWe+2xUpsCcJvN/UmTxeedfR3gg==
X-Received: by 2002:adf:f485:: with SMTP id
	l5-v6mr25963725wro.259.1534591601454; 
	Sat, 18 Aug 2018 04:26:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r13-v6sm4358482wmf.35.2018.08.18.04.26.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:32 +0000
Message-Id: <20180818112638.10006-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][meta-networking][PATCH 1/7] pcmciautils: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:41 -0000

* fixes:
yacc -d src/yacc_config.y
cat udev/rules-start udev/rules-modprobe udev/rules-base udev/rules-nonstaticsocket udev/rules-end | sed -e "s#__UDEVHELPERDIR__#/lib/udev#g" > udev/60-pcmcia.rules
make: yacc: Command not found
Makefile:233: recipe for target 'src/yacc_config.h' failed
make: *** [src/yacc_config.h] Error 127

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 2e59f05c2c..fc064550fd 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,7 +5,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "udev sysfsutils flex-native"
+DEPENDS = "udev sysfsutils flex-native bison-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 
 PR = "r1"
-- 
2.17.1


