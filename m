Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2AD74A46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 23:21:13 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id 30-v6so3416185pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 16:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LYEE3su33TsG+GHkDlpKaurXhlzOAZMXr2fXn99YC5A=;
	b=ipooPfLEQ7IMQ3yyWoRr1+1x7EN8lSoAfJhKXmnzunm9TvOoG8Fd/WicRztE/deJLU
	iJt5nQdhw+RtmDZxlkVKS75z37H2E4NOyQQZrVp/CFnOWb8VY/ShsBRVV1vDwLWXlWeq
	f8shrzi4+F/76+TK+SSIuG2eONdTH3op2CeAcsJqZbn54lT6ZDcLErKSV9JsG6pNqbVs
	dl4l7TGNN3lxtA+i8iumNc617hZgROcFKgMTu/7Tb7hOkOqlYCNRp8pTyj2UPE3nlSDG
	8zwKMFNAd5934xf/6de7ehRJ6baQr7bopkUHWxvTJsGc7/lYPoGRTxCCKph7t+B/bfsY
	7RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LYEE3su33TsG+GHkDlpKaurXhlzOAZMXr2fXn99YC5A=;
	b=Q+IlP1ABWMGmZtOxs9OIhytsw5fTgyvB2NXN309QfQDD5gtFxZHEF2+H6hvaKc993g
	OqzAw1YJ288eeGPQ0rexjkyRgFCJDgCwraxyppxNHI7N4qcqQpGHQZyRI+wsU00uORFz
	Qk9vic8xlM5Besels91D0Fe6Eu+rlPCuxmymngmOHdxwyu92YoI3krnwLJQ/KkHdSbPr
	AsJZ4TtTmVi//YQpSda/kB8LhGlYBguvxiohpdfs6e+xkXRw6GfmN5potXA1pMQGvRoP
	Jq1q9s0ZllmxOGdtBkwZk592ofdpXrz79Ei2iXUsnzqRTAV1Zy7pBF62gBEijVh/mn7X
	bn1Q==
X-Gm-Message-State: ALKqPwcevQ7ODcmQTZar/od4/N1kYu8v7wY3AMeFyaoHhtUhr8oEnETa
	oU5Y/wbkKh44GyM4IFmn0Whnrg==
X-Google-Smtp-Source: AB8JxZqtROSlwr3f7FWpsAUZSM4qPZqxAgk8jO64GHSzdfWqL240jmN9n3cu/u7K+cfd7OYiEt9EOg==
X-Received: by 2002:a17:902:7441:: with SMTP id
	e1-v6mr6945482plt.238.1526599274722; 
	Thu, 17 May 2018 16:21:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	u70-v6sm13828212pfk.121.2018.05.17.16.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 16:21:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 16:21:08 -0700
Message-Id: <20180517232110.22663-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517232110.22663-1-raj.khem@gmail.com>
References: <20180517232110.22663-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/5] tinyalsa: Update SRC_URI to github git fetcher
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
X-List-Received-Date: Thu, 17 May 2018 23:21:14 -0000

Update to latest on git/master
Fixes build with clang
switch component build system to cmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{tinyalsa_1.1.1.bb => tinyalsa.bb}        | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)
 rename meta-multimedia/recipes-multimedia/tinyalsa/{tinyalsa_1.1.1.bb => tinyalsa.bb} (50%)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
similarity index 50%
rename from meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
rename to meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 66b95db00f..72094b6fad 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -6,23 +6,13 @@ SECTION = "libs/multimedia"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
 
-S = "${WORKDIR}/git"
-SRCREV = "df11091086b56e5fb71887f2fa320e1d2ffeff58"
-SRC_URI = "git://github.com/tinyalsa/tinyalsa.git;protocol=https;"
-
-do_configure() {
-    :
-}
+SRCREV = "67b9210d344c34e8d1aa0cfe638abce71c5221ca"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa"
+PV = "1.1.1+git${SRCPV}"
 
-do_compile() {
-    oe_runmake CC='${CC}' LD='${CC}' AR='${AR}'
-}
+S = "${WORKDIR}/git"
 
-do_install() {
-    oe_runmake install \
-        PREFIX="${prefix}" DESTDIR="${D}" INCDIR="${includedir}/tinyalsa" \
-        LIBDIR="${libdir}" BINDIR="${bindir}" MANDIR="${mandir}"
-}
+inherit cmake
 
 PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*"
-- 
2.17.0


