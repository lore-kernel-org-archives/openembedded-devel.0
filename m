Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E36D3611E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.27906.1730831958750359043
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZ6un+bx;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e34339d41bso49940727b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831958; x=1731436758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5e5qtv+ay1hklTNGJKU8qrzqT1zXhNIqRhRYhqlvTc=;
        b=JZ6un+bxaz0oawn9XBIK90IWqMq0oJIIHJg0ATnFVKfV27v4IR4ZA3SQM7ianEIkvZ
         w7a30eJU7DMsu65+q2pMkV7r39Lh46W9fPYb1lFCpfiLbIez0+Hs8o5mRbjIPP2zeLxD
         uHQD/T9K99dwUvQGn6P2O/hPdTHAFVyRzIpclma7qXUdlEPUAtG2DmFYug6mmepRJxKI
         pOt+9lZGyKDOa0+WAiEEkYjyXE7ObewOYd3dDbFUyvVU4cRyjIspYbuW0gn5bTbZWweP
         nZTYnVVRrLdllKxplDaKRZvPRS2J+6jusIAN23BbwmY7AO7nO+fdJnxRrYWUybvt4sRD
         LVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831958; x=1731436758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5e5qtv+ay1hklTNGJKU8qrzqT1zXhNIqRhRYhqlvTc=;
        b=YT5mRvDjFPI/VyulnufM6bz2CoC+yZtgA3I5eKUPFgdc50GRuGFhEsm1cWtg0iLjA6
         D7LWfmPulCZSnna69sxRXEHmUY67Rc14UCyBQVzPcDNJtUmAp74lwli3TcnHVynL6rqM
         gX6gR1QKv4TKYMoLwdSVH8tu7RFKz2Jo2LWuhaC4ZlRwLnEZacUNwASs0FV03WCoGcc1
         ni/ZYlUhoZYetH8F44frv3uI/4pyztd7CbF7f06gkMAbdSrwmnnpAwnsYGdizaxHrKiv
         9FL8X4YkO9qnafBgvGnDpNG8aygondyvfekOCR0XKPrBNKlTjBClS9BzKkxJ++vhEQVX
         aJ+g==
X-Gm-Message-State: AOJu0YwyhcXZ4YPZxpO7z3CSx5VdJSGQ9lfplX1lRbdPaKAGopcK6R5S
	KDpzoQO4eELfnKQVqc8J28FonuW3zcjoJ8UBo66Hkleoz4SvwR7jKBPi7D8K
X-Google-Smtp-Source: AGHT+IFvWNrfIg4DMSiD+oW84XxGNlmN0HhXXQzpqbo93XNW12ypNaqdRfaNiCGK4KuCb7J0C2z+og==
X-Received: by 2002:a05:690c:a:b0:69d:e911:88c3 with SMTP id 00721157ae682-6e9d8acb3bfmr326580887b3.29.1730831957433;
        Tue, 05 Nov 2024 10:39:17 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:17 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 097/161] font-bh-lucidatypewriter-100dpi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:13 -0500
Message-ID: <20241105183658.34982-99-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113612

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index 557eeb17b..a1a6d43e0 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
 SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
-- 
2.43.0


