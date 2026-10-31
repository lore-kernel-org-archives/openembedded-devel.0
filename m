Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8297.1793460833670059295
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2026 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w6ERRziB;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab38a051aaso16868697b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460833; x=1794065633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKa+R0enrpfgSbbPczjH8b3N6HG7ab0NWEfzh24rTXc=;
        b=w6ERRziBW2f5X0bEad6HIfVXrP5ymVoV2u3IRBlQIb8jR8SReBetz0AOc5p5oITJw5
         DAyHOFVG1vxstmUbSNB7xbp83EDFQbz+b92asxaTRYK5K6tauKxbyb2dAZuQF5kMF0aJ
         pV/FGC1g1J269UFr0ATQKdJKsm+oqW9KT1zXMTei9HTviJZEvlP+U6c6WwgRoZKqIRt8
         KqJns7ZZzabwgx4r/K9RpLsPDGnl8OmXYXPnFBGAS2ConAyra9kJE5e9U++uX3uB/Hv2
         0gv0tJvt8Is90zvlh0ozBMBu/6aATvP2BZpLIRtZLNOoEGTz3poKg+giolJ9BzfBYKcf
         Oi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460833; x=1794065633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKa+R0enrpfgSbbPczjH8b3N6HG7ab0NWEfzh24rTXc=;
        b=z8BpZuUiMyo7sql3iwTO0uf3sYwTB4LTIkctXedYoxgV4nfPBBunuYVxxgQulQNcAM
         zNAJyn1vadp2ls6H0vbBkY1v1WhdWUD/pP5HLBQM4t6f+gLKzQ7w57/JKaCIhbbHaDXN
         t89NasEvRNWS9CSF0/ib/m+y3Wc8w9Zlgt+7xSMqHzaln91PjkWM6oEZarrNIx3vf4OE
         v5yWelFWeJ/3+yW3BRYc0dkPC9kdVV6QhZE8U+SdnqWRBcNWocGs1TAUBQij24+iCZKN
         oVtsgfcwxy0JORJSnkbG7hgJa9h4y003G2GKz61Ec3waTxJFk7y8kFmE7zx+5fgsNSUV
         qcOQ==
X-Gm-Message-State: AFq9FYKboeXlKAK/1G11xgtZmE+ct50OOtngxC9q1Vki0AwtNaeb+5xj
	j0vb2AeoSEdgHn+R2ft2zleweBb240zHkyHfWKLItDo8MzVGytAgRkdEhm2KMiVg
X-Gm-Gg: AYBFou33RNEJKiYwx2ZTZMWsrJ5X/3AXDFV+guZkf0VdXJ1nldfNe1aPTXSGitcS2TF
	ObGTSI6cTy/BzhGWqHNzlU4rwfYlB/zmMXn1m248bhLLYbiYusArvVff5AxkiIk4DWVh95Gc05p
	YFsz/9SCjMXJGP+TRa2LMOQR69hripK5H0VXlFelYl5TkFr4tBBVZ26kJ9BjApjuUjYJKsBiV4x
	ZR/VH3LVwQFi52EmTpmFyJO0BNqB3r8GFGRTrIQsOez4fdaNujeoArH7PyNwvMya8f52UJaqXpJ
	KBSbdiGs2uK8eOPgDYnFHGP6vfKH2ZP9RyB6f3DmnkKGJzQlthylrCLuKibAEns/XtHlYtsNaAB
	N4shxnVyfDXyU0WXzvTFxHt6n9wnyXGRhberN1vdgvQCvYombgHx9ifOCp8+fFCE9GN7OBX3hxQ
	VHFT9AAncsi2JrYk9osS10Ux/pMIobxLgLAF4sNeuHtOFV9JSQ8IFWVUypAt9RdcNF2eSem/eQ9
	s2JnznkDFBDrudDLXAx1oLxjiX8uaaCfKNLKX3jAEJ1NVkGsKm8dVE6CABw/yoGaPA6CWxNyZ9m
	qq6L7e7NesgS5X58XTUK/JdUf7/Tf5SwHZd1Xb4W8/GesbykUeWvys9MX/1BD/2hJh9wdIWtJDb
	vrJycZZqzwWc40XWTwxL/0le8E1oViJLG7EiLAt++ko+0xzEkdnTFc5KrtQVvqXP5yR1KNR1l+g
	==
X-Received: by 2002:a05:690c:6987:b0:8b0:adb0:b5fb with SMTP id 00721157ae682-8b2b65aafc2mr38061637b3.2.1793460832535;
        Sat, 31 Oct 2026 08:33:52 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165e59sm22547237b3.31.2026.10.31.08.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:33:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.660 -> 2.670
Date: Sat, 31 Oct 2026 11:33:42 -0400
Message-ID: <20261031153342.585212-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 15:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131725
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/webmin/webmin/releases/tag/2.670

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.660.bb => webmin_2.670.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.660.bb => webmin_2.670.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
index a98a0a3ab1..79b20bfe74 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.670.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "185cfa4ac3f2654b363b4b329df0033e4b997a5af92711a211fd038ec042696b"
+SRC_URI[sha256sum] = "617af07a890bea18a83dca5c9d7168de1ad4d5f3076d8a1df3475f123748dc21"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0

