Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9ECCDD0C7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.21774.1729612082089833192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXJ/t5Vu;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5a5a59094so55159107b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612081; x=1730216881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Too20Y9SWotG/DcGSFroBHNfT3hOfGD5lEKeN3mN20Q=;
        b=bXJ/t5VufeTMmnh3v/0yfVYAXm/hWorWhFb5PSQ3JBaw/4C8dpJ0s980lLxvgcxEWZ
         A9qHMzE4wnJNdDQphTuFiPXirllTbV42dFoAgx82NNt8h/39sylODek7SetlONmEWeha
         ibGu0l/DkZIXsgeZA5vKeMTWqAeO+SiNcejlr7WZthlrAp3pWMg+0EQfzwT09GQTbzLj
         ZzGE/lfg04ROeZGxzGXprX0O9bstqwQrX+YwRjXMCA6HMJ62QseeC4ZC7PizTd7Zp83M
         YQdCNUFbntGXIP0ylCyr861hVkHprBq9yRLXJi5nyEXkgwzMhBrHpwRAVF53XkyPZ9ub
         KZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612081; x=1730216881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Too20Y9SWotG/DcGSFroBHNfT3hOfGD5lEKeN3mN20Q=;
        b=AwrLDXBqXjm1ZVRsMoJUfOAYyjBbMZBPAxeSWcOvubmLgUTzZ8wmLmMFACYOja+9H8
         6gBsf332wwGfj9k0t7LITo8uGClG7J+CmsR+xXm+6AO+sxxXzrfqE1OYV8a5atNkFlbz
         WOKbELFHMihqYJOpMk+vzJVm0lFT6HB6ypGfdwVGr/D3tYL2CgNzPc4cdHDhefXbaUuX
         PMqS8qtuY4Q54fFlgtqafb/KCvboNS2vhpENZiS7SidWqMD9Xhd/BSYaIU7kVkhstdI7
         F49GDzndgp5/jICTFBhvq5ntswV9rK0IaDmRSgsB4u+N8Z6weFra4ODV3RPwSYr0PH8y
         9G2w==
X-Gm-Message-State: AOJu0YyfIvoBYIdt/824wBaOwHJ6Cfp26x0kYGir+gFK96GdqjBE/9UU
	9WAFBxs8XwQkZTmWrbOIAxj6s61mywPaXs/0yVJ//I3D9GAIJeW8Mqm3gg==
X-Google-Smtp-Source: AGHT+IG/fAArqbh6nj5Q0GzkEEcX0MLn+Du2J6bTqzvm34QHJpSRz7EEHle3tCWW3yw5bvqpPKfrpg==
X-Received: by 2002:a05:690c:9c0a:b0:6e3:3521:88ff with SMTP id 00721157ae682-6e5bf9a725fmr153106347b3.18.1729612080618;
        Tue, 22 Oct 2024 08:48:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:00 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 10/46] libdigest-hmac-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:28 -0400
Message-ID: <20241022154729.20331-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113101

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index 43b7f4d5a..41b4e78c5 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -11,7 +11,6 @@ RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMAC-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "e6a5d6f552da16eacb5157ea4369ff9d"
 SRC_URI[sha256sum] = "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59"
 
 S = "${WORKDIR}/Digest-HMAC-${PV}"
-- 
2.43.0


