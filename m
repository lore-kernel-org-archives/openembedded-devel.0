Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D9BCAC5A8
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.17306.1758290378420612064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQjpQWj0;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b046f6fb230so408341566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290377; x=1758895177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvSg5eO+i57QwT/+lAwbq0ViOees8Sjy6Yjn7fahYe4=;
        b=VQjpQWj0+2AJhf0LlEvPqsYB8ImuGRj2ZxiFC9ZF0pLMVlkUJJWGQpFOlRJ5DjaDHj
         ESCMNkLcDx6e+seas4xYycJc7pZLulGXjgJIrp1bvkQfrOepfmEdIX1RN29Waqbr41hd
         qe9KycXle47NmpJmhBeLZhbdCvYcWvDez8sMSVFU4MpMQUzF5WZa+JYJ7reVLOhCQbZv
         EMLABh2zG7mX/fR61L5jvM4BEvQcarXAIZRSOZnglYlkfWsL6qbR87e+okoczkS8/xU/
         E9lDXohL/GIZ+Fa2UJNdDtqSLegim2Z2MjD/QyN0SQilnyzaRXKfATWGqEcFb4Ciirkv
         nn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290377; x=1758895177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvSg5eO+i57QwT/+lAwbq0ViOees8Sjy6Yjn7fahYe4=;
        b=u63cTHOce/z5MZtBYQ3SV/DnSluOIoc35SCtPZxp0M4VOrHcjzR0cxbAQV1/gRZFvJ
         w05Zi+bVNKQ8xh914+2PJ4jD60Dq9sDsk5BmExvHeKY+PeehP9EQPNjPyQ+TFNVgWWu7
         5WsneRVNk/fVfaKy0IbBkCz+Z5Lb7rbJio49EVFoe8Z0E736kLnEAj9LTRG3LEF0hmza
         r7FMLEDCGw5C+jt8nCgnLYYm3ziDRCWiusINxZRiQFAX9r/w9ArgNKkV2EL7S8I+7wWB
         vDobg8Eo9KbE+tLdBz3jnaWvmiGw2ezm+53OevTAaOcwN4UOZGMzhcQ2Ht3CpT45QAeV
         LD6A==
X-Gm-Message-State: AOJu0Yz/GLBkk+fV4AHm/sfwTTp3vtETR1ghxn182z/AB0e25d4njNVL
	j1oCdJuwp3qxyxvH7FAbg6E+pqV2NV1lDa/DpoB2a5e3/6iLtdVypeKeSS4gBA==
X-Gm-Gg: ASbGnctN3Cx2Wbv5OwXQVHpYiM8Vyq+ezXuyoDoQT9s9haLve5c8eUCZhwlKeeP1Y12
	9JZ2ov53uRef+vx7EAK+yQ0WSeJJKWyyRVDeCZ5OToLXr7QtMbVxwoxFovMZteZbpTZePuI3KDA
	id4SltUNHFYywRuimVpXLaB7cEzdhhxY9q1jKletxk03Z+36CVSM2Q6LQ56pvhlC5wBzFe2hkK+
	OOXecfhq0SKWgMYEshlioBUbGIlQNzwajbBv7DUVIw8yEKMAl8vEl0kt5YM18L77vNsMh+5iNAT
	sMI4EBk8EBxNM/p7iFdHuIj49LNt/DerhcPGIrImD7smda0Fg8hLl4N/06++tBFzokVMiEgp8Jp
	RHrF3htLpwukM3HR6rbd3
X-Google-Smtp-Source: AGHT+IEwQKeSQaYuNjwge2m+9U49PapXB6NrZgaNtEJZGSLAjciOSDx8+OIv2RM4OtlYM+0X0xepZQ==
X-Received: by 2002:a17:907:6d0b:b0:b07:ce0a:9e83 with SMTP id a640c23a62f3a-b1fab25334emr826305466b.19.1758290376579;
        Fri, 19 Sep 2025 06:59:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/9] ctapi-common: Point to working SRC_URI locations
Date: Fri, 19 Sep 2025 15:59:26 +0200
Message-ID: <20250919135933.916848-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119601

From: Khem Raj <raj.khem@gmail.com>

Drop md5sum checksum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7687cb73b26e09c566adecb4e5ac71a270800004)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/ctapi-common/ctapi-common_1.1-14.bb    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index 25d5b09e7f..b7a9d3e936 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,10 +4,9 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
-           http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
-SRC_URI[md5sum] = "5b7259ef1c8cd9ae801fca7a5cb548c1"
-SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
+SRC_URI = "https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.LICENSE \
+           https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.README"
+SRC_URI[sha256sum] = "0531a6db39271166f1e9060f81a0b2d47f878210dfb4f465c703fe205cc3a8ce"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE

