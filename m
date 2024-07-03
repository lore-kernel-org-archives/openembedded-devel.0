Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4C1C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:48:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.58028.1720032522072145978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=1Qj5r3D3;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.178, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70af81e8439so380939b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720032521; x=1720637321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yfk9d1n7CL8Ci0wJPqfzUDhEfKNulwyzAdQDQ2oHPQc=;
        b=1Qj5r3D3L8eVFDXK0Vmvwy4Oe0LQuC9FjbzDCe/CRsIpbJFP31mABqK8O68cW/ciFy
         R2eGaIl/il527QqvbjFxsTqLAKaK2SrAHS51ZuA5y2ngpZ8lGYFo2htkV7bJ+9ZpaYmd
         SMSHVlPGHxFgyWpcmyLcPipheK+OB8xqZOt59P/q4KOzPAPMboUJGRZB8b864zWBvOxf
         ZgucQ82DcjlgSyOnbIDG3gLW7m31iHjmZNiOgK7Ht5ZtrlvjNMyMMIxyGlDVU0J3aGNA
         9HQB0qisr6+Y+VMzQsv7hHrjUA4ncQb+b2C//GwzQhaJdFxZry87pwcWSnCzZL9qWhgK
         ZauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720032521; x=1720637321;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfk9d1n7CL8Ci0wJPqfzUDhEfKNulwyzAdQDQ2oHPQc=;
        b=lQRf4x+4wZ3slLc85i8b6BAcazmee9e8PF5L4EhmrPebCnxfV+6J2zJ/7uXe3hbTBy
         /KmpwVqsyG1D57JlAd1kC9mPxs1VGjEriqKCQICnrRFqzrlNaSCEInirfPIFAJdg5YFK
         TcA1YJeg9JIP48Cu272NNMDXBN658k4WG11IBYqAV4Sm+ZUtCOv0h6kcKnRLOExN0e8g
         WlMokj54QsRrvhpzIrDZBSIAhV+r40ewfq2BBh6gQ2CkLV3AA9anFUc51Hf5ZvLJN5ug
         wumxZLa6SR8AFmFbLbSgumbaBSKDFeSEu8LP2hRgIvwVJIOj9413Upn6cEpVSC0lkhbJ
         jtdw==
X-Gm-Message-State: AOJu0YwLJCqW6K+7F3O+/T2v928iCCs/i6GHLQnRtZNARLDr0u3iEATH
	ZSdJUSfP/o0tgR0+k9Nr/TEocooLfN4DAHw0/OHabw4wsv8Uxc8V65XkgOlKohqIuJVTPJY3Pl+
	q
X-Google-Smtp-Source: AGHT+IF2WlR8YqHejS083XI7lF0lvoSh/rnIkex400P40KI2Dnb4hywPrKqV2FaXwxf1fD/zPor2dA==
X-Received: by 2002:a05:6a00:2292:b0:70a:f576:beeb with SMTP id d2e1a72fcca58-70af576c2b7mr2029749b3a.15.1720032521316;
        Wed, 03 Jul 2024 11:48:41 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e53fa7sm10773256b3a.27.2024.07.03.11.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:48:41 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] apache2:apache2-native: Update CVE status
Date: Wed,  3 Jul 2024 11:48:36 -0700
Message-ID: <20240703184836.23299-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <CAG1aeW2+nEeB8A6viC0YUGx7J3wCHfxbDC5BGRn71OwiYwKCSA@mail.gmail.com>
References: <CAG1aeW2+nEeB8A6viC0YUGx7J3wCHfxbDC5BGRn71OwiYwKCSA@mail.gmail.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111247

Update CVE status for: CVE-1999-0289, CVE-2007-0450, CVE-2010-0425

The current version (2.4.6) is not affected. It only applies for Windows.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
index 48bb773dd..265313b3f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
@@ -41,6 +41,9 @@ CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.44.0


