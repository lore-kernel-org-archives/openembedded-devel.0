Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id E092D78AD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 12:28:46 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 70-v6so7476260ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Tb3oxOBRJMy77o6XCBd+UCHzLiot+qU4gj3UJ4odPpc=;
	b=RPQdYCIf2kLJzaHWOa5yy4DsdMJ2baXjgW+NCfXoIp3CgRifph4nM6wm5H53YO2Gau
	UVnR4VpAPG631wDEwMVhdLLYfCFyJyUbuCjLWT5ayr7jpkwZvqGwFOK/B39K4vOsoxK6
	+aE8D1aKxPVQ0mDFiQujC83V1HzLcbhjmZgvJFmX28QkMjDxUI/I7rlqkyxfVCjfdnFE
	Uct0RqFmhTjPUWWOD+pzWMWLn7iMOiIHsRnWSQlHSE5U3WUAYhpGLW0vpyH4gEDrkHR0
	FjAMh4JrLyuh0y+UfVmwGkzPSKwTSYehnmCVJE6ggt2W4YKY8L2ffzH0OtQ24bkZHkxz
	sUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Tb3oxOBRJMy77o6XCBd+UCHzLiot+qU4gj3UJ4odPpc=;
	b=Ezp3MznG+b6D6T2/GGckF/qv29xPU75HvY+IFXaK6CfTZivUSIHUVouZiZukOiPIcG
	DkZVCfDZjSNZtvnX1k+MYyXQke83jxmKpCNIVUmOioKHTLnQTAaTDBUBoZcObKV4KYmF
	svkonnOIuZNx7aCI+zq6TIHr4vDV8xv/uOkAcw0FL13t5Bla4L2PxWcLL6AmWdMr7QCn
	+cfrhHM5UuAt+Fh8vSmnv2fsKtc3l4jCI4GI9EhZLfPb7GuhNWJSS3DU8hgw2FtpTeNe
	5f99ZJrhxgWkhDppQpbXOS6pWVP2VJowinVw2N0v0MpzAaUrsB2LjQ3BJpfWXyFVN1zC
	VPoQ==
X-Gm-Message-State: ALKqPwcv/OqbY7dXp8KT8iJlf8Mh1lPyjlVQCD76/+WTxAsllUXGnKvG
	EFMnlmiMbgWyQuWdJ5wTu/CAk5T1
X-Google-Smtp-Source: AB8JxZrGwBHT2cPPuIwXxNa5EHlRww0xgCwRHIKjiH/ex+MrglytQLkm+z7EGQ1oqmYjxSz5m9Tzig==
X-Received: by 2002:a24:7801:: with SMTP id p1-v6mr5258336itc.20.1526214527005;
	Sun, 13 May 2018 05:28:47 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o123-v6sm2831158ith.25.2018.05.13.05.28.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 May 2018 05:28:45 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 May 2018 08:28:42 -0400
Message-Id: <20180513122843.29800-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-oe][PATCH 1/2] libwebsockets: switch away from github archive
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
X-List-Received-Date: Sun, 13 May 2018 12:28:47 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../libwebsockets/libwebsockets_2.1.0.bb                   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
index 9354799871..100f3a3541 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3393a657830d4a118c5a6ed35ba53d0"
 
 DEPENDS = "zlib"
 
-SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4df3be57dee43aeebd54a3ed56568f50"
-SRC_URI[sha256sum] = "bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66"
+S = "${WORKDIR}/git"
+SRCREV = "73557509bd15f95a1ad081a6f4fab48ff7743215"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;"
 
 inherit cmake pkgconfig
 
-- 
2.17.0.rc2.3.gc2a499e6c


