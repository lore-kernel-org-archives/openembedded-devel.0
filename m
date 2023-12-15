Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484D2C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.66297.1702656069041647686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Rvpr9heL;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9fa2714e828so101289766b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656067; x=1703260867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/f60vShS/IsHkpuBqYkG1GN9UILo4Cg/2tsrUR8WK4=;
        b=Rvpr9heLyn5uhd5I1g5zc5pDDN5CGN6e9yl2JP0Zaofhb+lP5IfV15Lx4Go2o7oxHh
         3IU/v2mcM8sRX3DtATlQUbnKRnuANs3hO6VslKvyBC0G0Q2Kro4+njEZUudMPnUk+RY3
         7UgJ9DWQ6E/perpR0wjlrCGmyotMhnOH3ZW48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656067; x=1703260867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/f60vShS/IsHkpuBqYkG1GN9UILo4Cg/2tsrUR8WK4=;
        b=n4om7RW1xkU3K/N+vMoTIPULh7nbt9FHFnLdrx+tn1YkviJQPCk6YOLlOg4UF7Mclr
         Wxtew/FpfgjT6Ms1gYVzpAu8fQyvAtwX0ShO3gDrKFNyECh4v4MarLJ+KV1l+LacIaSE
         71/7ixavT9QDoV0nCLpTokrAmy/b+nW7gQNO8kE4SxnNjFrRJZkfgmTbeCABWfl+F4a3
         L/jeiJhS6PpsfRLaWjmfLiQqkS553af0yqlAuZmuqwMV1p/aGWED/agzkwa4iIDnTuG+
         uRjtosPmUlL8+TtzeoXMEfcc8RcwD+soHaHeZ8Dnu10WmVlSpiXDBrh5f6L4nXeFRww5
         yoWw==
X-Gm-Message-State: AOJu0YzP4lFwjPTVOPxNpUMql79I4bjkTjFq6MBXBucDkMgPpEzAgq3J
	d4amjJp/tYMsHG/4reZRC6iA1LdwYExwJwX70HU=
X-Google-Smtp-Source: AGHT+IGe1/7RUSP4xE5KHfHQgvO04y40vOEkm0Anz2P4lTpcUHY4UxvxNSJFhZp06F/yEDjXH2iGrw==
X-Received: by 2002:a17:907:3f22:b0:9fe:ebb:b2b8 with SMTP id hq34-20020a1709073f2200b009fe0ebbb2b8mr6686820ejc.68.1702656066761;
        Fri, 15 Dec 2023 08:01:06 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-expandvars: add recipe
Date: Fri, 15 Dec 2023 18:00:58 +0200
Message-Id: <20231215160103.2164505-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107522

Add python3-expandvars to expand system variables Unix style.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-expandvars_0.12.0.bb                | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb b/meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb
new file mode 100644
index 000000000..6183c310e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Expand system variables Unix style"
+HOMEPAGE = "https://github.com/sayanarijit/expandvars"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b2e744064bd184728ac09dbfb52aaf4"
+
+SRC_URI[sha256sum] = "7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844"
+
+inherit pypi python_hatchling python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


