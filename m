Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF89674C00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:59 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id az12-v6so18738719plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NcG7rWS6xE69r9kuWdvknZguKeSovJCaD+bU/qiv3tI=;
	b=rq2FdehOE+GkNp/pgu5tpbSDHyKkB+i0Vn9bUTtEK9oJGGqTMAgW04ADQLKDlYLASA
	dLqbJfJHWPfKonR4bOrP5BASLxh8cpUcJihr8IiO8udxSUzAdd47JM4f4JY8NjHvodzD
	qQETflKJvyAskg+pMdmtOhQ6pWWZaJ93M/88KJQ+hTzt5ZGZVCFLhZCZLA4p4IiOpTeK
	ApLviLpukCTr9FsddTH26/W8GpL94R1zr91J05kdRmSnh6/AftNx4QlnMZ/LWbDWFi+G
	9clJHmP86F9aIu7UWDhD5Y1W1EKHjyPU75wPR4Gws33rly5iR0b37nDDwo/hx4K1Q2Q6
	G57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NcG7rWS6xE69r9kuWdvknZguKeSovJCaD+bU/qiv3tI=;
	b=N/wf8RVt2d2jnMGpiJC2zFcCOxtRpN9UmXz+R5YEcBUL7hUZmTg5i7n4PMcP4z1DUS
	mOxCBSSkcmakEFOoL1xMr8//OEZ/O1a4HU09FPkiUAU08f0f+3FwdFyCF19omWU/nE2R
	Y4GODQ8vHZdb68lJwAuz1j0mi777VgFOafOIhdD2N1EKDpxQfHpAOAoNwOc6cJK+QdKz
	CdZnh+7+WQwiGYpqZgOEzMAYetUZmlv/D/feY0k+4q0NvcnYUyxSeHPMfQwi4otBfBig
	TXLLqgY8XwP/iY9ITPBEF+1/L04fGwUnGyQWlCGRYyqtE2TOzyCxKDKPZzOIJ4HEOIFU
	/V/A==
X-Gm-Message-State: APt69E29w9JvFTHpRD//SyEZD6HueDqAkRqBX8spA/sQURttfTt3RZMh
	CmoDy9HiK4uBuPBKbEZ6r08=
X-Google-Smtp-Source: ADUXVKLHc9pMoGWRlHjsSJ3rM7KPVa4hi2guenW5niG03GrhhVK3bjENp4xxoKM80e6c2aiVW4vkPQ==
X-Received: by 2002:a17:902:9f84:: with SMTP id
	g4-v6mr2479714plq.339.1528080541226; 
	Sun, 03 Jun 2018 19:49:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:39 -0700
Message-Id: <6bdb28523bfbb555debad92ffb2f09088e4310b5.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 05/15] mariadb: Do not use ucontext_* APIs with musl
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:00 -0000

From: Khem Raj <raj.khem@gmail.com>

musl has ucontext.h header but does not implement the APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b545c0643d2b2a1f1a816e789ff67116c613de5b)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mariadb/0001-disable-ucontext-on-musl.patch    | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 689b8ab..f3eb4c7 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
            file://change-cc-to-cc-version.patch \
+           file://0001-disable-ucontext-on-musl.patch \
           "
 SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
 SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
diff --git a/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
new file mode 100644
index 0000000..60e9199
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
@@ -0,0 +1,28 @@
+From 5bc3e7ef9700d12054e0125a126f1bb093f01ef9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Mar 2017 14:30:33 -0700
+Subject: [PATCH] disable ucontext on musl
+
+musl does not have *contex() APIs even though it has ucontext.h header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/my_context.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/my_context.h b/include/my_context.h
+index dd44103..9b28c17 100644
+--- a/include/my_context.h
++++ b/include/my_context.h
+@@ -31,7 +31,7 @@
+ #define MY_CONTEXT_USE_X86_64_GCC_ASM
+ #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
+ #define MY_CONTEXT_USE_I386_GCC_ASM
+-#elif defined(HAVE_UCONTEXT_H)
++#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
+ #define MY_CONTEXT_USE_UCONTEXT
+ #else
+ #define MY_CONTEXT_DISABLE
+-- 
+2.12.1
+
-- 
2.7.4


