Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7737523B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:12:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id n31-v6so3656319pgm.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 23:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Rn85qnluL/CTLoAbnayKHSPxqmokgBk8hxOgvWcJUgM=;
	b=GJNFBIleSSmrRf3oG3ObMMkJwGcUx6wS07bDn2ddUGyc5zGM0a69RlB8yMjwb/w4vr
	xKsGxhGiMzkTtiTVqsYt7p5i6jCrZlu1HypSlLpae3ZVM8XRPsTsa+6T3HQ29I83Escs
	eL+2A/Be9kRgrk/Tn1h4NDec52bBcqBBS94SmtBjsMgBC2S3L76XYsZUioXTH3GKNkxt
	2nWrgvjeEVHbQy461SeiuuUGDU0iV9HMA6rnm9VHhaSKZFWLo2mTyAlRuQbFGRzLiSLQ
	zDHIKtWdasjK7KaV3LSTlht2ooYoWDkov9b56ayMXW4pNyYYaUlydz3fVdV1gYkibkGB
	VKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rn85qnluL/CTLoAbnayKHSPxqmokgBk8hxOgvWcJUgM=;
	b=OQgLXFxiC/TvO5NZS/19YSWfeMDlxiL2Q+2I4H1gEo+B0Vs6NHHmZPNZL5fVimTGWV
	UWZO429z17jIHUB9LRUF+jZue7IYOwicwjOqW6Qru2I2RLR8CV6bXKnyuNGcTdUrlHdl
	oLwLp2GgP9nlRbzcDBhMkyVJHfMRU37pqVivokegiYDuqUi8mYoh+5TkzjKgGKDwamIG
	ycLWoJhvxC5p/4VM5xEAwzo9scemSxm7yoIIrrYNeuNOx5BYW+Qrf0UdkVI1r1/jqfkD
	7Qe5sK5rmSai9zoVjLsgC34wteKGkPKikzrFjV1t9NODH5NPrdHliA4hH3rV6gvJbbmd
	RJ4A==
X-Gm-Message-State: ABuFfoiybTf6LS/W45+UUlSJEOU+hH3fijcqx7OdMkWIMJsnkvKq8rE1
	wFzziuGG+wYhKwV7dO/uFEiuOVk9
X-Google-Smtp-Source: ACcGV62BPiZ+305fdIN5GdjTKuWRrN6YoD2LlwbjnqJQfix9/3tHnKhG9gcXi8PjVAJ/E87XViIzLw==
X-Received: by 2002:a17:902:344:: with SMTP id
	62-v6mr14657819pld.164.1538115123744; 
	Thu, 27 Sep 2018 23:12:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm7361026pfi.4.2018.09.27.23.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 23:12:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 23:11:51 -0700
Message-Id: <20180928061151.20175-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180928061151.20175-1-raj.khem@gmail.com>
References: <20180928061151.20175-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] mongodb: Consolidate COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 28 Sep 2018 06:12:03 -0000
Content-Transfer-Encoding: 8bit

Its only available on fewer arches so express that via COMPATIBLE_HOST
wiredtiger is only for 64bit, so add it directly to config args based on
bitness

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index bcb15e6c5b..d39ab0a314 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -29,26 +29,18 @@ SRC_URI_append_libc-musl ="\
            "
 S = "${WORKDIR}/git"
 
-# Wiredtiger supports only 64-bit platforms
-PACKAGECONFIG_x86-64 ??= "tcmalloc wiredtiger"
-PACKAGECONFIG_aarch64 ??= "tcmalloc wiredtiger"
+COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
+
+COMPATIBLE_HOST_arm = "null"
+COMPATIBLE_HOST_libc-musl_x86 = "null"
+
 PACKAGECONFIG ??= "tcmalloc"
 # gperftools compilation fails for arm below v7 because of missing support of
 # dmb operation. So we use system-allocator instead of tcmalloc
 PACKAGECONFIG_remove_armv6 = "tcmalloc"
 PACKAGECONFIG_remove_libc-musl = "tcmalloc"
 
-#std::current_exception is undefined for arm < v6
-COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
-COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
-COMPATIBLE_MACHINE_armv7a = "(!.*armv7a).*"
-COMPATIBLE_MACHINE_armv7ve = "(!.*armv7ve).*"
-COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
-# https://jira.mongodb.org/browse/SERVER-16898
-COMPATIBLE_HOST_mipsarch = "null"
-
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
-PACKAGECONFIG[wiredtiger] = "--wiredtiger=on,--wiredtiger=off,,"
 
 EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  LIBPATH=${STAGING_LIBDIR} \
@@ -62,6 +54,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --js-engine=none \
                  --nostrip \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+                 --wiredtiger=${@['off','on'][d.getVar('SITEINFO_BITS') != '32']} \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
-- 
2.19.0


