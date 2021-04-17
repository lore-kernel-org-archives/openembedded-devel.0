Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.3518.1618693599222706464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNcQu6UM;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t22so21584484pgu.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tmHHNZclg1HV1l4hKjCqDL0Ke19Imjd5MTNF6+2h0T0=;
        b=bNcQu6UMgc9Cf9vipHI3np4RQ4hY0EHpaww1l7jgbGYvr9jB/5ZKI/G4UOWswlI77P
         bI7x5E5EkqMMlcpoH2q8PgOX+wMVLyIF68muONfhwNt/F6p7VakCB4pN7ZAItOeXSqnK
         NFeQ0IeqyJy7Dzk9yLZeA3IiTF57kv2/ZsXCBJ7XjJWD9PNRxIFFQQWO/Osb/QVu2khc
         zlD94uOjRDJ4LAK7PkWNdsd8/DLKTyzui3gPmWPFQesrG2PdOKfoql15hXuprJxgizQT
         LZD4Gh5wv7HJF/IYnNVO4CJGFcCWrC+Tww5uYEcMjfT9fuWV8A2VQpp/mbicfSbvLxdk
         7vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tmHHNZclg1HV1l4hKjCqDL0Ke19Imjd5MTNF6+2h0T0=;
        b=hteB0iOTrPb0mue0vo2+qiEFHwmYKPMrM9IeshDhrARc8YWr+NAlGb62AuWAdjyrYl
         WOdf7vuPzVLJ3JgA+/DMnjA/cFdYSPyVYCvOFHoeSTTFcCrvks+Fti0lbFh5sSriBNjQ
         jhDFC3ijPun0EIl0PbcP05Jro3T7fMuk00hjBUL9PYu9FXACpSzUTgEGqzKyDi9kMW1E
         YDq0KcnLbc0IbBKw22UIoKRL4MGWkosrBmuHij3efef2W6fwC9TB/YLhDqEdqVWGyWZU
         Li0W6tjUVKwwpdbKdKxcl9jMrY1qGEYQPwQbIpryaXFhSF1QRKUXLX62737i0XkdXsfH
         pJag==
X-Gm-Message-State: AOAM531Augy9NluIp7eHHrDXT93Lz/epA6fTw9SCDzDmI0/yIW8VmGMM
	47w3fwlUg9jGYpk1cyWUVIH/cjGjRtfOxw==
X-Google-Smtp-Source: ABdhPJyvIDM3ttFkJzzBY2cH6voP0hHfv3lqeVwjGEX+DsOYA22BpBK7VFVNxWK6k+dD7Rl2y5kBWg==
X-Received: by 2002:a63:4513:: with SMTP id s19mr4736016pga.34.1618693598666;
        Sat, 17 Apr 2021 14:06:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:38 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 40/50] bats: upgrade 1.1.0 -> 1.3.0
Date: Sat, 17 Apr 2021 14:05:49 -0700
Message-Id: <650bdf68890a51bb7fd39779b5eec91616a17951.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

Add 'pretty' PACKAGECONFIG option with ncurses runtime dependency.
This option allows to display test results with '--formatter pretty|-p'
bats command line option.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df625750c681365b8ed1fbd746cbe054437395cb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-test/bats/{bats_1.1.0.bb => bats_1.3.0.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.1.0.bb => bats_1.3.0.bb} (75%)

diff --git a/meta-oe/recipes-test/bats/bats_1.1.0.bb b/meta-oe/recipes-test/bats/bats_1.3.0.bb
similarity index 75%
rename from meta-oe/recipes-test/bats/bats_1.1.0.bb
rename to meta-oe/recipes-test/bats/bats_1.3.0.bb
index a8179744aea..8190a5e3a51 100644
--- a/meta-oe/recipes-test/bats/bats_1.1.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.3.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "git://github.com/bats-core/bats-core.git \
           "
-# v1.1.0
-SRCREV = "c706d1470dd1376687776bbe985ac22d09780327"
+# v1.3.0
+SRCREV = "9086c47854652f2731861b40385689c85f12103f"
 
 S = "${WORKDIR}/git"
 
@@ -18,4 +18,8 @@ do_install() {
 	${S}/install.sh ${D}${prefix}
 }
 
-RDEPENDS_bats = "bash"
+RDEPENDS_${PN} = "bash"
+FILES_${PN} += "${libdir}/bats-core/*"
+
+PACKAGECONFIG ??= "pretty"
+PACKAGECONFIG[pretty] = ",,,ncurses"
-- 
2.17.1

