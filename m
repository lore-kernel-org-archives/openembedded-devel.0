Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7853.1631714298975875707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vi7u+HQx;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so5001978pjc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpnsMF4YBwTmZ1I+F+7OCW9eln6PKEB66+pQCQhtofk=;
        b=Vi7u+HQxuDkeladnd7piYpnwYD6jJNY7aK8fGwsSl7QnJO7tqZD2Uzunw0R6iWxgKL
         3K26s2vWs79rKA/MV03M8JGNDvr/3BF7wm4Ku/ftJSt21PyYSN4/8poDSVBN064aiTwh
         NU0eHroPn44vr2oD/fVqzCxSBkUIiQGCW8j7y+teBBhrypupvssHC10Nk4TOMb8LJMnj
         SQFYc+2arpa/BWhYjExlPJvtPiJ64JN9pkoLUQQq5UOz4WhRR/R+L1BNC40R6P3oaYGo
         ARf1Ys0quUOA4NgbN7VZgBt8cveS7kOIoJ9QDQTqDY/jmhGthJ2DPfLTj9mqetSMHr0P
         2b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpnsMF4YBwTmZ1I+F+7OCW9eln6PKEB66+pQCQhtofk=;
        b=MWS4UDr2SwGVwk3JQ0Wjp54/H+d8haZuKI4qupDzNidJPXB3oDa/a5RKP3p6whStS2
         l7lUPDpTMoDSKdaPQ6DRscymjPcCpG3Wgr5UHZLbAGyAU3Jyb12z28zWL9pEnPOa6npi
         qogs8yuItGPmucfoKNt4/95eK3bDF+zkrw1u28cCz5/8odUGaQlrRVYlYMVmRjQFmg1F
         FLh+x17G663ATYwYtbIs09yS4Ny8LAjA2Jqb4wNMzFBKu1ldtWxAZ3f6iQTpWxXG21HQ
         ZN4UiJTns+lkkOGx+LilANz3C+KMynYK33UXMVvey7+Tz5Yt1s8eAJmh+CLS51hlpo9t
         pGWg==
X-Gm-Message-State: AOAM530qRCO4aNs8k7Jt+UIY0qemXD8FJbBaSeoLq5jvunK63WtH998Y
	2eYBOYDptuSiguNTV+Alk/CYdhgU/OOgCA==
X-Google-Smtp-Source: ABdhPJycKlAQV93ph7Gz+/L/Ns9MTbJgaPBKWAlCTi/IWzPBiyrBKrBUEbJ6iNpOUX9Dqfp0cuMC3w==
X-Received: by 2002:a17:902:7897:b0:132:580a:90b4 with SMTP id q23-20020a170902789700b00132580a90b4mr19995242pll.7.1631714298250;
        Wed, 15 Sep 2021 06:58:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id m12sm5232815pjc.18.2021.09.15.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:58:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Matteo Croce <mcroce@microsoft.com>
Subject: [meta-oe][PATCH] pahole: Add missing rdep for python
Date: Wed, 15 Sep 2021 06:58:15 -0700
Message-Id: <20210915135815.2343194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
pahole-1.22: /usr/bin/ostra-cg contained in package pahole-extra requires /usr/bin/python3, but no providers found in RDEPENDS:pahole-extra? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Matteo Croce <mcroce@microsoft.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
index b9fd81fe4f..db7d88cdf6 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -25,6 +25,6 @@ FILES:${PN} =  "${bindir}/pahole \
 
 PACKAGES += "${PN}-extra"
 FILES:${PN}-extra = "${datadir} ${bindir} ${libdir}/libdwarves_emit.so*"
-RDEPENDS:${PN}-extra += "bash"
+RDEPENDS:${PN}-extra += "bash python3-core"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.33.0

