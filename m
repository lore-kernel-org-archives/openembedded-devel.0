Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7E2CCFA11
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.21777.1729612084725370707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AbBemdKi;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28833f1c31so5574051276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612084; x=1730216884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wReauL6M/oAW51WbGgyQ8rUqgerP4+SJUpQYmZGAE44=;
        b=AbBemdKiQHbBMLulsj7skYucsCeGT6Rk83HIGKtuG3Zm+DvD1WQ2v7E4YdwMOgPXlg
         FH5JTw+D0QjTJ2a6SGPZoSk4p/pS3lPBMSuwqC23vcxt/ShafUdglrk+gZVCzIIx1VMf
         eFyz02OUJdFX00fd+UDo7AXKvy+JV0UrNGD1y1WrN+qeUKQ0QYsi8fvjWrbfwp22j0rY
         7V8A1bS+LzQq0A/B51IR74TK6+4m2ubNiyJb1BDLY2uWG7ZxXca0wxsznlyEo27qfTFn
         l0v7h6YzhiHkkTvFQ99S3pwc0IIoqqKGfYzXU1WSdb4i8xJgW8gs9mOxq+Zz1Arh4uWG
         KuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612084; x=1730216884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wReauL6M/oAW51WbGgyQ8rUqgerP4+SJUpQYmZGAE44=;
        b=JwTv4uzwBvlU4gThFydUWg6mHY62GGRleGHqkeIeuHE1f2ckZ2hIzYwSVzhMwhzP/R
         pIOCuWNMTzSjm9TKZjm3qVDTgPqbpeObbpfb/SaqPj9WTitbwTfRHPgqrtqJjoLEGGoe
         /6SXrDOotlLQnfN8y9IVAk44T9+yQN7zBwD7obIu4RwpBQrd/oKv+oOCkudHTXpNyQF0
         GM8JeWcDtyh3ibMKtK9Uv3UvXXGpIkjH9NcBBOsm2sZH02sAVtrYuClFV/SRCO5E87F4
         /rgmGG++ie6hw2AYGkrAFVR7jU/IU7Z1BFt1UBnQEhwlQNK/DSy2nZfWpBCpYBh9UXO/
         2wzg==
X-Gm-Message-State: AOJu0Yz6nr8OSgCvj1jPaUH5xG44fS2tAbbB5nMRML6L1FoN0318BCCa
	2Qv0f7HRCfy7dkw90zAvU7lUcScCtEppbUT7mxPfplnBRqwjTj1q5lDQiw==
X-Google-Smtp-Source: AGHT+IEV1JxzmpdV2oRzKB5xLWvNCHISuwlxIP0181rOdmaXNUnd5DCxJseC06zXJ21nZPzp9GhoqA==
X-Received: by 2002:a05:690c:7445:b0:6e3:1d8c:1224 with SMTP id 00721157ae682-6e7d49459f8mr28701557b3.20.1729612083318;
        Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 14/46] libextutils-config-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:32 -0400
Message-ID: <20241022154729.20331-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113105

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index a58d96582..0f43c537c 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -8,7 +8,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
-SRC_URI[md5sum] = "565a7b09c7cac5907a25bbe2c959a717"
 SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c"
 
 S = "${WORKDIR}/ExtUtils-Config-${PV}"
-- 
2.43.0


