Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 29842748C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:19 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c10so26068781pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T4dv+fnazpe5XB+0Z5oIjTRtV83ueBtST78BdCiKZKo=;
	b=VVYPxgtn6AdMrOqnhKuHfYyRGyNL7STheybtlKvjCsurr0k+ZWygr7y303T5Mlw4L0
	tPtZd1MjjIUDi+5kI1ymW8FhrHcRUPmAhVxbnkDIyrylly/UvAvot5c5lJijb59hOFVR
	4D7/A3bqcLgPYke26vWGB31EMVMtdpH3AGewmop8RM4a+9K5+LQ5wC2Gc161uVV3VJuP
	J3KO+J3t3VBN4NikCw8id6iqCkGlhuSKRK4B/ZWj/henZSX6LNJys8m1ZSZJjUuQMKAS
	GwnoxWehESUL9480w6+erEVe5wnKeMcACtMxkfM4vpBIdIVB+30SamfI/h1UHHuFutYA
	PFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T4dv+fnazpe5XB+0Z5oIjTRtV83ueBtST78BdCiKZKo=;
	b=rT9mA5PvVzFwWfVOSTWwt/DBcNdYe81bicwQSx9PFHh1KEo0mV/pSZeVg/Uu3LncpO
	RdYegB8izA3pE2QwBQbNGlf8KJWLKOorCqmKMbZ4KpvLj39lCN28IZvMOUD0JVLT1PIL
	+gIo1SFH4sq+yFXP5+Ev4/lqED1vfe7ZvDNftfJterslZwRyrRRuVoc7veB1A0Ll/FKa
	fG1IbKja2qhpa1TuaHWWI6HKswvrqZj/k20tB6w8ol0os6XBYzYdxOUM4smJoac9yKhI
	id/Arjc9VKHXJdtNC+Sku/kqWd196/Dofq5Lz940a7VnUVO+FLkKB8pVDB+dk60Rs5mb
	JO2g==
X-Gm-Message-State: ALQs6tCipUMrTQcd4zT/6mYL4zO6WdyNgX/W+ZYbDM0nX3FEIWKL9hBV
	pbEc/1qhVjGkpYWenUeJAvne1w==
X-Google-Smtp-Source: AB8JxZqXfxBu6mlODJCJQQWII0zqCu4544/JfxojAXsJU9ckEd4rxOzvQQRb03PBFlXSdU1e3VErAA==
X-Received: by 10.98.75.139 with SMTP id d11mr45027582pfj.244.1525892420654;
	Wed, 09 May 2018 12:00:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 11:59:57 -0700
Message-Id: <20180509190011.30006-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/16] postgresql: Depend on external libnsl
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
X-List-Received-Date: Wed, 09 May 2018 19:00:20 -0000

glibc has dropped libnsl support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc       | 2 +-
 meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 812c2aed48..5462332c56 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -19,7 +19,7 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
-DEPENDS = "zlib readline tzcode-native"
+DEPENDS = "libnsl2 zlib readline tzcode-native"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
index 061184a6fa..8a01d8604b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
@@ -5,10 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
 SRC_URI += "\
     file://not-check-libperl.patch \
 "
-
-do_compile_prepend_libc-musl() {
-    sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
-}
-
 SRC_URI[md5sum] = "0a08f4078f5e4a54e764f63ad38a6de3"
 SRC_URI[sha256sum] = "7a320cd335052b840d209dc9688f09965763351c590e3cc7bf577591179fd7c6"
-- 
2.17.0


