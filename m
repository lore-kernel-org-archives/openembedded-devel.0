Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0990D1036F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.6079.1729801146558133237
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aOOavegn;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so13663427b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801145; x=1730405945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKO+qkwSP79cOBNc5LhGFwEWbvlj3s6u2Rlm128unxY=;
        b=aOOavegnuZM8OURXKxYaQ+tOr2Q8I8ZllutPcpylfTOTN6+TJrLdpcj0SgI8hHUZ6j
         2eVsD5AXS5WIawm3e9SEihpqXiEUeHjGbWNjWmWHqSEb/W1icOAf1M0cJoZzNujya5Xh
         1gWurZtR+4zYPMrcRpIeS1fBi1U1U5N4+4oYTA51Iin0/0I91xt8z7TW7pVzPOONUcuH
         uRqAjkdVW/YsofENfhhei5q2PEBsQWsqkNGNHSpuMF5dC+uSKM8Yg4W+WVl+vHdsK2+M
         L34J8/lq12pSYOJCwiZbZCKX0DfxUyPr8z/9l624bsbPH7ho9xCZe6zpWIotaObdSXwV
         XM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801145; x=1730405945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKO+qkwSP79cOBNc5LhGFwEWbvlj3s6u2Rlm128unxY=;
        b=ZmbMlHoSv3etWbrftyfZ5fqy8fG5GDTTwtLiznu/eCrv/kWxZjIkgDuo0Pkxv0dtSt
         BItmiohRJlUhmM4ifTvwWjwoL43lb3ogDbiLqsvzGPKAszLg8ablTPzRmxfmtxHR5cEx
         eWsntGjEe542VbEkMQ2RtZOkYfqCPS8hHZMycfN8VWm7gcpGVxBqdfc4jMnQGkTyw6qR
         2UE5UvT3yNiNxulWNiR2+v3MVNohEgBxZ+xdcNFL1bJm4l+AmP+2TuLFFzLpsQ0OUrn+
         hCM5OACk5BqnQrefwVX/0+ziDdn+mP29ICPKNzhtOiUK9A+5mTS5l773Buf+IT2HsPXK
         Y2qQ==
X-Gm-Message-State: AOJu0Yw7OQx4M0TjC41gfkep3wIy7zGW/ePO9hYEFILWMiTXzNCGoUKb
	bPYB9HOFQDLSBBRqAouKysgRFI5SLPttyriNFR34C0SWSHVFzANpd8PgNg==
X-Google-Smtp-Source: AGHT+IHpChpG7PZNtNKk54DpH6LV45xFXZlPu1O5R3bDyzbbNBpbCvUapHN0uynYfTA/yPIAuqgguQ==
X-Received: by 2002:a05:690c:f85:b0:6e3:2508:43ca with SMTP id 00721157ae682-6e85e8b384cmr31778327b3.27.1729801145332;
        Thu, 24 Oct 2024 13:19:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 19/42] libhtml-parser-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:38 -0400
Message-ID: <20241024201806.440273-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113197

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 4dbcc107b..a3f287dce 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
-HOMEPAGE = "https://metacpan.org/release/HTML-Parser"
+HOMEPAGE = "https://metacpan.org/release/GAAS/HTML-Parser-3.72"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
 DEPENDS += "perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
-- 
2.43.0


