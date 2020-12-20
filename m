Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.25937.1608483250728069535
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dR1m1iC3;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id hk16so5079188pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KOMQNctUJrz+W1KrHG14qo80EhIf6F6ljHIkKWT9ccw=;
        b=dR1m1iC3YyLpqAaOgVZJAoZSOA/83aDCcds0OOajoeL/bYpRFSqioaWu5SuibEOQzj
         mgseFwaeHvUlThW7SamAsrsn3ajK92zc4VubkSYupd6kgxHp/8G08lTKJwXQYBMeOzGK
         ghpTqp1y5mWlBiLzYjagOK5pLt5ylGSgUhzl2ECRnYdpPYRtY5VYTpxOMYbeZuElwayF
         4o1PbO6676VTsWO0UhghsY5CpcDMe5+odHGHevZqwet2fmMuz+bezJMpfIp25o+bBtbP
         PlURsYTlF/8FIMH7OfcgzV5Bq2CLWGC6tlkT1BCSEjQDjEO0joIrSyGZbN6NQnD01UzS
         BF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOMQNctUJrz+W1KrHG14qo80EhIf6F6ljHIkKWT9ccw=;
        b=qyO0wSzoasTc9tVN6oW0G0oEtLAlWgRZbHgCz52UNp7QWbEatcEmRssViYxb1GLEij
         x0/5u5Ceca6l/T1ngqTn0b+b22Z5Y6NyWyU1DdMHmmSdyXct90vsORBDIRbIQcmoeu3J
         jgA87Ep8DlNDCCkeM48ja6dc3doMXRkZtMUaWb4zWouZ9Rx6IHV9HgEN0enm4HrF7Vzp
         pS4uXp5T3pmLjGK3skw3cLk5bYl9vT63/XLQu7ufagQGerCkn21wAWJIIvLUhMmKkczH
         1WCBoXPMiLZbuuKzSER/ZSiuTWl+2s5Qz78NWi+/deU63YTs9nAsseSSQFGFPYq6en+E
         3CAA==
X-Gm-Message-State: AOAM530qSKHRk8eZLwsvR5zEYg0b9zHqu1ohIF8/XhPwFRHnvdBULCyc
	uuBRQKIDGLQOxqzRywKoFWZRoMv9dw7SgA==
X-Google-Smtp-Source: ABdhPJyCCEVw0e209gmOUP0V8klWNXzLR0AUoZGWRDD1Q29D69yRCH85Mx4Z+cGDJHy2kNaCgUUQSQ==
X-Received: by 2002:a17:90a:4cc5:: with SMTP id k63mr13445813pjh.202.1608483250145;
        Sun, 20 Dec 2020 08:54:10 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 6/6] pcsc-lite: provide pcsc-lite-lib-native explicitly for native build
Date: Sun, 20 Dec 2020 08:54:00 -0800
Message-Id: <1f4b2a1af58702914989e10744a5ad1409a4e23f.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Commits e2180b00b3b8fcf776c3 and 8edd760e66b48e411d2a added support for
native builds for the opensc and pcsc-lite recipes, but building
opensc-native fails after commit 40b3a5123120da0e4586 (2019-12-04,
"opensc: fix RDEPENDS in pcsc PACKAGECONFIG") with:

    ERROR: Required build target 'opensc-native' has no buildable providers.
    Missing or unbuildable dependency chain was: ['opensc-native', 'pcsc-lite-lib-native']

The commit in question is correct for target builds, but native builds
don't have packages, therefore there is no pcsc-lite-lib-native package
to depend on – the -lib part is also provided in pcsc-lite-native.

Ideally we would fix this in the opensc recipe. However, using syntax
like "PACKAGECONFIG_class-native[pcsc]" in the opensc recipe is
apparently not possible to overwrite the dependency for a native build,
and using RDEPENDS_remove has no effect either – apparently dependencies
from PACKAGECONFIG are added after RDEPENDS_remove is evaluated.
Therefore let pcsc-lite provide the missing package name for native
builds, even if fixing this unrelated package is not the most elegant
solution.

Fixes: 40b3a5123120da0e4586 (2019-12-04, "opensc: fix RDEPENDS in pcsc PACKAGECONFIG")
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
index 6f38d65e05d..c1b793960f5 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
@@ -36,6 +36,7 @@ PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-de
 
 RRECOMMENDS_${PN} = "ccid"
 RRECOMMENDS_${PN}_class-native = ""
+RPROVIDES_${PN}_class-native += "pcsc-lite-lib-native"
 
 FILES_${PN} = "${sbindir}/pcscd"
 FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
-- 
2.17.1

