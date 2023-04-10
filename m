Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DD1C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.54245.1681153119041711349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=oNlA7L2n;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id jg21so14293144ejc.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153119; x=1683745119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TRLtEwL0S4fA6sLLvaQ3rRB2LVya8b6Z1SbXd43X/c=;
        b=oNlA7L2n/gO0+ql/f+n3RL8OYtYlecazYWS+MpL5AUeAEZ99ymRwBDKlsleIFC+t01
         m1D9zdSgJtL8EPSsuyTOnsFluUwQaYMNU2x0JncqPP6j9/UbZPC79Qtj0/KxjqrIvsqI
         Wsq1ZLgwKSibUmCUbegtYHwJVddrHExEdn3l5MQeQCZgBiWu/h2gs21LXVJLocPBThWF
         cZp7VazDxLPFt8esY90+rldXLoxz1wL99ziAnC+6jq/EnxQVbnW5988Ng0Bhf6vaklnQ
         3IEEZajMajZX2UhtpoW2zKWnWhXhqgji5xrQo5YEv4MjCewpY9rLt41WcO1fLYPgxk/0
         va4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153119; x=1683745119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TRLtEwL0S4fA6sLLvaQ3rRB2LVya8b6Z1SbXd43X/c=;
        b=0FVdRz9SQ71iuJixzS+/1kUkr2VYWSWHPfEjc+QGuww+wC0MrRdnAb05jhQEb1LKK/
         7OLKY7rSed7jDkyjWnR+qljSvWTiIM03xIsbqSqnW5FRIRCDGI18ICF8d7uFhXMJaJKd
         bqp0KUOUSKOrfXvblyKlMCh0YMbxaCWh4YkTcN9qruPKsasNXok/nvYSksyeWoPisn/C
         THyWsc1rTdzwO0eZA856W4oVjwiRs88jHqcHXvX8JxKlF0d/mGwwNB2P1LN5rMSBbHlV
         o8QcxyaL6a/32mH9c8qZDjHSGT/rFqYn+Adh1rmxaPcMjinG9injQppaKFSuIgNC8Q4I
         wCTg==
X-Gm-Message-State: AAQBX9djinF51D8yQEKCP9TFwey4fpWXwNgCzeFChIViFiTyGbMyXMpN
	lBReCEVqUaLjj61osMZQjpLe/cwp8wY=
X-Google-Smtp-Source: AKy350ZvmNhfe8iLwzMH3rcTOsmF+gSx4k+xR1nQ9LETsFfAYn8Vm6Ttuj7Itnv9rLmxUfj3EXuKoQ==
X-Received: by 2002:a17:906:1f54:b0:94a:773:7121 with SMTP id d20-20020a1709061f5400b0094a07737121mr8499306ejk.42.1681153119754;
        Mon, 10 Apr 2023 11:58:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gv11-20020a1709072bcb00b009273859a9bdsm5279796ejc.122.2023.04.10.11.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 6/9] pahole: respect libdir
Date: Mon, 10 Apr 2023 20:58:16 +0200
Message-Id: <20230410185819.2416704-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102047

From: Martin Jansa <martin.jansa@gmail.com>

* use the same expression as cmake.bbclass is using:
  CMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')}
  but ${baselib} should work here as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
index 449508a5d5..ec642ec3b2 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -21,7 +21,7 @@ inherit cmake pkgconfig
 
 PACKAGECONFIG[python3] = ",,python3-core,python3-core"
 
-EXTRA_OECMAKE = "-D__LIB=lib -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
+EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
 
 FILES:${PN} =  "${bindir}/pahole \
 		${libdir}/libdwarves.so* \
-- 
2.40.0


