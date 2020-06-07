Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1346.1591500301255541560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGiGBBkb;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id d6so4529985pjs.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HHbNlspcNfws4ZVQlqMfBjNZvOx2bgHwwfwD6HZ7JGo=;
        b=VGiGBBkbFuyjASDh9nnMMh6QnUNX4O7ZkTo9Yl3uwxtBMMhQfiyuDYnZL0WpCqf+/K
         1iAYzKSepPMf25PR7iH8K+TZJDGQYHpQedAInBCZyamSm+s2r11Gik7GwnG3/9uQaEwu
         /HB2A/nZ1Kd1goDv9CbjRpwdsb0omMiSzWNPryffhLwaLKPh6SCZHw0vD2HyueM73V4N
         yUspIpj9SELy4I7MYhQ+IklbnpSocnn2dHlgIA58PqAk1i48M5XGvYP52K/D2wL/Mi6c
         h3nveBaBoREUbw+Itp/Q+qxbATXgqUTs2R84EGmiCQOWVfhBL3eZ/eDwQ+U5Mq3Ndd6Y
         QZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HHbNlspcNfws4ZVQlqMfBjNZvOx2bgHwwfwD6HZ7JGo=;
        b=PaweWKvYNX+7RWbUWn2Cm5uFxDoFpBlcjWDzYHlS0WHCZLLra5kcGeB12k4RByGU4L
         K4vBO5SdFqIdPmnreCROmoolW0unZp/syzUynKrdQJAOwpzakSVZVo2cj+Vm7wsxuTx7
         HRDXBf21EQkIXdxR3/hU38K3bPCao1H0CkxbjxU5jeoYG+10Tm6neIZopCxcL+h4Cf2R
         Al1aI3t0/yr7Nfq3T6QWp+M9Ip2MdbCVtc3A1zWKRTMPuIS017b8zt6nYtmV9q2K8Y0+
         l1bBYNOzjUVqGlB4hRdxO1pa4thYpkO/ymRnn6i5MpIthircX6ZMYMXPGBmfhe5QX+xn
         1Fvw==
X-Gm-Message-State: AOAM5300ofL0bSA5upLu2Pm1PtV7DM8DxhAFiI7UXtwb80w+rxjonmh9
	yQDHTehfWMv63QuJVcIKYhv7qnJH
X-Google-Smtp-Source: ABdhPJzJZwcVG1ovcWJOPOby4j9fmH/NcU/I1/cDCAHpNVo/Iky7Afc/5WYE5nCavfCUfoAMHN0IwQ==
X-Received: by 2002:a17:902:6b86:: with SMTP id p6mr2081036plk.47.1591500300671;
        Sat, 06 Jun 2020 20:25:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/26] passwdqc: remove double modify operation
Date: Sat,  6 Jun 2020 20:24:28 -0700
Message-Id: <1e2cfa3adb03dd959099d7eba1f1ea59d0bb57d8.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

It is either += or append but not both - picking
append to be the safe bet

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 68fa0a4ac2b320c1ce92b44ead54df5f4d043a06)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
index 504ac1537e..dd302506d7 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] = "d1fedeaf759e8a0f32d28b5811ef11b5a5365154849190f4b7fab670a7
 
 # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
 # this package's pam_passwdqc.so needs pam
-CFLAGS_append += "-Wall -fPIC -DHAVE_SHADOW -DLINUX_PAM"
+CFLAGS_append = " -Wall -fPIC -DHAVE_SHADOW -DLINUX_PAM"
 
 # -e is no longer default setting in bitbake.conf
 EXTRA_OEMAKE = "-e"
-- 
2.17.1

