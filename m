Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2E179B20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 17:54:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s4-v6so8179650plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=06oyA0Tcn07CoGim8Y72kh7wUQo/tQBATDynqmPYqSo=;
	b=gZkuYiYDdCJHdXfvSXGEsRLSRnj1nEDI2/wV5eGlGMjpfFMBgSVTFsCJhN+LbB38F3
	Ym1VEf0t0weoDdVVK7U2yT6kUED3ViU8v6jPjuVGsBgzm72Mvk+4JMw5tYvkzrXyoGaF
	wJDwDPNQZzrh9/sNQ2+4oegZIO7Ph67kdxqsbuEiZmmxu8amyiJRjXoXx3SuC0Lo3eV1
	Y5AymTQs23WoT7v9reK11LTfnnefPux7YPFeN3HTg1rFO5cbvRjUlKjkbaGvkyFOYsyq
	KD5r2Ag2ggSOhVFu+O/VPuOFAcZpYiWY0s78LNdqy6Kx7Bn645YsdA33R3ammlhSCIaI
	z9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=06oyA0Tcn07CoGim8Y72kh7wUQo/tQBATDynqmPYqSo=;
	b=RWJWvw/p4NQSGZRXP+HqL3WsEnaHUF4BLbnOljsj5ZbsGWnrTCugYW+0Qg7HSC1tY4
	XeS0qU2hRTroPM0Zra2ef9GLzRUKZSNTsNkc0L+x+4hVD4RMyAH2p1jzF6LHZN9cZyyj
	cKDruIyc/4iUDmcGDfvH1s2GDW+sJispmAprCE4Y0UHSS9dBjxDDe4B9IAKcrakROwjp
	6m0SQmnFdcuHiuqXWgs+n7KqIYrLru5K8NbfEffp2YWKQDPJ7q4LBvlDEzINXzmzLQZ/
	6VoxCRSb3PR++KbWEfrueUzdgbm8wzEIZLYVtVcyK1tHOspEhDjM0NpKR5eR+EQ2cOts
	uF8A==
X-Gm-Message-State: ABuFfoge2ZphgvAjjBMmtVBgkeq2WU5usL1aS0JSElwQsM1OIjfMvQC6
	ljugdQR5JsoWGRvil95jjFGbRCn5
X-Google-Smtp-Source: ACcGV62cOk5NmIX85bcsq283G1Qn20/ADCexvAvS2PfYndprH7e9bKWKeCEgIT9pWrbFHG+2TyQtyg==
X-Received: by 2002:a17:902:2805:: with SMTP id
	e5-v6mr13967380plb.169.1539539658885; 
	Sun, 14 Oct 2018 10:54:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	r65-v6sm10804685pfj.5.2018.10.14.10.54.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 10:54:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Oct 2018 10:54:11 -0700
Message-Id: <20181014175411.11676-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Sun, 14 Oct 2018 17:54:18 -0000
Content-Transfer-Encoding: 8bit

Latest Chromium needs it during build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
index e3b46bc2c8..8c3397821e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fde91d5c5bbd1e0389623e1ac018d9e8"
 
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl zlib icu"
+
+inherit pkgconfig
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -44,7 +46,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --with-intl=system-icu --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.19.1


