Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.12948.1589899437710762458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOGSn7h0;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id s10so4250823pgm.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qP8yQsPnugdQe8l6SlVL6naBu/zYXRY1+j4S7aKoV2Q=;
        b=LOGSn7h0PR1qinmGszo1paIN+cHfje0UwljHBnZYD7NHS+Ew8QKPYFgMcyL4YvXQQN
         m2+N4uxqZSsafcw7y0q7a/h45M2qJ1YwuJJzUCBNaXIC4z7qap0q5HFIkq+rF1H0oHzR
         uDwBPwLQoVmcqSWmnc2JuKMyaBj4RwWVnoW1J746VOPHFwl/MS7GU+r1ZuXTIwZcl8vQ
         QSd6zx7NCe2X+clKP2XaZ3pf8Q5rhSZzaePA7vVHSLrlcrPV9IqJ1exbZwih10sDDHwx
         H5gM/R7x3KI9uOTJSp8Ht/9JI05HGKVoOUTpCaTcub2+UjVOYvCByxSk0U5OB6SyQJg5
         Zllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qP8yQsPnugdQe8l6SlVL6naBu/zYXRY1+j4S7aKoV2Q=;
        b=HuAhH9/YbJ/YvLC2Pc/VpcxMWLIJytMqRleTc/0vC8w5Nqkcdsw3HTGWDTPW8OKjEE
         WSEOdQe/Ihk5eBfK00yaw6DzJwrTZdj0OHuxlU83ypzUUltjrN5bYs5KEwOAV6w79cVB
         /FYe3fV3mJ9aDc8UyQPejgsPH/QTf8vWGyTq1WN4e019AaHNNamgFFlao4gkCvJvVfzp
         +wXpceVr0rtB/St/ae63oO/9A2RVV6auU2T8lUIO4OZc3DQDfH1nHTDWtUnlfep7CVHz
         jV2vicj9nAHtcE0a3qGGP82PAbBNnz9J16FaNTgySQSBlh0uUKoYZzIY5RvGoPuxVAdK
         FO0g==
X-Gm-Message-State: AOAM532RrqZefxBqXYRLeBWyDML68omJWgGm/2NstZgWfppOPHLSTw+V
	DMKA05y8OrdZp4fvZSkGmOufCOWT
X-Google-Smtp-Source: ABdhPJx1WtuSVHV70WG79DKAyCQ0fZR5sk6wVXzcROarWHTbrqgJcxvI2WbxjR737GgOxIgub/I0HQ==
X-Received: by 2002:a65:4987:: with SMTP id r7mr19622107pgs.250.1589899437038;
        Tue, 19 May 2020 07:43:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 18/18] samba: upgrade 4.10.13 -> 4.10.15
Date: Tue, 19 May 2020 07:43:32 -0700
Message-Id: <20200519144332.12822-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

This is a security release in order to address the following defects:

CVE-2020-10700: Use-after-free in Samba AD DC LDAP Server with ASQ
CVE-2020-10704: LDAP Denial of Service (stack overflow) in Samba AD DC

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a41c021cfb11418f1a32e49be0716b00b5234210)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/{samba_4.10.13.bb => samba_4.10.15.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb => samba_4.10.15.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
index 5f227c892d..2c74c27fb8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
@@ -35,8 +35,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "e7906580bf06dae087e99ef8254f327d"
-SRC_URI[sha256sum] = "49eb6426e97cbf538e416e51ed8535930382512ad2d13d5ffd7f4336aa7faf63"
+SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
+SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

