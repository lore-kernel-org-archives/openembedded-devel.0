Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.305.1597264904288370542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P91Op2Hx;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id m34so1623583pgl.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p4abxvV9QllF7gndo4SwhkoARzWgdUmKMpuUPmVWI84=;
        b=P91Op2HxFiuztj7tc7Jfv5+ewFgGDAr039UPmQjfZkgjFxiRL/+chKq3DUKa6xS+s/
         VonjFV2xXUuy94D05/cD+d1SG93HnPYKzifyiswEbvDUDhcJm22Q/xdfHGbUuVociJRw
         8JjMmObblWtuSmj6zQJr9N5WqFz/CVL5vL4YQ4jo9a5iR2kVmXDHk9ACNIqXHU7yGy9y
         pb1sOtkDNkwHAx87cSkJJbNFRiPnAhxhOww/1LkAaxywdIcMQml0HvX6vMMhbdDPdi5s
         9cka2G6r9RFZsrBc3llR/i24t/RYllbibWSEdgEKya4+IgUv9Bcj/AflNcsWWqVu26l+
         NnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p4abxvV9QllF7gndo4SwhkoARzWgdUmKMpuUPmVWI84=;
        b=hwWLfUnrIes8fBxdUkGhiu4PGUzJLyYdf32pdu/3sgjrlEKHxY+FcdQ78L58jmzrXh
         satLCJ16RLvVrQ5Tg2mKKZd0Y8aK1DvXkBupw7Q5152T0Ofztk5Xb66hwJaFF1s+EDMl
         LGXxdmXyHWrhzTGJnNdRXRNa0o0HXrhNRN+Zk5FDSX82i5evGJ12OhafwNGm89ZOTKAu
         QDJbtnaj0/c9GmxOE3dlSjF9hmkeWKyeziO22FS2GeIqAxp8XU9iayzWqETQDB1YwaT6
         yE+lCL+2JECK56vv1dJVvlW+IVDhYdwxu/sDrmDNF9MzCD18hRtxWCtqwNgmavcdzgjt
         q1KA==
X-Gm-Message-State: AOAM533hyHcYLXsCfp22SF5at3gVQ64H7SOj9cG1SCNGKoE651FG6hmZ
	xvfBXeOSYOdNdcjKK2v7v7GuG+92l6Q=
X-Google-Smtp-Source: ABdhPJyfem0DN9IVCaypo6GqtrWJWNJ+PEC4FPDs8h8FCiv2owYf6upaD3W7dhsZc3fjxtmPMn2Hbg==
X-Received: by 2002:a63:100d:: with SMTP id f13mr864588pgl.212.1597264903524;
        Wed, 12 Aug 2020 13:41:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 12/18] quagga: Use -fcommon to compile
Date: Wed, 12 Aug 2020 13:41:24 -0700
Message-Id: <20200812204130.1012160-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang11 and gcc10 have switched to using -fno-common by default this
hoowever still needs to use -fcommon until fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 134a33d478..70c32b7a4e 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -42,6 +42,8 @@ PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
 inherit autotools update-rc.d useradd systemd pkgconfig multilib_header
 
+CFLAGS += "-fcommon"
+
 SYSTEMD_PACKAGES = "${PN} ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 SYSTEMD_SERVICE_${PN}-bgpd = "bgpd.service"
 SYSTEMD_SERVICE_${PN}-isisd = "isisd.service"
-- 
2.28.0

