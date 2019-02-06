Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id E2BDB7C035
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 00:46:00 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 64so2303711pfr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 16:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GPW8SVPmE8QW2l61lYf4BL+76AdHOQTi09ylzACUcJ4=;
	b=h7WM4lGUAElCQPCQYHDJ32hRyZ3IpwdEyk8hWmPlZw54irMcmknoW/lJfQfeBzb9zv
	lnrlCI8vKoLE3jKFQklS3tAZJjzcwnJuYbXhA+qRV48julYwsN+fliW02X80LaViPgXU
	ws/WhDQ7EBOnbP/xCedEUisAtuzqmgwnvwxB3fzeZ5Yby3Wqs3k9yQ6kpz0MUjydgxlk
	KdmBLy/52NY/RCpAfNBHzY9mm6sKVV1vZm47WstvmSE4EvFa4b8+R7xR3tUmyJef8wMp
	RSuJ3e/fWpdfRKBdu4N6ubTNQmab3EBSZn09BHu0h0XCkjIAS23PFrq1/E+bUkebD0Wt
	BVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GPW8SVPmE8QW2l61lYf4BL+76AdHOQTi09ylzACUcJ4=;
	b=uYcWJiJp7HxTg85Q0V4heT2TxH2GZ3u6mehsUJKlBc3UaAXeyxwU7mCNRPJPvjt8UA
	2kSAAyEMQnps1wMMozKiRQkh6XgUCtLR1tigvIUOQQnH1NHI16GQIuKNvmg1ZHZJfJ5Y
	SeHcIxhOK94Z4z+Q50s4NTN6u1zge9C13JolSl4xyQneJezP0HJDeibKkJ7WaAubOPAx
	CG9WvnJOAdcy3/VGro0lJxCKa+WrpRzbRMEoTWj4gA6MadaAGyg7GzIJBpQtGPol8rGe
	4nQZhaFyRc6J82njtsrKbSp8nq0FdMUYPytE06kMa1NK6GVr5RE5eU7OZytL/4QvoGhm
	KrlA==
X-Gm-Message-State: AHQUAubq5DkKTQEYSSW+HRLkK+erwWTKsYexISdezLUoPwx7P7sQYR/r
	hdlOhpU2fvZkBUrhYMb8R2niuJPl
X-Google-Smtp-Source: AHgI3IY3Q8oplqgrQnkvNB4rTa1UBNTooCsaXpuSvUCzzG9Y57n3mT2brIQPARNZ09BCYk6aHEuvfQ==
X-Received: by 2002:a62:6503:: with SMTP id z3mr7581244pfb.169.1549413961610; 
	Tue, 05 Feb 2019 16:46:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	l74sm7684098pfb.145.2019.02.05.16.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 16:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 16:45:47 -0800
Message-Id: <20190206004547.32351-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206004547.32351-1-raj.khem@gmail.com>
References: <20190206004547.32351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 6/6] ltrace: Fix build with clang
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
X-List-Received-Date: Wed, 06 Feb 2019 00:46:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build regression with gcc

 ...hook-Do-not-append-int-to-std-string.patch | 33 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
new file mode 100644
index 0000000000..8f1c4b9b9b
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
@@ -0,0 +1,33 @@
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
+--- a/sysdeps/linux-gnu/hooks.c
++++ b/sysdeps/linux-gnu/hooks.c
+@@ -200,9 +200,10 @@ os_get_ltrace_conf_filenames(struct vect
+ 	const char *sysconfdir = SYSCONFDIR;
+ 	if (sysconfdir != NULL && *sysconfdir != '\0') {
+ 		/* No +1, we skip the initial period.  */
+-		syspath = malloc(strlen(sysconfdir) + sizeof FN);
++		syspath = malloc(strlen(sysconfdir) + sizeof FN + 1);
++		syspath[strlen(sysconfdir) + sizeof FN + 1] = '\0';
+ 		if (syspath == NULL
+-		    || sprintf(syspath, "%s/%s", sysconfdir, FN + 1) < 0)
++		    || sprintf(syspath, "%s/%s", sysconfdir, FN) < 0)
+ 			goto fail;
+ 	}
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


