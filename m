Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF2BD1036A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.6070.1729801141426943122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5acQmBy;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e290200a560so1497373276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801140; x=1730405940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjjWoX1Uug9wwTbTCDevPn1cCdCATPvASlBZVsncMTg=;
        b=A5acQmBykjyTFNJuesH4PxXV4UUvdTrjEk0Mdx9MjH8IJM60MVsJXKg+dPa19ZlFg7
         rlxIIgd111Xj8g+XVMfqZJ8R8dM7ks/5BmXQ0zMcPLzWi1ZlFYuu3aGksVYNWDaUScBx
         XpLaHndzOcXI+mex3RMyBWiU0ldYr+5d5dsoVGNwUzeR4j6C+GAruwc/DZf+mvo26frJ
         4urPUejcF7yCb5W/PIkF5srVfCeOlDTimSV+tOUJKKIbIeHpp82iRu3ykwdJqOs+OmYZ
         CIWrdbd59w7aTikuPdaafUUNFDQCqLyZ+HPikK2WEndsXtS/tvt2mmOPaYHOlprJ1Mj/
         mVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801140; x=1730405940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjjWoX1Uug9wwTbTCDevPn1cCdCATPvASlBZVsncMTg=;
        b=mbaSokeSS1aC3uIBAOzm/knftZYE1M/ARDcYEHv6Cp1COjg6dRzuwniH95L+gN5RLu
         2Pw/QdEzbTsaxSCoVXlbl7sZ8yy/EV3EKo4h2/mC+/J9b6t0oscRJHTUwHTyTajenNJn
         J5DhQ6T/a7puT5sBo5W6SGLMD1fAu39QY45ujzQhJ7wiJzGE1ZRcQfRx2mQFG298AabQ
         tK746bK9QHvhQ6eC0TPg5wYP0HBGpYQDBYrNkV8aQ0HHhMvgSMPDOLsXJWVY9PJoNTVv
         UFZmsZQwwCA4yE3G/OJz6MI0clNRqA2+B4JsuwbnBGCqjRGnfJr3ohUM2oMiZcAMK+OO
         S11g==
X-Gm-Message-State: AOJu0YwaZwy31wE+Fr3wmHvU7d4UyPn8/p9gtrL04Kl38re15DTkaYvB
	CNidlvmioHIuz9XGK6P0ylqbHpZK4AtRUnTG2TfEtp8gUywTwdKmUIVaNg==
X-Google-Smtp-Source: AGHT+IEJzGJjqcy+GUPyW8Q+ASOIGx7Uc0NtAwhxdptzHPDdZamqTLoVcfwVgralhDUy3G0ZpsS86g==
X-Received: by 2002:a05:690c:6e01:b0:685:3ca1:b9d8 with SMTP id 00721157ae682-6e7f0fa6de4mr83970487b3.30.1729801140119;
        Thu, 24 Oct 2024 13:19:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:59 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 11/42] libenv-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:30 -0400
Message-ID: <20241024201806.440273-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113189

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index fd34c6d12..8e3b3dc2d 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Perl maintains environment variables in a special hash named %ENV
 For when this access method is inconvenient, the Perl module Env allows environment \
 variables to be treated as scalar or array variables."
 
-HOMEPAGE = "http://search.cpan.org/~flora/Env/"
+HOMEPAGE = "https://metacpan.org/dist/Env/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
 
-- 
2.43.0


