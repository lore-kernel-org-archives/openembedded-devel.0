Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764D2C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 07:00:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11042.1785826846476855504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 00:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fSWXKszU;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3851165a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785826846; x=1786431646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pxu1ij/XHDRsGkIKzesU59ZUX0yAuNHMemapjPzq330=;
        b=fSWXKszU2yC0eFtBk7P3LDYDCAhl5NsE/0gkZc6zmQYtg4G9IgZk1H0nApKs0PRVms
         6QY5Gh+bbEN96H5t5zCNk/s69sei9nYuR7hPNK8SJDV+HjyZgT6h4hpKpS9S1aY3eyJG
         3klsOqm9ew35lXkPvj6mCNbQkY1AHuA55DiDNkvW55jytMg2JkFV+IhzFnwrjOw/dUfq
         AsVYeu/+J2yzcSdFf4zT8V+SahicNOxMFUrpn/x/rjNLCoOhT9mkB/AlUcolWf1/Icyv
         I3LSPFjkO53ipGFqPVEcpJOAjx1Aej0vpCegRqm78ubymtGWwPnEixKB2D+xEfE25a7e
         FTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785826846; x=1786431646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pxu1ij/XHDRsGkIKzesU59ZUX0yAuNHMemapjPzq330=;
        b=JjiqU9L2qoz7f1bVMJgLEwsJoSMbC3pLbRzdgCNPYNky1BqFulvGYO45dVqrw2j+9v
         quZT7NIQMUpjYVE+mqprSVeEkoAj2OEBXtp5vho5E84C/n5OlKtrQ98PGbPYb+boTKJZ
         3OKoWYZHpOxk4WxOcrSebhG5iVyTARboZTr1B1CgDxGKzyU32D6npV9+thVXJgtwSm92
         eP8vgrafcipALlD6X1BPB065X+cvyXVts9tAKAoyRt3n619EF9u79RKbT6GxrPdTUjFZ
         hxM3tXu8I01lNX4tYDyMhoNC7oP3ictgOFBT6E/6KN1fkU0nrZYKZvgqcjJ48ElVrnbW
         xgZw==
X-Gm-Message-State: AOJu0YxMd6IxUm+hVDT8G7FMES6X0juKUXklZxIfaN27AnOZlQCzWuqN
	3hWVgSVVKyb847vM4FWkNLX0o/VU57voOdfEnkDgVWaQ8emAlRQb8iyuJhDjEg==
X-Gm-Gg: AR+sD12euUF/+4/XvfEg4zAFwbx9b5ycnsR2i/psW83UQ0lBFK6z/o2zpvw5kPSQbDh
	avwaNLjCyAkNXLUx0CHI/VUc0TZJZ/Kqc4wKl4er40VRfpUVzsGMVSMguMcyKKflQVJDfJsryJG
	EIbuQU+lLssampaBL+ULDirBS7sk8Jaw2kPcUHeNzQIo54ragMu0cgvGd2WQNEcmGLDLOOZUbYY
	UMhhxYYzrsLg+pM0iPKUPbx5l+dgINaYq6+kum3AL43H60K+0Jr00WeHpUgehGEpE1ust/e/ZH0
	XIp1xjFGrQ4RPPi5CAicKyb8Gb32RtY8+RqEgzLwdUFF7AI86dboqY9iIl6oQT7Q76gdmzKcL/y
	DZyXYiHHfhCvYxI5F7YPubZRTYp2lDYgONIOPX/s3WTqmXesqlEmhuME38edZW+kEAYDErZ01CL
	mx+ZsehJtipPsvnXW/gRa7FZyRt54/bw7yUXUM0O5NyQ7J/46YGqka+LnaNqLgJ3R25fxQ4QYfl
	w==
X-Received: by 2002:a05:6a20:9e0e:b0:3c4:2cf9:28a2 with SMTP id adf61e73a8af0-3c92a8a8130mr13551870637.40.1785826845391;
        Tue, 04 Aug 2026 00:00:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm916034eec.12.2026.08.04.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:00:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/4] python3-fastjsonschema: upgrade 2.21.1 -> 2.22.1
Date: Tue,  4 Aug 2026 19:00:11 +1200
Message-ID: <20260804070012.3171225-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
References: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 07:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128737

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/horejsek/python-fastjsonschema/blob/v2.22.1/CHANGELOG.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...astjsonschema_2.21.1.bb => python3-fastjsonschema_2.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.21.1.bb => python3-fastjsonschema_2.22.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb
index 4d8cf7a56b..082e5a7746 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRC_URI[sha256sum] = "794d4f0a58f848961ba16af7b9c85a3e88cd360df008c59aac6fc5ae9323b5d4"
+SRC_URI[sha256sum] = "0b83d1ce8d7845b959dcb20e1a5c3c8883b6541d9c52ab02cce5166b75ec805f"
 
 inherit ptest-python-pytest pypi setuptools3
 

