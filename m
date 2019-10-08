Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42FE47D2D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2019 04:44:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 23so9586033pgk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2019 21:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TeMr6DtCOffC2qdTyv7q9FHgtliS35x9x1x8f6j+hKQ=;
	b=aWl60HiWYbeeEI14nykOaDLoGYVZfWUkUtb+sFYf1fnTG/AQuxTtkn8pBMnARwQovX
	R8PTB/dJCBcmUy519V2R9U5CgVME30/sBHTVTdYkdTeM4PTTxK4EicUj4V3OsJ08Co6X
	nJY9/w0hNC4n5n42By2t11z849OVLMcc7XTpzEJqVN1Xa0+BsAg0MixK4dq83Iebbnw7
	KpIhrAxrsNcL5mLHkbF+HeDmVysAi9T6SFutgiijNrYVcAhnHn17uwrf8p9CZBBMclY5
	xFwuxgu/GPBRnZj20Dz09fJfJd9NSmf0/Phx+ohY7I3NrXbSFKKJOr+Qx5vZY/XdhAXh
	2Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TeMr6DtCOffC2qdTyv7q9FHgtliS35x9x1x8f6j+hKQ=;
	b=r7mvFOrONZSLwzK0MFp2TX0yz62UUk2AFXhUE+odZCE/osXnLO7DEki1VUIox90ry8
	jW4TE7XG34cGGIONk5rhz3LyQX1T9gNeTtvyaT4xo8fprJom0yt8Ig8Kh1w1rN+FDm1V
	cSJ/GVk6IanbC6EKpwkEldQhR9NBBIOSApyIDSVxASVn67x7Rkg8xgiXNbyRVdiIx94H
	B4uDWJwwBTGTXXWPXTYuUljImtwsC+8SPN0TaiarRaP43U6P8wY55saSw//7waEd25KL
	6W+ZLrwghU1CcJwhViTGVgHMRFu7KM/KeNGQwxnefb1KSTnXo8eOcuhM799NHgtBUSz2
	lBmg==
X-Gm-Message-State: APjAAAWLDc/PCYf6AhsrqfEIes6V74woXU3/V0/YarcVDKevUPJwew7R
	4j+3uztqn6xTgvfSdFuDgf87ctVc2NQ=
X-Google-Smtp-Source: APXvYqzaO+/x/TG2YKGgDkf0P9zLG+/e0kcUQG8r+76A0A0BGa7dFOSMaSAna4lZP6CmncSdkdn4Lg==
X-Received: by 2002:a17:90a:bc49:: with SMTP id
	t9mr3272643pjv.111.1570509891622; 
	Mon, 07 Oct 2019 21:44:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	e184sm19166607pfa.87.2019.10.07.21.44.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 21:44:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Oct 2019 21:44:41 -0700
Message-Id: <20191008044441.577191-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mongodb: Turn system libpcre support into packageconfig
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
X-List-Received-Date: Tue, 08 Oct 2019 04:44:51 -0000
Content-Transfer-Encoding: 8bit

when libpcre is built with clang and mongodb with gcc then they dont
link well, in such cases its better to use in-tree pcre, this paves a
way to achieve that if needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index e7e03a4e14..cd8ccdc8ab 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -3,7 +3,7 @@ LICENSE = "SSPL-1 & Apache-2.0 & Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE-Community.txt;md5=3a865f27f11f43ecbe542d9ea387dcf1 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libpcre libpcap zlib boost curl python3 \
+DEPENDS = "openssl libpcap zlib boost curl python3 \
            python3-setuptools-native \
            python3-pyyaml-native python3-cheetah-native \
            python3-psutil-native python3-regex-native \
@@ -38,7 +38,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST ?= '(x86_64|powerpc64|aarch64).*-linux'
 
-PACKAGECONFIG ??= "tcmalloc"
+PACKAGECONFIG ??= "tcmalloc system-pcre"
 # gperftools compilation fails for arm below v7 because of missing support of
 # dmb operation. So we use system-allocator instead of tcmalloc
 PACKAGECONFIG_remove_armv6 = "tcmalloc"
@@ -46,6 +46,7 @@ PACKAGECONFIG_remove_libc-musl = "tcmalloc"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[shell] = ",--js-engine=none,,"
+PACKAGECONFIG[system-pcre] = "--use-system-pcre,,libpcre,"
 
 EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  LIBPATH=${STAGING_LIBDIR} \
@@ -54,7 +55,6 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  TARGET_ARCH=${TARGET_ARCH} \
                  --ssl \
                  --disable-warnings-as-errors \
-                 --use-system-pcre \
                  --use-system-zlib \
                  --nostrip \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
-- 
2.23.0


