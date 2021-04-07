Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3680.1617779264886809396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 00:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZTZryuvS;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id e14so25846208ejz.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RAQw75fkWLIlub7HWdM4QzBmVm58qQ2aFjPZkXkG3o=;
        b=ZTZryuvSGM2Ozjz282FAKPB45Dw621psKlfLNxaaoCWY7wphjPbGc0SFXXtKYLi4n7
         Ob46wM5V8NxgPUgD0lIEtJ9gpYUeIW0Ztmgdv2GAerso99hnfJfzczn86w1rkKatiXeO
         db3MJFvG0XtQxvidY+MIFGVHzw8uGE3rONjV3g+jZaLG3dK54VVNa64NizKJQYHk1iTK
         SxL/pg3pJRDjuKgd4s7q15QgnxuasDgAZgEnRtkS/O8BMHqcoDwdjZaYkf+3CR0zet4f
         d3h4xd0XSFTIM/27k407gi0z28pHzvUT55odYk9T19WiGCxtd4I3XwkACp4u+lT4DSAN
         C1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RAQw75fkWLIlub7HWdM4QzBmVm58qQ2aFjPZkXkG3o=;
        b=NNufoOw2SoUitcAHSJCu782t3lJkCwdE8rHk6ijXPARciUsVfI0MPc3lgPWXq7k74l
         qHFJ9iCvkBugo5qPrwd/Zhy2Lbkue/Ay5BGDgErk/Q6Yn43A7A6jEPeBKg123lzbWOki
         nLat+aw6kTJlENtzQ/oqyCDw4KkJnhkbErUNr0tf/bf0GUpkr8zQqj9RSSw50Lfmr/k1
         8FFtJa7P83uDmBeP1lkuQrWH6PaVQOR8vkJHvRlyN6UwMpKvHBQg5e7th3Qb063fP8EG
         z0MnpSnXOOAoV7Oncro+7YV8WtKXcSAEvMlbg5Dm1ge61thbSHIzVTTQNaUFAZeLRUIU
         rimg==
X-Gm-Message-State: AOAM533Rjbrh+CbhbfpJWOQlJJwLLR/erj9cwsjESj3DtbSNOmsMQ6tK
	HP35Xzjjn/G0Vm+uiVwN3xCIoEF2RMs=
X-Google-Smtp-Source: ABdhPJwGsKioSESLxDt07DdTuhoYMaqrXbcAD84jqVdGDHfryteCfb3CKxXAHfrzXquUKlgIWteLTA==
X-Received: by 2002:a17:906:7946:: with SMTP id l6mr2051787ejo.500.1617779263339;
        Wed, 07 Apr 2021 00:07:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id l9sm8608032edv.47.2021.04.07.00.07.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:07:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] networkmanager-openvpn: Fix packageing
Date: Wed,  7 Apr 2021 09:07:35 +0200
Message-Id: <20210407070735.525616-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent upgrade introduced:
| ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: networkmanager-openvpn: Files/directories were installed but not shipped in any package:
|  /usr/share/metainfo
|  /usr/share/metainfo/network-manager-openvpn.metainfo.xml

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
index a1a61bed1..1f76d8ab5 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
@@ -38,6 +38,7 @@ USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
-- 
2.26.2

