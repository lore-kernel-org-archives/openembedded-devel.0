Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.13004.1589899431181593618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pABeRpgB;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id m7so5722479plt.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Iij+7sKiWXahR07lD2vqGTEpnXtaPb1qqXMqimdcl2o=;
        b=pABeRpgBZw6Bu13jG9AQEnfMrWMQJTt2HhcEr2sr/p5bAd25MKegulatcHju+7LhA7
         dct/QvrxULwgLIx5/xZqAS1d5LC67KVfal11zEl1VZHnTwR0MZeg2H2YSgBEjNoynTzN
         ehbFW2wwj76svIkRnAmzrC7aCCBFZVuS67DaFrcPrFKBO+KmOr+2MOCdQ0E8kq8x4BX+
         dTO6k+8cSWIlGjb3OR8v1F/D9oZTEiDr9aeWS2I5rjbIcmxpStpL/qpInGzx1Wc430QU
         j8OI/4nc7o1AOE07QaobY976AJVYl8cZ0PjaLIN51qjLAD+5nbh0uFZ7+wU6VBkXHpve
         iYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Iij+7sKiWXahR07lD2vqGTEpnXtaPb1qqXMqimdcl2o=;
        b=HFHAVtGW9dMkUUn/ZJhy9ZtGk8yGghiP1IC1kjNZCNPi14j9Nyrp98IKdi9DE6lPt8
         yfU/apnxVYxslWq+vXpLPL9KSTFpAxPIAhZh6IWEkdK78BoGcNXkIDagB+wJfQqgWVKb
         cHvuU4x38ua5/J92F4m/6FTP90KsKWVKRE9iSwdSQ7PrymQIfhlgpnrGGZ1AfSvBh5Gw
         kvJQpi50AN8VOcEb71CSxouYlrm1bHyOQ8DW1pdUoXK1EISMWq1z8f7MGpqCcS1ZrNaC
         SShjIzol0L8IJjyJSY00WMhJCqNDZwTfoiRIhgU5wqEruPsrxjqAZUKcxOMx88dcWFhv
         eEOA==
X-Gm-Message-State: AOAM531l5sC8FhwHseOtrP5JmIlMV/FF0/digUkg/hV+6uELscpfHQVP
	1EjV+fjA738TY1WV7Wv2bQmVrPB5
X-Google-Smtp-Source: ABdhPJxz5qkiBfgMKyLTSwGIEnRX1jkpDsa+scUSe5EYwBEfxdT91c9yp4MmDkG4TuwZ+qM6yl0i1Q==
X-Received: by 2002:a17:902:bcc4:: with SMTP id o4mr19742479pls.275.1589899430443;
        Tue, 19 May 2020 07:43:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 13/18] modemmanager: upgrade 1.12.8 -> 1.12.10
Date: Tue, 19 May 2020 07:43:27 -0700
Message-Id: <20200519144332.12822-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9108bf23cd0fedb1a3fed6800b1abf05c083b49a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.8.bb => modemmanager_1.12.10.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
index 47a86b9194..deab6f0466 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
@@ -14,7 +14,7 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "68b53d0615ba0d3e2bbf386ed029dfe644a6a30a79ab8d85523527bb4e713aff"
+SRC_URI[sha256sum] = "b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1

