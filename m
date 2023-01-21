Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B21C25B50
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2058.1674324086149702811
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OsUUhdDi;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so4919612pji.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNmxBgRpkQpSkqIsoBDsT/T+ppQx0yz2P3wixtKBeDg=;
        b=OsUUhdDixiQiBfmz24Js+7SP+dNHxsBEqyCOJ/GIMx772O0gm05GTNrtXsLiqP8iox
         mzlcOqpaiWuNZisg+bicvQ5l6OT0kKPAjtFskkKIwvLZ3M1bhc7y+jS48Ej6Cbs5UyVj
         n4oGblF2whflcG5n2n05XCOFtunuE16FXcMmP2JqUoE7qMKLN/BMg42fe5NwU5X1fUiI
         Kl5ScK6y7JbwBGJ+aIVqbZ0l+6Yv6wjwoQzyszTawiHCUyG2pRyiE8yPdg4RlVw7IFSz
         NcW5bJ17ZcWTbiFk88X/9jWOF+V2rPj+jgXEsClj5cKZTR9mBsEVjrYzSI0B+UiMkz+A
         0c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNmxBgRpkQpSkqIsoBDsT/T+ppQx0yz2P3wixtKBeDg=;
        b=UvJbvmIBkFmRCiD+2gtP2mKPzyI+OpRupuUM47TnzSA9+2rzWhy/iJ5pe9ZqxiBhnT
         15am31HRiOaGNdVsBq1SEhLL3I2vee0oyteTGdR96DgvoybCf6M3PtKWby3FDgXUXcd6
         TormDIPqTz2eT7WTzi7++lXSiK7il1xtYkiBrU97iL+McZ9scXQPHqXiY8zgxOeC3YVQ
         K1BweBs1ri6NgUYBfZeh9UiDMg6vnHbRfAOdZlYn6JO3idbNjroKWSE+y25M/X6T+weW
         lQ8Uk4zCx1fPuU6VsqziYo2W3o8HHkGGWvNJZbtLoSNHoPyiS1zSogFrKx3ulO+0rUnQ
         RFug==
X-Gm-Message-State: AFqh2krmsT0R8dFagF6rbyFqElz2bJVSimltAkR8lzgfkS9bFi+0T+aP
	yj/25oKOIvik8ibkoarxzgkyUHizqV6cCA==
X-Google-Smtp-Source: AMrXdXstctW39VwT3uIxJI4ZtQi2Guw9Ezkt3LtOJFNuFvH5N52dlrRRfO9+dBwen7WdoAPNOcUrkA==
X-Received: by 2002:a17:90a:688f:b0:228:e790:4c2a with SMTP id a15-20020a17090a688f00b00228e7904c2amr20118848pjd.2.1674324085263;
        Sat, 21 Jan 2023 10:01:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/30] xmlrpc-c: Upgrade to 1.54.06
Date: Sat, 21 Jan 2023 10:00:53 -0800
Message-Id: <20230121180121.1229895-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100669

Drop upstream applied patch see [1]

[1] https://github.com/mirror/xmlrpc-c/commit/148e64a5bb5588a89840ee498430332456c216f3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rc-Makefile-Fix-Makefile-macro-error.patch | 29 -------------------
 ...mlrpc-c_1.54.02.bb => xmlrpc-c_1.54.06.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.54.02.bb => xmlrpc-c_1.54.06.bb} (91%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch
deleted file mode 100644
index 3d861fc625..0000000000
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ea4ca50ca9cab755f3722096158a46deec0e663a Mon Sep 17 00:00:00 2001
-From: Arthur She <arthur.she@linaro.org>
-Date: Tue, 25 Aug 2020 09:51:26 -0700
-Subject: [PATCH] src/Makefile: Fix Makefile macro error
-
-This error caused the curl library wouldn't be linked correctly.
-
-Upstream-Status: Pending
-Signed-off-by: Arthur She <arthur.she@linaro.org>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 1cdf8b0..acd04dd 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
-   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
--  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
-+  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
-   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
- endif
- ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
similarity index 91%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
index 36205009a4..0a7ad33c64 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0002-fix-formatting-issues.patch \
-           file://0003-src-Makefile-Fix-Makefile-macro-error.patch \
            "
-
-#Release 1.54.02
-SRCREV = "86405c7e1bd4f70287204a28d242a1054daab520"
+#Release 1.54.06
+SRCREV = "00870af80021aa0a66cc72c9aeb00587cbfde560"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.39.1


