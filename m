Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E652BC77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 15:47:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.17033.1681400870106012145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 08:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=O9uXzc1W;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id z11-20020a17090abd8b00b0024721c47ceaso1723057pjr.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681400869; x=1683992869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgb8yChVfl7p31ImzvFJ8JVy7jxPulH/fOy8Tw9WG2E=;
        b=O9uXzc1Wy+2PaQgUypfy07J6D1bfEURUY7DWpsAc7RUkrLFlaCbVEmdoojMu8SkWMG
         rTZ87oPe0RCQsggYZ4fdZdZSU3Bi2inzYxjMxMx2hgevKK9YWslSntE3BCYmolP1KZlw
         nftgbIC+hIdBfogPId9uJrWORbPouGwgXq9pvyTemUVAUdLLoetqBhYpJJdBkuSn/kni
         +MauFWK0Sin+E1sYIOxE+jvtDpGaXKrrBSwYU3yp9anEw2UEF8qbF8jRCGbHXSSJwWpI
         ZzPMOv5KtsGYWq+6AbRMuTSssV94cKj38V657YvQVEYrdG7O8h/kWtuCbCmPNu8/8q98
         6wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681400869; x=1683992869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qgb8yChVfl7p31ImzvFJ8JVy7jxPulH/fOy8Tw9WG2E=;
        b=da5f7oZ4CuntPOUfr30iByc8q8C1Gof0TkqL2Z4/GoIs+3ZqMCzpKRkXZwASWTnmoT
         /losPyFoXdbxqdt4C7Zv0CHABu0kyGnQyVmfJwOo99qs/wCWhIKrX4txP7MP4THwfpQu
         YPYtRiolZ/ZV3DCP1u4N6Nt32mlTkLDqr5KOvizkfo/q7cfG6pJBAzzyHgJTujvSIVB8
         CLrWPTtV4TohqL1IDDEeqUyTNqm1bIqFJnCZ2X4QIzvALA+qSf3yCVmA0WSGLlVDsar3
         V1OB2AUPxRvUCKBwqh6toCcKoIRE+pISz8a90f3cXnHZx62mfSvsK+6ZKlYQRMVjTmJm
         eG6w==
X-Gm-Message-State: AAQBX9c7CO3DEz/X5M9hxZIHSBmNIurla2P1AeECxqIyQpEaT23VSVni
	AGXObpS7peUPOkpxer4o9OPhSEEUL1A=
X-Google-Smtp-Source: AKy350b76YPuIRJzNWzG+MAMeLOAbS8Gmn7x09g61ymjTX95Oar9r36Nb5LI+yXXAY8lJsFlC3VGiA==
X-Received: by 2002:a05:6a21:3283:b0:ec:885a:a056 with SMTP id yt3-20020a056a21328300b000ec885aa056mr1896785pzb.33.1681400868996;
        Thu, 13 Apr 2023 08:47:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id y3-20020a62b503000000b00625b9e625fdsm1583946pfe.179.2023.04.13.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 08:47:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] onig: Ignore .debug directories while finding ptests
Date: Thu, 13 Apr 2023 08:47:47 -0700
Message-Id: <20230413154747.2052138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 15:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102081

.debug directories maybe generated when building ptest images with
pkgs-dbg, these directories should be ignored in run-ptest script where
it tries to find test binaries to execute

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/onig/onig/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/onig/onig/run-ptest b/meta-oe/recipes-support/onig/onig/run-ptest
index 2574d7efa5..fbce336990 100755
--- a/meta-oe/recipes-support/onig/onig/run-ptest
+++ b/meta-oe/recipes-support/onig/onig/run-ptest
@@ -17,7 +17,7 @@ workdir=$(mktemp -d -t onig.ptest.XXXXXX)
 status="${workdir}/failed"
 touch "${status}"
 
-find tests/ -perm -111 -type f -exec sh -c '
+find tests/ -perm -111 -type f ! -path "tests/.debug/*" -exec sh -c '
     workdir="${1}"
     status="${2}"
     t="${3}"
-- 
2.40.0


