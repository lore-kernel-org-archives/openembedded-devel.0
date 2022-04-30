Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14596C43219
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.25728.1651346344972005070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AGAL15nk;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 7so5020226pga.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fx5eACS0HJ0OKfRMKDes3eRFsG7W3ujd7zkBS0gN+aU=;
        b=AGAL15nkItiSwM98g58ypqaPeoPmIteveXF4umQg3F6KvaqEuXFKtl8Sa+lJPUAsb9
         8J+A5aSy0KqlyWlQ6y7u2ycKxCb1SbwyE72nyYzD6lY03IfVI9otJtzkZWFScyk4mlGN
         R3w6R2MEmqEuv8JGkruIPk8oF6qPZ1KQ4dYjqN6ABRS6xuCDMC+UlzAP9JurhTgRvPqa
         xFwW1STLSA7xOH8fgSiTSjxq7jmvfFAY75Zj3sNz7dv5hYTICLyFjVN13tmuPnnEDGxe
         HTwWIyayN0t9hJ+4LOUJJ7XAut+1mtPnLd/7y6op7SIRFwC/f8mNvM2Q/l+BVAqf2QNs
         xXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fx5eACS0HJ0OKfRMKDes3eRFsG7W3ujd7zkBS0gN+aU=;
        b=D4ciwGquIvPnDt9SzgOadCaDXu/ynt9Wk4lA5ytSvt0F7NlyUsyKtlv/pWqgdygbgL
         Cf0uQ8pG+0sX/Rv1SCOpFoFq9+6XPF/cn0GZAOcFLpCgNNAXXuMLI5ExPsu3PeZHi3M0
         aUCg9uylmr+12XkhZxh+WMaltYQgoISNiHlI7S8Y3rY2cOx0lsSkaq2B2xG1vbNDrG8F
         CGJB+gQnrf4GXTiByOL/6vs+24UU/PwBocDwNuiZEk/nuA61V41Wwc15pMGPez/8hj+w
         0zTLIPBqUQ/8mlvTK/+z8tEOu0wfLgiiXfMSCIPMy90Mabl28XIdcZ35vxTG3Dt+tfI7
         a8GA==
X-Gm-Message-State: AOAM532fSHi5tOcjdVc9Dx/iAOiJmOP1qdTELidDp3EjZaRyxcS1wVbv
	NH+XSWd3PveOi3HAhcBdH4/m+4YWo71kqw==
X-Google-Smtp-Source: 
 ABdhPJx9OvWoB3ORfnv5k8ZG6e0KKbAJaZ3Cb/RaOiqNRGoB/Aq1kUWfuPyaCKDhxuXAW8DyVPjapQ==
X-Received: by 2002:a63:d906:0:b0:39c:c4ca:32b1 with SMTP id
 r6-20020a63d906000000b0039cc4ca32b1mr4048502pgg.408.1651346344202;
        Sat, 30 Apr 2022 12:19:04 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 25/39] libencode-perl: upgrade 3.16 -> 3.17
Date: Sat, 30 Apr 2022 12:18:05 -0700
Message-Id: 
 <3a780555211262c5aa971bf9918980a7de88900f.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96892

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
! bin/enc2xs t/enc_data.t t/enc_module.t t/encoding.t t/jperl.t
  Pulled: Fix Issue #144, spurious warnings from -Wc++-compate,
   and a few related nits
  https://github.com/dankogai/p5-encode/pull/168
! MANIFEST
  add t/utf32warnings.t which was missing
! t/taint.t
  Pulled: Skip taint tests if your perl was built without taint support
  https://github.com/dankogai/p5-encode/pull/167
! Unicode/Unicode.pm
  Pulled: fix link to Unicode standard
  https://github.com/dankogai/p5-encode/pull/165
! t/Unicode_trailing_nul.t
  Pulled: Use note() instead of diag()
  https://github.com/dankogai/p5-encode/pull/164

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a21bab91bd8eeb22aca87dd93d5499ad1e481450)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{libencode-perl_3.16.bb => libencode-perl_3.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.16.bb => libencode-perl_3.17.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
index 8d239e7e2e..8b4f292a35 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e5e91d98a97de70dccecc2a25d049a0b5f5f12228c618680020d73043355294c"
+SRC_URI[sha256sum] = "b44cbf7dd60ec6128ec575dd348484975086522611bc7580cfd305a095faa6d2"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


