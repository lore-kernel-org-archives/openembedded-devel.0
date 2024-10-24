Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABEDD10360
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.6069.1729801140529666136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUbuh+xa;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2972abc807so1511471276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801139; x=1730405939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p53T6295F7XREcjWQqwaIVh04xEHwBIOrHAd01rDqM=;
        b=VUbuh+xaTXL5ra3s733y/Kl9MQaYbVhxpm05xo1aSQTq6c1SsL273Tx+LPgdyJggNp
         tSLH9+NAaErTzA7bGQobtoX3vAyKJoXg3pKwLP5csIYZJapRsA1wfTQwCUWu7AwkZwHR
         6Ca2fJlH2V/YOAnJA0LDpK7xc+d+xgXsJt04vKv+QBL1RrumRUZqMUZelcGcS1olv50t
         k2K7EJD4FuIYl74+0qbaeFPwPDSoFLU+sB0/2uJ6Tetj7e+JayRMsSRNJ+cQmFor55VZ
         BKRJNbNpIP9CBw1Z5F2YuXnZmtYKHBUTbYw9VnW3/GgkJ2Rui2/jvPcQxIYI7fvicj68
         hOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801139; x=1730405939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p53T6295F7XREcjWQqwaIVh04xEHwBIOrHAd01rDqM=;
        b=HpE1eAK9PdtU/cUCFpEZWUXG/HyjFXQ6sqiPS9VfTpam3SRMGDklmYWCROHoHofjqs
         YF8yoQ5rQm98YgF+ph7vLBJSt3qCpHuFB1tvC04uXfdf9/ZDJr2qs8iuCEt1765IzHxE
         E31rLi55TfyKGT0Rj8JCUl13p6KwXqHPu90toY404Sf4Xi0l6tEVOkw6LghRdyYtbOOw
         cxMLzMQa3uslWMMaxEykzD/9p/Q8OOgU20ojX37GFJ/gAKhDdI8V4U02q2JQwr0U3Gno
         ESB17tpklCnMMNQNkFZcUXXd7wR6siCRu+fWRkc3kXyZ/7gLtOOCoOm/MZZA13KbyucU
         0lqw==
X-Gm-Message-State: AOJu0YyqF8O9iCDp3+s2qYHbCVjAN5qbuEdRqCZ3IYaDkfHVI4F7DUge
	3E5FBXmlT6SdnFEJ+XTacBwLXk+4eJRnhT2ZwdkDHcU1z9H9yAtwIT5htg==
X-Google-Smtp-Source: AGHT+IHyQGXpuK1wEj7vKRBeLsX6riuYD8AIUOAhjRafmGdVqTfCztk8vZtUaOQ/8vZzilMulfubwQ==
X-Received: by 2002:a05:690c:4881:b0:6e3:da91:3e16 with SMTP id 00721157ae682-6e858183348mr39769017b3.22.1729801138986;
        Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 10/42] libdigest-sha1-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:29 -0400
Message-ID: <20241024201806.440273-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113188

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 4aa37243a..22c6d3d33 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Perl interface to the SHA-1 algorithm "
 DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
-HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
+HOMEPAGE = "https://metacpan.org/pod/Digest::SHA1"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
-- 
2.43.0


