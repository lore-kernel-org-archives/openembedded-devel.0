Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACB0C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 20:51:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.4188.1657313468155874468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZ4RF2om;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id u15so15148382ejx.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVXeb7aAML/qDhOiF4T+vq26P3WRdpasalJ7QoXtnPE=;
        b=SZ4RF2omShpszBD1fbDhZ23v+a0ThUX4BqCTzoTlEi6FRDy/vRYPDDPvMvZOYAIQO3
         xFklXakgAPcTBKHeW9W4vKjj30xweCOajE+MMfqG4owd/6kXRN/fVCjvSEYkEK9rh/5O
         6NHjMQbVu71upXHmHkWjpGVCMfDXFRoPdDLpiNyLrGntln1zfVDzVoDHqJhXH4Kad8r0
         GEAgzVyg6Pzzj8hw8kxaBdM3Ly7FXhaQBGAPjwCCmxpIT1mLx6JQwR6VkNkf4vK9gerM
         yQuC5ro2K1j687TilzE0NZsVtoRrwHvi471UH5KS6oDUFnC4YwL9wlbbqYE4pI9msaRa
         uwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVXeb7aAML/qDhOiF4T+vq26P3WRdpasalJ7QoXtnPE=;
        b=XTpW8AcUruN+4HTrkyjPx/gPCApumSy4hfQO/uaoya5d1M4gQBn4QmC0b3SUv4emqF
         Bc8mKv9kd0E/NvPj7CuOheIvqPdYek/+6YsaYzqsGANkMFaQiN1pLBPkdu+QV/4IYZ+1
         GmQb7oP34UYmMq6y9QlUKsSoUj5ZTE5O2XU+2tA0vvpGja1NHytqbp+hAe1ClluJw8f4
         byVscJ2vw6Obe5lWUYzzDe392D0aB4l/sA4VfzUdcVgu/+FMTDjUsiWCIUzOkd568KMq
         al12qOg9VOzasY3b8Ma1+VIsiJ6RELt85RE8D3fWIfTN8/ibVSeEg0oHkGVaPjxsT8d2
         tsgA==
X-Gm-Message-State: AJIora9OydhBbt0ESYtYmMDyaVDmN6yufJtWBM/+bZJklwfWBiR4p1RP
	2g6cLozcw34LwRaqKVTrP2K0yI4cShg=
X-Google-Smtp-Source: 
 AGRyM1uaRnd4qkKLYy/4/JuIWNZO3rWrZZyrSR83qXeG8+tz66qrHBhR3P9BeC03rGOXPxQgONPuRw==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr5219809ejc.568.1657313466470;
        Fri, 08 Jul 2022 13:51:06 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a05640200c300b0043a7134b381sm10268512edu.11.2022.07.08.13.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:51:06 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/2] nftables: Upgrade 1.0.2 -> 1.0.4
Date: Fri,  8 Jul 2022 21:50:49 +0100
Message-Id: <20220708205048.11990-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708205048.11990-1-alex.kiernan@gmail.com>
References: <20220708205048.11990-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 20:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97793

Drop backported patch.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 -------------------
 .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  |  9 +++--
 2 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (85%)

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
similarity index 85%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
index f1cfb4910138..78d71fb4c0fc 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
@@ -10,20 +10,21 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
            file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
+SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
 
 inherit autotools manpages pkgconfig ptest
 
-PACKAGECONFIG ??= "readline json"
+PACKAGECONFIG ?= "readline json"
+PACKAGECONFIG[editline] = "--with-cli=editline, --without-cli, libedit, , , linenoise readline"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
+PACKAGECONFIG[linenoise] = "--with-cli=linenoise, --without-cli, linenoise, , , editline readline"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
 PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
-PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
+PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline, , , editline linenoise"
 PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
-- 
2.35.1


