Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9018.1621001285894455196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EdMMdgZW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: athomasset@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so1523769wmb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzXxcxbfFAVZiKzcVObP+OqDJlpwqvMWdC8FICeVl6k=;
        b=EdMMdgZWNsc45mGD96jvYzKHBcLhmy0xFOVn4JYzrjVhAv2ueRH56rkb5Gk+nVXwg7
         +YtxcG13qRgcrCjx+REygFrgam2v5Frz9PZSPvBHhxHOkNUaNs4alBLW9tDDp+hCfwJK
         gldwBM9+LclDFX7iOwgLZpqIpXRcGscEkH+dK8xANt4Oa0r6KOerM/tlihCHIjSsT/QT
         IcDSytCbEWEcaEdUWAKHggOuS4ndf+nGZZu1UjLXqlwVBUb/W+XPcwrRipLtRTFromhI
         5Ho8oqmuTE1jRqqbkInO2JiDV/eiBrRnyYWxRUqAWZiUT/7jYFyJeodzkNdmy7RzvN8u
         jSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzXxcxbfFAVZiKzcVObP+OqDJlpwqvMWdC8FICeVl6k=;
        b=jaP0iBpfMe9x/9j6tsZOAFBxXt4dDyY4Q7rqQ34f5RUob+U2wvlz961CpzvMkbtjbm
         PqYbrg0qUastR+8pVyAvM1Z5NZhwSsqCP425lTQxMccps+qPCULyN4oDXYvrgYstWHZB
         U1piH68V92DF282WkXWSV0H1tjGIultHI62SkkoXlqtfBMPaBAqsaUDfmPtfr/v3kW7/
         011XtA02XSsxqD0eQJveJtvJ3pwtUJ/wFmhPjUFoTNK9OIBzyjiJ/EqRnd7sx5dtqe15
         33ZBMALVMD6dGiRllbNAP8iZYD70QfVg9eQ7A1119jG8Vik/UbZZZCtmszsK63nMjGoc
         DFLg==
X-Gm-Message-State: AOAM533XHyp/Hr3Fs/9iTpI2VP5Ge3RDEaXQxxBSZWa/BaeMR3wRwjLX
	XV4GSe2xx3rDfG/f9mg3A6h1hINrSBw=
X-Google-Smtp-Source: ABdhPJztGtGxmQXeQwwVbRJBGtvmNjnZJ3Gwdw160zz3wvsgrVeTFR1y+iKEWmsevzHvsUq0gwd4qw==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr49691409wmf.79.1621001284085;
        Fri, 14 May 2021 07:08:04 -0700 (PDT)
Return-Path: <athomasset@gmail.com>
Received: from localhost ([2a00:2381:f65:1::1:21])
        by smtp.gmail.com with ESMTPSA id b8sm6898209wrx.15.2021.05.14.07.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:08:03 -0700 (PDT)
From: athomasset@gmail.com
X-Google-Original-From: Adrian Thomasset <adrian.thomasset@doulos.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Thomasset <adrian.thomasset@doulos.com>
Subject: [meta-networking][PATCH] wireguard-tools: change path for wg-quick systemd unit
Date: Fri, 14 May 2021 15:07:22 +0100
Message-Id: <20210514140722.3503198-1-adrian.thomasset@doulos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix error when enabling the wg-quick unit:

% systemctl enable wg-quick@wg0
Failed to enable unit: Unit file wg-quick@wg0.service does not exist

The wg-quick@.service template unit needs to be in /lib/systemd/system

Signed-off-by: Adrian Thomasset <adrian.thomasset@doulos.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
index f698b9a9a..e769f44b7 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
@@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"
 
 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_unitdir}/system" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
-- 
2.25.1

