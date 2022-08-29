Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A52C3DA6B
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.67684.1661756214817469019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VI8AxxiF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 12so6904649pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/pM4c8XngoSfaYn3XkJtfofYdSIj1w4zfYzA740OD4U=;
        b=VI8AxxiFZkg6mx+N6QPkENv6CEWyxw2H/6EW78DJJI8xoqkIhEjt0352FYRn/WmVQa
         RG4c5ErFjlKkWnoaJdxK+2U4vAW0q8/XR0lsNdAHcl81zqRVXy9VOG0tvWGn0LQo00Wg
         0N2Uyfp/N0DQTYgM0Il4KBvkbI/c3ylYlrCqTeKE8RfqjcVU5lWFELA7iqkGgEQk8yCn
         ZH79nkb3eVRZ7yinI9VSPsvQPFZU86qDVs0cKAkBgs89Yfh6OelpJblMomNkxuWZtQAT
         2UiRgDIwY8lapgqqa0itQksGMS97WRe0KkFQalZpHzD1KK8lTIXvaDKTdXeFTm0ZJEz7
         QY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/pM4c8XngoSfaYn3XkJtfofYdSIj1w4zfYzA740OD4U=;
        b=pHYSmMBGtk2SKLZjYQMibmsIN3JqRNt8Zib2flq4MuqDN9+Dmz9WKcwhIvZjLbhHSX
         1Unxltl4QDtJeNLqZhh+KdaKGJPIinCp0zY7+olj8cQv67ifXArIuuGU/icdbGNcgNFK
         ER25yDqPEniQ03OwDM5IgB8Zay+D7NEzxD8mTUhJfRCT2E/Eom4YtOaw+PQLh1dLR8gU
         qumZpocexlQ9JWCtJY9TZm3Q9VopYnxsbIwr5e6blRqDDYyrsCqkkTDBegUYOnKQ54gf
         fgeHzfjI4Dd7T/7iovuOKZxkZn0A1g3cTPC5EWn2nIwzvGTmzFY5UTag7W4ddEty2JKH
         i4cQ==
X-Gm-Message-State: ACgBeo3Nw3aa3Nv2XHRWMEcibhcHxT4pLg0bX9xN9aPd37ygsj/IJt+8
	mr8H4X1nXFnWSkji3f7FR/HJ977QIC/05Q==
X-Google-Smtp-Source: 
 AA6agR7W1hjVkPGzcdMyaqmFIbM1vMGDp0cEVofIpSmeTlQwL19N9J35f+iskgk02D1NW/55ZFz6sA==
X-Received: by 2002:a63:5a1a:0:b0:42b:52f0:4134 with SMTP id
 o26-20020a635a1a000000b0042b52f04134mr12431427pgb.164.1661756214003;
        Sun, 28 Aug 2022 23:56:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/7] samba: Fix warnings in configure tests
 for rpath checks
Date: Sun, 28 Aug 2022 23:56:45 -0700
Message-Id: <20220829065649.808556-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98514

Add a patch to avoid implicit-function-declaration warnings, they will
soon become errors with clang 15+

set path for privatelibdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ith-Werror-implicit-function-declara.patch | 32 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch b/meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch
new file mode 100644
index 0000000000..4a89f76782
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch
@@ -0,0 +1,32 @@
+From 28ec4c9323e67cd114a0465015c9f3c2e64e6829 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Aug 2022 13:05:26 -0700
+Subject: [PATCH] waf: Fix errors with Werror=implicit-function-declaration
+ turned on
+
+Clang-15 turns this option into errors by default, and it results in
+rpath check failures
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ buildtools/wafsamba/samba_waf18.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildtools/wafsamba/samba_waf18.py b/buildtools/wafsamba/samba_waf18.py
+index 7a0a08e..c0d2c3e 100644
+--- a/buildtools/wafsamba/samba_waf18.py
++++ b/buildtools/wafsamba/samba_waf18.py
+@@ -209,7 +209,7 @@ def CHECK_LIBRARY_SUPPORT(conf, rpath=False, version_script=False, msg=None):
+         lib_node.parent.mkdir()
+         lib_node.write('int lib_func(void) { return 42; }\n', 'w')
+         main_node = bld.srcnode.make_node('main.c')
+-        main_node.write('int main(void) {return !(lib_func() == 42);}', 'w')
++        main_node.write('int lib_func(void); int main(void) {return !(lib_func() == 42);}', 'w')
+         linkflags = []
+         if version_script:
+             script = bld.srcnode.make_node('ldscript')
+-- 
+2.37.2
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 53526a26b6..f88dee6175 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
+           file://0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch \
            "
 
 SRC_URI:append:libc-musl = " \
@@ -113,9 +114,11 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
                  --with-sockets-dir=/run/samba \
                  --with-modulesdir=${libdir}/samba \
+                 --with-privatelibdir=${libdir}/samba \
                  --with-lockdir=${localstatedir}/lib/samba \
                  --with-cachedir=${localstatedir}/lib/samba \
                  --disable-rpath-install \
+                 --disable-rpath \
                  --with-shared-modules=${SAMBA4_MODULES} \
                  --bundled-libraries=${SAMBA4_LIBS} \
                  ${@oe.utils.conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
-- 
2.37.2


