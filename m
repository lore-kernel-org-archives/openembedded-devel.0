Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861DBCAC5B9
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14121.1758625604335663355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnvCNg7d;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b30ead58e0cso63065866b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625603; x=1759230403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj6WmeTlA7eYaV8rom4+hs1bNJtlZ2B3z7dvAsRH/T4=;
        b=cnvCNg7ditU82+Qn24b9qH17mIXp1dleupCx/aKM33V+3iQV9i7tJPlvwbqhQFKapF
         vdnLTOfJtGmX7kRIpw8sGve2QH/OMTQFTapLJaQ0px4gmk7SgSjuuVYE0+kv8LQTspue
         YnaBGmsV45YL1CqXy/Scu9TVpSVZCG9upAdQ6d5H6Mf4NySkWs4sy03bzINi8OBpVeLO
         POQDEa0UhnKAz3/S55T2n5rsD6KnHm2M1uehGDuC3wKOwq2Ex7v/NijEUvNMhQXfaW7l
         U8dbz0SWeyZuX1gz/RDcXlRR6DWw+EIQwu1uHnJWURqzxkomL9JsKJr8Pk9svo10Am9N
         nE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625603; x=1759230403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fj6WmeTlA7eYaV8rom4+hs1bNJtlZ2B3z7dvAsRH/T4=;
        b=rczAlq9DZLuAF/kyUWjOD4X1D5tLqvhAHWuIn1BKYJytnPLmlCji+4PpJ1y4YWehlf
         GQS4J9ibKevwQDBul6vuRwIeLufYJOMNujCeCNjeBS84hGxj5ZwJ5aQVaazVZArgIGrk
         VpEM0gQpUEB1wB6FrI387SP02MkB2ggcqZh7dsmIvnDCRvWUk0oUQLCKGjJY3e1wfqX9
         qTbEoh9zz0lBcK5rWzW2awJ7iclUhCrp+o6AbEI28AtfhqubfJickxjwDvSEyauLOFcE
         i7XkCLP6u7/6ds1BvUvKnSTevzCqzCp/htAD1LMX2Va8vjSftPd+M0n4YXOtjxsosS0e
         UTuA==
X-Gm-Message-State: AOJu0YymGveaKPRL7+D6daBDCuWSf4ighu5I2b9/FFacIzGKselvyody
	pwQsQz+gXTfuniAYLNXFNnE/MkDG/7EylCxIAg4elyWOmnpKV/ddJLVsC2h52w==
X-Gm-Gg: ASbGncsQulo79qJYr6d4zmDvOTewmfKh0lZ2MUxhQzCYGs1bGmJhW4gHzXIuYqXgWLh
	7qQHeA3rQunPgLBo1FGyYlo7b9XTkEZ+2vpDmOgqJU+vyNH/Zfa80NXfFwIxdpk7htEcS8L9cZ6
	fwYhDiAhOU/7h8MesAeLe2wcCiynPeca0IflPRAHHB4bdIN9jHKTE4+ULqzP6ToVBEfx0BGSW1l
	xSFZPvIrySMEAdPHBcyb0V+kdfs2AWQ9qgQlG0rWQ1WeOZBIYNLZFGlr6cw7zQfXtKg9sK+gp7q
	OSXNbKZURvWWEKwiwN00bBVHqa5wx49+ivE2TE5fBMcHgafJk0Axgx/Sh7KJgJafxgfuoArG5xq
	cmhuI91T8Us4SlCwGVTTn
X-Google-Smtp-Source: AGHT+IEMG1XaRY1ghRzvMbJ/yBLEvTmAIcpy98Axfsgy1CzPCuvuNr/P5wHp80EjshqK/VABJeWDEw==
X-Received: by 2002:a17:907:72ce:b0:b04:aadd:b8d7 with SMTP id a640c23a62f3a-b30261c096bmr205946966b.13.1758625602658;
        Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/22] faenza-icon-theme: Switch to a valid download  location for SRC_URI
Date: Tue, 23 Sep 2025 13:06:22 +0200
Message-ID: <20250923110636.3413021-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119672

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d0e061bc72cd776aba847dac564af3c7e8384a5e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index 5ed3375eb0..12d344bff5 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -8,8 +8,7 @@ inherit allarch gtk-icon-cache
 
 S = "${WORKDIR}"
 
-SRC_URI = "http://faenza-icon-theme.googlecode.com/files/${BPN}_${PV}.zip"
-SRC_URI[md5sum] = "e9bd6106d13017ce06d24b586259ae9c"
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
 SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
 
 do_install() {

