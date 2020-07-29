Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.2172.1596013085613430585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=WQn7yOyn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id s9so12596549lfs.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OZyf4z8b6w5xE3mGBLX4s2L5aLrDTehZS+S+uqojxwM=;
        b=WQn7yOynuhpMj+fGlkpy6W2d6yuorVPevAD7mFpevI9nEmbvyftIOF6m1D4axTPhvd
         LsAaS1d2fUdAjGIzFThW8JE6Nk0HVfgOW7PfpIwtvO1F82nwJVY4Ip9bN4aW++23wmPs
         tDCb8MyLnDt+CHt3VcEKNMgOHlH4Ujm/NIqUPHYzxT4uBqewUNBUCWSUVVrDUaKaF/54
         M8LzLyagm6y82PpLufjpEbsgy+mjKqRZc+Pdo6i7F9rGwDpHrEZTbVcNICqkvGf5fqRM
         y3n5imieEkvxtpX0RDVm+lytn4ZNVbfAHap/KRAhq0a9XAjC9RDuj/rIIMXHU+OPaCsQ
         4Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OZyf4z8b6w5xE3mGBLX4s2L5aLrDTehZS+S+uqojxwM=;
        b=IUTLLbGxaU19s6tCnnenDWrpOLeU9BswQK9E8Xf3QUlsQsbrsUDydMZ8ESgyCp0RfE
         j7FQCJl00qy7RSzGNZbnJTcItUWRSH+dH8lZ9UJUT4uWkmJIRCrH3hJfatWcXAhiF1O4
         zmaLv9zvtg6FZ5+KyEdRZyKYLVbzCL668Z7kkXNd3Zx3fUQIGD23v8bzLtpeF3vZjj1l
         sf47blmrsxwb9PAsFZs/nFCPracLORt9T1VztAhw2JJLjEDiQF4yWkHcrL+QaVYNaAB5
         hFuLFwKim3JpSIBvtJ+LA4csLAZ0bTxxX4sOaGNSjpJWjsONnV7EtlVE0hZ7gKVtBOrz
         QPAA==
X-Gm-Message-State: AOAM5302dl0n2FVL8lYVf8TzQBOzDP0sgYIHnl+6PpLpg2tOpGHaNfvw
	2fr46UsxvxB4+z8t63Enn9n0DSciIxs=
X-Google-Smtp-Source: ABdhPJy38nc34uHLTGmMbzfscsxveQap9jVSpPVdX+xLTX0XgAytwea4CTt0ZclZywLzMqe/Oehltw==
X-Received: by 2002:a19:e50:: with SMTP id 77mr12088565lfo.188.1596013083247;
        Wed, 29 Jul 2020 01:58:03 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o16sm268523ljc.66.2020.07.29.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:58:02 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] libupnp: update to 1.14.0
Date: Wed, 29 Jul 2020 10:57:47 +0200
Message-Id: <20200729085747.2766868-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libupnp/{libupnp_git.bb => libupnp_1.14.0.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_git.bb => libupnp_1.14.0.bb} (90%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
similarity index 90%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
index 339c07cd9..eb6c6cbf3 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
@@ -6,12 +6,11 @@ supporting the Document Object Model (DOM) Level 2 API and an optional, \
 integrated mini web server for serving UPnP related documents."
 HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-PV = "1.8.4+git${SRCPV}"
-# release-1.8.4
-SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
+DEPENDS = "pkgconfig"
+
+SRCREV = "a6c3616530490ca67db41131572ec18f00d95eb0"
 SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
 
 S="${WORKDIR}/git"
-- 
2.25.1

