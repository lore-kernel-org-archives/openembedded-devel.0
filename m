Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id B645B7C200
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 18:11:11 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id y1so251648pgk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 10:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QpTT7GelLPhNg71BdWTVHHIUbDypIWEEmfD2HUKiwgo=;
	b=cBd3TiBCrQi5C7lH4uA9LPIBxvGA32f8BP6wNOPHLwgzQY1cCz5tktYBHFlDccHirO
	frujRYuP+m/+fKlDPz4kGpthuRAAMp88b6oJy37/5GIVhEOgRRmTaFa0wyQgrvjIb7t8
	ThK9jNnbVEy1YJ3eyFWcVDI5GDZr655u8Uwb5xdenelWzKwvQMKJyYJA2PywSm9Cw1Ph
	qMvKnToyHOE3OGitDJjYfotRw+3tc6iL0zbi3i1vvVn/dNFUiG8dC5NxkfyNqTyi28c9
	/E4sYN+40/0mwVlsEV9BCGSvCz/tXAVITxP90E2b8bOlPZf4FpjCbxxwLsCAa2TM4hn0
	I8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QpTT7GelLPhNg71BdWTVHHIUbDypIWEEmfD2HUKiwgo=;
	b=KVfh4XTSiD5gxa6cZem3pB2I7xwuzsP03MKRSG/nTS+CUM/jt3ik2G7caY0l6Z8mw4
	0GYbopbK8Ub1KH2j/uNy+K9qGScZBwEVIneOxqOlnYq0TyGHg70F64Nzh6oqJN6nAkdU
	VtGmVlZJOFlVcJoxRXmj2hHIgUFPyucFs3IwSuZFlLhcj9Lp8rtzvx6BeXxYmGAlBvYe
	3RyqN65HH9j9iGhO97S5SHP4W5e3DyAtnA8c/Kg1VS2NkxcpTwetwmQHQn9gWL9ybwEA
	3dVJJQXcr+D/anSF/H6TbWD8r2vEnI8DaiiPhc1xkZAAzwCnOEby91H8itgOxjIyk8Ji
	Nm9A==
X-Gm-Message-State: AHQUAubzBcHOOWHt9J5wAXSjwSzkvp4UhQ6fmER4rmoonotUK0xoMtaR
	qaoIglOMNvhb/vCWFN5PyCK+9LJb
X-Google-Smtp-Source: AHgI3IYc5Q7qBwXedaQhKHeAabjRxAFOjoC3RD7vcrhxSNu5qDLLTf52CHMgkD5QfTtjeaMPebOaPA==
X-Received: by 2002:a63:f658:: with SMTP id u24mr572930pgj.267.1549303872388; 
	Mon, 04 Feb 2019 10:11:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id b2sm991515pfm.3.2019.02.04.10.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 10:11:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:11:01 -0800
Message-Id: <20190204181101.22055-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204181101.22055-1-raj.khem@gmail.com>
References: <20190204181101.22055-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] ltrace: Fix build with clang
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
X-List-Received-Date: Mon, 04 Feb 2019 18:11:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hook-Do-not-append-int-to-std-string.patch | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
new file mode 100644
index 0000000000..69e078741d
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
@@ -0,0 +1,34 @@
+From 8321f8b3befbaa355cfed988fdd8494133989676 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Feb 2019 00:38:16 -0800
+Subject: [PATCH] hook: Do not append int to std::string
+
+Clang find this error
+
+| ../../../git/sysdeps/linux-gnu/hooks.c:205:51: error: adding 'int' to a string does not append to the string [-Werror,-Wstring-plus
+-int]
+|                     || sprintf(syspath, "%s/%s", sysconfdir, FN + 1) < 0)
+|                                                              ~~~^~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/hooks.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/hooks.c b/sysdeps/linux-gnu/hooks.c
+index 327fdf3..4750d85 100644
+--- a/sysdeps/linux-gnu/hooks.c
++++ b/sysdeps/linux-gnu/hooks.c
+@@ -202,7 +202,7 @@ os_get_ltrace_conf_filenames(struct vect *retp)
+ 		/* No +1, we skip the initial period.  */
+ 		syspath = malloc(strlen(sysconfdir) + sizeof FN);
+ 		if (syspath == NULL
+-		    || sprintf(syspath, "%s/%s", sysconfdir, FN + 1) < 0)
++		    || sprintf(syspath, "%s/%s", sysconfdir, FN) < 0)
+ 			goto fail;
+ 	}
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 83043cd212..3dc269c80e 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-configure-Recognise-linux-musl-as-a-host-OS.patch \
            file://0001-mips-plt.c-Delete-include-error.h.patch \
            file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
+           file://0001-hook-Do-not-append-int-to-std-string.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.20.1


