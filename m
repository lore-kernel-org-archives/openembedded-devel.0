Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CABEB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:11:04 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.48318.1691773855894138214
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 10:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Bdr+Rk3c;
 spf=pass (domain: underview.tech, ip: 209.85.161.48, mailfrom: vince@underview.tech)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56ccdb2c7bbso1672977eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1691773855; x=1692378655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NemHSfRLn9oUL6Do7e7olUMm5HzmYtfFu/XBbPOGLM=;
        b=Bdr+Rk3caQ69aGPfzyXS5mtGGCTxt+Me30Xi6yAlwijAY+tBr98QllOd0ONVpGoQsu
         CTmaZjGpqeTE3J5nYLXKCubL/6hHbGJUKK/o225wU1TNZML2Urhc0hRoGZ4eMRPRXkjs
         GpnKXn3dNvCaqDFP3MfrrALl360Y5opINT4ZCVyk+2hf/c5Musvis2mWogCynNXYy9hD
         eaJ8uBkuaRNzEdktEaMFRU3tzWF4OcAfSZy+FI7s+N5V7RcSeh62jde03lgh+3Qk0PyP
         f9nYj8dP13BgQKqzA65V7AuuGjGnkEbn9iggLBYDKAByH1W3GbmCeHL/9JtpHeo8N0ZW
         cdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691773855; x=1692378655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NemHSfRLn9oUL6Do7e7olUMm5HzmYtfFu/XBbPOGLM=;
        b=CeP6F5kSGZs9jsMm7EOfYoFuz6minSDlpgov/RIdtAJkMNR9D+lo8ivQ5zaZeDVDBM
         D9/eVsTnNdWwZEK1Fj2zxl5Wv7+ewVqWLsnC3VMEIvf5JZZEPJZqLFg5bKDxmIJz2vHY
         WIrNMO4MAQz2247gA07KrBmS8peyMNYr5e+vsXrT1W2ZRapFiw2ns3gpdu+MPNFKXLki
         yyBp31FZD09Vd2xUkFaaarzJfl59mcAJ1e69eIYwbnHmyQycBv34TNSNJ0quOT3LuBWe
         4nfLESB7H42EmpEhBDAmNWxL70FnPFxpX0OUHhj+lxEoFsrt/krMqctHofE1f4IQBTvx
         RMFA==
X-Gm-Message-State: AOJu0YyXBFZsDTyo/U8sRrC3i9091O5vlBjAitIv9v5FqsV5JjyhVPxk
	p0hi3evUY6PRaEtiThTEBBzZPfeeGfoNKosaX6U=
X-Google-Smtp-Source: AGHT+IG6cOJ/g3j36waFSiD9nPlJq/RQOA2n3logc98g3B0L096FfiUM1wG5PtlML6AKlq+cuwtxSw==
X-Received: by 2002:a05:6358:9044:b0:13a:4855:d885 with SMTP id f4-20020a056358904400b0013a4855d885mr2567264rwf.10.1691773854820;
        Fri, 11 Aug 2023 10:10:54 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d00:a9b0:105b:eb51:9187:14cf])
        by smtp.gmail.com with ESMTPSA id r25-20020ac84259000000b0040fe0fdf555sm1293717qtm.22.2023.08.11.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:10:54 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [meta-oe][PATCH] cglm: upgrade v0.8.9 -> v0.9.1
Date: Fri, 11 Aug 2023 13:10:26 -0400
Message-Id: <20230811171026.578594-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 17:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104341

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../recipes-graphics/cglm/{cglm_0.8.9.bb => cglm_0.9.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.8.9.bb => cglm_0.9.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb
index fbd267b16f..603ebe48d1 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.8.9.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
-# Tag v0.8.5
-SRCREV = "c51040cd4139b628fba2a0e6751ad4aecbc0c81a"
+# Tag v0.9.1
+SRCREV = "cdd4d0e83e9ee79f73aeb0a4fb60b4abd8ecf947"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


