Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3579CCAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.10162.1758189218147109910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJPONKKC;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso1066008a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189216; x=1758794016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rj242vi7Wxvf5bDrkLPbvlYs1D1ppoXBQHAcgHG7Ru4=;
        b=KJPONKKCuKeKDYsrEfL/Wr9QSzHVTDotG4wzSxDWEDFAFYhS9j0xrZdiQDlTU8ivpm
         5GYhScAe+IPVgVaZ6LwYhRf749yADorWAmTTaMWkdx18nvJYjCYsxmjm0JsABuc9fCLN
         bRU29uPJkOb9ecP8MwWLPYl+nbOksFGk+/n0zbm6ht0OTai4nTHkA5BhtyRvUCmGoSmo
         oz6EYUdgd5vJV0lWeB9u/0jNs5vy9h7US+RovN7llVwd78vAwNuTPRm8sPkgI0R0taRp
         84AMgScBJNM4w8qzU0dZvXQSWeer+idn3p+yvRvnTwHLL+Iu3G+Rbvd++Kb4sLk39n0K
         /kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189216; x=1758794016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj242vi7Wxvf5bDrkLPbvlYs1D1ppoXBQHAcgHG7Ru4=;
        b=kZXFzYEpElRD1ig7QasM5C5Bhtp41IlZvbYhKFp3SAzYsisUKw1bhAB7JkfgEyTeWl
         VpMsWjICf047jl2dCQKwqOe59ATmFjCrbobJPZWtfEvS7RdMMrohvIaPCTBQiw1+HPcC
         62DnP4UvB1GwWCIWzKQyy5YdmCWp5OzOLu2LHOQbQ+WkBe+RSG+PV97qqAFupDdIyxi5
         fscSY6pZsKw9c6vbtkujl02J7c+9TiGqfnuBnmAnypdTfV44+IPmzolZXuuiTCbqLuKv
         BhAKbem6dIqY6hhT15ns2j24l5cQ2l2eQa3fn/wFsH3DZ4M611a3sWT3tA1OfbO13Vie
         ND2Q==
X-Gm-Message-State: AOJu0YxHhKpk1gtH//+wrt0Mjdu+atE7C49YRTmAteJAjOk4Qq10TeXm
	GFLV+EJVYhv7Keq3RYF0ZGlnT7zIMJ16RVWiIgx35H/bDbAWW6uQEraXXrSCfw==
X-Gm-Gg: ASbGnctb7D/2sziB7IsZPrNZU3N9DCZaBOnp3dlaHbXZRnp3nd9LCOosZbe+9FMupz5
	GIdp9h5bAIss42Vn9co90iTf5Dl2MpOrFhbrYfR5Cv3n7dbWP6vqBX7BQl/v0cvQOGyuMY84BJk
	/4auveQ03gfy9yNQ5uQvDm8mrmtYxK2wpxDkCQLJw4VzW1ULE9EGCxrnt+D1p4V6et23vGmhtBQ
	Y4Q/Meh4lNk2Jaecr1tzYH8lOis533k+xK+vs3ayTd6P6q30k24MVjlzK4x2Er9xq7r9USJTcDL
	BeMc0HD4i4ajHTqmPPtC8T5dV1L/p6aSbxXt+UrP2MEj0kQhlABDPzHUljdAWKU8PCtD4QVsNrc
	wDW3E7zm7amWd/3aRKN9XQlEHlSIi3keJtpDob5Y=
X-Google-Smtp-Source: AGHT+IFCHSOisDqT1C0LHSDEkrvJj3JyyaR9G4fUC6MGV5zhIxZ9KfdROSpS+fJi+DZbWFsps7K6eg==
X-Received: by 2002:a05:6402:2114:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62f83a06d41mr5477761a12.1.1758189216386;
        Thu, 18 Sep 2025 02:53:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/10] cukinia: upgrade 0.6.1 -> 0.6.2
Date: Thu, 18 Sep 2025 11:53:27 +0200
Message-ID: <20250918095332.3369767-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119546

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

Changes:
    cukinia: add /proc/cmdline parameter check
    cukinia: add test suite and class to csv
    cukinia: add kernel config check in boot partition
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit daf73e7279da15ad2c29d95f9a8f01658a81f5d5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-test/cukinia/{cukinia_0.6.1.bb => cukinia_0.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.6.1.bb => cukinia_0.6.2.bb} (92%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
similarity index 92%
rename from meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index 9bd2301c85..7b6a7622f8 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
 
-SRCREV = "b074be54a1379ae1243ae1187f892aeb39b7c083"
+SRCREV = "a290f2dbb813ce12ba407962655a5d8b57322221"
 
 S = "${WORKDIR}/git"
 

