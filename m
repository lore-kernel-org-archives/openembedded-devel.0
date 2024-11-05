Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADABD40CE6
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.30619.1730838884752416570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpzO5RvE;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea15a72087so47639447b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838884; x=1731443684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=531JMTTJ1/MsfWbFaJOWB3MmRx8SCu1NJLm1jyzSb6I=;
        b=JpzO5RvEZjpxJb9Tdci/yb7feA10uEfBSbpOq8A5eU7j2oCztzXOBnvUs7cq43/KAC
         d6P3ZbWkHbK+gUPjxNO+C3WIlCW+r33mVxAYNi6BlBew8L8f/kt0dmZqBNv4yhYvhR7O
         b6cgM8twJzzV7N5r2Wq6Yj6FAAbV3X5PWyz7k5HCe3U35puZQ5xA67qHhhIh8OUGG2fh
         Zu6V9gTtyVusbgsLUN1KkiG65H/NGh0Ko5XvnUJSGo517H5IzNTi//FTSgQYHxRWqxEh
         +l22wZQlZujpc5PwCoDC1fjcAWjm8ESP1oSD0aIUleGvgFbO4O/9nUqrQDGeuNpkVtxM
         xwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838884; x=1731443684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=531JMTTJ1/MsfWbFaJOWB3MmRx8SCu1NJLm1jyzSb6I=;
        b=OvxwM1BIFfWevrKjcXvOspYE+LzsK+q3F9HwRoR13ic1mo+TWqVfUbVHDaOZwu3G9r
         7PosYaZNq0f6tnNY8mk3lnjQPjXTf/qLWS8LRzGWdGxTAzOtvnLdJPbFLdcO+/q8wYAO
         s5HmT1AbUdbNYgRvswmTmY2mJ0fjZPOJPjNS08BKFAcN0nmDd4ePMrd3JTCCip+wRl8y
         emMmOjWH9A02fzo9VUToUr+qxz+iYwWTySmSofUov0aBDh+wqb3JbTwtKmHr6i2zyer7
         1nLHQcseZ9/2qnX6d3/Cp/cGt/Ry8CbwiKQyKUc2cLbYvo2jG25ElMiItZdPgXHJo6KS
         UqBA==
X-Gm-Message-State: AOJu0YwieDP4SmCROLNLLypXgjgFyjGazUoVGz0Jg+STz7zejRG+onkF
	ho90h7TD9s2NQtddkOEhCGPUuFLFF6e+xN5roNsh6R4ABFhqtdD/tAsxsfmW
X-Google-Smtp-Source: AGHT+IFfTLO1KILNiidNrA+haUwoSfwVrokvOQ+MFFoR6qrfp+6afwBLprIUNXhVHdk8+1sz+P3cbA==
X-Received: by 2002:a05:690c:620d:b0:6ea:7e37:8cec with SMTP id 00721157ae682-6ea7e3790d0mr124258537b3.2.1730838883383;
        Tue, 05 Nov 2024 12:34:43 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:34:43 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 122/161] eject: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:47 -0500
Message-ID: <20241105202827.3104-122-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113639

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index dd5489e7d..5ba93488a 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
            file://0001-eject-Include-sys-sysmacros.h-for-major-minor.patch \
            "
 
-SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
 SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
 
 S = "${WORKDIR}/${BPN}"
-- 
2.43.0


