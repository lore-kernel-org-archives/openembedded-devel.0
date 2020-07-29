Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.1919.1596011744008101202
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=UZW44Wd/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id v4so14452731ljd.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjpMhqQgaxNysNYu84CNpOf0kr+dB/WxbbnZs3+eMCg=;
        b=UZW44Wd/L9BxPqV3YYFezC1tXvUSNDhCt/PHoh3/NICvkuae0MnHpCWqu5FE0Qj0xY
         ahA2dehE5kL/f7D2XHT7td8tMvaR4eZzcr1HGXrdibNB5x4GKLWUZGv5dGV4bBwtB49F
         t+gR+tI2lef/76TkEqqBzDHo4nfNGBwCIbtpYtIYz8yfvxGLzuyF2nTh5+TGqGPLQacY
         UCN2bUKJjRnilVwE219YUli8wqagFHbThY9T09LQszLIoom3JGJWkAuYxiiha47f9WCr
         GGrPVH4+HqSi69gh8UAENFsob89jpa/UOLaMjLJvT27wqBNgCi5y9uKLe1GA9MYikBTZ
         YDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjpMhqQgaxNysNYu84CNpOf0kr+dB/WxbbnZs3+eMCg=;
        b=t/DFcefWd9HXJ744F3x3/DL8umGVddYytNgnRxPpJUi8W2LRuapisTxu4Ll+UrPTlw
         eAneqv8DB0a7iIV7v5kaQvbbtXIguA9CPRu5uvB8Vo1ZkebRvHImsbHB0PvU6sAHA5TQ
         gy423zdZuhTn2c9arIiEQxYpUNHIvTFZ/vriX6pTCCWHWCNFZD4/d3a+BtJTmqApHZQc
         T+SR0spwhHAFJx0Jwt28PG/luRoPlnPW2oNWI8O91PonABPOao4kCNZCNC1sOQuXeCUw
         zmkE+XMconzflsHTogqu/ceTnDH2ZAILOqi9DEjEBTsl+kLh+ZcLDGtomDVlbznF7aOg
         EaEw==
X-Gm-Message-State: AOAM530JLE2yu/Hs72r+93Oo30lz+PG+uMB8NU97sWZRBrHOkHUTrlsp
	Lu/66pyrFRnhJtadLFL97KLDXIeVnSM=
X-Google-Smtp-Source: ABdhPJwSHvKS1iYfGBukRFj43AAuezXpaRp0uJw0cvgtOAd2XwIBTanErqzvCGM2rJNaUun1L9666A==
X-Received: by 2002:a2e:2e07:: with SMTP id u7mr13342179lju.195.1596011741767;
        Wed, 29 Jul 2020 01:35:41 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s9sm258780ljh.46.2020.07.29.01.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:35:41 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 2/3] libopusenc: add recipe 0.2.1
Date: Wed, 29 Jul 2020 10:35:36 +0200
Message-Id: <20200729083537.2740433-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729083537.2740433-1-open.source@oleksandr-kravchuk.com>
References: <20200729083537.2740433-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libopusenc/libopusenc_0.2.1.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb

diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
new file mode 100644
index 000000000..596c5fe86
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Opus Audio Codec"
+DESCRIPTION = "The libopusenc libraries provide a high-level API for encoding \
+               .opus files. libopusenc depends only on libopus."
+HOMEPAGE = "http://www.opus-codec.org/"
+SECTION = "libs/multimedia"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=174b92049c2c697eb73112801662a07c"
+
+DEPENDS = "libopus"
+
+UPSTREAM_CHECK_URI = "https://github.com/xiph/libopusenc/releases"
+
+SRC_URI = "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${PV}.tar.gz"
+SRC_URI[md5sum] = "f038ea0f4168d184c76b42d293697c57"
+SRC_URI[sha256sum] = "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9"
+
+S = "${WORKDIR}/libopusenc-${PV}"
+
+inherit autotools pkgconfig
-- 
2.25.1

