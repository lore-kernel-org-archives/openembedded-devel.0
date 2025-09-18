Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB77CAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:16:02 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.11319.1758194156828718606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmqAWrsl;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-772301f8a4cso1225569b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194156; x=1758798956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=OmqAWrsl2ifgfLhDhb7LcMzM9W0XBc/epqxv4o0SqJ7BR72brpHFMR1uqAoJ12jBLv
         RNJsbHL2Z06FZzBNhk2FMPSF1FGlTw7ATHqR8S8Iio2BNBqAh19ouRkgeokLLd5tNfsU
         6dfGqm6s0JZ1ZEO4hSigomandDIQtlYXAIdqvHdv0qySbckkkfN0ojVImQdTxqvkssf3
         8S4x7ourdiuw8P60uqem81rIWG8a+tATNom6bwhaMlA5wmVOKRy9uBmRg7LswwWp813M
         nUJ5sUdIZPsBGLoRhjQyR0MP7LGFRhGri0YaaTHzNrmQAukgC46WXUPcwJIpLv32/CeS
         HJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194156; x=1758798956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=ZCz4bePgV41AYBOG2DifjeXM12Be85jIg3ormMuHy5JSHHAXVoDgRiV6s9hLu3SEVX
         1rJR1yWfY2MR90BX21HqedqnRR+TKMR77VGnwgQNmiMnMl4SWqd82S1gB+7zDonpR5Mb
         5ZdLN1Cy/xI2P6gxSj4h9IT8RLz3a16UX/jcezja6faQWT8ZNJrR4bX58fuhd1lnGGbI
         O8QHYrO9c+dAT6wE7XYtFkWpkNA0j2T043I/urW3z+VBxFRsoxxLlWA6Ik8/FnBDRDgP
         W8Oyced7oFHdLvdyoQyrQ/uqfpC3a6V0LZNHVueUtreFqbDQrgs5qkEGObqhMJr2J3ip
         h+bg==
X-Gm-Message-State: AOJu0Yz7ryxYBS2YVMEnUj598yRTnKf1TPwFTM6HvVdp9ShV/SD05JRY
	RFlHWZCy9T8jO5bqV/WWk1GA9yUmsYa3rsbO2AIyCadZhsbyLHazZHr89KUh/w==
X-Gm-Gg: ASbGncvLQPgyWzpG4FobCxrOZiOLmh0NS1gBiTNsvccUqe+spbYb6I7/yx87tcnhPpR
	k/3BWNCQdV5ZWRRHkLgMZkSJIJ28jfiScUdgQOUPMoPULo7ToIX5XQT+2txvYyobeFZcqoF7gSF
	782HhejnEOo8mdvHffegwMUwRnA4ewrdc6nqkAUeVmmlrEjIofybP4KMfWG7w36Cv+8T6vtQsFS
	p5iH0jzaIsK/Kwpk/pFiMJMT8pJt3w9bElEeakeYVNpUCptOiYO5UittmKBVKE7tYHkTmEWJT6R
	pz8Fn/Tm4KycKD+3QEC4MhF28G20x78VJynU9fLBBpVQ26+vD0K+RVmFN/nQCVHrZt4g8/OiLsG
	+Jo7Y6eILPurKQLfb8QyuAu5ZQgSIkN3UGONYTucFy3OMfuM+0wTLoClBZHLIdHp0LuOjiy+B9A
	==
X-Google-Smtp-Source: AGHT+IFd+25kqOCl8Mtls+rK7tgp3JWT4MMWmusUEIHcNEh4/LJMig2BrxZ8UZh+twKEBDbH/cVbVA==
X-Received: by 2002:a05:6a20:729b:b0:262:7f60:d757 with SMTP id adf61e73a8af0-27a8ca845d3mr7443149637.11.1758194155831;
        Thu, 18 Sep 2025 04:15:55 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3303ffe611csm4070220a91.9.2025.09.18.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:15:55 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][walnascar][PATCH 2/2] gutenprint: 5.3.5
Date: Thu, 18 Sep 2025 13:15:42 +0200
Message-ID: <20250918111542.717014-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918111542.717014-1-zboszor@gmail.com>
References: <20250918111542.717014-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119559

This fixes an installation error:

| make[5]: Entering directory '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint': No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (96%)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
similarity index 96%
rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index f90a123293..82953b798c 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
            "
-SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
+SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
 
 inherit autotools gettext pkgconfig
 
-- 
2.51.0


