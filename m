Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C6CC5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:42 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.35581.1749221919829631232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHv5wGcN;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e3980757bso18552857b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221919; x=1749826719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19+NH4+qs0kMPDHIYI9zhoLviQSSm6T/kohMUejMJ54=;
        b=eHv5wGcNI57tF1UO8f+6Fwbxin0oWHlC7AVBtW56y3e10Pf+3QV2F2bXAzMq5pwfTK
         8XiiJXinQjLMIBAEVOh1NmgqMVXm47mOUiqg9EMQB6zYQx/w/yv2lj7NmwuxDHy9r5GD
         wXhwaWY0Npnv9r83CAUK3cntxRCD1YW5BBn0lNGt34+kHOEOnB+3X24b0JxlBg60SAv5
         1XDY661PUMwY40jsfWugPWamj0Ny4KORBGDtS+zAcplJNV/7gV/qILgoKcnazF4QXA+N
         lr65XF/5Ie+UoMwKztiUwnCSLbpai9qDODcVb8K0Mi+PhTQf8XY5mYAcKoJ3/iWqUw/O
         PbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221919; x=1749826719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19+NH4+qs0kMPDHIYI9zhoLviQSSm6T/kohMUejMJ54=;
        b=GT5iUPesHQEf2COO4mfs0GIpvxe8jZ80/QfMfkA7+F5eJdVz7kDIB3v9rmhT8EFrDP
         GfS4YnyBO3nmaxAEbrMbh+1r81hj3RqvAPTlkABZo1Ly06QrhkpzAY464VG6ylkH32K/
         uZLOzNxoGsfueOZ+scyZeNzIlPDIkWEf68hMGjNTuiPeNg49NG/3gth7bjwDKmB0zUX8
         0SFa5jt+xc7720Ec6xGKH8jfa26suw3zyesa5UB3r9fCQbB/vvaW8ogsvt4KLhogMs7L
         bajIZ81YMfnzt8tvgNOJMo9hLklU90jJm18CjdWcsNb0wU64HUFaVzA84TE+Mi+2Gs50
         OW5Q==
X-Gm-Message-State: AOJu0YwWtDz2V4cmkgNm/7wQlfvH3GZtuv+qzTHlSt5BoW5FQmfCL/zv
	LIazAWjKqLvV9g92W5QkJT8Qw/VtMI1s9oFjKWny+TRkozPIMZlldY3dLmj5+Bmr
X-Gm-Gg: ASbGncv8LBtyfoxhx92GAcyrv7ykqRt01REEEbL+AKOLOnmjcqGin2g2Hrx2SeIWEmF
	4hRAfNF66aZdkFxWcdu/blkudCaGUdStnZesQwmgSbp4bBzbCH56N5Qnw6kB46EzwFliZEZ6v/0
	pwhRhFk1jBRXf04JSuE3gZOQBrn3vsc88psAztxEob2B+SRkoOWN7RW6+RlAxSE7x0F/sug/muK
	XgCQhiAnwfNg3eahhG+WXMd0g+WXOrbHBnntR5T4wuieoqT6NgIa6mET+E4yhWAY0O7EDQCSVIr
	Q8ytzWPOoqOFGdJ7/eHpNAm2AycuJe+KoLIHQ4OJHgDlvD3/fWVGhsJZWPDoQ3tW9nTGIRXutND
	5daC0eHYPb5Xh07hYbc67
X-Google-Smtp-Source: AGHT+IHHSHmmrm6A1nGOETSm3kSPfvB5oUzeofEyV8lh4yxmhzeY1mN/KvrKgzM3ZHTL9fhKRGdhoQ==
X-Received: by 2002:a05:690c:8f15:b0:70e:61b:afed with SMTP id 00721157ae682-710f7afb139mr31948367b3.7.1749221918336;
        Fri, 06 Jun 2025 07:58:38 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 6/6] xfce4-time-out-plugin: upgrade 1.1.3 -> 1.1.4
Date: Fri,  6 Jun 2025 10:58:05 -0400
Message-ID: <20250606145805.164173-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606145805.164173-1-schonm@gmail.com>
References: <20250606145805.164173-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117770

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-time-out-plugin/-/tags/xfce4-time-out-plugin-1.1.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-time-out-plugin_1.1.3.bb => xfce4-time-out-plugin_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.1.3.bb => xfce4-time-out-plugin_1.1.4.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb
index 1622cd4d2b..f68b051e4f 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "5a1ca36361e95ec718bbd887ea5be6a270ab458d1c2d672186721522a7228ee8"
+SRC_URI[sha256sum] = "b6b708900d7fd0cc3d8a045514962db94b60d959c266049aa2cff768fc381726"
-- 
2.43.0


