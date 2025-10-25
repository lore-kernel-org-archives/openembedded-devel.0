Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B092CCF9E0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.954.1761363621644780985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3AHRdmo;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2765709b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363621; x=1761968421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaFgB4UZBqFxQjTGNeT4yw9ViDwEvXa23t6S4HYEuI4=;
        b=X3AHRdmoiqM5jdkY6kQhwKGRj5CvIzY1oLDy2yTAox0m10JJQHX++L/xk7jeh6PGhd
         E+js0JloGeqH037QHbvnf70fJ585q4Q5XqksdARfxj3abeMWjz96ytsfhidSLOWs/pj+
         fntb/A0sJvZI3sU/RRVXXzt3wVegZI7i1EJmlk64FPGQke1rNLqztweQGEmDsQlBnW+t
         6ho3t7MksWgmg0dt/PNX8bBaND0J4OdF+BgIUA6iVG6xpV3luTgkwehHuZFbxy+6dDSg
         7Px5buPCrfl6FGFHsk60scsJNeAlP24k+SX2OXzHCDSEXHPgUv192mktUnl9Bmhgg0JY
         DJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363621; x=1761968421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaFgB4UZBqFxQjTGNeT4yw9ViDwEvXa23t6S4HYEuI4=;
        b=TEqjn3yujmVN41BIB5+4Zs/piBz8IGX/SSUDcRI+rYKxbUI2ImZieXb9918TT1jx/r
         cetRs8ybehSWE2uRx6AWJZ6QXbDhFfdjktrVG+hfRI+vOAHiZBFXtgJ25nf3JJsYetEY
         jh78esljTzmLD0TAy0Y6eusnTIVEBjDwH21vNUrJoWqMLmALLPJf31gdJJLhBl6hqXKw
         ljNgDcReYYTxA3V0GRk4Ape5wkC+bUwPco9RzL4ICHtW8lnSvgY1RMy+Y/KJzG8uHjJ0
         mbezoOquSxqgpWV26rNjjQaal3ePeJ1bOF8HLmPbauGXLwykA2bPpNoCA2bPfX7SocTv
         pSQA==
X-Gm-Message-State: AOJu0Yxlx/ZgFS++Yxdam4LBgq00lofGxvR7JselDzfiKE4X+bI2SMuK
	IeGxxGb8qdKUHwgLakIevFQOOHsx6SwYvkzLFE+Kbd0oTl+AqqjEkAI94/e3IbIZ
X-Gm-Gg: ASbGnct5XvKm5jUg8xKAs2ZGOZ5v+wwNpZ6WHHK/Bmu8Q+LUvGI9K+0A7oK1QidLXlE
	xyBmHKylXSxDdTe/x/iNx/VpRmdmq4uZO0J1ZwC6m35S2EiNNeAu1SvmH5DT0AEXH65g3Y9c44H
	HsyivS4zZinnjIpf5xAK9E45ruQ4JeM/sj8xLbUMdDc9qZAh2xWe0dvN8ZseSa0sUIFHADIYxOx
	9z2BKkIwPPYtIzZol2JI1NSQcmW1CKKsNXoueegK3mRvf2obZkIMfhoh7CzoPh3VisHHtrbxFQq
	hKZsmU+WwV/JvSyq9wWEaAL8qc1+SdqNoMUA8SA/oknniJpjYnsA6mCQDJj996TbH6Il4dFc98I
	z6bgNOhhutO2TGM6GVj8rPxNLjVx3ixz2ASaO1eFkMeZgzqGtJe+JLXb20CFNAug9nSiC6TFlox
	e0BboTupcvaRBXC6z4GsBZLdTrUFLJTS1ly/oNR79PBrLOVf30pGXv9FdWVUm33q1j9FTYjmQl
X-Google-Smtp-Source: AGHT+IG3twFFfJc6tMZhyMPNt1e6UqtVli+X579ZHJhM9K0oK+PK1rSXoCxEuxpSNfmE88mL7YoA6Q==
X-Received: by 2002:a05:6a00:14c7:b0:77e:d2f7:f307 with SMTP id d2e1a72fcca58-7a284dbb2b3mr5979992b3a.9.1761363620601;
        Fri, 24 Oct 2025 20:40:20 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/11] botan: Upgrade to 3.9.0
Date: Fri, 24 Oct 2025 20:40:06 -0700
Message-ID: <20251025034017.2071643-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120985

Drop unsupported configure options
Fix reproducible builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../botan/{botan_3.7.1.bb => botan_3.9.0.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.7.1.bb => botan_3.9.0.bb} (86%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb b/meta-oe/recipes-crypto/botan/botan_3.9.0.bb
similarity index 86%
rename from meta-oe/recipes-crypto/botan/botan_3.7.1.bb
rename to meta-oe/recipes-crypto/botan/botan_3.9.0.bb
index 74f895cf3c..77bd0d007f 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
 SECTION = "libs"

 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fc0620463461caaea8e60f06711d7e437a3ad1eebd6de4ac29c14bbd901ccd1b"
+SRC_URI[sha256sum] = "8c3f284b58ddd42e8e43e9fa86a7129d87ea7c3f776a80d3da63ec20722b0883"

 S = "${UNPACKDIR}/Botan-${PV}"

@@ -24,8 +24,6 @@ do_configure() {
 	--cc-bin="${CXX}" \
 	--cxxflags="${CXXFLAGS}" \
 	--ldflags="${LDFLAGS}" \
-	--with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
-	${@bb.utils.contains("TUNE_FEATURES","neon","","--disable-neon",d)} \
 	--with-sysroot-dir=${STAGING_DIR_HOST} \
 	--with-build-dir="${B}" \
 	--optimize-for-size \
@@ -36,12 +34,14 @@ do_configure() {
 }

 do_compile() {
+	sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${B}/build/target_info.h
 	oe_runmake
 }
+
 do_install() {
 	oe_runmake DESTDIR=${D} install
 	sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${D}${includedir}/botan-3/botan/build.h
-
+
 	# Add botan binary and test tool
 	install -d ${D}${bindir}
 	install -d ${D}${datadir}/${PN}/tests/data

