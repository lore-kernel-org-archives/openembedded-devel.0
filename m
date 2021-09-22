Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.923.1632338541203101589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cvKz2W+V;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id p12-20020a17090adf8c00b0019c959bc795so3140727pjv.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qlQ4uw5C1tn5ke679xq9E4ZaRRc7LhS02zn1ZjqZhPM=;
        b=cvKz2W+V8AFs6wN2X+TSXNVcyUR3+QRmiEdzxdpETUxTo5WfHzQ2CaDfp/cYYbG4yF
         /qhnJNisHAYu4wsfSDekgmhvFdwDFgkJSFCTVvhEfZ5i9cjNcamTrllIhO8FRzJzOYXQ
         H0j72xMpvjpBlQ0h5gGkNDtcCakdh2cN+7Anur3BlfgZqWK8SrJj7vpuBISUMUNg6Tcs
         2PjdRUsgdJo2iSODUb5B8zXyd8Ct5KxdtP4BSl6ZN8PtZ3yKorLzecf1pguB3Cxvb2pq
         l5Z7qUxmavO2Q/MgzZ00SiVEM6BDRsO6TAIRi06yNBBYlyM62HVHEN08GzDjMznl+g/W
         Qtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlQ4uw5C1tn5ke679xq9E4ZaRRc7LhS02zn1ZjqZhPM=;
        b=6br0B5utjouWc1SamTo8UTg+m8qq58f3HBh4npPLSmuU4Na4QecRwRA6LmTgQAOzVH
         H5tD1ydnEFrvo1ZbdaZK9ynHprp9ArpvrMmrczop4ym/HtT2s/F9oK2WHeV1CbOFcuho
         A9wan+BZhhRldpG5RIULjgLHhhGLQZohr7SkVnSO/RmJxh+Iu98SSCv9E5Ue6xvgKGnE
         E/03+rFGdqqQP1/3tRgOTwMmC0ztvHaJQTOeUQjj7HQSIe1s9RZHwtBYzdDMCezkzxDr
         F3FUkq7nAN+3JF9TMXnNFUbUiGXwi3B6RpIowedOVAdcj2l6dtwmoCXIdno4d+3PZ8X4
         UtVw==
X-Gm-Message-State: AOAM531IKPBxile0YmWoDjFPhOEhYzV9ghDwXEf+3DyfunUbolcy+UXt
	0DZBHiAJade17Dte456srcKc+ioYnMOMQQ==
X-Google-Smtp-Source: ABdhPJyPejbOmokgL1JudpKUnGXB29aOme30zw8gYyGqcIAGiZM1aik1iZtxbCkLRoTQcmqEleCj8g==
X-Received: by 2002:a17:90a:a23:: with SMTP id o32mr741559pjo.172.1632338540501;
        Wed, 22 Sep 2021 12:22:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/39] volume-key: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:40 -0700
Message-Id: <20210922192213.3062719-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../volume_key-0.3.12/configure: line 13428: syntax error near unexpected token `blkid,'
../volume_key-0.3.12/configure: line 13428: `PKG_CHECK_MODULES(blkid, blkid)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index bfecc7ebd8..ef1ae2c0b0 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools python3native gettext
+inherit autotools python3native gettext pkgconfig
 
 DEPENDS += " \
     util-linux \
-- 
2.33.0

