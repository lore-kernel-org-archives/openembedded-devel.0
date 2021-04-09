Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.3638.1617934885588828496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BJm6MchS;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so4335961otn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OVLA66D9rKsn8+j0ryqiFsARZQSeIsQ4TUrzwW8BHlQ=;
        b=BJm6MchS5jAqzi0lsRxmLKUkVosrsy1LCSX9+oRqKHxf+dy0SmZgR0yho2/LD+anIq
         FHROnj7pVEp4IoEnJk/g6LjQ/5eM+cWAmOo0bB0Js5/2mRZb9T2I4WuUJQzPXEW/cKE3
         2TJoKQLtZyBeD0kNw4mjYCzvHjw3gpXjtXuSBjvK0k0xScx4M1ezzxZtON+s9ZcGZs9d
         3fZe2YIHR+JnNKU2UpcBZg1D3Lmc+/4INu/otKVjK05h5qQ7ajapHHSLNNmd4AyYBZtr
         +aoIUDA1WowMLQB2KeM41TaPuXpFUzMiDTAGpXWCZ+HblQxFNSS9BhFDbMg6y3Kl/R7h
         /dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OVLA66D9rKsn8+j0ryqiFsARZQSeIsQ4TUrzwW8BHlQ=;
        b=RpKjI5MwGVMDpcZYjo/Rv4MCGAPRcpMXTdkusaXJeXJ+zGcmfvgneEjATOQNiMn/PJ
         Xrxk50YMyBm3l6sqtdpMH1CMpA1iTmB6Nz8V17sVVWzdcVxO1QtezbX+AkrXK/j4ieI3
         8z6G2eYiO0LfolBoHpoU08dRIRmRccV7E8+W8hC6srG33J0Dw8TM2OwlbVl06HAufxTg
         ntgPQvcf6rkNVzEc46c6vywr4r38WHyXxaqAPApVn6tPH0JkFCFzeQalyzjehvqYNtLc
         vDkGdUUs4YRHEoc/XACqqtUXOk81rlyaB6kcjFNoB4UlXoAuzrK+NEUzlZqjZPRk8S0n
         2Rqw==
X-Gm-Message-State: AOAM531ae64KsZdopnMXMV5MtW6RarnOw1/L8IudhravTFi5nYfm79ud
	dqXuO0PtE8p0/s+cPxBrH1enyi2Z2ps=
X-Google-Smtp-Source: ABdhPJxYL4Jhw0AuJ/i1F+Rkxa+2Lu1qjmm4eVVjkPua3REi25ajpOmnghhMcVbZpDoJf5Is8mF0UQ==
X-Received: by 2002:a05:6830:14a:: with SMTP id j10mr10472565otp.143.1617934884817;
        Thu, 08 Apr 2021 19:21:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 35/36] rabbitmq-c: upgrade 0.10.0 -> 0.11.0
Date: Thu,  8 Apr 2021 19:20:48 -0700
Message-Id: <e0e0fb5240e3c6ef97b0b4e7545c89c70eeebe0f.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1185b272a48e8b797bc7c4e96645cc2fce3d298)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
index 2ef6b187e94..0cfd225cf88 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git"
-# v0.10.0-master
-SRCREV = "ffe918a5fcef72038a88054dca3c56762b1953d4"
+# v0.11.0-master
+SRCREV = "a64c08c68aff34d49a2ac152f04988cd921084f9"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

