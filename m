Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.3476.1593684923035085919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=SVGpSwAP;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.68, mailfrom: jacopo.dallaglio@kynetics.com)
Received: by mail-ej1-f68.google.com with SMTP id f12so2429778eja.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2020 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdmivNlsBbzd5OVj9eapEm8jaY6EYeRnjoteXNVB6BI=;
        b=SVGpSwAPOzYdavvgDllsJa8tnlB3ohxu41K+LuBVpEl9qTd7oJMGhz80z7a5jo6thJ
         YdqkYzrxau0J1rGLaZHu2TcZY3Xo8eZ2h8yVnN3VCXrSccYogWkDm3f6ZZarJholyqft
         T/sbz6HYqNoxK4Qwb6xLth859I871fMBrnID5Y69GTRD3iVuYm0xu90ZPZLhLHc+3Fc2
         LfRDoZziJ6sQCeHl7wwAHIu23otc3Wl82u2nftjr8YUQQqzPtiRsvGc5HR9zgw+LNs49
         Ja/xzLM4Pbz4Y1j1mS6D5K7TeaBhVS0it0JakLIiJIhePRR2829siCaXtiZQri9XTEqN
         Ckgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdmivNlsBbzd5OVj9eapEm8jaY6EYeRnjoteXNVB6BI=;
        b=Zfnio93E5s071MnhBuf246ir6Lvykq6K/rHM5w4so4xEswUVvLvI5bb2f8biYd06Wu
         vMduHYZfgNtxij41LxnOwZHIbD6uTpJt6k3OfuJNGh3V53SRJmcGwtHhE1I8+h3vU51w
         4bry3VB0GaBEiClaDBYDGj+RP6vn1eu5LBTaps7SYEOubOp2ATYyfY3RHOfIpOTey446
         bCe70OcMSKcvK7piEHBpqOVK9fBn1XHhB+CKLTcwOSkLfqq8NBQf4In8b3dkeO+/i3of
         MTGU8xLq7VeXco2sKMGm3jVCl7GEO0PRLzYrNLHly/Ho1WQ22VQ/0UGB4AxMtvPFRGKR
         eWbQ==
X-Gm-Message-State: AOAM5313dNj/QdOe+xXgLWxN5OciFPltQBE73HIj4t3vcB9Vj58DXMfO
	jxMmdQScI/g1pM54pVH/pa6UOnVKEQ==
X-Google-Smtp-Source: ABdhPJxzyq9Q37iksunSYt9Pr4UPLlH/K7qPQdfz7RBsCEesNp2r//Q/OzdTZrFzo8AYNai04Kf50g==
X-Received: by 2002:a17:906:6a4f:: with SMTP id n15mr26265672ejs.378.1593684921216;
        Thu, 02 Jul 2020 03:15:21 -0700 (PDT)
Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from localhost.localdomain.home-life.hub ([176.206.86.212])
        by smtp.gmail.com with ESMTPSA id h8sm8543773edq.15.2020.07.02.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:15:20 -0700 (PDT)
From: "Jacopo Dall'Aglio" <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-python][PATCH] python3-libconf: add recipe version 2.0.1
Date: Thu,  2 Jul 2020 12:15:15 +0200
Message-Id: <20200702101515.465529-1-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 .../python/python3-libconf_2.0.1.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
new file mode 100644
index 000000000..80bc59d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-libconf_2.0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A pure-Python libconfig reader/writer with permissive license"
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/Grk0/python-libconf"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05f696c084eaaf5d75bc150f70975758"
+
+SRC_URI[md5sum] = "e212611cbf6a696e05742a983b3a0c57"
+SRC_URI[sha256sum] = "2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.4

