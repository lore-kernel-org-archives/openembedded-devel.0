Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387BBD1039A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.6205.1729801156741560231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxOSUkcn;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e508bd28so12098407b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801156; x=1730405956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKO7Ed+eGUjWDidniwj8EPinarO0QrTINipTE7QSfeg=;
        b=LxOSUkcnWTQgKLo2OecR+k7Zy90bpwLmSDa2ztczDWzRbz4/uPhkNF+9X8gO2V4zqk
         U0orLGW6j8Vq3hadS1i+mLtgsO+Z3HEOh7w5s+Hf2SeBNOsiNaf95tsfAbjEgTk2xOuf
         kToHTlrdykcDnRHb/Pi1BvlGYcfaIYC3IqJ5u68rYagHJKYRJAug5KSG55jcdVyTTkwr
         oEg5wVZnGPgzjuwJI7V/sRx39CxIpp2/SA/D0iLk1a4kQdI2lt0QUqpOiCjgUR42mJhI
         A9VUSPvqDyAFaBeEzv2MNhe7fpnKyi69Sptks0q6201fOlN7tGCbKIvJW6qTDJ7tquLb
         GphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801156; x=1730405956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKO7Ed+eGUjWDidniwj8EPinarO0QrTINipTE7QSfeg=;
        b=k5P5rUNGLZ0zQ6dndLrlCjFVoyVvSkTM/gXvFZTVdiDYrBpxQVx72FSwfHogBlGUe1
         hsxc9gRHrYbgNYVTMMnZqIceJFnUZ8XTq4O3GNvsz/BxFtYxeHzmY+UB1zmjON2Wh7Ig
         IquGdyZVQbsTeVYTDJi+K9Ub3w1vDMmDufxtxXqjkLArwWa8lxmUYz9B45jDVKGulDWj
         GNpQq4AimvT7PNHM1ZURUl4PSATMiUB0a9aj7QAVKwfJ5W9O5Zu2hqjyJJuGIsSfkrIV
         KVUxFN5P544uam0du4HFgIddsq+Fi38xrS8/CyHNNEkDjcwSyFaoZNL/Hw04ZC8e9rop
         sACA==
X-Gm-Message-State: AOJu0Yw+tepB6yIHaIxny2lgMI3lXXRjpGYHSM2AjGvfWB+L0gb3O12X
	cuWTbuXO9layV+6fhkUhlReW3/pPx7djYM/qADztCaW17B1myg3r+V6n4Q==
X-Google-Smtp-Source: AGHT+IHNmtR22izk8a41+6ArO+vpx5mITpXpuBuY2S7zs1HcilVqWecyZUsV+v57edjvIY9EMo2zzQ==
X-Received: by 2002:a05:690c:d94:b0:6e0:5d7:8432 with SMTP id 00721157ae682-6e85814c9edmr31393977b3.5.1729801155319;
        Thu, 24 Oct 2024 13:19:15 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 34/42] libtest-nowarnings-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:53 -0400
Message-ID: <20241024201806.440273-35-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113212

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
index aea0e7e0f..fe178b46c 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -16,7 +16,7 @@ run when any forked children exit."
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 
-HOMEPAGE= "https://metacpan.org/release/Test-NoWarnings"
+HOMEPAGE = "https://metacpan.org/release/ADAMK/Test-NoWarnings-1.04"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-- 
2.43.0


