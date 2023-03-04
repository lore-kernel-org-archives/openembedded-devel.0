Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C228CC6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 07:16:13 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.4707.1677914166611751241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 23:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aj+aQC7R;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y10so2852761pfi.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 23:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677914166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddv+DwheXY0FomqWGgcW1z/dyf9lcjtO7fispvxB3Uw=;
        b=aj+aQC7R8LyZz8vybVPHDMnufy8hCuesHHYugxxPItMLxCNHvdPs/LGVcKqYMuuZ5Q
         JxUBXPXFK3o2DZQJGUd5S3o6SqXo7ZfMBBHXv20rpJkBkfswpXdcNDVOOeJ5xOKq29CV
         JoR1NMnuCrKlNUxLHrwwvcfEjW3vD7XGpzQHDJeK361FHqh3FQya2maG4u28phn2i7xJ
         ulu3LGknIaBmb7GsjtTGxN6HT3tKZScmRRd0kDQZ3dTWM8lRlEcqRdkYkwCIfmTaI6BY
         jOWE7FwEX6hyE6ejeiHxFKTqwmJ5z3mmKqpVmCtHViwj3ZLxaoKMZCVDoR30HILG4Jok
         UDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677914166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddv+DwheXY0FomqWGgcW1z/dyf9lcjtO7fispvxB3Uw=;
        b=yIk5prnipiTc+b5It5gGGoSI5OEjgqY9daCP2CaVG3GmGCg6FxhRADxq+0Aw5lar5A
         Hsi/k+Z526nBsS7XLIsPgc0tdBlLwO/Uw7/ki0pJyDL1fUErc8EMhDE8pqpxAXovoY2d
         ltoMt0qC4X7xXJluZvFvcGlsn0F5H/TAh5vRr70pd82y/vvHKrjcN5RDNW1RkAlGlJ4z
         E+qUkLheFANhLbbfntzVpUu5Ql7k/87UrCLt1hxnP6RNryD4GfBUBg7feSRGNUU919zg
         WLBWBjYflTOr9MQlKGwfJHP8hPECEMDTQ9Yur2tuXFUK1Ivtmura+Wt9cJXq8/g2c4ez
         QQSw==
X-Gm-Message-State: AO0yUKVKXm3Lgvru7Ilae/ARVII1NBEBR3qBhrAnO/oGL2Qw1RMxO9aH
	mu8kyD71d/qoI3Xih6dxgUolVFN6vW0=
X-Google-Smtp-Source: AK7set8VowVEtquE5OWukqgjR3os+PHL+I0fk2kg6/mhbtPXmqyK3vdcfTJD/mAawXcnQCPPDrV/zA==
X-Received: by 2002:a62:1c86:0:b0:5e3:a299:da83 with SMTP id c128-20020a621c86000000b005e3a299da83mr4167141pfc.19.1677914165637;
        Fri, 03 Mar 2023 23:16:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79151000000b005cc52ea452csm2672373pfi.100.2023.03.03.23.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 23:16:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] gegl: Remove openmp dep for rv32 and ppc32
Date: Fri,  3 Mar 2023 23:16:02 -0800
Message-Id: <20230304071603.3898663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 07:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101354

openmp is not yet ported for these architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
index d5291711bb..7fe64a9bd5 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
@@ -14,6 +14,8 @@ DEPENDS = " \
 "
 
 DEPENDS:append:toolchain-clang  = " openmp"
+DEPENDS:remove:toolchain-clang:riscv32  = "openmp"
+DEPENDS:remove:toolchain-clang:powerpc  = "openmp"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-- 
2.39.2


