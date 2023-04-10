Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FFBC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.52959.1681153081994544542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=eIH93cAa;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id gb34so14793904ejc.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153080; x=1683745080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TRLtEwL0S4fA6sLLvaQ3rRB2LVya8b6Z1SbXd43X/c=;
        b=eIH93cAaT6t+ebMq830JWPCStjOQ+YedDMgIpY6Iimm4I0ZPcgzMXHrqGObHaP2aQi
         tr7C4fXHHnduRVH2X4RGnljFI36v1vdPYluPJgEBRMXKcJ1lQ7XPcN3+8kWmUukYD8hI
         OhiLyxCz1iisbd68PWxJP3u+LMJofeUZ2AAqQ+vExiJ3dNc/aZA/TDY244IOjvRFAY7d
         BmIee38YswLdIJoZfWutodgwTxavoml7R3ZirjaJlmsXTfiDzP3ig6h4cU8gk0FjRgYH
         Fen2fx4asYL76w5HzOhha1TG3rxIGsUit7qG1yTQ/4lyByZNTtFW9PYMHLl1i3vCsMiS
         E/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153080; x=1683745080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TRLtEwL0S4fA6sLLvaQ3rRB2LVya8b6Z1SbXd43X/c=;
        b=vHoJ2cjiQhI5BWrXFM3i7RJgpXj5YKADjrV/ngq9FfQ1nYORq/FhhG7f4r8EQrZmPP
         9LbxtbNqZ3tpfFKQJHKA75c/jTimUliaY/dKB9KC64/DKGhOTc4iUlButdna6XDi1rFb
         UlPRtcaZ5IAzQeYylpbMSy45HY82K4JQ7ID35dwZJ2V4fDQtSM2Rokvwnk1JTfzbpqOB
         1Bc1ALBkZvfaQKOhDfmAm4M5koAiQYyqRlNbbYw8tH42TfX5ZlxTDwk9eqzld6xiajBa
         kJSEvMzBJjyzvs2OKg+PgePRoH5P1a6LlZK9V+HbLFHaJIuv7jC3ePuWxh8VElT1y5Jy
         HWlg==
X-Gm-Message-State: AAQBX9dONGRElHiL55TmhKYpUks3p/4fMR7Nkl+N0dZc3PzxiQTkC3f0
	SiCTV38TsFkxbMSgQfHr6CL3D2prvEo=
X-Google-Smtp-Source: AKy350bhYnbz8sgbyB+jr8ppPHosuPP6zAM3hxAsuk9375y0Vh3haVY1FgkB9yOOd8+3dQerZDj/Bg==
X-Received: by 2002:a17:906:9c8d:b0:931:96c5:7646 with SMTP id fj13-20020a1709069c8d00b0093196c57646mr8253412ejc.57.1681153080319;
        Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709060dc100b0094a512b0972sm2395866eji.117.2023.04.10.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 4/7] pahole: respect libdir
Date: Mon, 10 Apr 2023 20:57:39 +0200
Message-Id: <20230410185742.2416583-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
References: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102039

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


