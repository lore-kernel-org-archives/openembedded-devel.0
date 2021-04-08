Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.240.1617899805870287074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ox8DgGzn;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 25so1317750oiy.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/zO6KjRyM8AtY4N5zcbe5vH9FsnBZ5RjjKCT+KZMHKU=;
        b=Ox8DgGzn0AEVbVhtIjgUa+4UOgCwBwwP6p9Yu4jPNL7ng/dgS+ILP4PQJ1t1A98+2a
         LM4myQ0bKvRyHKOJGCilcMqxnSqbrkIpNtjBUUehPmUFJbwM3UzS/EDyq6Idqt68XI3H
         EHvAffg0QG0qfyR618vlv2EwTMTs9wUob/Sbrf0MjFwu5qNO39h2DWhk8cCcFdda4TpS
         OPfAtEkvjEh2Vdmp8pAoBPDFQJOAI2Loc5OY/jWiOwiZSeBD5UUIz05xa7wAoG7iESvt
         r4Ahp7RmtlQWy6yNC3Hj4DKpXbg0DkPGPe9glBJebzi5V8oxnAIH9FTh4hd/DgJ8Kdrl
         nLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/zO6KjRyM8AtY4N5zcbe5vH9FsnBZ5RjjKCT+KZMHKU=;
        b=HufkqcSvvyfoHwhztRsMjXnJJBh4y6lpXeR9XzaMm+U6PYJltVRYTyUb7lRyHY7DdE
         AEatAAaxe2fi2r8N6JtjfHkLIBZRVP1H1WL+rV9GKRsO9vyqHBvrzEl5jael/n5EA/MP
         t2EbY3NgxbyUmOND9dSfbuCFdMMhaIGdPBbbsIMY0Oz0j5FmUNe23s5QZ2l5hovtDidk
         qfYBlUyY30w9oOqyCZGgcqyoYkjLGGEWABTGA4H1MlIDFG4sLD17hw934RyGcgbffY8h
         CAJHRE/28pJC/S44u8I1aOUG9DLv2/J08+j+BOI6iMjZ2DBxgFdqyEzEjcaviC21AVR9
         Kp+w==
X-Gm-Message-State: AOAM531KUOSmlgumF/mIw2WkjduUuYbOS5Mexx+Fu2gtud1poney0ltW
	nm8+vvNXbGhsByi3Bp34e6USqaR1m3E=
X-Google-Smtp-Source: ABdhPJyDSHqKrbdIaVSQpaPUgQqeB8qmFw3uLjFGQ96KvaLvaQ+313lNzA9fvXt8Rw4J/shBcCq75w==
X-Received: by 2002:aca:d787:: with SMTP id o129mr7022396oig.40.1617899804994;
        Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 35/64] libxaw: upgrade 1.0.13 -> 1.0.14
Date: Thu,  8 Apr 2021 09:35:42 -0700
Message-Id: <354aaa21d223f2185a46a968d9e3194dd3199206.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 454644c578c84062f49b443626b7bb7dfff06060)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
index cb1ffcd8cc9..15f52d8d453 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
@@ -5,10 +5,9 @@ DEPENDS += "xorgproto virtual/libx11 libxext libxt libxmu libxpm libxau xmlto-na
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
-PR = "r2"
 
-SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
-SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
+SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
+SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
 
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.17.1

