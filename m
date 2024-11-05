Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B368D35E33
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.27739.1730831907255527624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPHJQV3D;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea50585bf2so61215617b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831906; x=1731436706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+R4V8F4hJ6hDh6T0FqbT9kvdzb2swKEA+E0iJFOK/Q=;
        b=EPHJQV3DxCUxpGliI24PYZwey7evUBa+bA1d8yUuXEXyoMcW+usotJrpNzYemLRF2G
         tEb3TZe9Z5l/IbqkJ//8y8eG8Mb8y0pdSZ4JkaFy3KoKQL3umFNqBKQcUd3emTbPRLCv
         YmiVvfQhdmE5dqe20z9SqDDBHAKfk/GpuwhywftYPGTUGRly6xzNDUeR8lCirIcgPsv3
         6gQ5Iv0S4BJ1LjEzC2BbUk5nEOwiNI4fNk7TMky0KD6PMqvbaWLsD1ZVGu2WJJoAISi7
         r6t9Q4wcw/Nw+jMaWNwWZZ8IbByMdqr6UxR1A55ZGGvGapHKCc4afci+7o99dhqKalTv
         aFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831906; x=1731436706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+R4V8F4hJ6hDh6T0FqbT9kvdzb2swKEA+E0iJFOK/Q=;
        b=QuRShUzZQxBAPMLmMCIyVQKnW0xRAgQQv9ZeV1h7Vhds3jYlBjHQ3EkaWbA69apLP5
         VpPDnQPJfKxyyMk/EnBTIbJlki1pb+j6yMPK2sPr0g6vQEMTp7yO+SQh0oZO548g+mmP
         x1xQSX+MgSOrudFpQSnxGeccbIcbIkXo2U4GfX11dPB+uojxsF3KG7mqWietyziVR5gT
         q3nR0N55fGKRwzYVxwNqtgTkPsxzak6l6XtpGG79Tws7FutYvN1kFSlukc00XttQmjG3
         ntMpd24uHIVgACgJUhvpMY0fQEJUJYByOGXNmhFGXEdNVRFnnSEHMgBj3KcM9K80wo2v
         46gg==
X-Gm-Message-State: AOJu0YzVSyVzU3r2gLntSaZZp2yY96jViMGWA1dsEETCDgGu17LM58Vf
	mhzsLBxRQVaRuFNJs0bpJoKwNzcceJTqGjNpMJuZqSXGBmE9po3G88YLkzAM
X-Google-Smtp-Source: AGHT+IE9x6jP5S7SC7okZT9zq7cg89/DzB64+gj1Dojx1MO3p8TNQb72pFuTh9+4UYcvDwX3xVOhdg==
X-Received: by 2002:a05:690c:7013:b0:6e3:34b9:961d with SMTP id 00721157ae682-6ea64c2ed0bmr168505457b3.38.1730831905893;
        Tue, 05 Nov 2024 10:38:25 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:25 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 035/161] libparse-yapp-perl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:11 -0500
Message-ID: <20241105183658.34982-37-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113550

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
index be9704a31..b77a5c95a 100644
--- a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://lib/Parse/Yapp.pm;beginline=508;endline=521;md5=41a45
 
 SRC_URI = "https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "69584d5b0f0304bb2a23cffcd982c5de"
 SRC_URI[sha256sum] = "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5"
 
 S = "${WORKDIR}/Parse-Yapp-${PV}"
-- 
2.43.0


