Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC16CCA480
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:35 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2396.1654283969981571913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYaHudsa;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so9641198pjm.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Cw22w7karlVxJCF98y5sFYc9Chpryca052GfbQ7q+E=;
        b=VYaHudsaG9QQBlj7/nGYk+3PCtwIOupkeD797k+Z8AXnyM4iDmsMJK/th8JuMC3MpS
         ypQ1si8bcnN53AOmjIb2LBHVWA73lb4sBNydvTq8D8Ku4NZ8+WAiI0pJC9icf5bXwo3H
         iD2a1CMnlNV2l/HqMu/foBTjxIxKIIXwWT6l3+HSkXHNk4gkCRjzAP1EXPOdz0bY9MRU
         P0wZr/fCyM1Pw2N77FJJF2WLY8RoIURhczFzEnBarrS2Fr+eOuR0DZrYKSsoezto717/
         jBjPygBE9jWccUQLQUmGMTzFGS0yf88AeTF6Zb61fzeryRQC0lJ49saELlL9B3jAL5OG
         vCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Cw22w7karlVxJCF98y5sFYc9Chpryca052GfbQ7q+E=;
        b=zpNHu6cNy4XDSG9o1hIBpOt9Xnjxge5P+FXbSITlhRIP767mGhCdnIN+kxKk2VfiXH
         sGj5FlT8XxsCgLElZ5Gqlr1ERWCqS7dyE2zBCWQUe0n1VhCNUKNxRKO+RTh5NxPB/Kz4
         6H1CNSraKNnYJVsvitXcitbAkbqJMuFEXSoqSatPP5FXvn8Ygtz8FNruecAr2ZN0l75X
         AU0603PAOYAcLLGcRILd5R0h7TXcTpdC3fwd/16YsRRhxK7ab1jNDtRasyJotj3uxsR2
         C3Gx3pk9cdCDQYVZez0jvdv6NpO13BmpvqEfT9AwHlQWYnBK5o5OidvLqFdgPxLUXkGT
         xqYA==
X-Gm-Message-State: AOAM530WXz6JEHfp7KxG1BXmnqQ5v/UcteOE7UOujplRGvvVkPmDMVZP
	t3PzNqODFo1sEgsupKTPYvDUZGPa2K0=
X-Google-Smtp-Source: 
 ABdhPJxdlVutILEyufF9OXKHyJecc3Q/MuMSOj2QNAC1kcRjWnLCgQJGGT9HeI5ls5Ti4uORAm90Qg==
X-Received: by 2002:a17:902:bb83:b0:161:fdc3:3b8f with SMTP id
 m3-20020a170902bb8300b00161fdc33b8fmr11351666pls.45.1654283969185;
        Fri, 03 Jun 2022 12:19:29 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/20] php: upgrade 8.1.4 -> 8.1.5
Date: Fri,  3 Jun 2022 12:17:03 -0700
Message-Id: 
 <7566c789da7850a2a35d1a8aa0f3e0b721e2cb1d.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97393

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 412638c21b09ecc6dbe4bd480fbc8a0a83d05da5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.4.bb b/meta-oe/recipes-devtools/php/php_8.1.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.4.bb
rename to meta-oe/recipes-devtools/php/php_8.1.5.bb
index bf6c543097..e3af9f6984 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.5.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b3f688cb69758523838b8e7f509aaef0152133d9b84a84a0b7cf68eeafc1df76"
+SRC_URI[sha256sum] = "827de56771c3ab8313a069812f15f6ec49989d510aebd0dce180839c6d8d6ff3"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


