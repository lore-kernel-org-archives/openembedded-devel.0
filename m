Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D28DC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:36:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.85912.1684150589901334140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 04:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Lu2pF1J0;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3063208beedso12042167f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684150588; x=1686742588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZUbwkU3EUM1xjvYNTkK0ArzBh/bbvP7EyqXIK6CBJI=;
        b=Lu2pF1J0nSOWxJNVH1GHrYZiLN3f17bvSgTl9g1KgUM79D+NK4j5TKc4OXqf4y6qsu
         7VBXgTS90tJDSXG1UPvEcS45wzwD2UW4//io1brrISSjXuydSEehpw3aE3jdAFmc+sfQ
         HVjZwFlkr6sY7tOBtx2VoIQAda/JNtF6Vh1TdBKiJLubIJRFgRaUyrAEnYDuNa7rdPDx
         PKhzXgoo7S1Sgc/lOhedC3jx8WSiS1kWW4kdGWbwT7usgxoM1K3JarYQ+GIHjzjiMM1j
         4vcX0WXKKTfJcJc+RstnngGhg8nupcSc7hphm1BVY8EM+W0q4kbS9bWwMAIYhXJqQY3Y
         aPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150588; x=1686742588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZUbwkU3EUM1xjvYNTkK0ArzBh/bbvP7EyqXIK6CBJI=;
        b=J4AYpcWQBrNQMRypURkZATK54s5OQ2siAZHBURbfKNo4GcpjBnTZ/LugjN347ld00L
         bSq+dERTZvstTA9EMvdDDvRv4Gvvp97xkUL+dkfEiGo/kKrIMoOhYgcvShkIc6iCxj1W
         SlM42bIzyfMcICVKGIsp8OdwbcLIkoG5nEx5af8t3IIMXcjk7aqHK9+yPUZXx1yp8n8S
         KrLBvnN2aYQMhdkvKNL30PdWlzt+BF/59Jel4hYjvO3dv6LVGQAKM2SEyufmokS6rzfO
         gjrtT52I6pM25ZWtEH0rwr67RczBKkEm2YK5SLrcbKmyN3f3FzAQsoCE4q8RDjuQyT59
         +fdQ==
X-Gm-Message-State: AC+VfDz0X8GfaBOyDUbB7aJ6A/765EUIiUEo8DxStAyVWL24ztdY1f//
	laLRzwz//gYvzttNmq3uGMTk4K0No1Q=
X-Google-Smtp-Source: ACHHUZ40EP385GE9M3QsQtk4cB/jGdARMe52mMUskeuJNSyDjvjlgIYU8P8NtBPD8nk0YXDM+SyITA==
X-Received: by 2002:adf:e50e:0:b0:2ef:bb9f:e9e1 with SMTP id j14-20020adfe50e000000b002efbb9fe9e1mr21666248wrm.56.1684150588153;
        Mon, 15 May 2023 04:36:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c210500b003f427cba193sm21660442wml.41.2023.05.15.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:36:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] glade: add gobject-introspection-data to REQUIRED_DISTRO_FEATURES
Date: Mon, 15 May 2023 13:36:19 +0200
Message-Id: <20230515113620.42510-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515113620.42510-1-Martin.Jansa@gmail.com>
References: <20230515113620.42510-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 11:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102601

* otherwise do_configure fails:
  http://errors.yoctoproject.org/Errors/Details/704194/

  gladeui/Makefile.am:267: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL

* AM_CONDITIONAL is in ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4:
  AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")

  but since:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/gobject-introspection.bbclass?id=4e51c1815c92bb15977a3bdb14171d770da44004
  it doesn't get copied to ${S}/m4 without gobject-introspection-data

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 6c1112038c..9ee087fdb7 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -13,6 +13,7 @@ inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
-- 
2.40.1


