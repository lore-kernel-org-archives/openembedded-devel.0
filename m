Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3166DD35E40
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.27721.1730831890484083980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5uVWCk4;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so5184090276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831889; x=1731436689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqQlGVV3OhvLPoJoQvLdoyN8YrQl4xFyOYl0De6D+Ds=;
        b=g5uVWCk4mGAia3DVRSi4E+tO4lxSpJT6bhO2JIpGcxKldd9s/6m8v8qDSd+lPdLaNv
         OHSTbJqBKaW9n1HZCh5NBJ3l0RtIL6U1cF+M9DnA/BTXW5tYgTujZZ0RSoNgdvp+8c9A
         8QztKYWl2+3L6MVmN2PiSBvDV5oPcTjmK/vbgd/DAt+aPkfsiYpw2mOjiCesyXBztZ6+
         V0hmuOYlIrv+x0/RaZo+17/Jsi4kEobmK18JLKp2JFsKW6AkaX9qHY5mhfMHvPKpO5yQ
         NWdwN+Mehy+Q0wgewmP0efXxHS47/JK6KdfocNUWHZS6BG4/TUa72kMAKs6lPUzOmO/7
         Qn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831889; x=1731436689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqQlGVV3OhvLPoJoQvLdoyN8YrQl4xFyOYl0De6D+Ds=;
        b=cyRd+J0MVEPE0uCzZRkw8rPKRcgIu7N+SZTAkbPsCLO+fKzhacSoLmmJzvz6Z8RbCy
         V8+Ga1mIwWu0/2sG18ANLFym4ftYWiyz0C7CKQaeCTAbv2vG3veawpumzPefZowkqr6c
         v1fvGlviEZ8QwYR4UIqNBjpZi+UuM1zJ2jW2OHi0Mxx2DI8G+V/PmiBjk7OJ/WTby4tK
         9LGoO+ndh7XtyeRbmCZD2BHzcfASvU83KVbDdOKzk5sorQ+xB74+RVqC0JQ4cyO1ecpb
         UWXM7eHi/YA/5F7BpSHbAvEJIHDeeDlSHKBuZUT+6MFmc1YUK45/egFCkSdAKy0Xmuu2
         qwSg==
X-Gm-Message-State: AOJu0YzRaC1faANRANDrntVxB1tS/NRGn7VbsBLEfPXklQErMVaJBAQr
	uozye/5aOplNBJpuFb0967g8GZzHovtds7l/EZ2051gHFy/KlRlglcHnK58g
X-Google-Smtp-Source: AGHT+IGxeyLey731Dv4RQTdFp5auMFNZZ+Kefvq2uP2Rub3rHNeZx6lINXALDVL8sA3T2rRph7RjSQ==
X-Received: by 2002:a05:690c:c8e:b0:6e3:2be1:a2dc with SMTP id 00721157ae682-6ea52374db0mr204978827b3.11.1730831889187;
        Tue, 05 Nov 2024 10:38:09 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:08 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 015/161] libev: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:51 -0500
Message-ID: <20241105183658.34982-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113530

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/libev/libev_4.33.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.33.bb b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
index 346e78b1d..6d29900a4 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.33.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
@@ -5,7 +5,6 @@ LICENSE = "BSD-2-Clause | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-SRC_URI[md5sum] = "a3433f23583167081bf4acdd5b01b34f"
 SRC_URI[sha256sum] = "507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea"
 
 inherit autotools
-- 
2.43.0


