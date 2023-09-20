Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A7CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:41:24 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.32834.1695199277753236836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 01:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tu0cWWy8;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so901228766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695199276; x=1695804076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8q2QE/FTCPjZoss5tbe5AfmZtAEOI3Cb539GOlGHis=;
        b=Tu0cWWy8PXjHn+22JXNtB5qbksc8FKQbCxE7u5l5pFZ8Pb0GdwWv87AMgpiojoVy25
         ahsb3dg4c9rP+Z+cfEYqoBkVW7Wv6MHTTW+ndl3Wqx12/0sCEV0yrhAIBr4T1PrTdgi4
         X3AKOjTlKeeIEaFwYlPJYzijgG+T5HERd7NQIl1/HZrz7v9JNE1qEeZYgN7RfsPxhh98
         oDWuKNDdnFwrK/qv5WMD2LqdmQSGxOJHaiRIctaRR8ShkCaIwWOYcztU9RSprHxSGf/l
         9AmsRoAM9QHL09HH7MoqnucEwG6OoeP7fkYsQpgb2q0pZPPxpl5io3sd5mJV52gX7ld0
         +UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695199276; x=1695804076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8q2QE/FTCPjZoss5tbe5AfmZtAEOI3Cb539GOlGHis=;
        b=SMhv9eEAhUE80BqSybZ4bjzJke9/XGzDVgsAXYeclEHVw48uNTdqq+QC2MCX4IQfTn
         1qn1CdTikcNbP8e7v71fn1vfH68LMaN4wYQncLkwfOzpV9x6MR+XNb+tFu3cbelT1uxN
         XI03BDGAIFrTN5r202gfIYOmIEBKnbUX4BnNb2jW9mScNWKgCa6b/pBwlXi67CJpR62b
         X8ELtsZAVjel29w8qb3eiz71WIvouSEPPwsMzmSZlUexq/DlP3CCHJZLIJgcgIA6ov9M
         kKqJSB9K+DT+bik0FmxSxgjyzxTiXFkcknmQK+HdbKyqLWXMDx74vCN9v/ZjgG5pnroa
         LLsA==
X-Gm-Message-State: AOJu0YzO9kNzwIs56D4sWcHew+lkHPCz3oF8dY9/xGc/wM8Vm3wXapex
	XSlbq5S1aiDcLyEVNE3kJEOBCIse234=
X-Google-Smtp-Source: AGHT+IEvnWSZAk/MKmgP8xvzVdZ+u+e7RHFSkpRtKjssPYWfxmCOk0jvEhRnjeQj2mIoSIkj3+V3aw==
X-Received: by 2002:a17:906:21b:b0:9ae:3ee3:dc5a with SMTP id 27-20020a170906021b00b009ae3ee3dc5amr1393343ejd.73.1695199275812;
        Wed, 20 Sep 2023 01:41:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d23-20020a1709064c5700b009920e9a3a73sm9018720ejw.115.2023.09.20.01.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:41:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-multimedia: restore x11 restriction for projucer
Date: Wed, 20 Sep 2023 10:41:09 +0200
Message-ID: <20230920084109.2448802-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920084109.2448802-1-martin.jansa@gmail.com>
References: <20230920084109.2448802-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 08:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105007

* it was removed in:
  https://git.openembedded.org/meta-openembedded/commit/?id=deb11a823c32d4090b3724a589641810e06df6bc
* but still needed as shown in world build without x11 in DISTRO_FEATURES:
ERROR: Nothing RPROVIDES 'projucer' (but /OE/build/luneos-nanbield/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
projucer was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
NOTE: Runtime target 'projucer' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['projucer']

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index c520653761..fddfd720da 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -44,7 +44,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     bigbuckbunny-720p \
     tearsofsteel-1080p \
     pipewire \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "projucer", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
     libcamera \
     vorbis-tools \
     libopenmpt \
-- 
2.42.0


