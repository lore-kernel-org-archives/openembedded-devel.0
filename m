Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C24C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 19:37:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.48621.1701286668070885372
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 11:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TRuMxrGZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-332c46d5988so103830f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701286666; x=1701891466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpyIfWmfE34Sa3u5u4sLCA1JrB+wd2cCwZBJ8ebgAr8=;
        b=TRuMxrGZEmM/D6qsLEdOg5yUe9wtaac22NuPcEO14pg/2O9v/JlGqOlg+jqkvRSFAH
         8PBp/fqFTMfvi/5iYbtWL2VaIWmfOAdqRxwucOTOI6rnpcRB8BO20EphL7yqW3fTbIGN
         1dv0UypGfWtKj/NpaTuYtcqtDi28qS+G09XI22iuKRgSMLEYEwZvpW3x+9tOShOL3hUO
         jFkM3orYWeDMNI+AtrzBKcytU0LKvZVJueL1lSpnQU7jLwYlp01ADKZ9S+Ri7qyARcRM
         f8nUP+ZyRjkBL+TjmIVWwbKSUMJlCnpaqoyGSS+jMUMPzPyESPKPpjhogDpSpkotoP2j
         WXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701286666; x=1701891466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpyIfWmfE34Sa3u5u4sLCA1JrB+wd2cCwZBJ8ebgAr8=;
        b=YUz7Hs1PctgFf/I8GlB6ZGJ09oiiUJpKSQSkG4/6Gvk6M8KixDiDbIx4QoYJVUXxbP
         661MfopIUd96mepkPbYvFopddObjjT2mRTubbSzpo420ywnp+pJ08jbFS3VqXCiUv0U6
         X3Bp80vQGW+nl08R3TTMBQjZLqFKHoazRLWBSxt5Hj1epTl8G3yyCiQ5xrIs+hNXp6mp
         n1stJSU7vqwD3EbHKaHgR6+figzCQODP90CkWLgw5tN5C6/XGl8Oiac7zBh6QbHLERsC
         TX1TO5l4aawdHWsKl5554wXTmOdOLsKU10C47PEQjg1lzuZyIbnWImc+h6iBfqXCf5b7
         ObIw==
X-Gm-Message-State: AOJu0YwBkd4ILW+uJtQdAByTKK6tdRYq1IwyOfe7byAVVjvyave5f6JN
	eQ4aAUKigVjgJCA+FrBKmpBH2gXL7mProg==
X-Google-Smtp-Source: AGHT+IE2qzP32lvHEBSRyWjSr0a21trHQy44gmHR+8A23TiVgXdOPoocoRx/ZlSvmn470YJ1XY0RyQ==
X-Received: by 2002:a5d:5591:0:b0:332:d28f:e953 with SMTP id i17-20020a5d5591000000b00332d28fe953mr12367052wrv.42.1701286665675;
        Wed, 29 Nov 2023 11:37:45 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b0032ddf2804ccsm18472724wrf.83.2023.11.29.11.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 11:37:44 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] icewm: upgrade 2.9.9 -> 3.4.4
Date: Wed, 29 Nov 2023 22:36:49 +0300
Message-Id: <20231129193649.525300-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107145

Changelog: https://github.com/ice-wm/icewm/blob/3.4.4/NEWS

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-extended/icewm/{icewm_2.9.9.bb => icewm_3.4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.9.9.bb => icewm_3.4.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.9.bb b/meta-oe/recipes-extended/icewm/icewm_3.4.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.9.9.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.4.4.bb
index ecb0dbe73..8a150f5a9 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.9.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "af7bab3472189febf50753eaecfac586901419d282cbcbff92e860d4b74894b3"
+SRC_URI[sha256sum] = "1bca9a0b5f959c1f715f5e49d2e0036b5ef3ca07d049529bc88cb7429a58ba31"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


