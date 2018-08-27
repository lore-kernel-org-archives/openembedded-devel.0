Return-Path: <yisooan@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8EFE79331
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:49:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m4-v6so6244520pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RV3wYKITFuLykY4jJ4x3uKqJnDZVjC81+GzNp2ZbMV0=;
	b=tQHqxJDcSWnEaB+9dylro22DJhn7cWkEBwb0GN/tZszBoRUbb7INPK3VuBa3Uc/wlg
	L+wEboFsuYAlZaPUAwSCPrWr0Ffbz/Oqjs73/Oc8abIEFnFPIjvf6xT4QtHcuKPkrC0q
	M86CwRl12msufXT6tgDjcsaE9Cq2PCkTLDOFwDewWFLF5QX3cA69EkjbdLvYCyOFDAdC
	tGlqbgO1k8gwaId+DZ90sw4BD5/WQ7w5Y4/Mm2MriTqAJPqPrgXDUFvSwNijrqR/nTOr
	BOAEJ3SMSFO9QghkBAGO40cbL7Il5TO8hLss/QkUTURTRwGv454Ut94laLgy2BZYNtVB
	d7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RV3wYKITFuLykY4jJ4x3uKqJnDZVjC81+GzNp2ZbMV0=;
	b=jLWml7bJInBDWcNXnH3zVM3BfrktUjP5YM/Kp2GIJgty+PPw3/qtsYrJJ85v7W5oPw
	FG/mF7V5O6vtC7irAJFhSEGyO/oxKbLe4qpYg4SqsQr/PtIUbL4S67fJYR9BUM76MjNJ
	I3SswiRBo11mV0FEr+8erF7WoX3oSBDNP/yM5iRYMtpKAoLAVkth1UZTKYW4jls1EzN7
	jQchEoTdTO9z0yH+3UpiFJ3xSNWPLHNajFHsyx2OJQnwC0MGMeuNLP4D0qXR2VxjSsoG
	FyjK804dZPhH6JYsGJKDB7z1e3Hsls2kXttySWlQ3dOwVl9kiG5cL61PhK8m9h4Olyd8
	2+qg==
X-Gm-Message-State: APzg51DLVa4DaWJ/TA0oToWbkZ8zcX6gGFpvyEMbfUV34edAs7giA2oY
	KC4jNO113lbrsqG9/OWwb3x2vouZLfGx7g==
X-Google-Smtp-Source: ANB0Vda21tNtw4vwtcvVGjJBBNTxJpkkDwUwKsryN6Y79cllE1OXPQ7IKKKO+y5az72+dIfZYBzuhg==
X-Received: by 2002:a63:5358:: with SMTP id
	t24-v6mr1070649pgl.208.1535341775635; 
	Sun, 26 Aug 2018 20:49:35 -0700 (PDT)
Received: from localhost.localdomain ([118.42.82.236])
	by smtp.gmail.com with ESMTPSA id
	f19-v6sm21326049pfd.147.2018.08.26.20.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 26 Aug 2018 20:49:35 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 12:48:37 +0900
Message-Id: <20180827034837.1664-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo][PATCH] libconfig: fix SRC_URI
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
X-List-Received-Date: Mon, 27 Aug 2018 03:49:35 -0000

hyperrealm has moved to github and it is maintained there.
The current SRC_URI is not available any longer.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index fb6e50e51..a8adebd4b 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = "C/C++ Configuration File Library"
 DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=git"
+SRCREV = "f9f23d7a95608936ea7d839731dbd56f1667b7ed"
 
-inherit autotools-brokensep pkgconfig
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
-SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
+inherit autotools-brokensep pkgconfig
-- 
2.17.1


