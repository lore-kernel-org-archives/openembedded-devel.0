Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB73C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 12:10:19 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.35255.1699877409961219874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 04:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edYvZ89S;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9db6cf8309cso652513266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699877408; x=1700482208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WapltZb2cHmFCJryo95Ka5rAIjXVQMi2u2SMM7q5ngc=;
        b=edYvZ89StfZ2SHwHtxMmoiGTdu2PDGV5Tx7LXbKp3fY73ErvyNRHMoMupiSCES8hLS
         8a8u3+ucIiBkhd7ywSoxV/LytQRSgkmulXlI6MNsPOAgx4NQMK03dN8uAqlo3mo3KZc9
         MBiPPQeyYK+CX5eAFI2nVPbCZ0yTP4Ml42LuxJwoFfFh6x3qonF/wm35eyVCsHCPlvy0
         iuX+ZpSVgbyyKm11B5YN10D3pJPfpl+fGJ1WpFB8luQkyNn2sdBeAK4m8shuRDebYjc6
         g+QQ0PLvvaSxlvnmAdugmN6U6aGx/9Q+66gUDyoHk+F0wu/FtjRoA7hJ3Wvi1EJTRKDT
         lb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699877408; x=1700482208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WapltZb2cHmFCJryo95Ka5rAIjXVQMi2u2SMM7q5ngc=;
        b=kujxmOs8qpCNEVQ5IBtAuEtin01YQna5e4K3Se+7BvpRbqsLrOBB5L/kQfadhvRmyu
         m3vq0Qn6agjFS6u7rAgv8KgikS6BoOJmACLfsGm/zzDWomRohUQDPpSIKqHDyACHPJzc
         AEj+XkiiN+U3l81UUouDnDVZQxxB6V3uDJhS8J/o5vMl6ATxaxRn4qgxUTD1GUzPNWpa
         XpPAb+fUpbBTVHjDzTCLYemD5L3Dyr35ETgiLqPTHC0t7i+ztl5xcyejhzXnTcT+LKw1
         izpdfkDEEBMWx4YP9uSbafqH3DJv7PZyrMlbl97lrtsFVpnU4SdoVXMPGhjk9YGuNiPB
         wJ2g==
X-Gm-Message-State: AOJu0YyLnKKbCBxtr8t6ZtxZmOQROBp19Z8e2oGhVjLnZiH9Cv9vnd+P
	s5fYzbVAJV/cZBCDm3QRrd/ES+TZt9OQ9g==
X-Google-Smtp-Source: AGHT+IFwZVhZFevSKtRsEKh3sicv5W3svwIOejglOk5cj78pFULu8mWE+CflDSZjhraUmF5WMG9CcA==
X-Received: by 2002:a17:906:ca4b:b0:9e2:92b5:f234 with SMTP id jx11-20020a170906ca4b00b009e292b5f234mr4195730ejb.39.1699877407455;
        Mon, 13 Nov 2023 04:10:07 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id rs4-20020a170907036400b009a1a653770bsm3921636ejb.87.2023.11.13.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:10:06 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCHv2] libopenmpt: upgrade 0.6.2 -> 0.7.3
Date: Mon, 13 Nov 2023 15:09:54 +0300
Message-Id: <20231113120954.102081-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106640

License-Update: Copyright years changed

Changelog:

https://github.com/OpenMPT/openmpt/blob/de9e591419eb5f5534f06da2876515fe7af18039/doc/libopenmpt/changelog.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 -Added comment to commit why the license checksum changed.
 -Dropped md5sum

 .../libopenmpt/{libopenmpt_0.6.2.bb => libopenmpt_0.7.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.6.2.bb => libopenmpt_0.7.3.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
index 47173d71d..92f33da89 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
@@ -7,15 +7,15 @@ HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae09d6164bdecb499183479fd32b66fb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=59f6e21f42e49919617267ff13a0b232"
 
 DEPENDS = "virtual/libiconv"
 
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "d21fb799695cbe10a1e9aeaea23ed708"
-SRC_URI[sha256sum] = "50c0d62ff2d9afefa36cce9f29042cb1fb8d4f0b386b81a0fc7734f35e21e6b6"
+
+SRC_URI[sha256sum] = "2cf8369b7916b09264f3f14b9fb6cef35a6e9bee0328dec4f49d98211ccfd722"
 
 S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
 
-- 
2.25.1


