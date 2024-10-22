Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CE4CDD0C1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.21962.1729612105846736828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MSJFiekk;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5e5c43497so24695527b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612105; x=1730216905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QewNiwd1wgrJa8It3YTkI7p6cVY1fhqHV2OfozlWW0=;
        b=MSJFiekkaLHHJOxaau6hOAuOtsHqj7ZO9RbiJ6L3/8A4ty0M1z+aMhIC/lJl9B7xFP
         JVO++Dx9icrS2qs6A1Ir/+UjPC9hRzY7zGG5gf/HWFwp5o53ZP/TZyuD3ZTkfwY2+fEC
         fjHxdbN/NYNo4DV5Hz33TkzmoEyL7xAgtYQEWY5P2wcwAMSJdtRZ/UFnhiXo5EGCu2MT
         qI1KXbdXnJQU9upOP1AwuQTBEl94UTPE2n2pVFaQFs1UQ7stWM62s5/jyCK2bJhHxaa4
         pnQvNZ1T6KDratMGeL32jqhGJShsU82H7ARrjfPxnGEus/0zuNqiCQQmut83ZRh7TDNc
         Jfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612105; x=1730216905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QewNiwd1wgrJa8It3YTkI7p6cVY1fhqHV2OfozlWW0=;
        b=CF6sb1xMXyD3IqERIP5hNHnvOg3B27cZqzLs5AS6iH9LomeotHdh4UN94OxGsud4II
         w+W6BiKfh40ZE48ir6eDvE1/Tu7HJUIDWtPmHJgC+ZjfwaFoCyMx28tg+VwkbqIxgdMk
         eDVMLkbus/AbpXrD7E0MnoIgEYxoK7U6FcVF77rRL6L5baJJoqgOsLXahOGZKLMe5EM1
         H/jHcy6wuwyy+KoVK/Tsua8wxDXPJmZPfvLwsZ0LoQfQJDmcvPrnoKH6c/yyOt1DnYa7
         cIMx/NgxZ6smRRAUfC07dB7LXHP29sYFhuTWZnCqTrGq5IAfVzL2bJO4luF6P6czJLRL
         /SkQ==
X-Gm-Message-State: AOJu0YxX+6l5giwkkM9+xHXwVHo0BQ5tlNjt2FtlWoQbCxPA8fln2OfM
	HT9KbAg5pGCiFbpyery03RxUbbGqKcTYBqJ0ae5beGTNUz2rtYsqT1DSCg==
X-Google-Smtp-Source: AGHT+IEHn3yzPfo1wQnq2VTR3fqautv1fFECmJI5mA4WNeRMYaWAp/OQdhzkXdY3icOE13Lbb20ppg==
X-Received: by 2002:a05:690c:95:b0:6e5:b6a7:1640 with SMTP id 00721157ae682-6e7d82cf937mr35059777b3.42.1729612104405;
        Tue, 22 Oct 2024 08:48:24 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 46/46] libxml-sax-writer-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:45:04 -0400
Message-ID: <20241022154729.20331-47-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113137

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index 487a5c22c..c3dee2bcb 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -13,7 +13,6 @@ DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
-SRC_URI[md5sum] = "3e3023c648e3003c04de2fb04435f8bd"
 SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
-- 
2.43.0


