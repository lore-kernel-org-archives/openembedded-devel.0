Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.8341.1598999782312322459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vA5Kpmsz;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id y6so1280284plk.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/1mnQeu0AWiND1MOokBznod06Q/f1wlZ2KXtnkSypnE=;
        b=vA5KpmszBIgWvbsvd4G/U+lq4ByXjbhhgAQ8lGh/TPuTEB0+zLbIRr/BbXkJc6P3dt
         TkG2EWGMIlNwbeilpurO6rLZMEXG/qHsDyayGK1AU1T4BBXMTE+h9sdJwhkmBQe+mjV4
         X1UZkaiV/q0apYAWN8A4mxj0s/F4YOWXs0mBYaq+wUVjG9ScGpNhvf1qT9BeH3GFg4F9
         zyGBz4WI/1UKeASEcn7S5PmRLIp3TnRaQMZRyM6PW6poFa3t4FX0GjRO7umXCTNxbDTG
         TkpZmBNJKuFFetWFSPRSF8+rDgO1PT8zYo+17pZA/lomqLo7eDI2tM8L97r7wgjKdxfA
         sl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/1mnQeu0AWiND1MOokBznod06Q/f1wlZ2KXtnkSypnE=;
        b=GYqZWGfS+6yLi0SAgOyMPmbf2/+wQASQE1GZLrYFZc8nXSNe5GPVpVxTd7G1RmG8HS
         EOipe2SX2OeZd3koKOwJBfpjPkwzbaYIw6aL6CGo7vGDgwPLY441fIcxHX6sKu9O//Aj
         w59yMspG84hrMSvyStRpX/I/NvufyMyMtIm2SUVJrOpyHPrho6dCaGn9fa0GJLhUZEYb
         aQ8KfLKMyaGpSjH8z5B0GOJBE92ukF5S1lGOqKPxO14h8M8EGXsb07uRUp6vf72f37dm
         njjX3gEMKOOrt7UyK+lGrVQkOf1UlsFFUoQIwLVfQtcj3NhG87kyFWZic7Uc5lMY+Ecm
         2eDQ==
X-Gm-Message-State: AOAM531FiqT7As8f8tm1Gut/ECV2PDFjyeEFMm0XjalbBsEryGYzwBlv
	nuLG+yqS2K/YDB7dQb+AoEeuOUECXj3yEQ==
X-Google-Smtp-Source: ABdhPJyxHKgJwKFg165L/1+XfHrGnMF5rf6UI0KADLO27lJzhFNRSLzONmhONVRCF1j0LW/BqiUcGA==
X-Received: by 2002:a17:902:7895:b029:cf:85ab:8d4e with SMTP id q21-20020a1709027895b02900cf85ab8d4emr3636223pll.1.1598999781442;
        Tue, 01 Sep 2020 15:36:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/10] netkit-rpc: Use update alternatives for rpcinfo
Date: Tue,  1 Sep 2020 15:36:08 -0700
Message-Id: <20200901223612.1386026-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps it live along rpcbind

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
index ebe867d776..a787e52f7d 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://sources.openembedded.org/${BPN}-${PV}.tar.gz \
            "
 SRC_URI[md5sum] = "67212720482ea1aea9182a98653a9642"
 SRC_URI[sha256sum] = "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b5e933ddad8a14d3b"
+
+inherit update-alternatives
+
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"
 
@@ -42,3 +45,7 @@ do_install () {
     'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' install
 }
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "rpcinfo"
+ALTERNATIVE_LINK_NAME[rpcinfo] = "${bindir}/rpcinfo"
-- 
2.28.0

