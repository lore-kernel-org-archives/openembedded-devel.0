Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AC5D10370
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.6178.1729801135553312408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FbyoQthY;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e33c65d104so12590897b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801134; x=1730405934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Naxzd5CHOWE+dWfePXOgSnb4YuM+mjTEkY7zsl6DN3I=;
        b=FbyoQthY9ZArpiVZ6Dj7csQG3kfmhikMnFd5GfNqW8YDJYio2RpbCL+pFEwkf/7jMI
         PuH/Qg+vwrJDI/6nUdoN0gWi6yDjtSiWMtfvM43IL5uTh+KlkwjzhShb8653d5ELo52/
         mM3jvi+u4O8BLXnQLEgS3ehEwClJjW1TkPFkhIZfKHxDdZ4qc9zNkB32M7F9EPVZoTx9
         6AjVsdnVS200/+FSLogA0WJ1mZl2sOpjT3WpzS6t9nAaXcBcizXuUtH9lMmJ3LjKkT96
         ppyMy1mzRff4Zg2OAeaSZmI7ITO9WvrmHUAl8e/mRVPc3OOF8aWYuNbRX/x5r3kElpWZ
         cmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801134; x=1730405934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Naxzd5CHOWE+dWfePXOgSnb4YuM+mjTEkY7zsl6DN3I=;
        b=oRebNlx+QjlqSI0MNocvIuWIXmY/XjK/GDubq/zvC0tPZ1UYq1WI5k8tkaPMuTKd/4
         r4Iye5OEVxfKwwGxcQ/fyZ2PUXxLp1R6FxMDqZ4Mq1/ywaT+52KGBQwtqLgCQMoaoooF
         aMtlj2gAmbUJ8vFZPhJ8CFeEUmL1S2J855dDOGXXidzrwKKsFZ++F7IGUVJJsA8PZoDn
         91Fb/kTVXTP7ANyKNdYmr85uUiB8/UiTVHTmjTFPKQLzMuWLJssp2BhVFV0HahiYWqW9
         VxHRe+TcrgL2vyHrzEAzr6GuXla7Dz0iihBlFSbqEt8iRDPF2ow3LBM73/maJgOr0O3g
         kjwg==
X-Gm-Message-State: AOJu0YzPep2+qhXJwD8iF6gPs3ttO6auQWWb58OS3RQ0/TNHjpn2lY4j
	ckccaXkkJ3cwZCWPp51sJU0R3+JREjJCoMMU/aFw+cLPzv2jl82d2yN1rg==
X-Google-Smtp-Source: AGHT+IFGdZmWfOZKvSfbMhTlTBf3uyIPEXcuIPnoAAQvYz76Zn+Wjjta7jnwyozgaqG6S4k83QuVqw==
X-Received: by 2002:a05:690c:60c6:b0:6e7:fb87:7097 with SMTP id 00721157ae682-6e85814d48dmr41039327b3.8.1729801134237;
        Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 03/42] libauthen-radius-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:22 -0400
Message-ID: <20241024201806.440273-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113181

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libauthen/libauthen-radius-perl_0.22.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index 4a7b576a2..79a371d2c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The Authen::Radius module provides a simple class that \
     Radius server. \
 "
 
-HOMEPAGE = "http://search.cpan.org/~manowar/RadiusPerl"
+HOMEPAGE = "https://metacpan.org/release/MANOWAR/RadiusPerl"
 SECTION = "libs"
 
 LICENSE = "Artistic-2.0"
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78ab6ea0cba1f1ec1680ebb149e3bc11"
 
 DEPENDS = "perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
            file://test.pl-adjust-for-ptest.patch \
            file://run-ptest \
 "
-- 
2.43.0


