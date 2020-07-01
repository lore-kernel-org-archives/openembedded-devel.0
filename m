Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.10572.1593562048610920259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bAeeLSwq;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id f6so6128097pjq.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oScjNDzsmzEwxQ9hMxSsUWcq+3YvEoWxO1B5Ei1A2ME=;
        b=bAeeLSwqcCBmmGIvALf0OZ9MBsKMDeg2Xq1AWC94VHQBfRZJX7fApW6NNL0teF9jhj
         PxjaNsNybRX1w194SHtqjemcSIEWAPALaWGnIL95W8sZvOYR7WhQLp0O/o60D2HUUY+Y
         NbbdduoJNIRmoS5x88zxQZCGJA/fHad4WzuvSE+NpQP/P+zHtwh7mATVcdO+t8dwwJC5
         b+sp1tHtBA4IGfMQxLSSc0ZoxxmIpjIaGND9dLaY6jBRkhFt4wti7zUrAUNtMbpXPCa/
         V+hfX56+s1fOKHDBMTrIoA9UBy4N3Q5EtDKcVhB23o6FI2paRlOnXYKPegiL4bNGHBr5
         8GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oScjNDzsmzEwxQ9hMxSsUWcq+3YvEoWxO1B5Ei1A2ME=;
        b=Er/crpxbzYZk2dk5oLSsqbZtPWtaXEJVrFLKPRD6BL8hlAzj3SCB4HZ5pU763P4Bzc
         7a025X7VtlrOCAsEugZjhBtEsCztvz+RtXj03v+pIXmrrELtnGeBA3zptKuVZZYWY5Kj
         8hMqO8rQw4PwKPf4eyQjvxp/5tjNPSSAQX1Rzb0jE+pGdmBFAjPh+BUQIEggtPjkcAq4
         uV/iWYxQ32DRQEkHN/CDvxJO2HB8WVJp9h2MiC32T8pq0esl80n3IMIjAoMcZ05QI5+o
         Aw3oWXCu+SbAxMrl99PdSBJ8/5EQblA2FIz2yhoF4bSQ4Emf7zXVy4mE3x4nzXsJ3yYe
         JehQ==
X-Gm-Message-State: AOAM533+G9X0ipuLQzDgXagtxf8Bg+diiC0wVv/JD2RF8JPkT+WyGVn2
	EUFeNl4fap0mo0YIzXFcInzPECfIEXA=
X-Google-Smtp-Source: ABdhPJwYLGUTSOsnI6wjcD2t+HBNCu2TnYYe/bsPjwk4M9nCra6SsyQyTALsQMiI3881+04CoG7hkg==
X-Received: by 2002:a17:90a:7107:: with SMTP id h7mr25021949pjk.210.1593562047943;
        Tue, 30 Jun 2020 17:07:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 05/32] netkit-rsh: properly append PACKAGECONFIG
Date: Tue, 30 Jun 2020 17:06:50 -0700
Message-Id: <5d049642cefa2c8671a52ab625bcfeef960293cf.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

As ??= assignment will be overwritten by += in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4cca3eff387dc6630915ba4238b97712589308b8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index a6716d06ce..f6c05daa18 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -37,7 +37,7 @@ CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
 LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
 
 COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.17.1

