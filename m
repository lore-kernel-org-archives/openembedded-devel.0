Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EF6D33A47
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.27754.1730831922829640571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QbnrX98x;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64374727b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831922; x=1731436722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS1BhM0jYT6QCXlUTbY0H3/7/rWIvg1qTiGctXC3zEw=;
        b=QbnrX98xv3qz6JN1iLZiGp+gkbaQWGCXc6iSQwc7pQvaZ87yZvKMSMqiXarT5yxZhd
         DQ6WtzWEmOe9Fck/FQuWadYLE6uGlxRi3VidVWraO8lzEDOwhdfRqJjTE0mTs7hnBvMd
         c17K8ILL6lyXVXyv0TZtWuWnWd4lUEJddw6SYGy7eesI1V/bX4vZ5GCi4OSqu+dr/lL0
         TSaUCErSdsBVf0LXQYCc5pK9bWFjXaCB1u0702QSKdd5F5TqeBvwK34LGUzVFFDZE7PO
         pV1b9wDfPSf69zQEqv+RMIt+c+e/LymmLAirUsOibVCByH4QUOCbqgFGKtVWF1iA6psK
         1HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831922; x=1731436722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LS1BhM0jYT6QCXlUTbY0H3/7/rWIvg1qTiGctXC3zEw=;
        b=qN8ZuFw5ucbkbUHZ0FswzTu6kuNHkpP9f8V4+i114xsazFezvF1cgavzz7D5NVzy5w
         6UuvodQk2Y/rZv5t6Q3eKIX7CiDnITlI0IwBhUqPuWdPsHv8abXU5XYApeDzPYjFnA73
         iamhbMQyPTXZ4psVenBe/l7Ojo4VjOi4oECmnCH0iavzEnBi4VmOyxzFDioLpnXEaKBD
         aVdZOyGrV7jECKbezJUzOSQdSVJNT4i6hPnGb88uk+4T0+lqSvT3EQRGqZS6Wu8puhTM
         +K+Ge+zNw9S8jZHEQ1RXkLXR91UHmRyUdCKWK2icRDDlTYXogxmTBf5jcszw7ux62XBm
         FjyQ==
X-Gm-Message-State: AOJu0YxO4/OEroaJvMUS32tpZMDgTD538J4CGcna2WCGDNkdCLko2sIU
	cpOoDPdyj4Dk4tkb544da3BDt5iyHuxxBJ8QV6ZIw1zkELVsPrRwHaePowOO
X-Google-Smtp-Source: AGHT+IHKMjNgeZbpiSIHEnvWBmPapkyXYSY7v6y5YasqkgCSzueHDtmomyGQV2Xtyubf7a6wfHN4aQ==
X-Received: by 2002:a05:690c:6e03:b0:6e2:1bba:ed4c with SMTP id 00721157ae682-6ea64af4defmr184598057b3.17.1730831921459;
        Tue, 05 Nov 2024 10:38:41 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:41 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 052/161] libfile-fnmatch-perl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:28 -0500
Message-ID: <20241105183658.34982-54-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113567

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
index 7768d1741..eeb314fdd 100644
--- a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
+++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=34;endline=37;md5=54fdfac62963b7cece
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/M/MJ/MJP/File-FnMatch-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "22f77c20d0fb5af01a3165e2df2fe34c"
 SRC_URI[sha256sum] = "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a5d68cb7ae7a9e916"
 
 S = "${WORKDIR}/File-FnMatch-${PV}"
-- 
2.43.0


