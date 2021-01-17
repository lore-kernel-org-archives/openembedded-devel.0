Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.21228.1610905594692026424
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E1XrXp+v;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id o20so411790pfu.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2Lt7uo1J524YzqNwgnwGtffirUh1zHq/pnyUZKVEgdQ=;
        b=E1XrXp+vXXjzTAFGPyzh/P/67P4gM4BTaiwIcTmu2jh0hYP9TBTMvAgFu2eClQNiA2
         IwXEdEsu20cgij2QinbizmyfkPwFx5G3rgp+5HKwMl+CZ80ORodTtfgDchAqCoiKKczy
         dVWe8AoZ9DEdvUbYb4dvk9OeYv2WVM8GXAmiPXTeXA7k6GAWuKxrNM+sYCJ+K/njhAnv
         CBid3AwgKpOKqlNbc9qe69vQWe8rKBcQlquzjs4G/xnhDW4KkIlQlXRztb6Ur0hPZeBq
         /AUWG0Ri6mDuN8TRDio6/ZFR/O/OxdcmWvntsOl+5pQpvWCHFJmujoEBEgNuPOTUeuAW
         yx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Lt7uo1J524YzqNwgnwGtffirUh1zHq/pnyUZKVEgdQ=;
        b=C5s9hKeXMlYdAZtzaNatRoJ8SpROHHRmjKlfFMgGLh7Sk3KvOzOZ1w9ewOI4lx1h+8
         dawP85L11k13CELwV/MgKbtqtFMIUiKNJFP/IykpAalwUskLQFqI2IMVPxSIzwyqccHL
         rXso76ujLiEGx/+3MOuD/FgykEMscnAbTLGMuvq6s+Z5S8yuRByhGgjCkM4KzvBDWs2T
         fqRkZhr4G33QjqmvSZn+kTBodUOYsMLP5YN8zaOF6ShYZgVdqRE6xPwiNniK9QeVBdIA
         WYagCxLUj75q7g8TtebSqA5H3ElEcyN093Oq1e2tUl1qimJnoVg0N4FmAIjHJGEFAroc
         NwrA==
X-Gm-Message-State: AOAM530Uql8HmVvago/7Ges7Qs3mUXamvlFIFm8IhcnNuV3xdR3/LN0V
	vwygFTQLM8XqnDdJBVRVljQ7gNY+rs1a6g==
X-Google-Smtp-Source: ABdhPJyJLOl8oknfxBCkbU2PXl2Cgn1X32PrsOmptuskM5soLerHFS/e2Iv1v77w0CUMNzt0BFjPQw==
X-Received: by 2002:a62:9208:0:b029:19e:a15f:169e with SMTP id o8-20020a6292080000b029019ea15f169emr22385770pfd.71.1610905594102;
        Sun, 17 Jan 2021 09:46:34 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:33 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/28] pcsc-lite: provide pcsc-lite-lib-native explicitly for native build
Date: Sun, 17 Jan 2021 09:46:01 -0800
Message-Id: <3e84d4caabfd21ff68837d875e6a7f00b63a9c45.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Commits e2180b00b3b8fcf776c3 and 8edd760e66b48e411d2a added support for
native builds for the opensc and pcsc-lite recipes, but building
opensc-native fails after commit 40b3a5123120da0e4586 (2019-12-04,
"opensc: fix RDEPENDS in pcsc PACKAGECONFIG"):

    ERROR: Required build target 'opensc-native' has no buildable providers.
    Missing or unbuildable dependency chain was: ['opensc-native', 'pcsc-lite-lib-native']

The commit in question is correct for target builds, but native builds
don't have packages. The -lib part is also provided along with
pcsc-lite-native, and there is no pcsc-lite-lib-native package.

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
index 91d77ac938..04989fb740 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
@@ -36,6 +36,7 @@ PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-de
 
 RRECOMMENDS_${PN} = "ccid"
 RRECOMMENDS_${PN}_class-native = ""
+RPROVIDES_${PN}_class-native += "pcsc-lite-lib-native"
 
 FILES_${PN} = "${sbindir}/pcscd"
 FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
-- 
2.17.1

