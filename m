Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3938.1591230778401252899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 17:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LphxEd+g;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id x6so4172231wrm.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2020 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LA2TyPE8dEA3UTsk44wYrbjCtUXeTAnqBvrGXBi9NfI=;
        b=LphxEd+gj9dl07V3SI+yRk0Vpl1wY2MOm/Wmb5ax1TeptqCNaM23XTvQX15wxngqAM
         yo2VeXV/amSJKL/O9bUAzDljeb+o97U1Wx8czIcyCtVeXShLTcxR6N5nGMb0dsY34Rup
         iZp3x8GY18vofEDgRXoT6+ILRhT+WziDoEkS5E9glawR6PLPkcGcNi/0Uii76X4Foid2
         CRyVrNrZShVyQva2snGX2x2Xf8spuM4hOvjgdzdFQ5EFrljYMfCdsqmInG5Rkg2JUMfO
         ZKkx7ZAO/Kignl62p5lGM9hZJfr57ni8estiEWp5y1Pv0Hy9vSJwAOZDtB7v9FY2muFi
         8ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LA2TyPE8dEA3UTsk44wYrbjCtUXeTAnqBvrGXBi9NfI=;
        b=LvUnPww/cPGZAZmwSRP60/XLKI8OkynLVTgli+uSyPyVxBlRrTbBNXDZhWe1EuY6TY
         WeF2rLvD3RJLftxlR3XKzFQ9Qge7vxvoBQsIzggO0Wf+DyTFy6F5DNDyy7wipcFr8bRt
         n09M99roOdfuF/Lbcel81+2edwyrtkZXE5JUg39/Ijjf2dgabui8BLrh4P/on7mQP0JG
         xsYQdWpU799lgZq3X01YD1yRhy3AOvwIqx7rtcckSAaa15GZNWQcoTtKm620OgfgLROt
         h4i43t6qcqXhUtUC0SRbJLkNTSc+KjLts2FVkD1Aiq2JKGXPiz7wMyE3Bm5Ltg0KgAmD
         OteA==
X-Gm-Message-State: AOAM5339IXwV5Zw1YUtAvaNJcJ13J+oCWJHPWZ++66QK3RUzY7vfouUr
	tT3GX2KVN9pP2ES8JGPyECzf7vgp
X-Google-Smtp-Source: ABdhPJybeFrGaqA7N6D6BXc7GZkSJWyYy/E4X9qgyxi0SqcmJY3Dqf7JikaJC1RQ6BTcbbPrl6CyAw==
X-Received: by 2002:adf:f003:: with SMTP id j3mr1605174wro.228.1591230776545;
        Wed, 03 Jun 2020 17:32:56 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q11sm5375723wrv.67.2020.06.03.17.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:32:55 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] meta-python: depend on core version 11 or higher
Date: Thu,  4 Jun 2020 02:32:53 +0200
Message-Id: <20200604003253.741903-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python3-pyelftools and python3-pycryptodome(x) recipes were recently
  moved from meta-python to oe-core in:
  https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
  https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
* this dependency will make sure that people do upgrade oe-core when they do
  upgrade meta-python past these revisions, so the recipes won't suddenly
  disappear as a bonus they will get slightly newer versionw which are now
  in oe-core
  python3-pycryptodome(x) from 3.9.4 to 3.9.7:
  https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
  python2-pyelftools from 0.25 to 0.26:
  https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7cfeafe599..3dcd7b3021 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_meta-python = "1"
 
-LAYERDEPENDS_meta-python = "core openembedded-layer"
+LAYERDEPENDS_meta-python = "core (>= 11) openembedded-layer"
 
 LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
-- 
2.25.1

