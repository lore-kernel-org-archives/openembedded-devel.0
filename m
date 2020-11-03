Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web08.6266.1604419638555164275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bYX3yvxf;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id k9so18886809edo.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2020 08:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hU2a6XoOGXNJetmdE2lCuHysT+UjsSmMvU7oWXqJUVY=;
        b=bYX3yvxfFdKuSHM0AlLOOCVbUX8fNAYcFXylLkSLu3q0mDLnSaVvgfLfLVnJLnBuw+
         Tn6mOGpiVwZZU7x6QluYPpm1jiaAOsD0QDP0v+ENCnbt9zmsBbc4JebXzzu97Na9hPiX
         BUBH6d4tFr/MAnAjlPn/degAUjr/efejTmjdQX40au6T9BLJGsJmT6Jx9eNHuI1omKnF
         VBIX/jp6YgOL20oFMPfUjrcIg0fPd4nOvr3U6V+iE1dQW89s86DRMnCgvqXuhzaahSFw
         K/HWURB7Qn+SfcY9OLbR96TRH9iSbAhaSwi1Ruj8fnly6x4W4clLuniramt3qtQZe6ES
         NcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hU2a6XoOGXNJetmdE2lCuHysT+UjsSmMvU7oWXqJUVY=;
        b=iGpllIQCO9TQTY7dVn9CadYuWY2Tg4UwXyao5Ik+tmVXaUg0N1/rkvaQdfMMNh9M2A
         CXf4rUJ/iELpDB6QkurS39kmOielhtBjbZS1T73vxjCJp//5EaB80Z7f/wzEWY206ccO
         VoEpy5qop0nt3Y/ybDVvBSNP9MBgK1tJnJp+XfUhzUwQ2kj8I72V1H8XUlRuMPZKE0l1
         M51xK7ce5lCJI2GKJPD+LIMbnuENC8FJ6lB5UQ6o1CxH3QOBkox7psBz2WfZb9/6QjvI
         Zm6aOYZQSe/JMbnbNDRz4f1VsxeAkhIyfleyVwyjK2UnE4HXwHqkNL8EN0GVya4rZJNt
         J31Q==
X-Gm-Message-State: AOAM5333P6kvwZZkQF2eGVkzLvpa7H2ZO1iAhVV6nC+JlhzXeFwHiSL4
	n7OS75sV7QuRaHO018UvemHkFj0a51+U1A==
X-Google-Smtp-Source: ABdhPJw1hcbttTh2Zw0DpzI57XZiGMkjJNhJE2RdvcA0sNTd8vscfUzv8eHUkgy1EshjJ+W/KgezoA==
X-Received: by 2002:a50:9e69:: with SMTP id z96mr17751532ede.226.1604419636826;
        Tue, 03 Nov 2020 08:07:16 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id y14sm11738077edo.69.2020.11.03.08.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:07:16 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: Fix typo in PACKAGECONFIG
Date: Tue,  3 Nov 2020 17:07:09 +0100
Message-Id: <20201103160709.439135-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
index 12ad39761..8e4b6c86c 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077
 inherit cmake
 
 PACKAGECONFIG ??= "shared-libs programs"
-PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-USE_SHARED_MBEDTLS_LIBRARY=OFF"
+PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
 PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
 
 EXTRA_OECMAKE = "-DENABLE_TESTING=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
-- 
2.25.1

