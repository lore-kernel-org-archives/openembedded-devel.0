Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.1373.1618619196126675454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 17:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rL5fKU8+;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id q10so20255879pgj.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 17:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CXg1x79UbkwSXV+mFkm1ilR/Mir6wiLbbAEs0L3/XQ4=;
        b=rL5fKU8+jLbRWoKhBBb2fUJd3rD20vgriVqxCqQIqTkZVc6CVuairWQh7I4DuNXm76
         JsfN4GTMvDRyKcgn1BKbsIfruqHPXFmkekcZDKNmCV/7xR5pzrfLIUEThs+z/qE4LxFJ
         CuOR4zhPKKsAPDN7bNAK8OLYTlzapQVLw+vRhAUCiZ/7rXJ+q2aTlN07u5J2RUB42knw
         26z21lozu6uTAnoTIMgALyGrcLC1+o8zb2oW1GD8bY5iVO6cbO/pkYnFyyJ5Ut+0d4Mc
         9wm5Ru5kJ8mf8ZOFLBPWRNLaUJuR86UpS1xz3Z//0KcVZB/qb894BZNHPewdkOpZIL5i
         Tg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CXg1x79UbkwSXV+mFkm1ilR/Mir6wiLbbAEs0L3/XQ4=;
        b=WYOUtujMMf/wTodHxgk9gg2cwspj2IQKKREh0/hX1T/JOSxDBmBB8tY0UuszXgwDc8
         LTLajRF3sg+mDSyYD0UcbYN2N99Rax0e8d2jokotjTbNPylnlohyFbZsLAwie937/AaJ
         UE5MqJCOX0ApYvB7+a6OgIkqoLTXt2KOU+ALt+a16gbfEznNu1c1/L/xvrOt09HgQe97
         +ggk4WU0dQMOMHZYUQX+XVmYlSJaVpyKoNiNEnfcNqjAgc7dgcXFsp6EtP5XlDxicV2r
         v/aBh3Jg5o8q/c7coSasvVkJtvJonwj+V66Q1aqrYDaY2+sgIEpT/gQtrKhNRCs3sskb
         ZPzA==
X-Gm-Message-State: AOAM532bbI7VyxqX+dxffJCA1REPCrLEoPMWQAJQ2WrZcpv4M7xfNO2O
	zrj2vV26VTtlpVtQb+qEUaBlX8KuI9u8CA==
X-Google-Smtp-Source: ABdhPJzySEUNZ4Ns+4BUmNuWrnzFug/6meMtOYRmqPwQGD+8qsKO7pfb+5dKSYWleNFJY5banhsI5Q==
X-Received: by 2002:a05:6a00:16c2:b029:228:964e:8b36 with SMTP id l2-20020a056a0016c2b0290228964e8b36mr10254236pfc.11.1618619195291;
        Fri, 16 Apr 2021 17:26:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id l18sm6518951pjq.33.2021.04.16.17.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 17:26:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joe Hershberger <joe.hershberger@ni.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] strongswan: Make PACKAGECONFIG a default value
Date: Fri, 16 Apr 2021 17:26:32 -0700
Message-Id: <20210417002632.443728-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Hershberger <joe.hershberger@ni.com>

Change from a weak default to a default in the definition of the PACKAGECONFIG.

In https://github.com/flihp/meta-measured/blob/master/networking-layer/recipes-support/strongswan/strongswan_5.%25.bbappend the PACKAGECONFIG is appended to, so if the definition is weak here, the variable will be empty when the bbappend attempts to add to it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
index dd50fba3dd..c178b4cdac 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
+PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
-- 
2.31.1

