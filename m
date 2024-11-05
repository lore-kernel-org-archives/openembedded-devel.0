Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E3ED33A5E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27897.1730831951493975911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=biDcoQKC;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e8063533b5so48284597b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831950; x=1731436750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXUIHwN0ufJ5SkGvTSIK3TE9jljQmb+LU33Gal+hoYY=;
        b=biDcoQKCdet7L1g4Y+ixtWWx0t67iE1L85ReFrn6IQAZliKVoCGLhxKCme/cT/22RR
         YNF2clXRCFA4w9xnLp4TQb+wmKms1QsUOaUwav/c8uN4u/+I4ih9hkVqCObTij4BMZNh
         xm3SLHpYGliJjhOwsewe9EpVh8dMtUoj0K7BbUB3mBhDhrrKEyimLXMSfWqmKRJvfRlR
         kiz4LBqLbdAVI4+0usEZy05eu74VKhuWRp5gdQXmOL2mA6jcOSKFwC6sUtvGVuwnMSVZ
         uXMP20ayJKD3qy3LM9qm5WF2K5Fbkaw/siearu1QSobnjmFTovdCy09PA0sVIFMSO6CX
         hNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831950; x=1731436750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXUIHwN0ufJ5SkGvTSIK3TE9jljQmb+LU33Gal+hoYY=;
        b=m6Yrg162d1ACsAUV6dLnmNhkIm4r2ijxDF52mXkxYG3H91xT0Oot3yslaPe8f28Kv8
         rMUZGNDZl7WeGU2gL5NosOiS/ZnrlyoVDQfZto3vfNj6ZFNOH/HHjpRrs5UI+KR0s6f8
         Cr/ysQxxQDz9DF5jp7/KyoPsA6VKBEEY0XtPbncUZ2IeQsr8haf485ueGK2dFz7uo+Ad
         KG6oGtfIWNiTUWWOudd007fIjbWq7d9Nr9xKq/vQDb/Zngt10j4HntLJZhJ4lbohrJfX
         dyoVNMKEj7xc6g0GqB6+ikLAWMyGhOVBKolzxTM4pkqbOSf0ycQmppKh5uOTEDgull4S
         fCmw==
X-Gm-Message-State: AOJu0YwPnmleEigAyXiUzqctruOQp8bj9ChiGHDf4aHFqcpUDhUAnJZz
	IWMEJZe80mkHOEOZZZmv0ocrMkHYkdv7Hli+nbhmDD/zpuq5qELZwKKLe+RJ
X-Google-Smtp-Source: AGHT+IFKBem/eAWWt0hfkNzTLZc8JOIemES/y5XxDtPcicptkqtaYPn5IdqIOvT3mifBX7lYElISHA==
X-Received: by 2002:a05:690c:6ac8:b0:6e2:12e5:35b4 with SMTP id 00721157ae682-6ea647d0980mr180495817b3.0.1730831950120;
        Tue, 05 Nov 2024 10:39:10 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:09 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 088/161] ttf-roboto: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:04 -0500
Message-ID: <20241105183658.34982-90-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113603

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
index 3752ec39b..25ce8e930 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
@@ -6,7 +6,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "https://github.com/google/roboto/releases/download/v${PV}/roboto-android.zip"
-SRC_URI[md5sum] = "3b43a5cb33196ec25e44d5fcb40219e1"
 SRC_URI[sha256sum] = "c825453253f590cfe62557733e7173f9a421fff103b00f57d33c4ad28ae53baf"
 
 S = "${WORKDIR}/sources"
-- 
2.43.0


