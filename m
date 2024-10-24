Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0AED10397
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.6193.1729801149212267834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nhLxQXMG;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5e5c43497so11982377b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801148; x=1730405948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBfDDQkCDIShXW8BSAcvOZVBnAJmYJjrfPbqR28Wtpw=;
        b=nhLxQXMG7NksWQrU4GNSYJtBPofkML3nnkFsx0Tmj3i0qaaVWYPzfBkYf10US3OBVR
         m3jo+yTsBswj/dqFIpaCI/gOR7Zh1qjTBGd89onwlVwTDEuRgLtrjLhgkYNyHh+WQ0tG
         AWLM05ZZ7i4JMRSariQ/eeI/win4NzZaUhm7rTAQ3WzlXkE7yEGvqENRYbFzlWLc56ZT
         RfEPTKEvuiO2WoyUjC8KPytH1zQSn0kd0u+iNMgwwmFwnqMYxVAo/hsTMgGVPxRtGx30
         rc1fG+/QjJjWcbWcn/QDd3JCoJ+o/UvTBk2u1jIue9zAs6UYExRHmOVF7gdc2qvLPSD+
         MZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801148; x=1730405948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBfDDQkCDIShXW8BSAcvOZVBnAJmYJjrfPbqR28Wtpw=;
        b=c4pf9L+jCcup72KurM41LyMVM+ldB138O1Lzg+9hG2UWCJXLvHWwv2J31yxXVk/WVI
         xFP7YAGU9z8jvF6RZOfj5vhzV3N9EQDI10bS14kS5iQ4MoMD8R8XgR/63Ccaztogk5WI
         mL5qXz0rV3XGM7Lc0IRbIXFbnSkgVrGFm/I4ytSRKy60yjkrq6lTcPCpHBidIZuWfPds
         2OWw6M1nVepoZppKDMmRYRI3pqRNWAx58aQtBSVna2qmEAVaZav4Pgpu2vnxRY4jDxBC
         SC/vicB/h4ZP2+uUHLgytYm1yZhnVzQW5QjaXFnmUjbr+6aLyhswg61TcpQ1r5p+7C+S
         CaQg==
X-Gm-Message-State: AOJu0YwjkhHpKRRoDqCZ6+jsR7Xzr1punc/9l6SRKsaHE2PVVDMtA4Q6
	QaR6gqMLs/Mb2TsZnitGxo6z6ue5sXRLLyGv0DKT9HyrVnWEuk84yj8m4w==
X-Google-Smtp-Source: AGHT+IH0EslDyjl5RGarT/64bxQk86wORghOs+f2gydnPpDT1MbGZ7rjHXyp1iv51Tbn6vImsdbkBQ==
X-Received: by 2002:a05:690c:6d07:b0:6dd:d894:bc40 with SMTP id 00721157ae682-6e7f0e7355bmr91165337b3.26.1729801147795;
        Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 23/42] liblocale-gettext-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:42 -0400
Message-ID: <20241024201806.440273-24-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113201

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index 654fd2eed..9774ac55d 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -4,7 +4,7 @@ functions for retrieving message strings from databases constructed to \
 internationalize software."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~pvandry/Locale-gettext-${PV}/"
+HOMEPAGE = "https://metacpan.org/pod/Locale::gettext"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
-- 
2.43.0


