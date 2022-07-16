Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE45C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 03:14:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.2006.1657941278952446612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lg1m5DAP;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso7765932pjh.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UyD1JXEC4XTJ0mAhcV4bxiBufMzdMeZRZlDPkSc6T2s=;
        b=Lg1m5DAPrbqmd1+06YUBb+0nulA+UBE0XlE1GXJqkaSUmRAFUH0xTDm4FIaN/HfwoJ
         A5+UzOCSaSm3JcxsXg+n7CFfr98gpQXlvYZS0nzQXcA+A5jPMb8OF1TNK1TVlGeVZ2p7
         MTr0fVlKGccJJKidJMOaACiLRAl1dTqBDUJvh+6KQSlrYP/DSbn8s40euwjVXLEegqQ5
         fXhkpTgqBqPW2hKaHw1hSvtTeMs4Znkg7UMSFhTDMxb6egKxZV5V8YVxTvD0Q2kSnnfY
         bX3pjPngGTcarxwovp/ajNKTW0ZchaxIs/J6QWE5WcUgNeQbRFlvv0R2Fmvr/e41g/U0
         t32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UyD1JXEC4XTJ0mAhcV4bxiBufMzdMeZRZlDPkSc6T2s=;
        b=Rg3uDqIndZD/59mqZRO75EluN6g8RUGzdaPBg23lQlc4YvmqHg96j9/+iGKhgAzUZo
         u+nR+yUpG6L22OBX5qEGLVsbd32AfbFXqTQ467ooNs8q++X9uN+SCEtt50tHOvvlRj0N
         ROOoI073i1ZFsUsjThw+vULpYb035Uv9SOQxVTFcxlIdjnEXvPRp8iGeDvvLpAaclVev
         bccR8lwryYT9lgB2IZJOHw2O2Bvflxj4zAZUAeJmgEeHiyK1UGnj4aJlofyxFDbs+inw
         qAG5ex7CDNEb0OpQZP+lOeAUgCUF6CjdBxaSs2P7tMhmce3NXq+PG8l9KSeuVInAgftx
         +IiQ==
X-Gm-Message-State: AJIora99cWTC/my9bHEa5YXXlnJFZe0yblWSOfMwC/Dc9p06kIxqOesy
	xJB2ifgTU+LstnvuzuO+TIus7NUd5j97AQ==
X-Google-Smtp-Source: 
 AGRyM1ucQUvve30Zm3fsaege4Myr6SN+zi+iVozGPqdZwn3YMS3YzRtwsPMprl3ZoAFhm+IryaHJZg==
X-Received: by 2002:a17:903:2654:b0:16c:5120:f379 with SMTP id
 je20-20020a170903265400b0016c5120f379mr16926391plb.3.1657941278106;
        Fri, 15 Jul 2022 20:14:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a170902654800b0016c6e360ff2sm4279455pln.132.2022.07.15.20.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 20:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/3] catfish: Inherit setuptools3 instead of
 python_setuptools_build_meta
Date: Fri, 15 Jul 2022 20:14:33 -0700
Message-Id: <20220716031434.4021879-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220716031434.4021879-1-raj.khem@gmail.com>
References: <20220716031434.4021879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 03:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97851

Adds missing dependency on python3-picobuild-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index 98cd251d2d..bffaa1f8cb 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -3,7 +3,7 @@ SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg
+inherit xfce-app setuptools3 gtk-icon-cache mime-xdg
 
 DEPENDS += "python3-distutils-extra-native"
 
-- 
2.37.1


