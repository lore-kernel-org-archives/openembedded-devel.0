Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8497EC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 09:13:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.7110.1657617199304803331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tenl8eX9;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id o4so10273443wrh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJjH1Reob8lgYuLn4LlfU1DhpeTHvbJanmuoAHNJ6xA=;
        b=Tenl8eX98882GZGCltrULyxyNq/h+NcH8xygmQwc4U0QNM9GsRNw3OYHjnwLx4CObI
         1UMDQ3v1g6yhdeU9YQ//lsaflamqajo5W38SP9eqLtGqEc1rfvg4dnxB0fKKlGi+CkHx
         O+l3Jxl17cxW7Zawhcr+5cVIXthi9pGQZsIIem00yBlxXK6xWCkRtHRP58WdxjIAyRj+
         mqMsOypSUQ799W4NoACQ7KWyArjp+0YBJocKUw6X2nNYXnbQ/ixp0VXYYMz56N+w5LxH
         1EDfsC2TBku1tbI6cw/cYlZmgMEDodGcoDsNp+NcbVIOtNL6r9FQNasGtfAwqM4SM9/4
         3k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJjH1Reob8lgYuLn4LlfU1DhpeTHvbJanmuoAHNJ6xA=;
        b=23UQ4iKg4nfQbvLOqMaBdU8theVu6eHHHXdQe0g8r88IJpKzAfmE5YRbN77EHnRc+u
         Zvn/K24tWVh/8Icib9Ij8OK+Cm4pQExzoxH0Gdm8OAyZ+oEE4rn7712swcht/hvROFxI
         Zh/iJ887ZrfpFDlN++DTL58F7IZVYeFCtr4fTjwraJyYwvCKTtD5wd+mogAI9DdL60GM
         2PTPTE8FF67EMQA1PDUrtdmmiTNEtYOJiWP16COUxlOTPKkZdbZg2LWHL05sGne6+tmy
         poyX2ksCO+fNWoNoDq5ARsWbUlUqEYkqtEDKvFi8ZbZIJxMEf2lvFbnqotGlO70jx3qq
         TnPQ==
X-Gm-Message-State: AJIora+MtVpAyc5QBo6zT4v7rTW9flVnU8FC0/H96jCSqo5gEZ0U0Wnc
	U9mYcmnHnIZw+CD5h5xrnM03yYVHtmk=
X-Google-Smtp-Source: 
 AGRyM1u/JijSlEUdKy78Aq4ZV3kCLgusqSHGlonfo8atVmAthvxQ07+etCdJRs0YbupY4zalwe3wtQ==
X-Received: by 2002:adf:ffc1:0:b0:21d:66a1:c3ee with SMTP id
 x1-20020adfffc1000000b0021d66a1c3eemr20577446wrs.364.1657617197304;
        Tue, 12 Jul 2022 02:13:17 -0700 (PDT)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a5d424e000000b0021d4d6355efsm7707337wrr.109.2022.07.12.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 02:13:16 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH v2] nftables: Upgrade 1.0.2 -> 1.0.4
Date: Tue, 12 Jul 2022 10:10:54 +0100
Message-Id: <20220712091052.21871-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 09:13:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97815

Drop backported patch, switch PACKAGECONFIG assignment to ?= (matches
current practice), add in editline, linenoise CLI options and xtables
option. Switch to --disable-python when building without python to avoid
a configure time warning.

We can drop UPSTREAM_CHECK_REGEX as the version no longer gets confused
by the 0.099 version which exists.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 -------------------
 .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  | 16 ++++----
 2 files changed, 8 insertions(+), 47 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (77%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
deleted file mode 100644
index 65ab2dfd8c49..000000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 18a08fb7f0443f8bde83393bd6f69e23a04246b3 Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Tue, 22 Feb 2022 00:56:36 +0100
-Subject: [PATCH] examples: compile with `make check' and add AM_CPPFLAGS
-
-Compile examples via `make check' like libnftnl does. Use AM_CPPFLAGS to
-specify local headers via -I.
-
-Unfortunately, `make distcheck' did not catch this compile time error in
-my system, since it was using the nftables/libnftables.h file of the
-previous nftables release.
-
-Fixes: 5b364657a35f ("build: missing SUBIRS update")
-Fixes: caf2a6ad2d22 ("examples: add libnftables example program")
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
-[http://git.netfilter.org/nftables/commit/?id=18a08fb7f0443f8bde83393bd6f69e23a04246b3]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- examples/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index c972170d..3b8b0b67 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -1,4 +1,6 @@
--noinst_PROGRAMS	= nft-buffer		\
-+check_PROGRAMS	= nft-buffer		\
- 		  nft-json-file
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
- LDADD = $(top_builddir)/src/libnftables.la
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
similarity index 77%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
index e078be79a1df..e2d0bd66812c 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
@@ -6,26 +6,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
-# Ensure we reject the 0.099 version by matching at least two dots
-UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
-
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
            file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
+SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
 
 inherit autotools manpages pkgconfig ptest
 
-PACKAGECONFIG ??= "python readline json"
+PACKAGECONFIG ?= "python readline json"
+PACKAGECONFIG[editline] = "--with-cli=editline, , libedit, , , linenoise readline"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
+PACKAGECONFIG[linenoise] = "--with-cli=linenoise, , linenoise, , , editline readline"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
-PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
-PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
+PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --disable-python, python3"
+PACKAGECONFIG[readline] = "--with-cli=readline, , readline, , , editline linenoise"
 PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
+EXTRA_OECONF = "${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readline', '', '--without-cli', d)}"
+
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
 RRECOMMENDS:${PN} += "kernel-module-nf-tables"
-- 
2.35.1


