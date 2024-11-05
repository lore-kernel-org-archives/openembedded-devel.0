Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5E2D3E781
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.30363.1730838848579793902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dBUX8peB;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e35bf59cf6so2274807b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838847; x=1731443647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBdHIlY2QLLrFnn4Fct78UZYX08m3FStbqtgXnpFBLM=;
        b=dBUX8peBo7gh5GefisALh1x8yRpMJDI6mArpLxGjws8WfL8Uj3ejlcas86eiH3BH5i
         +ymOcWVP/4N27zFsKEUmU07SnRY5M+AJVQcXKWrcG5gcb+ojeV/7I/IQhIijb8o8+FKl
         /nA+g5e7GgaD1GTRsZGOR7AZVsEG6DI9z8GHWTkIda2GqZaO6xiik6DOeUutoayD/v/n
         dpwMvFAr/k3Wmnqpk7x/yy+buhXJ7YdnLnt7TFPRWxLoQ3pZwSdxOLi2UjLNu1Q8ysQh
         EFs0XfmHHFOsQXYSBnzHgSSlgVpqGoPkxhBAor0uHGJbMPkpNLnwORZglCHlevBC85RG
         ImNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838847; x=1731443647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBdHIlY2QLLrFnn4Fct78UZYX08m3FStbqtgXnpFBLM=;
        b=EzlT8xOR3uZaE/11B6IZduUtduXL67oNBGUXG+VHHbkHSFumj+w+ysJkTHkxogaTUP
         DCLOoYwP7VLcB2j4FsjhQfelzljx7t6mjJZjyEcHCQSffhzojZCvK4M9YQQykThEm6St
         irvSFoiIftWhKYFkZikQYs0BEVrR+owcxbktocuwL+H/lgb6S0+3bVZQxuKWK409hXgX
         iIjouWHjSBXku+8dlp6IMx0B96MFPnBI92liJjz1+cY5MN2CBTgEx8MhdEj7Osw68Fov
         2ZH6f3bN8TkSOWj3k4TdUd2+ZnqMZxw0u+l8yVxrNIuDQiVFt/5w1hzCJEiRlyyQbd7T
         JlnA==
X-Gm-Message-State: AOJu0Yy9uMj+F/NuldN++FepCRm8Ra+sxQBtwNoeBKV+TXBkL/koE2Mu
	8u5M+UhoTWVHyoD2Av0L27NU8NMaAE0IV+3Pg5WYVlilwW33mXqe5wIRR9S+
X-Google-Smtp-Source: AGHT+IGecEr7s4BvSvx/N6S6IKH3JqwzlX8YVPq2pu02Ah7WMYMQMJrIngBoybI4JLcwB8SNXP4BQg==
X-Received: by 2002:a05:690c:6701:b0:6ea:4b91:38d3 with SMTP id 00721157ae682-6ea557dff6bmr165483817b3.4.1730838847260;
        Tue, 05 Nov 2024 12:34:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:34:07 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 119/161] ckermit: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:44 -0500
Message-ID: <20241105202827.3104-119-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113636

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index e32aba93c..898a4eeb4 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
 SRC_URI = "http://www.kermitproject.org/ftp/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV} \
            file://0001-Fix-function-prototype-errors.patch \
            "
-SRC_URI[md5sum] = "eac4dbf18b45775e4cdee5a7c74762b0"
 SRC_URI[sha256sum] = "0d5f2cd12bdab9401b4c836854ebbf241675051875557783c332a6a40dac0711"
 
 UPSTREAM_CHECK_URI = "https://www.kermitproject.org/ck90.html"
-- 
2.43.0


