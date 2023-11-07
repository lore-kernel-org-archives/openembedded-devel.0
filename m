Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8540C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:22:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.13643.1699370563752572155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fF3R6h9g;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9dbb3d12aefso854069066b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699370562; x=1699975362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0n7XhszxGbyizbSNZLlpixcSvdQjlk4d0AtrRb8NeNY=;
        b=fF3R6h9gYODl7yN9RRI+Xw7Y99Rhp0HL9FxWtySyRgKFeapyVi9YeOH6wq78TfTQ8h
         XPYowlbiCYAcqv6XvUFRG4xhT/EoNaARNytPz6QFF15WZtZtKiAhwuJE/AWvYlyQUp40
         bkcn1DqQHkg1SaCLSOcQk9F6PrVOoA1fE8I1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370562; x=1699975362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n7XhszxGbyizbSNZLlpixcSvdQjlk4d0AtrRb8NeNY=;
        b=kJ5Bi7Nl7SWncrdJ9uGi8gqUYH9DT/7YEnOP6Ye0eBA4ReJFK2842XIgFDCevPan9x
         Ci56fUp+eIUU6SFWZMenDuiGx1R4Hyxtl0jpcHDUDAhx+ZcJ0d25xSbyHAbYrVJqa4QD
         j9dccQlMRmc6Itf8c6habnVHc+5OJY93ghM0EvlF4ApvU71wd1amWTsNs2qkRT+C6pG2
         nqIKifnw0KhJwhyNSuEAQZjkBAO+CwWtaJSyWp47DdTmK0Rl22in0CVYSSGzf+KN/il1
         sQqpwfgUZTANIKQejxt1RJBs7tjNRdJbcFxdzU/+qsi8d6HmUpjY+8sgSd1ytCdquDoV
         HmbQ==
X-Gm-Message-State: AOJu0YyE1srbAKoTUeOD/SNwGWngY46vJth+WT66aveqeecowvCNBLBt
	Sl51PD4yxkdpNLSC8bsJGBSu8P0dEB5owAsTZh0=
X-Google-Smtp-Source: AGHT+IHHm7mK7OaAVEuzSpFwx1GfwZ3Kd297WZW+x8G7EkYySot1HfxJr3zqP2nB/sEiybCbTEnGcQ==
X-Received: by 2002:a17:906:eec6:b0:99d:e617:abeb with SMTP id wu6-20020a170906eec600b0099de617abebmr14412960ejb.23.1699370561785;
        Tue, 07 Nov 2023 07:22:41 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906168c00b0099cd1c0cb21sm1136897ejd.129.2023.11.07.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:22:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/3] imlib2: Upgrade 1.7.1 -> 1.12.1
Date: Tue,  7 Nov 2023 17:22:37 +0200
Message-Id: <20231107152239.2219002-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106454

Upgrade to version 1.12.1:

- Fix some clang complaints
- scaling: MMX asm scaling causes segv, disable for now
- loading: Call module exit function also when not dlclosing
  module on unload
- loaders: Fix build with -m32 --enable-debug
- RAW loader: Don't unload loader
- imlib2_grab, imlib2_view: Unset context colormap
- x11_grab: Use correct depth when grabbing

Remove bzip2 from PACKAGECONFIG because for this version it is an
unrecognised option.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 9b8849b58..ceb14301e 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.7.1"
-SRCREV = "01424487e360383a039dc123bc2a345fe7ea2535"
+PV = "1.12.1"
+SRCREV = "9198db25369f04db069ce61a661c3c47b2622655"
 
 inherit autotools pkgconfig lib_package
 
@@ -28,7 +28,6 @@ PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
 PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 
-PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
-- 
2.39.2


