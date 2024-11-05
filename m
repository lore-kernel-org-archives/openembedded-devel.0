Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33436D36102
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27896.1730831949917322835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8Po7GxZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64380707b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831949; x=1731436749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMeDRY7YpYjbRI8YHtS9jJ0FjJg06VMj+bWkWBpzFds=;
        b=X8Po7GxZDS5jDBds7FJPU/tWjc86AZ9TF6V9vkm6uI1tSd3JQkZqUh2e808TIxBwcE
         hcmPVhyKa6w/a5jRqzLnWmkn5qyp/YLKew1yYVxTFAQ6Fe/XTINQt4+fHx49w9tEdlyi
         4DdYN8+MtvZJvpA0nB1SeuzrgP6AtZweImvD7iMHZMDakGYSxCQ8gPbIEuvT/biz3Arg
         4divXiDBcy4fFMRW8wbk1KUQzDlSakSHBO0Iyc+Csge91MAotdJ7IWcby7P7PdO1B+lj
         CoLtc3cFlBq67f0hnTrNfAB4YqWuUZOjoWYAqMsZRiVpR2jscRi4Z7X2Gk1DIpXQbsX9
         46Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831949; x=1731436749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMeDRY7YpYjbRI8YHtS9jJ0FjJg06VMj+bWkWBpzFds=;
        b=rzZhXU3e2qMqtE+y84M0dTLdPshbw+W9UH50zgSVYCUzrrjk/ZcXtTsuzXMv/aIW/M
         PdE+z3fbSbOqm7ovdGAxSOeBvntyYS5U+DxUMtMQvdpvasrzy3UO6kQ9Wgv0K4dpuyqa
         rMAwWAExTcfnhp3XD21UOfjHepbhZbANHrQnPLvguRny1Fh9adV0Nl/ukeLmotkQd9Ko
         uHYQ7rE7Qr7PZ8tVxJUWmxhWuLVRiO9WE6/bFeC5C+hfpxD1BJKwz0//MKeQRsPhcy/g
         ggc7NDKnUuSoRYJUtGrFChJmoU5FN4Hcu1qWAr0rDDDlhzjbAJ0ZAs4Sp3f6MWNOZpe0
         OdYg==
X-Gm-Message-State: AOJu0Yy3/EvXgaPuSYZJ1wZbfiXl3/Bs77NQHlo7qXK95v2ksk+dUXSU
	N3+j1FrY5FW3KuR1OYWS2exd0TsjmOu52qBc4XwEh+rDoxtU26t0bOT/rcGn
X-Google-Smtp-Source: AGHT+IEOJ838oU+wclkDTfP7MARak5bWXAZLWXyymxzUvMJewvxeGnXzdI+76Zg8C1Gg3j7BZsBs0Q==
X-Received: by 2002:a05:690c:6f8e:b0:685:3ca1:b9d8 with SMTP id 00721157ae682-6ea64bdd307mr166873797b3.30.1730831948606;
        Tue, 05 Nov 2024 10:39:08 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:08 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 086/161] ttf-mplus: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:02 -0500
Message-ID: <20241105183658.34982-88-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113601

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index a3babe90a..4adada04f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -22,5 +22,4 @@ do_install() {
     install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
 }
 
-SRC_URI[md5sum] = "d1400184b51b3871e8d2fca6c50e18ae"
 SRC_URI[sha256sum] = "a20b9b9b03c2a6fb1e2137d29e8a6ce06406ba1e008906ea3c474dc048dc06a6"
-- 
2.43.0


