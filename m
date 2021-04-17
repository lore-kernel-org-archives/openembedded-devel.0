Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.3515.1618693585996257492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nUrJcui2;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so16415495pjv.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=pg2Q/zuqq54dAnAhgaPj7chJj0T+98s8RKMM1IePmhM=;
        b=nUrJcui2i/S2wsdEBetIMSTjbvhJwTel9S1W1wAO2LgILuSwRteOI7FHe2K8jo3vPm
         a7BtDtOEr8vx6Ex0pKcLj8aj0HLIKfFyH1tjUK6qU1TMpkpOHwmotKeawI248woBXsxh
         0e8n+YZ5salZhQGInt4fQH7Qd1X/Dd2QKXEI/FRSx1ZXM/nJxmhL3ad4hhPEx1ZOFQah
         V625rlrMi9v1B2ve2LkODRhxaRyVYk73Iuqe0gT9HNxDiUgRZQ3c/4GVevbDnyIcfLn5
         zowGb+Mi35L1rlo24wusAYr0uNr7ypDr0BvSDzIFYN2lBsgtQNprIFi/w3lj57nkLnEG
         eN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=pg2Q/zuqq54dAnAhgaPj7chJj0T+98s8RKMM1IePmhM=;
        b=DEEQyyPg2sYVEA6PBpMD2hU8LIvwYy1v/3YVUdamXhXbQXyt1QzIqH4QvHj+pk8DFc
         S9ty6JUT62sSI0XcWRHneMRU0NDGHaxMYIH5Su6ymSZRpftFScE21bcB21RsHSIh67k0
         xZg1ewOJUgx2OusWR0+YNJ9ztWP0x1yiGuvGJEicaOa9mGI26Tp87Piwch6FItomIwxX
         9jo6UKw2Qvka8Elj8qy3N6yQTo9Q0tZ+O+7mGyWuGWrz6+2BFU6NhC03/aVpdUCUfyGa
         GaXdzRpvOPDXZn4+anTmYVDNZTZ/Cy0PQv+Ev1zrMPVYsfcFHlY+bIBuDrc7p4ReFYYB
         Sn4A==
X-Gm-Message-State: AOAM53143TM7XErZG4IunjgKYUr91ckYrKSEgWTKr60aJ22FboG6YAmW
	6X2X7Ob6omj7n+sXNih4cjhmLeViihfJ8g==
X-Google-Smtp-Source: ABdhPJx3gEFkOGwfZWl0SSfASpW02Ej5dCB6MyQX8CUtgWe9z0eyFe4Mg/RYDmqaKKqtviUaoRTHuA==
X-Received: by 2002:a17:902:8e89:b029:e9:a576:886e with SMTP id bg9-20020a1709028e89b02900e9a576886emr15547817plb.65.1618693585491;
        Sat, 17 Apr 2021 14:06:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 22/50] modemmanager: upgrade 1.14.10 -> 1.16.2
Date: Sat, 17 Apr 2021 14:05:31 -0700
Message-Id: <151a131c76881d6979756a23139bbd4f0fe38d60.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vinícius Ossanes Aquino <voa.aquino@gmail.com>

Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4174e40a9833fe1a59ffe774d472073f96b1cc40)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{modemmanager_1.14.10.bb => modemmanager_1.16.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.10.bb => modemmanager_1.16.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
index 2045e2a8666..d1ba8e43e37 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4ea60b375a761e17e7bb095bca894579ed0e8e33b273dc698b5cbe03947f357f"
+SRC_URI[sha256sum] = "efa9a963499e0885f3f163096d433334143c4937545134ecd682e0157fa591e3"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.17.1

