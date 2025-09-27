Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5BBCAC5BB
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 03:44:35 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.5326.1758944670981788572
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 20:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxHe3uxa;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d6083cc69so33888237b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 20:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758944670; x=1759549470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CaT96DCLB7cXcsytHuGlBkmtoABcju5oa7XZiTJIjKQ=;
        b=JxHe3uxaVxwwoh+97+EGIzVwLQpPSxtZSzCw8KgKZWoqPMvdXCxOVxAvf7QvzlNwlv
         FbeaDOZNE1wco3ceeCqyOJrFziFjfXsPJZ6oQlBBETO8ZOulNhag5RHY5kFmVIusaS1x
         Xf2swL+Q26mPg55172w0eByYBw/4fiIpxKcCKiHwYt1yl+IexE5FSLPd8BcNI8poPsQa
         V8B8IcWxWt76aPBKPcPhYlX6FJ5mI+u//vGXVgmdV2Q5byOmp2bREXyb0bWf2JNaFnDb
         Cq+SJwtMketFkUvRBPdzyqhCzHhR6/vVaqOKJHF6+jbpLkie/qrheJJ6UX7Q7obzjUYr
         7McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758944670; x=1759549470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaT96DCLB7cXcsytHuGlBkmtoABcju5oa7XZiTJIjKQ=;
        b=Oz/ADW1fJnbLtC3duOQFEMqM93KweyDtQpO8nE+Xpn8Ec6//jNuonGUf7q4axl99/x
         bohJibqCb9xDRfCfdEp/0xZ9KURsDWvLsni0Obxz3a6TeO8swQ9WJeMTEqwkzStcOUAi
         921qGvgkpfel9O6SFF0NLtPeq0M+Mv+ZjVIPAieZVfPjfdtt2bhHGw7Uw5Jp04ciGpfX
         APSHGuPbY7RDqfuT608ofxIbCwzuYZwvjbgBrq2nEms6vRDBMfncpoJkNutYepB/9wRx
         qM2To74U/1oxZlmfYKgcrVQEjTq3c5tGFvJhwXPQv9PdfB/2XI48kmYP07cQLhD4/b3J
         /O1A==
X-Gm-Message-State: AOJu0YxzOJaM56BveygvqasK+7P1AdnZQznaF7huC7ghAyegyRxjlko1
	rTYYyvnlf+bp6tiSSJ6uF00iUJ3/ufBN6gqU5Jnpj5Zuok1uZdsNXVeqt6PqWcJc
X-Gm-Gg: ASbGncsUPBLaRb4NY592qQm0Ajdcclj21CngukqWy/H+ojRR/5MaA805Kt/TcAumvas
	rW/e3722w18CgotcqHx5tkt6R+ZBikGn3s5ChOjcQieGC+N2D0tMGNV4JzR9cPBb9T+GicvC3qE
	OXPON9IquJmIZI5Xs1dNtfjgebghCZyLXb1J3gTUCP46/1OpJuB/4WgBXGknTILnlBh58Nf+6jQ
	WuRhOYEu6GLAiVYY6z7hwxb2oCUQx1b0cMavMQhPtuCT4Y7Vv8CL2NPPn790RU+TsIzEunfovAI
	D80ZFT7NPhW3AvlHSenEGehKTYbeNJbIPJsf/4gSdb+7cHeLO+TisSkXD/UPBkILFalaLgnyjmx
	mrTQKr7g62ruSe9T7GlpLDU3gNHBK
X-Google-Smtp-Source: AGHT+IG3OuKpDIKDlo9pUVA7UVpU/158sqSAIL6mKxWTorDAPjbKXdDNZbO6ftsnTu7E0qTBhJwhvg==
X-Received: by 2002:a05:690c:a0a2:20b0:773:26bc:4ee6 with SMTP id 00721157ae682-77326bc7d70mr9610637b3.3.1758944669579;
        Fri, 26 Sep 2025 20:44:29 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765c62a0261sm14393767b3.39.2025.09.26.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 20:44:29 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] gsoap: upgrade 2.8.134 -> 2.8.135
Date: Fri, 26 Sep 2025 23:44:20 -0400
Message-ID: <20250927034420.13089-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 03:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119950

License-Change: update copywrite from 2015 to 2024.

from the changelog.md file :

  Version 2.8.135 (07/01/2024)
  ---
  - Updated `soap::http_extra_header` optional user-defined custom HTTP header string to
    permit multiple HTTP headers in the specified string separated by newlines, the
    specified headers are checked by the engine to conform to HTTP header formats.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../gsoap/{gsoap_2.8.134.bb => gsoap_2.8.135.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.134.bb => gsoap_2.8.135.bb} (88%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
similarity index 88%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
index 0956eb121c..8ce4f17075 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language bindin
 for the development of SOAP Web Services and clients."
 SECTION = "devel"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "63478e555c0ccde0164f055ff605b02805db0abc6712a04bcb14cb617b047218"
+SRC_URI[sha256sum] = "b11757e405d55d4674dfbf88c4fa6d7e24155cf64ed8ed578ccad2f2b555e98d"
 
 inherit autotools
 
-- 
2.43.0


