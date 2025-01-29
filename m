Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB7EC02196
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.10682.1738150844859758935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SQMvEV1q;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43618283dedso70575025e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150843; x=1738755643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmon5yUJMX2KGk5RzXdT3s5wcErRM1Xhyig45CB7NZA=;
        b=SQMvEV1qhuLUCD4Ow20RKVRgu9o/2OxduClBcapvXsYYOSUrQmJnBhWAZs3cn5SW14
         wbTuO6glqpbmobxEhD0Wetc946fSorYgk55yDit0xKDhyA1ErnjIfdssXs5k/dDykjNv
         0F9WUhh+H+rFRvlmztNuuFj58VX/ic1smZLs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150843; x=1738755643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmon5yUJMX2KGk5RzXdT3s5wcErRM1Xhyig45CB7NZA=;
        b=jprE3vei4Nu9yH+WXqpajMP376HvnWaazDgoHvnoQ/J9OZanCJs8ngo+v5PO3XRe24
         aUCdWMTBtoYE84wTwba0fNnr81M4td/E8Q6OpabS7g80SIG7PcZ/yLiBduRmgDXFZZ6I
         HVf3UItw7T722MtzmWBSzv3ylZOlx3UZrZfYLNkwj1zFBObdt/TGKUFzeDKSnbdu/CLz
         HxezhMocVSXcJBU5idB/zlXkv0iOCgznfgztaOewuFsLQRagy8UbVTbaXYD5eaYYGmd8
         V27DyEZAkRQxQc6bfZKrfd0wNGhptWnNHGq7DucuJDOfm1hzkdkvoTMWBV84B9kulBFO
         7gNA==
X-Gm-Message-State: AOJu0YzGO4vViJLfJpnhh6a7GNpLzM8TGdaGQC7+5pcCcH+w4M1/pHce
	M02NEhkrT0tfkjxDxX4VYUSbjfhVcfMko0oTUx19bKmx7mbxuv7qsn1jebqjZbZDPQCCINF+bk7
	0
X-Gm-Gg: ASbGncu5/LbqpBbZkYA9Z8B8TKh2Tft1ERJQO+lQXCP6HHlOyd9geJMrQ/1wH62I75V
	Y/v8TFq7Plg09msqvmbIIY9AgAYK+PXx/pms3X4VJzqSISRBFNBSzMLVVkFUpeVIKZL2PtUWFi8
	jmbSiAEOSwd0ylAB8EnbDVQ4Mnl7R6q4AeghBES2Xrft1SV28DJhWEghxm6vwD5Fb7pVy7m/NUt
	4tX3HLUJ6AacbyVnqZSIMb+oVNZ6ZpB44dUJqopKnWbIsDcl3c8d4987pgJAmSyS1F2U7U/ZXQ9
	hQ5bAsqiNvWuY2wCxtR/ddnT2rbUwA==
X-Google-Smtp-Source: AGHT+IF/4WExlWejHEVBfm7qHZBJW63eSeqpHCDW/5Cq3oc6KCV5XJ0RXA4zo//qxxhWLlCoFDdwKw==
X-Received: by 2002:a5d:64a3:0:b0:385:ddd2:6ab7 with SMTP id ffacd0b85a97d-38c520af7f9mr2192150f8f.52.1738150842952;
        Wed, 29 Jan 2025 03:40:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-annotated-types: Add native and nativesdk
Date: Wed, 29 Jan 2025 13:40:34 +0200
Message-Id: <20250129114039.3562870-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115132

To build python3-lief we need python3-pydantic-native.
To build python3-pydantic-native we need python3-annotated-types-native.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-annotated-types_0.7.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
index 7b1bb11a1e..79e26e7ae3 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
@@ -14,3 +14,5 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "python3-typing-extensions"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


