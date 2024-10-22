Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F056CDD0C8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.21936.1729612078261104893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNnay5SG;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so5197856276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612077; x=1730216877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8Sjok/L39O12NXYjMTTTFTs8x6GoN/z0mnKiflFhbI=;
        b=ZNnay5SGjrIttteillFx3sCu1i/B6Vctqvkna+HpggX+dPzQjFOPtYImm4oOy1r/5q
         0X9FJxKOeQFeSi1rwuvX4HalYC1xPR1IebRTuqnpT2TwbU/FnYts8uN8IwMAUjzpk7P/
         LoePzhBc1W0d1qPBedxD1J8sKvENVWH4GWUJ79VxVXGTtuIvGylAjWOiRrtvz9frMyWG
         oradJigctMyYv1/pEMoI3gOjQGVgRwlNG0Kruc3OOC5UFKJLxjqDM3DJtjjTboFlf7t4
         W68ZJqfqmtQPWSjOgzb0oT5XApPgC4OwGFnuHb/Y6gqaTIBb3R3Y1dXLtydpsZwHjKhw
         wv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612077; x=1730216877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8Sjok/L39O12NXYjMTTTFTs8x6GoN/z0mnKiflFhbI=;
        b=c//8NWy1xN3qeVtLKxRIMUUzFCTIf2dVGvdLGGDaw68o+NGwxW+bkC9AAWf7KgnWSS
         7Fd8cuWkGMlDoawr7C20JlVDrMw4ZEuCj2Zmkx8e2LvsPNbyYajRZoDFp7bmFwhljdmN
         JdygaiT9wFk4I2MdwNRK5qOQznaeKCYg5+i3NB17BCxs2PXtWbm6fYkX7KJ0TVwLVoHA
         gs/4eZxPmStHura5gWdz8ObztFumwLUWH8FP5Mu/cbBw2ZcJCGZVE26FBUoAdD+581OY
         uKn1WeNZZK6F6kGag7j8rHpBIaRUYvXtzF+IePrOW8DpdgF43wqJ0Vvp9033z86EU4g9
         xdHg==
X-Gm-Message-State: AOJu0YwzFBpOb3vl3lNO5Bq4QK5QFMKADpB7+9sS0I1BGi/1G7jolC61
	q+Agp+h3+P2ehypqPEzv2mcYHHgjxSYbejqN+MM71QHqDQDyoOX8J0aZSg==
X-Google-Smtp-Source: AGHT+IEXU413LNxS71w4Zc05UDEy2EvFJFDXxuPUTjnihKd5zCtUV44u9yAfPyn72c3RTY/MTpCiDQ==
X-Received: by 2002:a05:690c:9685:b0:685:3ca1:b9d8 with SMTP id 00721157ae682-6e5bfe95992mr149367697b3.30.1729612076884;
        Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 04/46] libauthen-radius-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:22 -0400
Message-ID: <20241022154729.20331-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113095

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index ee7c4d750..4a7b576a2 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.
            file://test.pl-adjust-for-ptest.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "d1fe2d6ecf7ea99299e4e3a8f945aad8"
 SRC_URI[sha256sum] = "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc753364923fe81ca7"
 
 S = "${WORKDIR}/Authen-Radius-${PV}"
-- 
2.43.0


