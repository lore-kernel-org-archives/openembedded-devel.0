Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C12AA73175
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 15:17:04 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id e201so151239210wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Oh3D9++y/bq1wo9XobJ3VYvr/zrJmC3H1qKig+cDZV4=;
	b=MhaD7FmsLNHR45j95WVqGwPQpegZKs3lJemnxpjDiH56IJArPB9H55SZmlVEEiat2R
	b25iepFtFN6fZ3NgLmXeRfGgFJv3BINzx8M5u7kTabYCsibP9Xz9Jr1iQKTo0QE7BP+O
	K3qkvuHUU87xbMHX0kF8uHV4DRfBrK4EpAt4LUDSndbkZDtlGJUW2VRLWwgtjGftDMnH
	IknmVK0twOpe0y8UgeVnROZ3sttCbbOFWtj4sL5Wh5f4OrKss2eWPdwYZewfCTlFKfIM
	MZm+rnZtJl6sSYw+2eMWV68fM41QKVkU1DFK3UObmnZqlV+Gk1cRVCZcBVRQCB/GtVZu
	8uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Oh3D9++y/bq1wo9XobJ3VYvr/zrJmC3H1qKig+cDZV4=;
	b=eHsU/78HwUZOrO+hIjyRJDddavGFhBDqBF2k4BAj33oTEEHpRGgZcay1xbc22adhIi
	fEXOu26b2mBOMizaCzV+ASOQ/ytZlZrS7GhQG5nuQat4x+IeBdxkOis1YF19a5+MHuq6
	uj9wrAcjfEZutvDnRJIX03EXlRMlhgqOTrxgwWKiBJ+k6lCnMeYE4WEAxiq8/nTXEpyh
	yx8YknD/B/Sd2WA5oawgeo9sWkmo4ruoTOLW0rrUcFTzUhlYw3Cx8Ka2l0pHdVd/FxeC
	n0gemmSb37LnO0JPF5cFiQlEKaorbd7WzmVflbufV4O6t3Gyp8ABJGJbBW5OvuRmd1/R
	vlew==
X-Gm-Message-State: AOPr4FVeHC+VtO+YRY+EwROUCRRYoYBQUZfajM/eX3nqgvCoiI4wzaEVCzD4wCG42Y+EKQ==
X-Received: by 10.194.216.33 with SMTP id on1mr3526084wjc.120.1462288625012;
	Tue, 03 May 2016 08:17:05 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id w82sm5051183wmw.5.2016.05.03.08.17.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 08:17:04 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 16:20:24 +0100
Message-Id: <1462288824-15975-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1462288824-15975-1-git-send-email-eu@felipetonello.com>
References: <1462288824-15975-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 2/2] protobuf: split package to main and compiler packages
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
X-List-Received-Date: Tue, 03 May 2016 15:17:06 -0000

Protobuf has two main features, a compiler and a library. Run-time
applications only need the libraries to run.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
index 049f9d4e8f18..2977c59c4bf1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
@@ -6,7 +6,11 @@ HOMEPAGE = "https://github.com/google/protobuf"
 SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
 DEPENDS = "zlib"
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
 
@@ -22,4 +26,6 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
+FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


