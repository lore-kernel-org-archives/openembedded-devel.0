Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.28166.1624148851152559563
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jFPTOBto;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id x73so10752097pfc.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Jun 2021 17:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DUhQ7knJONN0AIghU1Wna0tmMAagk2mV+YNyT6FoRWY=;
        b=jFPTOBtoB4ejfB7aSN7F6i+yeefvlJbYGUigwWyM25B27UYxMWZkjwZTe9r9JhDlLC
         CulS27tJpfWSqx+rfpIUAM9TgYB0AB2iCwsJLm/Ihwf7JrZdjsIjo8o6vEQKGCpsjnmV
         sX09NzDF561dLguXxwDNv8/yFQ0iBiuSJUllN4zQGbpCVDpiV9GZUSMomtr0cJIelt0C
         fhU2yNcL64vqETgjXfjnuPC+hDJA9M47N0RuoJU+vUn6wvBXADRdoquiPDe4YGkYAlw8
         viMUjS6MeEkfJWChTDkNQh0Ppg4Z2Rsn7esbAZxGnNRDi4XfKBMThbcpedqg61sSaXlp
         CGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DUhQ7knJONN0AIghU1Wna0tmMAagk2mV+YNyT6FoRWY=;
        b=a02qqQUnCNfz11J0MfNmIG1xcxa/ZUvllUB50vrPWQF9SwG9QvdcVbWfeArTV9pN21
         +jkkNZ/82+DXQqX6AWehprE7nti3NhrW0KRqH8VjjaXZiATLfc4Qy4q1T1+H5a0ZoO8p
         OuFao6++luZVoDcO3baCu3enuZ705BmiiFp2rSqGUlL9sN7bp0ZhNfgKZ1PMAR4GBalF
         RQ1DW5ljUpKT9/JyTgRI89mGoW5NVjgURxyuaFU5xUi136TfIt3al10RJbxgHtQ9cNGF
         bVO6uaBpt4TzwAIzms1rc5NjUiFO4stGARI03LuY5LnH0lKtuq7ouZxhVcJf9OrU0B2G
         8zfg==
X-Gm-Message-State: AOAM533iRPSWSX9hr+Cr7VlJZLLPdAYkItpl8ejb3d7UMl5Egebhji16
	jc99cbJ3cvVQcoBp33x03NwoDLAnbZ+Xzw==
X-Google-Smtp-Source: ABdhPJyjWvgQwCBnuhIaxuKfNNMTEXWaB2OiPbdWNtultshPPSt08MrJkNBm59M+cjKYYbP0J7vi3g==
X-Received: by 2002:a62:b401:0:b029:2ec:a3ed:9494 with SMTP id h1-20020a62b4010000b02902eca3ed9494mr12145888pfn.56.1624148850583;
        Sat, 19 Jun 2021 17:27:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id b1sm2923628pjk.51.2021.06.19.17.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:27:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] czmq: Add nss packageconfig
Date: Sat, 19 Jun 2021 17:27:24 -0700
Message-Id: <20210620002724.3894951-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210620002724.3894951-1-raj.khem@gmail.com>
References: <20210620002724.3894951-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its already disabled by default so no changes otherwise

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index de1e76e93e..75584498a6 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG ??= "lz4 uuid curl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd'
 PACKAGECONFIG[curl] = "-DCZMQ_WITH_LIBCURL=ON,-DCZMQ_WITH_LIBCURL=OFF,curl"
 PACKAGECONFIG[httpd] = "-DCZMQ_WITH_LIBMICROHTTPD=ON,-DCZMQ_WITH_LIBMICROHTTPD=OFF,libmicrohttpd"
 PACKAGECONFIG[lz4] = "-DCZMQ_WITH_LZ4=ON,-DCZMQ_WITH_LZ4=OFF,lz4"
+PACKAGECONFIG[nss] = "-DCZMQ_WITH_NSS=ON,-DCZMQ_WITH_NSS=OFF,nss"
 PACKAGECONFIG[systemd] = "-DCZMQ_WITH_SYSTEMD=ON,-DCZMQ_WITH_SYSTEMD=OFF,systemd"
 PACKAGECONFIG[uuid] = "-DCZMQ_WITH_UUID=ON,-DCZMQ_WITH_UUID=OFF,util-linux"
 
-- 
2.32.0

