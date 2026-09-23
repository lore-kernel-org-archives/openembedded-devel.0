Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3B5C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4172.1790160099902570181
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pvBt1c4m;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso420374b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160099; x=1790764899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzuVRgFbfErwU27QhoMx+gfRv0ELjGjCcBmOzW7EjEU=;
        b=pvBt1c4mDfEhm4AGE64Ne5/rygsc3od8T6Udo6LaIVGEL1E2obvIgfjWlR/DiKVnS5
         cr6abVyzyYIKeU/HBwKbCXOO9oIJueYGdOhvpRq7CI8Oo4GWWH7LJjVhhzrTJWl9MsP+
         ae4Qu2dW9BwK5tPZzjUlSb/we3F0djZzzm9yWuc/WjmCFvS67QGzH8j1o05hXr71eKUl
         9+r3iQMG7dBCJBYDORZI8pdILLpkGQhhKqV+eVC8r5ILEsXfVvf0JJitpG214vKiofuV
         Gt6viUQoBXTmfFNGly7CSKuETeavWwQGja/c/ulCYktY17yUdYjk4Xw1BQWbGbRGxRuY
         kKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160099; x=1790764899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzuVRgFbfErwU27QhoMx+gfRv0ELjGjCcBmOzW7EjEU=;
        b=uNzPhYy9F/DD4ACAeVU7QuDPdcVzKJXSZMgU9LgVNf8JE6vGiJ/KsVVC9HMdYEEN06
         ceyI/v/ofkWD5eshFfRzpHCLjwkawt73mkoglF2pdDipZDpVbyWOfzU7j4XyIgBU5ReN
         lTOVSRzJ7tJl7u6k7X8k5vv38JUIp/EogEXWv5wC0buhktcGNjd9An/O+L9vO0HgWkix
         QUSUh9brIRpMCCBsrHDABmGUKlfQ9uYz4drsaZD/ZcWVCuVsTiipnOhF0Xx8wsuo7y7S
         RDk1+LXEN3c2HrHWR5y8WdwxJmNr4BxHW8zzzkBZ+Udq5MUc5CigeCqf63x0KgzbJH53
         M++A==
X-Gm-Message-State: AFuF++lxKhil2h2YipTALai+Z4CfNao3rl/XYU6jinedWE0SxpBUjX3x
	O81t+BEnUozq+nAcAHB8jbq/yLYd/xM0G2hVcwtWSPhuMamEf3zYCWq0A/Buuw==
X-Gm-Gg: AYBFou1T8mAf3Rgsn8o0CvAVRte6sV56qvYU4CZUTJA0MVBmWjC7hyorDMU9bgxKrRV
	/aaNs7tzS9kKBBEqBYQWsG20Oxkd7HD0rxuguHDbE5KEmtYGlauUHymIvBXYgpuwkbjo5FZJdr0
	3XLjaJIH/AmxU5//+2M8GlHgWNz2Bu1f5ph9fu5sN5LDj594T7D3TXp9to8tX1FeVEhMm4LAXBY
	KtBX+2DCXtvIch3u1m3GGCQCTFyoCv1OcklG5rNgNYDo0t2e8Urbe8VYir53gmogqqM00ZzrNP0
	dsjU9/zbAEJPh4BadAp0juCHQKEq247roApsfvkXE+B9u3GNwIJirbZnr02ozYtxYpFuocn4k6Q
	BSShJTyRuVoq0lx2gRYBlEok5kSIaJd0tkT+QQnLSy4+XZm0flr/8hDQrEyRUsDbjzZft0DR1y3
	7ZF/GsYH7DgJ6QZnYcHaES2/Of10XpuZFyp8+kcxcgvNtWCpMQjBt8xrRlj6YKyBMzgJb3BaFOW
	U3OEQpZ/xo04PTIU0c+lE8eyQF05q4HOQ==
X-Received: by 2002:a05:6a00:2191:b0:86b:43f6:67c4 with SMTP id d2e1a72fcca58-87d1a7aecf9mr2057562b3a.1.1790160099246;
        Wed, 23 Sep 2026 03:41:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 19/42] nanomsg: upgrade 1.2.2 -> 1.2.4
Date: Wed, 23 Sep 2026 22:40:33 +1200
Message-ID: <20260923104056.457360-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130206

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c347929f84c0aa0f7994307acb88351d787a0496)

Changelog:
https://github.com/nanomsg/nanomsg/releases/tag/1.2.3
https://github.com/nanomsg/nanomsg/releases/tag/1.2.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nanomsg/{nanomsg_1.2.2.bb => nanomsg_1.2.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.2.bb => nanomsg_1.2.4.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
index f291326c80..95b81869b5 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 
 SECTION = "libs/networking"
 
-SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
           "
 
-SRCREV = "ccd7f20c1b756f7041598383baffcdc326246db7"
+SRCREV = "e6d0b8ddfc780eb89f8f6ef305e92c19e76bed6b"
 
 inherit cmake pkgconfig ptest
 

