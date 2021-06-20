Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.28264.1624148850277026597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D+PTsoW6;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id o21so6572462pll.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Jun 2021 17:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4OvRdKJ55gQA4gio0vTcP/j5w6h19mmTJsJzPlw9E0=;
        b=D+PTsoW66jPJ9YirGTxZiIcPlLihIIkeGYMzsQrYa4ZUEwOEDoowIPJy11PopqJQgP
         +gbtr+7feZ/16RCEFnTo6QOOvtMUSQuWlr7623Kv0dXX/QbNlo9FCAvDPVxv+lUjVeU2
         UCgZ95FBlXbTPwmNBtbi/H79+LRA+7fdJjf+UEUzykRW62IuQ/oc3sHpPp7Pic0fN1C6
         Apl0Hnt7FWxykGrDULNCXQJ2nb+p4VZ3Mz9W8FjTvEJ9LDaouLtH0F+3NHUomYiSfOku
         zllO1hSitlj9gFC98serbWx3UACLkR4OdfBYmEYG8hqd2fnn4/+Jwf5yGIvSV6YoQ+Mq
         m+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4OvRdKJ55gQA4gio0vTcP/j5w6h19mmTJsJzPlw9E0=;
        b=sTMkLvoklrey7kOqoPraHVWBIrQrKOTEmtl+5jDotid8Ht0NXNhUDY93E7NCGnJZGG
         0FDpE7FQ0iV3ex9zwQtn0tflCa5FOW1+mfYWU+MPEYXV8sAJ/7qOLT76C7Q2eczU2Xzo
         gA8SO9WSZPi2/DaN0dyAeVSkydtSQcm7YGDl7iu4IZedL8LzuUs/ilR+5FJ0C8iq+5Yh
         yDwd6l/eLIc6l+0eXLLW05rVXQ5Q/J4owBQWScMEmbGdAMY/TXNU8672njJOsDO0Svwy
         G7SqYqkcB2NuRUMUp2EXPeYERQSFGcu8yIkFcqIqMJetOtIRxU0aBM2wicBRk4CKbSxD
         PVLA==
X-Gm-Message-State: AOAM5323zuo0y9y1Hwdhz8wYZxT1VpcH7idvwdiRVqWnR/u6LrGdQ9iS
	jqLy889vmgpZ6hkgFJjv7kr0pFMRU4csDg==
X-Google-Smtp-Source: ABdhPJxKDNpDQvOj8ujL9DHjubGBkCjSeWhpc9lt4mJXJP8gbzfQ1QN9jH4gBHUe0x0QITX/X+uzRg==
X-Received: by 2002:a17:90b:393:: with SMTP id ga19mr18655151pjb.182.1624148849709;
        Sat, 19 Jun 2021 17:27:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id b1sm2923628pjk.51.2021.06.19.17.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:27:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] czmq: Use Cmake knobs to enable/disable designed packageconfigs
Date: Sat, 19 Jun 2021 17:27:23 -0700
Message-Id: <20210620002724.3894951-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210620002724.3894951-1-raj.khem@gmail.com>
References: <20210620002724.3894951-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMAKE_DISABLE_FIND_PACKAGE_<pkg> disables detection and would achieve
same but ON/OFF seems easier to understand

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index f97a160c35..de1e76e93e 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -23,11 +23,11 @@ FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 RDEPENDS_lib${BPN}-dev = "zeromq-dev"
 
 PACKAGECONFIG ??= "lz4 uuid curl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
-PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
-PACKAGECONFIG[curl] = ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=TRUE,curl"
-PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
+PACKAGECONFIG[curl] = "-DCZMQ_WITH_LIBCURL=ON,-DCZMQ_WITH_LIBCURL=OFF,curl"
 PACKAGECONFIG[httpd] = "-DCZMQ_WITH_LIBMICROHTTPD=ON,-DCZMQ_WITH_LIBMICROHTTPD=OFF,libmicrohttpd"
+PACKAGECONFIG[lz4] = "-DCZMQ_WITH_LZ4=ON,-DCZMQ_WITH_LZ4=OFF,lz4"
+PACKAGECONFIG[systemd] = "-DCZMQ_WITH_SYSTEMD=ON,-DCZMQ_WITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[uuid] = "-DCZMQ_WITH_UUID=ON,-DCZMQ_WITH_UUID=OFF,util-linux"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.32.0

