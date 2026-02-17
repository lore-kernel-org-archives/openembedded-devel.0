Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7B8E909C7
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14903.1771342916233666625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pyGo7BZf;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.216.65, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-354bf10f057so447156a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342916; x=1771947716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnNxW9ipylybmheKrhwpAZf2YijYzKQRYs8ls7m7FHw=;
        b=pyGo7BZfOWdb2K+sr3dLhREkqd3wBJHKOS6sonARJy7jX/INo8ajdo/Ng6AEvSXt1S
         0wPedbazdSvAO+gRUNURweCcPe0CPZ9BAHg7P1B+cp0WdU1zEphmok9vI9sp28PmYNLe
         jAN0lB6p7RruqcNTjSv2c2G2m5BnNbejGHQdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342916; x=1771947716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnNxW9ipylybmheKrhwpAZf2YijYzKQRYs8ls7m7FHw=;
        b=I0eo3FeTLy+kkwp1xE0etiT7UhQ7+3ai10vx2BgyahJQEKNKBHQLWflfErZAFffItg
         HuebAGrwwkaNjh5D/9mocz99tIpeGSPuzn7ByD4r/nYNLtmnqKznjCafzKRHZ8byxhKn
         ypFnYfUCdUHdB4dls5cXsI3pQYnnttkRr1lp1boqjWDI/Q6QyHDcAjWu7StzJOChGLLt
         FxtI6nG1q37C2lzjbLAWZHBVzDPLVYljrbWhR5sgPgZKsDlF5T1dfL/A8WuAI9TGzZ6E
         dpmxpL//xuHqqqaRNxXkXAPOQpH9mEBSAVDFGkxnz2ROzb/zte2xhPAIh2ljXdDGt3Tv
         8mTQ==
X-Gm-Message-State: AOJu0Yw2hAZvYpGfIWRYo1BFWZMOnB3JTBsV2z2+wB1wcSAzSNZcQ1pJ
	Y0x2lh30gRugojBsPFpmAyaXQGjJVxbHRwkzSIpb+HiPrCY2IAVXWJ8O5W+2NJy/5Ta/msniVrp
	jPe6j/xA=
X-Gm-Gg: AZuq6aIeDwGG23adBItwmm6zsr72vi0t/390vyRJq7Ro8TEwZlonCla1eLf7IhW/Qaf
	qJpwxD7KHJlH+hHoH5JEtAOSZRnLlJ8UEjU14ykbw+6WB3nHUR+ctypvpclQIIJnoZdMskaGOLK
	5NY8cyYoufdqXs5OLhBpo4oS35sMgl4RrY8L2Xc8cZPT8tyTg9F6znIkmjMZ7jLmM6G7L2Fb0By
	Y47PDPkQDunGdkKCSJJUS9Le/JGnkaxc1Dnp+GnqoQW9wb6dH9u+jt0GJarSuJE/DEt3rNDnBdu
	I1KPuBUthL7LCTIX8CmjYQ+CG8FLDEA8K67q2LTLYQ6Wjy0J+Qh9xQGAybMJ0phOZnCv4b0Hgug
	4MR+t/LodQQr2i0hPTk8PQMbMrT+SiNKQCIcvIxqVFC7TpXM2UiQwqJXdig/eBPpklOT5AW6POc
	3sJlxPgjpZeyPY/BARQqymb2lWvY1+GSqvNy1TdSpPzsmCBZnYwPg=
X-Received: by 2002:a17:90b:56c4:b0:341:88bc:7a54 with SMTP id 98e67ed59e1d1-356a7b0c16emr10382634a91.7.1771342915672;
        Tue, 17 Feb 2026 07:41:55 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 7/8] libtoml11: add a BBCLASSEXTEND
Date: Tue, 17 Feb 2026 16:41:43 +0100
Message-ID: <20260217154144.713423-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124467

A native version of libtoml11 may be needed for recipes such
as dnf5 in the future. Add it now.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 5815a5e574..d31ca06e77 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -32,3 +32,5 @@ do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


