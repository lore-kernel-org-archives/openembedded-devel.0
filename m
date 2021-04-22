Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.731.1619111162673755574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k9UXHM2n;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id m11so32156852pfc.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS29NSAlPb0jsD9yM00ILGP0XaiK5MvoD3XY+YZ6LV4=;
        b=k9UXHM2n28E8v6+cQO/BFiXjOQfSiZRGT19TbPYUfngM2fy2kKByz8MSA76Gxk44KX
         677lgHxMDbCM9ixXI4zyXAf8ia5l3flwTdndqQxsNSL334qVKwmKpJoiZEXEpPMjBG7S
         BN164ay43ri6H8MjDmB9V33fcYKHiXG//cB1J780zSLUo/5SVV//53pXi9BXu/wYf4Jy
         N2hE7RaY8r93Ff4RM4gkqbOpK0ozNQgkyQKl8+5G2B1gR3MxB2BVGJgzCxdMMXgXnqXz
         +Avo6pozLC1c++97g1qzYLQL5Woz3e8vGL2ZdPyJ/vKE19X8YX7mOH3eO27yH0gTJX9L
         xQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS29NSAlPb0jsD9yM00ILGP0XaiK5MvoD3XY+YZ6LV4=;
        b=Lw9jb/5ekqBMYb3fg/KRFHrswz2sbeM5OafZr2QyUrkgCBxiZButntiy/1dZBvvASj
         2fpFUbmjPknNq0Gca+1BM8HoWz6gqpyBLlz7lZu3tdu/SL4INNQYcmb0qPAKu3y4MeDW
         A0jT0so013wo9cv3EWYNr+o+O1f6QCPdY8NF+UKxMfsZCqpYLwWM/vsHVQarVw0O+AYj
         B1ytJD+RZg0XT9YGKx/Ezkb6TatCemDrQ+84OrExqGulV/BYyghapl8KNdaZHNdBBQZt
         DMoQ+7sZz0kfeAEgEJ1G0HpiwCMl7qm1ZbWr5bGUyOQise64YOFZ/yKJzAvFPj1QCu2r
         6AcQ==
X-Gm-Message-State: AOAM53012704jAZrilxxbjmX2IgwlusFQ89HDFy0duFe9uQrz6gcvRii
	D71olWIbrTt/3X8HQ5GhVkHxyXANb7q49Q==
X-Google-Smtp-Source: ABdhPJy5vjbJyZTjGpwSANtjX3IA591+faZIc2+b3vr5w1IScVeIwC29EZ5FLX+alPCAMs8Ia2PqbQ==
X-Received: by 2002:a63:df09:: with SMTP id u9mr4372245pgg.112.1619111161898;
        Thu, 22 Apr 2021 10:06:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d5sm2948370pgj.36.2021.04.22.10.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 10:06:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icons on musl/x86
Date: Thu, 22 Apr 2021 10:05:59 -0700
Message-Id: <20210422170559.1139028-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it uses qemu underneath which segfaults on musl/x86
until its fixed, we disable vector icons

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index a5e6990580..717716e1f9 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -55,6 +55,7 @@ EXTRA_OECONF = "--disable-python \
 
 EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
 EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
+EXTRA_OECONF_append_libc-musl_x86 = " --disable-vector-icons"
 EXTRA_OECONF_append_arm = " --disable-vector-icons"
 
 do_configure_append() {
-- 
2.31.1

