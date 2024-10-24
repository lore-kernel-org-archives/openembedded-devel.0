Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9A1D10378
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.6074.1729801144049193895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBQYhHui;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38fc62b9fso13130567b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801143; x=1730405943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3BxQ/djqsUAmX5YssvbLc2dR8n/wmb+KujOtkBPQlY=;
        b=EBQYhHuiJghltRSoj3txW9iumFNmkJBmsCxnwKb+2JHDo16WWwqfGU/2OUrXvwNCDT
         lp1hjnY8hy65mmx3qiqL/Rx9TaX7yJAywRmNGzSrSTTsX+KcVxVYDsny5oSjIS3mVBAA
         ICocyFnWvfzlWd+FoPRupC4qV8XwZvzv0dxJqpbRJNo2je56TpkgA20yZN6gzMpxdeSi
         uR6rEv/Cbvv1AgziX5PpMirBsvDGKBIjZqSEwfSbTvRYFVzJGu0aC4BuTQMQ9XuKpODx
         acLI1kS3KrN2tNAuq9sATMV5U+h2PCkkp0K0Lp8EikUR1DdP34V79NuSODf4Tmc9UOuF
         19UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801143; x=1730405943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3BxQ/djqsUAmX5YssvbLc2dR8n/wmb+KujOtkBPQlY=;
        b=K23mIofNI2Lc49F5Jv+3THyUNa69aG0fRFHxmKY9Fj0LM86rtoUdlc9ymBBe+E8KW/
         ae3zoWHfMZriaafE0f3XbGKjmPyOJw3T9oUo3Wnlu+SSiO7sZ3NDfkyqay+fPmHWCZM9
         6w05jFL7giMMzHsGIYfLFS8QpKgULumUUqorvQSpSXDmanrHwj9dJaxFqoUtS8ill6Zr
         wmNOLbdFj3WZtK7nNOCVYzlfG6H6vZLq7sRUVCBg3MH1ay8fSdtDaNZvIYMvyV3PhQ52
         Oe5owwzj8VQxPwHy6a9licjYDBTBpoZISKkkqRQWLEWnulYAE0E98wyFinHGWzn2KzWn
         yKhw==
X-Gm-Message-State: AOJu0YyZaFj4os209tkJKr0plpxzqjqOjUJ2is/DIH/jPaYp/JFxD2Pj
	aGEZeZnZ91UGVpzrLcCNdzUHU2EUu/bBCYm97CnMJiYXIAJfGaim5uCBSQ==
X-Google-Smtp-Source: AGHT+IH81cxhtPsmC30Aa6S83JU+bNrFxtog7ebMq7fwNCblL/dfH7jA6LuCOJERxthbeCpKzTtkRA==
X-Received: by 2002:a05:690c:4a06:b0:6e2:167e:814f with SMTP id 00721157ae682-6e7f0f7ff6amr88020867b3.31.1729801142787;
        Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 15/42] libextutils-installpaths-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:34 -0400
Message-ID: <20241024201806.440273-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113193

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libextutils/libextutils-installpaths-perl_0.012.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
index f4db4ccff..25de3fc5d 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module tries to make install path resolution as easy \
 as possible."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
+HOMEPAGE = "https://metacpan.org/pod/ExtUtils::InstallPaths"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
-- 
2.43.0


