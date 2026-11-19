Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1837.1795113356471784707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t92q/rKZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccca948203aso79819a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113356; x=1795718156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rX75x3E/94wsjzNw03DgrDT8fgoyL7ETTM5aYteOYp4=;
        b=t92q/rKZT1e/EPx3Dujge0EsOXJG9QobGURFpJ7yv8g5WjSgIV0wGJ5QeuiKsh8Y9f
         VkP4SWJ54ujvhQSz4BGKXsg2SE8mkON9fl8oXkvgOfO8SoJXMCmswAW8A8kYLBAzw39e
         6cqDii2iG9jFvmSDg+A8iWg9EPveb7a/imYXz4DNBuKMySvJEKv9BjJs78gjarZupkOG
         EyR7bILSY/KrZD+Jq8njuqxO06pHnMAdSIrkMFTXBEXO2fNexmw8zfbtfsqwESEfX6hY
         /zTaIi+iICDk7GvMD2GjTIxL1Sn2yyFFo05rOiyhPw6C7Qld5kvN3YlkJ5GRd8JYoyAu
         6W2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113356; x=1795718156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rX75x3E/94wsjzNw03DgrDT8fgoyL7ETTM5aYteOYp4=;
        b=ASBzERFti81iKznfafLO7msSBA6VD4daKzHN4m8XhQys519NoO5vMt0ZB8mF/EqBB4
         VgFOPRtX2iyu5ZzVy1aJBL4dYZFr8TOTBdB+43vZLU6dhyBFxckOQCXa8rTseV+KWYGq
         EGjw6uM7smHIr2hWPRnmz80oNlnM5knOk2osu75uaFz1eSaumDhxGqb8OuZTxOjKNlB+
         v7MctD1tPUPSf5RFgHRa93vmaEmcAFjW+yf7/Hyktjf2RMCdA4iOdwfFs6mSlLoZSEjV
         x1HFuUGXCJKK6LlNvfBa57ZpPiW92FRu+b5r1dAsMjsNOHrwRDUlhjUOhzbA6h3lKjeT
         oI3g==
X-Gm-Message-State: APuU4Z8FJtwVhkI5xCtAiUQvDiamKo1ITpUdnjJc70vWvO26Y4i8sBKP
	lnjA9xwCEQGExwu6AT8lZK/1B55Wo8vPAkN9GDJPdpWz9WfVCh9a5mkp010HlA==
X-Gm-Gg: AYBFou05X1EfypHo2PAyr/QLfrCWChE4DUUtmbn2tNq12w+DNV2h5qvdtEN0s241pgr
	8cZEDX5YC9d7yp7aDxgEeWtHkWhp76nTecIMdoFyhAqC2q+rYMciXK3m0KdgylNjXyhyjkHTA10
	BS3LvLxmC/ZcpjeNwZ7AaMEvRB5TWu4+og2mDMwbfRGqrqTWrLqGJYhNELOCKJxaEONlTncmpgL
	wj/BXHJsRn9MEjXJWDSJzlDg2t+sZtJTLjkBocDwJcES/joD/ePIQueXX4fe0xhc95lcXNXZioE
	XIQqwYMWjbAMUsHSZFpYET+RsExlfvsosghAABnOUSKy3dQpG8s7CPnBknIDaxlHeZsXOK23sOV
	7tSz09v58F6/lw2i5wxTGt+NejvOo6XwJmNJELmwjq1DJY4RILJye9my5Ne2BwAL3Sj9lNx5ODD
	aRjlQoOwLtV7Vt172JMAZBD9NDTEJFzrEJnI04B2BREaJrjpuubMBoOPCQeL4czr6o+pgf8jBWl
	4hvZIrbhOd2DuHKDaowQ8ZSdp8yZ76e6G+cygqCv1poO8cU2JbcymU765vdXdlsPOZSCeikt2QD
	tHFTbO1bYTflq9z/ViqDeVbHfG2t1RO3Um58Ao0C26jJj1mI7gWM/Y4wSY8ZTg==
X-Received: by 2002:a05:6a20:914d:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-4014ce591e6mr478822637.35.1795113355588;
        Thu, 19 Nov 2026 10:35:55 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:35:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [blacksail][PATCH 01/64] nng: correct upstream branch name
Date: Fri, 20 Nov 2026 07:32:29 +1300
Message-ID: <7b269642cb83e14c5cdaf8c997d623b5bc7ae026.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132691
Content-Type: text/plain; charset="utf-8"

From: Nate Kent <nate@nkent.net>

Upstream changed the branch names between the v1.12.3 release and the
v2.0.0 release, which means the old branch is no longer valid and
fetches using it will fail.

Signed-off-by: Nate Kent <nate@nkent.net>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
index 7f8a3986f2..f10cf51c57 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=nng1;protocol=https \
            file://run-ptest \
           "
 
