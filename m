Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB73CDD0CB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.21801.1729612105055506085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDDt0vIL;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e39bf12830so40990927b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612104; x=1730216904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQx9smVNjAUmXhthcyR+Di/GtRZkCL0zaJhY7mgj39U=;
        b=SDDt0vIL16+9ajjg3TokZQZQoxpXA5aJjPZRlHwWRw9kSqLl0lz7V0It0q1RPJXqKJ
         CVRsW1gcsS+0Nb0pRe8gxMsvJK/S5J+l5Q8bJfMK1USUFHlpT62ETSi8WY756WZVECZa
         cWH8684EgVr/cLoLhtA+wO/0Fl+vQe1/C0iLuc2dpRhkz5hVdiWbmADzZSXH2wRo7vvU
         QkkSZnPZyN/5JvacDYs0G9Ai3J/XzbW8thBt+qQJQPKrntKACzDbseCqTiK0VxUuVxrb
         kuHYBfbLLw6PO6zt2ZPjerGOUMqCKhyB3aiocjaGBlhoNOe6cx9i/Zv715q7xCF2f0Vr
         p5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612104; x=1730216904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQx9smVNjAUmXhthcyR+Di/GtRZkCL0zaJhY7mgj39U=;
        b=RvYr96xlyxDfIKiK8MmlCQj4lVYr5CStRiJU4+e/Q0bmMI8STyWK8XSxt8ZXr3IUr0
         09XuYwjZ8rO+IwIPJq1rEXZas1KSW7J7AvmPFRgsbOtqwFlmVTm889+upW/nvwkurjgx
         HOCW+2tGm7ezC9TUmaH4M9ct056N0aL/Yt+4giq5buhJjwIbSGK95XsB7lSn6AybLtt+
         YN3pEtp535Oc9IDBDu1lYVvGHS6LHtzG8MKuZVLeTnouitVqu7AXUhbqina7nYXIvgS4
         2xGxjMjgMuQtHNfqHbQy5JtQJDdlR/RF383/GM/Dx0ICeoBRXT5po+rqzMOgV9G4l+e9
         +Dqw==
X-Gm-Message-State: AOJu0YyqFNaXHhBTkbM1NPi1MYpvkoAZAe/sXoe6SWYXY3Qex9lYpFD1
	bvN6eEPyZjU2ciIxKtwBd2UpuKjUIulJ2GSl5hcD2buYgvXV4Q+HRCWZdA==
X-Google-Smtp-Source: AGHT+IFFMwz+GLoh1conN54isg6f47ipTQ6aVZtOiIH61lm/SEOOvJQoDOqzregQrypNhiaATkf2VQ==
X-Received: by 2002:a05:690c:708a:b0:6e2:2684:7f62 with SMTP id 00721157ae682-6e7d4582283mr31293297b3.8.1729612103760;
        Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 45/46] libxml-filter-buffertext-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:45:03 -0400
Message-ID: <20241022154729.20331-46-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113135

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 7962d22c9..2261dafbb 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -13,7 +13,6 @@ DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
-SRC_URI[md5sum] = "2992c0387632583b966ab9c965b25512"
 SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
 
 LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
-- 
2.43.0


