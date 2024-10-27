Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F6DD13583
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:15 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.30519.1730039166791546906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y9GYTsil;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e314136467so31498037b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039166; x=1730643966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YS1TkGdSYSsVW5Y4Onrm1OD6guISNOXb23w1sc28Kk=;
        b=Y9GYTsilAfrNJqNp4fp7KSeFN9tNDWziTmBlCUgMT5yKovGE3gmP5vbCHodjYOxuOy
         JM83J8nGZOETDOYSxMVUGWYwvQhQVH7z4WUoDm6AceC9qHToOXB3rhfuYhV6PhtqnMKX
         7AMxncdpUFg+z2/oM4x1CJhv/JkSbFQYj4Ul9GBFGanNjQfKUKwezZ4bT12aiBiP1j6e
         pitSycnR8j2hHLhCJ428f00wZYU2KtRXWxVwooqYN1nYZ4+VnHo4Uqq2c7fwJn7BoQz+
         UWOqQ1JPBiZpVja0pE/JVakTn+BnVjUb4HYHBn2EYDWHeIrDkRQT8Kl/3n46NO0PGTb1
         lZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039166; x=1730643966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YS1TkGdSYSsVW5Y4Onrm1OD6guISNOXb23w1sc28Kk=;
        b=mylESGj9IRp8DgiOQMwct2yJjGsEMxFNZQu6G2TPT1gEdPNGyoSb7jJhC9SVUVnOZt
         mjZT2e5ZpAuC0F4fyHSvL+4VicbRYeyPZ6bNNv1VRdme5dodRGcCsK01VhkOqV8ucYt2
         3tp3UFXHpcpbtj8NtXSaQJ2iJODrhmvQs5gb2hl2JyJqypPn840VCsISKCJAXlKYFF3x
         EZlD0ZjlcZ2Iy3Uweo9FfjfABKC4uOZfjpFT5uES5EYnDO2TZRqOexlkpmcXCdC2kk4d
         s0kHg6duz3FpXNVnjlfcewWdwxT/PFyKYcHasuEXyoJjMI86o99rZgUoP5OG5rvXwdgq
         nUpg==
X-Gm-Message-State: AOJu0Yw5oLRY9HvGT7rBsxDlU9X6FvTRZzgnma27GwV314dZNQEpLkbU
	m1T5ycQUmmjAG5g6bMkG+OiBO9S7Wi5xNCWCHqMzIvbpVqzVLyNoaR7l/A==
X-Google-Smtp-Source: AGHT+IFBukF0dlTVIibVcpwjEoIHr6e2kLmZ0a3SXVe1OLfJlYJDJinbgKwOpoSRHji5VNzQBa7mQA==
X-Received: by 2002:a05:690c:9a8f:b0:664:74cd:5548 with SMTP id 00721157ae682-6e842f8ba34mr92411257b3.1.1730039165386;
        Sun, 27 Oct 2024 07:26:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/6] libauthen-sasl-perl: upgrade 2.16 -> 2.1700
Date: Sun, 27 Oct 2024 10:20:52 -0400
Message-ID: <20241027142547.261248-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113246

Change from www.cpan.org to cpan.metacpan.org use the CPAN_MIRROR variable
defined in the global mirrors.bbclass

Changelog:
https://metacpan.org/release/EHUELS/Authen-SASL-2.1700/source/Changes

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...authen-sasl-perl_2.16.bb => libauthen-sasl-perl_2.1700.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.16.bb => libauthen-sasl-perl_2.1700.bb} (81%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb
similarity index 81%
rename from meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb
index ee373c53a..f0913c5b5 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=171
 DEPENDS = "perl"
 RDEPENDS:${PN} = "libdigest-hmac-perl"
 
-SRC_URI = "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09"
+SRC_URI[sha256sum] = "b86d5a576b8d387aee24f39f47a54afd14bb66b09003db5065001f1de03a8ece"
 
 S = "${WORKDIR}/Authen-SASL-${PV}"
 
-- 
2.43.0


