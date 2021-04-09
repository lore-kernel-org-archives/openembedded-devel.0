Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.3680.1617934879771474677
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dypcd9E6;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so4303224otq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lRr2VEeKYTkYZ9H0PI5JLy75rSi7amhE3fARsYPtIgc=;
        b=dypcd9E62qb2v/L7iQ0+SAHi6+pfIGcEMpFRD5Op5ZlCDIEVj55oDyUZgiLKaXWSff
         QsoDmmyPXxCiWo8kg2q4WYnqL7NC9uHSpjOGa4A+AXgJyEdR3VZXtMEwsRPZV0IGlDGZ
         kTlZUFWM4J6QUJGdLux4RGJalI5AyhyrbHcHk3YDchuQ3ZDaH0jZVpqQR0sDIq1exxT/
         p0z8DfCBj/xVfPR57u4MoVVIU73VCmUcfcUaTdM60iNeEccQiv09N/APEwhndapxebre
         qpXYOOdFo7Hs/5yiveHm/SU0XdjL0ppBK3L81hhnCBAKgrd0SNrnFrvqsE7eUb7FUubZ
         KDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lRr2VEeKYTkYZ9H0PI5JLy75rSi7amhE3fARsYPtIgc=;
        b=a75nDGAsGgnyXvEoNEbVPA1RqaHm3CZGOaeg1Pzerl3ZsOZT7LkucYOtstaBEK8MPc
         N76aYmxn5uI26oR3QSIu1icCs2nXEjJt/wz4wRwK8msTlKuPYXhWi6Yp/hk7RzquH51q
         0d53L+/NlGRQMl0nBKDpaHj7myLaz1UomY/vFlW+T6ZBUHvDz0mwPDYVcBPKe5v5dUji
         sPkKr1a0k3t/4FarboNNpplo2Nd8Rn9dbI1DdT6YjqSCXqYOc0WP+edTjJo9JRD29XAq
         ZbuDxI0JQ922qV9nULBf7P93OZ1c45No/ddJhJW+iiL+qd08TFjbc6jQyaKHNDFRF1lu
         1Dmw==
X-Gm-Message-State: AOAM531+DIyRNlxvY5SfMLIlqRZFLuSfxGjfa7UZX+omP+BO5KvgzPlH
	FKEfccXICVDWhX0kdaSf+OzrRSIdKd8=
X-Google-Smtp-Source: ABdhPJz1zQ0A9cD1+Lapr+YLEUS2mOui99xlljQpA2iDZizSDwyFagM+yYjxFKR16p+Ek2MUz4cF8w==
X-Received: by 2002:a9d:4792:: with SMTP id b18mr10485866otf.350.1617934879004;
        Thu, 08 Apr 2021 19:21:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 29/36] nbdkit: upgrade 1.25.4 -> 1.25.5
Date: Thu,  8 Apr 2021 19:20:42 -0700
Message-Id: <a372335f58b910251e61917b7e393ce4e387efc6.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5bd0f88c775ea69db85e1589e833e50648932f22)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nbdkit/{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
index 37f6a8b76be..a6070ccf854 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
 "
 
-SRCREV = "7b04baeb1858fa04f5f4e0d6f2d23bef706e80da"
+SRCREV = "c828c6d48ff6b69454cad98054a1920d03c4b4c7"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

