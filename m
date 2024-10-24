Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E1D1036F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.6065.1729801136198566931
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RkR9i2tZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3a97a6010so16366457b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801135; x=1730405935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etPdg9xEd1X/LP68qgXsNAS3gvEg4Sj6+BZvlgtjo7A=;
        b=RkR9i2tZVf3OpusvOHchMT/XsplfUzPjuu2GO03MfTTJoU/mgb/N32I8dQqouH/8UB
         66ERHshIio4u1HhazIYvNweiQMPcGscwfsQQVTRfJEzIsHA6+JrUwIMlPUJf2gGQMHQ3
         nSpHYIHt5hWKqGaMSgo907uS6tOYljFCijVGWxvkKtKnb72eA5vWd5UUVZFHSgBaWWU7
         1vuXz8JJ8BNBuHLRLRYEKMGTasqxkQxgkaKMH+bQ3UeOUgE41YMkUMDx/AtNLGTaZCjy
         y67My/1xST7n1EaKlUug/URHftb/jd8ufYeC+IwaYrMm6YwReoQwG2RSB/0ZB3hWnR+0
         nYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801135; x=1730405935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etPdg9xEd1X/LP68qgXsNAS3gvEg4Sj6+BZvlgtjo7A=;
        b=b2ttydlQZg234pwsBw2Nt/vXgYI+bnBjiacFiACdPlFw/casHC8K6AYUabw1BhcvpU
         1qxtZbW6/Dh7xZUk50jVKSCZbtczComWXegwmf+5G61+isYT+m9wY/Zi8T6HkhCk/sF1
         chFtLlv4jh96ivORQjENmyYYvGxgkG5K2nKHU0/3Fp9+cOk3ffliMvdoYQmmaoW0sp83
         wMBp4NxsswEKRRHoZ63ogCt5VUGAMcIVrQZfpAfl+fUu16RJbmEyAm0t0CJdAoD0u69Q
         +VwmsxIZ6gSKfMJgxX0l8EVe99CZQY7SzRx5R8q/g5RK2+4QLQVdz09eFlJLajLwMx40
         k7Ag==
X-Gm-Message-State: AOJu0Yy/XuMtfdy1YOzJyG8ykhTLuZ57o8pwozI+F68pODeTgiDRszBp
	BvW8gG35VSuf1F0WYjrrVv9tks2beS/FUN0Y5T+XqTLdIlQy4IVh62CExg==
X-Google-Smtp-Source: AGHT+IEE+ZeMPDs/a9i/U+lD76xH4NVuEOeBwq3BGkzmIvOwk/B+TU1XoKY39cUn4auA7L5Lik1Q+Q==
X-Received: by 2002:a05:690c:f11:b0:6e3:39c1:1686 with SMTP id 00721157ae682-6e858149d4emr32583927b3.9.1729801134905;
        Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 04/42] libauthen-sasl-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:23 -0400
Message-ID: <20241024201806.440273-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113182

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 531bc61cf..ee373c53a 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "SASL Authentication framework for Perl"
 DESCRIPTION = "SASL is a generic mechanism for authentication used by several network \
 protocols. Authen::SASL provides an implementation framework that all \
 protocols should be able to share."
-HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
+HOMEPAGE = "https://metacpan.org/dist/Authen-SASL/"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.43.0


