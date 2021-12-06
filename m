Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD49DC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:26 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.55605.1638814525992651092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 10:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aAYjkgW9;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id y8so7624522plg.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 10:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+M4kFKkiHlA3THi+LLMXS332x5zdahpJC8iyiC5KteQ=;
        b=aAYjkgW92b3YRa07T7WUVolOKLzhG9mCQA4vXFVuxSlAqIgh7LiCmyGS05CGBpOXLy
         gOYHhZFHUXXHjS6gp/9B2XKl/M2Lx5NPKYxEuGr+1RQ4wWZVV1HNUNh0BDLOU0mZyFxE
         yulO0YbRFhGKO5aKSoPwrpEjSpgFLZKleQ32tKp222VL4y2zGEGiriTFpkDC9K3a0l34
         XJYygp8szut154h65QE73+5r5II7jPf5UKPqBJv7cOt2V/sb+PflPEV1XaMwDiJS+y6n
         XCY67WlCAWAyMVNhW0Iy3jC5sJ4r79VY7VwLUAMWzqBJ9zWigczsRCV9fpfgyQdohssH
         1zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+M4kFKkiHlA3THi+LLMXS332x5zdahpJC8iyiC5KteQ=;
        b=TyB0c4JGpjjWaK0OHf13pAfBlKzOrROjTp2U3inI+hwEKNUE16XKv5I1L7ex5jY0Mb
         /7KsiTZpNDhRYWh0aIWgBUCd2h47imBxekA/h7oOXlYRY9qMgq8aejYLUR+MxsJWu1ZP
         cVECclHpxkiUvV5alE4wjdQKwz01UIhvkGNTsS0o9N+T+0Vz77D+bHN4VqhkKK5t/hK7
         gun5JV4abRDTnvzrJN3d9URB3i1kOXVAYs1Mrv+yutowgZI9+1hhdJM8Tnxg5/qWOw2L
         d71E4auVjE4gcy/yDe4sS2m9MiIJMc+o0lzWslQsSDQEKFkOVWVONfiAjtEW6/ywihg0
         Jbqg==
X-Gm-Message-State: AOAM531Dy1OzSHgtQLV3j0YfKmPxypNjWrQlOAb2oRhdpnPP0aCvmlvg
	8+NROOTcMdVZQVlgsFRWsnVdu9Dp8kea/Q==
X-Google-Smtp-Source: 
 ABdhPJw0fr/veJxCCfU7P3BPWm2vRfWFCA1nv8ZijaWemqox0ubTC5orjGIlJr0mtGBMqWtrlSQqhg==
X-Received: by 2002:a17:90a:c986:: with SMTP id
 w6mr158324pjt.27.1638814525101;
        Mon, 06 Dec 2021 10:15:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 j1sm13715528pfu.47.2021.12.06.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 10:15:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libunix-statgrab: Use compiler driver for linking
 as well
Date: Mon,  6 Dec 2021 10:15:22 -0800
Message-Id: <20211206181522.4161973-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Dec 2021 18:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94218

the build system tries to deduce the compiler and its friends and fails
because OE passes LDFLAGS assuming that linker will be invoked via
compiler driver ( gcc or clang ) therefore prefixes linker options with
-Wl, but libunix-statgrab build system enquires LD variable for linker
and uses LDFLAGS with it, which causes linker to fail since ld does not
recognise -Wl, etc. Therefore using CCLD for linker is right choice here

Fixes
Checking for cc... i686-yoe-linux-ld: unrecognized option '-Wl,-O1'
i686-yoe-linux-ld: use the --help option for usage information

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index 7af7f92fb9..c2b6d4abf8 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -33,6 +33,8 @@ SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea6
 
 S = "${WORKDIR}/Unix-Statgrab-${PV}"
 
+export LD = "${CCLD}"
+
 inherit cpan pkgconfig ptest-perl
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


