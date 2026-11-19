Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1886.1795113450293668747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WXRZOpE0;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06e79e152so75934b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113450; x=1795718250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=WXRZOpE0kVRAIi5FQ4CvlDVGIDzXs2uLp30Xe4tmY2eMzQ6BRVnX8p8c/zKZOWGSEg
         wr4ip2c58Na8BkvQUummNGZjmIipi36Ydb6zrclibjzX8aMntFfi+b40wLXFk+SW1/zf
         Wcegq/ahVMHTrcxe/I2txklkrGnRVz1MutmYWa7//1eU2gf0kUPLXohjicaaKhj6nDd0
         YoxbxXATFCiKLKH0qpqvnGeqj39dEMJaK61zT2c0ob+b6mboo49bp1AuM7b/dL/qyC+T
         Lv/9HHU9tBFuHgem2udXCmdezNhBrxENAQzaYp1+z81+eGWs1Z/548QumU4wvxV0vTNT
         ShvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113450; x=1795718250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=inabWvhpA8d5Irg+c63AWbjUtxopNIuCCKiv0CTsW0MddWpvxmDmStMiPvy7HHKekF
         cP4U/d2LR+aEwhdUDeZjOfSBsDOzB+37l+endGwY3qgIU0tEyonQXFsIhamfzWTuZKXT
         PB8MQH5S6XRK0/wEUsOX75X0qBbxEKqwa98LB7hs7t7/5+FH8GB+/wYaDgN4EzkJNMQU
         XI9SB5HT1MzPXteDg5rEG8kLOua+0dKi2yQ8JGeKsl6O843szh+9Fs4q28dMiCmEQRGm
         3VFlWyidXO1PLCNUw9f/ywEdtIpKNVGkdmacvpmHsbJGORF5sKSCVaX3oBiGLbXswW6w
         sf2g==
X-Gm-Message-State: APuU4Z+NVMMAt/csOw3bBJaLUnkZ3sl/QK+96m2GZKDtPm3j2Zy6bc6Z
	rqaj6VIeoZ7A4H9RYvi0gaCLSOE4zKFpd28PjSZH0eJ0kjs4kQr9dfZpuJO/kQ==
X-Gm-Gg: AYBFou0j2ZRvlW6p6UGRktC7JbQqjo3lg1rkrxeu0ZPH5MUG4rMSqAdnmPPENZTPyea
	BqX+lAJy5+9yj6+ZbfWdRmefQNrhnz7aF5QKgP9J7+ZyzASEzmtE4bE7fClEoqF3BMEDwESj6VY
	2q0KTiJ2h65KR4wRyZJi3SJsxK0jzc60xOSevEiPbnlkveQBOny27WKlNtda+iwrPsM07vFV2tY
	Hk3mw5cYFW3iB5ldszYmO3qvUmRfcyW3VATd3LjJx6uoKllmIKmTw8doQfHG8c+NASZnLwutWBK
	ECz1eRFKMMr2UvdkHfhPpVIb+BIC1syW5qWVGPQijKludA2IMnPhQWKiljfcEWYFZ2mSfoswtp7
	KaRweM8o3gpUpHH9QdUWUN4Rr5J+tUWVljvwIW51CymF6QvgLhStFt+Faz6vA8tansSWE4lde6j
	Dv5WZqbvAIt5SiFJ23WjX7gJOd+4phOklWuh/sFsUKMIAC8MK//pa4dxeqEKT3DbkdsUIMaJ/u6
	ZnzKcIDaLA10HQb0axrDwTIQl/RxgQz0FL9G2gq00ij+RoWFnnoqBlZ+lZip26Q+g9vHmZ2ELky
	XVAT7yKJe6Q0XBWw6stH9aLF9TddMrB1zOfzmerUvH+gxYqiAMCchzXIbzOpAOh/
X-Received: by 2002:a05:6a20:a108:b0:3fa:f23f:a1d1 with SMTP id adf61e73a8af0-4014df5edebmr460043637.75.1795113449550;
        Thu, 19 Nov 2026 10:37:29 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 37/64] 7zip: upgrade 26.05 -> 26.06
Date: Fri, 20 Nov 2026 07:33:05 +1300
Message-ID: <8b3d8e398c552ee2e9be961fc2d24a49c8876f92.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132727
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.06

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.05.bb b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.05.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.06.bb
index 050673f678..375f55f0ef 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.05.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
+SRCREV = "d3296e39e1f1f92c7b41c0c3848e65640428d42d"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
