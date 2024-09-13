Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAC5EEEC31
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:20:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.67587.1726208456185042650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYxFWnbJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-206e614953aso19494955ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208455; x=1726813255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4z/FHDcDvM7QqVkeWsvQrzYFnqPJpcQebKvXIiVA2Q=;
        b=dYxFWnbJKxD34RNsBLnVFhNbU7abhBoDE6yJh9au1uSzftZt3dz9n9B/3hpv9ffsYR
         iGGITVauTERpW6Edcyf7gUk6GV5x69T4yEv4b5N1kSCABTtEg57CTak1dPbymFwAlzFk
         sznInpKCH5Dc8iNwPrUzFH6v4PahI4tW0WHbBlGicsQGH33R4IYronOqa88jqOF1Soz2
         WXKR2SJ1CqlFeCo0b1NdrPI5rYmiR/SZxE8SqEbd428L1uK52ocQjcmApDDxyZCVxxJs
         dr1d6fE0h/3Ey85rV7Mbaf/25S9GvgvZ9Uph57FLp569tE8c4DbpWHb6cfw72YwcIeSD
         1kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208455; x=1726813255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4z/FHDcDvM7QqVkeWsvQrzYFnqPJpcQebKvXIiVA2Q=;
        b=hKwbkWGam1iRfqeZmIMSV1FSrfhtPCnS1ZI+rh9cFV2egNcOLM3Rbxoynwk/TobCzm
         QngJryz6LU1rh4R5HgofZe/Eyt5vGdpW/DSqxCWpwjMGTCheQMUtWxqBaQRpz7jvCbGg
         ivcyKZGc8KVD+Pl2n3ocBIdIKkSZISiZwMhObzavw3HOSdyMlObDyhFNyQ+Fw9WoBWrn
         Wb4mR6YpuZjeL7rhQhGn0dnuf7BBnSAs0EHplk+9Yyi3IcPqhyH70s00z+aSQSRxEjfU
         K1ZBheVZVk5fJtTAJuLcwM4ypPVTDbC+9z8UlTuBZpc2v4cteIkNcfPLSHe/4gZwDrBe
         8n/w==
X-Gm-Message-State: AOJu0Yy3qom8nu63wzJerHFH5Vca9qZUT0HRwpf+0POwHnq9hOR/coK5
	bYtrZxhTf6KbRBYrSJgTepSEkBHT4v8R42erX1UjMUkr7RL5TlFsdxq/YUbf
X-Google-Smtp-Source: AGHT+IHdH/uQ5IoJaaDb/XGtX6SnXXfW7Kf96pSpzZ7mEZ0FCKW5xVJJN/CNvdyB3HUW4AirIZfvQA==
X-Received: by 2002:a17:902:f70c:b0:206:8acc:8871 with SMTP id d9443c01a7336-2076e39c331mr71025625ad.31.1726208455226;
        Thu, 12 Sep 2024 23:20:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 03/10] python3-tzdata: Add missing attrs modules rdep for ptests
Date: Thu, 12 Sep 2024 23:20:43 -0700
Message-ID: <20240913062050.2597921-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112262

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
index f4454f6dff..d81ded430a 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
@@ -13,6 +13,7 @@ inherit ptest
 SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += "\
+    python3-attrs \
     python3-pytest \
     python3-pytest-subtests \
     python3-unittest-automake-output \

