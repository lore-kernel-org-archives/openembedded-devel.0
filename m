Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 27D077888B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:04 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id t12-v6so4274029plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4xf6V6M5A85Fa2QW1IqCpAS3zAwa0JEq9zMeg5CYFt0=;
	b=MJjJz0nMyPACq3XAHlQi2Gy5e2UVPSLU5QryPdobYXfYUzcDMRYcV5xtFuL2JRRepZ
	RtFCrcsH5POlFupBlEhF7jQR35dWAjeNXsa9XATU5V24dWKXQhJYaj3gTnt0Z5c0DYrR
	5HFEWQav3cGwKCYesJAUvuid4zRLelETXInJDQhoCZrdYZiyp5rWrYmMOsHCQ+eH7ULe
	aaUoo2vko4xYh6JzQgTZFxpSs48ruVdGx1apBpChzyZDmLSER0ksdEWMbZNhzJHuucGv
	SLk/lr+u737zwBfx/ZVqB0cHxXRLjR37AlD4o7grKdnhfc0NgkUgPhycT9i+ALlDDaIM
	yihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4xf6V6M5A85Fa2QW1IqCpAS3zAwa0JEq9zMeg5CYFt0=;
	b=s6c15EzUTvUvWPvZ3fhwa3M8+fflX4pDLC9KxTzADUJK+0xHau0IBAkEuf16bqyjKU
	CeCSEQsA+FOQj4wF22zltc69bMuFs/AkZHboy1MpZEemQFSs8BHU8DKCa22iFuAVZfgo
	Jk7LIb1EKAnJh/s3yH9Zjr9fTl22VJBmemjPQkMQxY2ubJeTbLjMSi1y389DyYDdVWTk
	z/sZE957bUcCMxkPMkjdxiYJGDNsAeljoGe+nMsqjdmueKoxoobYIAPDTz91/b87b/HC
	9tUkxJzzPCC2UDtABvVAAC9bzecDL5Yes1yZvGcX0H5bgOibU0WWxvd838gQobzu5Gbd
	seoQ==
X-Gm-Message-State: ALKqPwcBpvj6PYd6zaJDFTI/zLehAFL7D2OZJLChFIe4f9OzJFG39VPu
	WmmqYLkArtWKaIeczNkIrst8dQ==
X-Google-Smtp-Source: AB8JxZocyjIP9A7JQu6SwmH8hnHV+iqov3tSqF2yoQJ6uOj4Z5ql//0cUeKkVHSOVjVls3BT2WGeIw==
X-Received: by 2002:a17:902:7402:: with SMTP id
	g2-v6mr746023pll.246.1526094485778; 
	Fri, 11 May 2018 20:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:55 -0700
Message-Id: <20180512030758.31409-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Sat, 12 May 2018 03:08:05 -0000

BUILD_LDFLAGS add --dynamic-linker to point to uninative but
some binaries in luajit are for 32bit build host, so even if
your host has the needed runtime, it will fail to execute because
uninative ldso doesn't know about multilib

we get cyptic errors like

| make[1]: execvp: host/minilua: Accessing a corrupted shared library
| make[1]: *** [Makefile:610: host/buildvm_arch.h] Error 127

Switch to using git for SRC_URI, master is pointing to latest
2.0 stable, it gets us all the patches done since last 2.0.5 relases
in 2017

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 1d69b3c12c..3052eb0484 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -3,14 +3,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
 HOMEPAGE = "http://luajit.org"
 
-SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
+PV .= "+git${SRCPV}"
+SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
+SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "48353202cbcacab84ee41a5a70ea0a2c"
-SRC_URI[sha256sum] = "874b1f8297c697821f561f9b73b57ffd419ed8f4278c82e05b48806d30c1e979"
 
-S = "${WORKDIR}/LuaJIT-${PV}"
+S = "${WORKDIR}/git"
 
 inherit pkgconfig binconfig siteinfo
 
@@ -49,7 +49,6 @@ EXTRA_OEMAKE = "\
     'TARGET_SHLDFLAGS=${LDFLAGS}' \
     'HOST_CC=${BUILD_CC}' \
     'HOST_CFLAGS=${BUILD_CFLAGS}' \
-    'HOST_LDFLAGS=${BUILD_LDFLAGS}' \
     \
     'PREFIX=${prefix}' \
     'MULTILIB=${baselib}' \
-- 
2.17.0


