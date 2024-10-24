Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22783D1036C
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:35 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.6096.1729801161438478708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPuOEZ30;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29327636f3so1577140276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801160; x=1730405960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OOIiC2fEvuuE2LASMzufEROJOGG55HhM4fiXrU1QH4=;
        b=MPuOEZ30jQbU7LhfKza2P8LepuzX0ZRyyvbyh0FGu5mvsv4wvQEY3q5S1xZxqmPL0V
         gTS8WTc6jHRugeaRHp5j16T/OXpiZCQ4XSyIca0DgeFttak0kFZRYQ3RcNGofDimNLF3
         9Mx+kGpR8oJdljORK3DEX7Z64cMSv9lyAOR5dzUa6jKCTAs5Lr8AKnn8XheUI9zlLWK6
         7LjMBtNNgYyIp37SvUONn1lrU5QghGyBcL58OuBQlDhcdIwhstjZRmTScCV2R1J9677O
         M/ZV38yhGd7f2l7k8oRdgc43PhtruGOWPExwTWcMotIm3GaKBfkM9lC1B3BnQQ1zne2y
         6T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801160; x=1730405960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OOIiC2fEvuuE2LASMzufEROJOGG55HhM4fiXrU1QH4=;
        b=ZGDYJc4fUDaZc5R3XtkSMjBoPlq9qRo679HJ3Jhzjm+1NhFaYrUihgOAjKudCvO7Un
         KLcTm00oDCmhWjJI5boRPfmGcZ7aDypU3pXBuSgzNi77D+vLIYYkLiVZuJLtoR/8+pnv
         esns7ObNJzgmbwydUYCTXk4WDCzH7CMBnkxH6TpLaiEjNShnYssgQcnOI0DGLzznZJVc
         fRr03FEHROhrMadffz4vi6ldrzbPH7w/HCFoUmSoEZwRgWfyKXBeEp6DYcP2ulexY3jz
         2nhLrbuBeL70cMHxfaJ5enaaxZrP2OiHNlatUXqke1PFZLhzQGm67920ohLA8FP28EbS
         4zPw==
X-Gm-Message-State: AOJu0Yx2GbLpRO4TAu13+Wgvd6DP4nAU/dghkWtOQaXoCIx6mhXpAfZf
	3TfloJUnhKEJK+bffGH0ql8HgV7oHkHLKyl6te7qX3OaKxi7KQuP8aMdTg==
X-Google-Smtp-Source: AGHT+IGT5QIuUy/aOPfmbyO6aCfMGNCxLS/fcrI7xF6K0+x+WUHql7+5Scdxwk2/EMQDipNkhoBp6Q==
X-Received: by 2002:a05:690c:445:b0:6e3:2361:df8c with SMTP id 00721157ae682-6e7f0fda974mr90884337b3.42.1729801159997;
        Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 40/42] libxml-filter-buffertext-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:59 -0400
Message-ID: <20241024201806.440273-41-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113218

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 2261dafbb..1c3dc7d50 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -8,11 +8,11 @@ of putting all characters into a single event. \
 "
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
+HOMEPAGE = "https://metacpan.org/dist/XML-Filter-BufferText"
 DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
 
 LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
-- 
2.43.0


