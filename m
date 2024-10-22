Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F43D2CE1A
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.21935.1729612076901706063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTnKcbTM;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e35bf59cf6so63572327b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612076; x=1730216876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3hY5mjJ0I4nYW1uOJehQfMno5UIjM4odn+ZSB8FkCU=;
        b=DTnKcbTMPlyaDAl++iCZ3xHlmiEEUyFB/Jx+cJaIbmlyNuIcgyvMc0lD721MAQRZZp
         Tu/mdcTzdNOW/0VsUuV8tJbMZ8ulyo8kqaugmycwPLFnHFsS44e73qcI6mOsQK1sYsB1
         0Mh1FqRjLqIKCJXiiBh0QePVUJX+FFFKTwKLdTKwrxNpaENjs49s9HtN3nY1vCZMmGMC
         pD8uik+zYhLxIN3dnDfLlumUbiFwgNSzLFkl/baMnRmCu3a8T98jceHukhghSZqjoC4A
         CS2BSFmJiWtlrPseIzJSYmyyAo7lr/3ApIzJXUb4nn3CLNwIE7G8MBwHagtA+Fax5MGO
         o3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612076; x=1730216876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3hY5mjJ0I4nYW1uOJehQfMno5UIjM4odn+ZSB8FkCU=;
        b=Siq3A5WYsqGC9UsMfLB/FiR0pe/JVGuhjRefuqeeHpAX+C5lXnp5R3E8T7v9RMpfI5
         o5chuIA4GiZujt+sMAqwjP+cH4ZnYPNkzX1/GdWU7gxhLigylC2wTV8fqctTYvnVaPda
         9TW43TL8E4OtG0U/14evilGPd93rHwjZGfgyzVu/p5iu+1vsOeVeyNs7J476ZnTjt0NK
         SRGmh1o8zts755I5d36JQWbfHDTkR/D+eiw47tfsL+xQ70+JQ6P76lTcTfBVSVKV8Kd9
         k6VxfrVCuXv7vRBgBjaaEAcyJupKixPIYtergHmZG+tA3NcxNZASAX4r60+qF970bp+z
         +R4Q==
X-Gm-Message-State: AOJu0YysXy1ovIGbj5jwDje1FRN5Js6iXUNz7KmoATL2iiXefXUOjhJl
	tfwd6m5tvdEVuJI5kVRNfa/vnm0iguNm29NcEmHluxGVak82yP23YD4vhQ==
X-Google-Smtp-Source: AGHT+IFhr2QW148cAaOupXwjlR0kU55q2hmiun9vyuaQbFiTZkxMq67w0EPbpQsgF51p0N0Sfl1C4Q==
X-Received: by 2002:a05:690c:f15:b0:6e2:41fa:9d4 with SMTP id 00721157ae682-6e7d48b5534mr31761197b3.15.1729612075555;
        Tue, 22 Oct 2024 08:47:55 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:55 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 02/46] adduser: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:20 -0400
Message-ID: <20241022154729.20331-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113093

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.118.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index 3ac2211aa..431b41a2d 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${
            file://0001-adduser-set-default-shell-with-sbin-nologin.patch \
 "
 
-SRC_URI[md5sum] = "44ba2475ebdaafc9613236bdda321c97"
 SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
 
 S = "${WORKDIR}/${BPN}"
-- 
2.43.0


