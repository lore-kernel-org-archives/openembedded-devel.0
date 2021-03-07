Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.18066.1615095820804813665
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 21:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uMXGicJg;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p21so4245515pgl.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufZkpbgDNIzLJDYhQsPzkkcZ632R5BMbJOoSI/u0GiI=;
        b=uMXGicJgBmrip70gIOaMs+sui5kfg5sYGqkf3hO9bCgAKSyhm3UyiUtETYvSyld5WB
         By3k7hU/TD2UTDA+lZrNsUPivMqA2nm4MDrs05txJuqNRKaRPCOZP61DtUh2/8cMjTke
         WPgIRLLJCrR+y27XYYyIyeMS3Um85UGlGpjZHJJH8n/IplACFZU0eztk3Q5MrOM5bwfk
         SttVBcWjF00ba452YFZIN4gjZb1ENVku1bq+/POaHEFWp8/TkelPiG8rH6O3YbbMenRA
         8avN+CI4EL2UUb6mzr7ShFDF4AO9Wa11TM4l7hcji/P7Plu0CXZCQvpDMJdhcvt9Gsls
         Jzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufZkpbgDNIzLJDYhQsPzkkcZ632R5BMbJOoSI/u0GiI=;
        b=qXOwefaJcIW+iAsJHRO60fobDKYjMgIC5teg1zx0w+KRpu0L03tWX80t/Ru4Y0lKGk
         8lo2PnW2ymIdaCqTjsmJlW/Fp+i5+aWnsW5sanw1oAylvjXh5hjAbr9Xwt09IpvJejok
         RT5/8E4hZUvE8eJeL++vuRlIdV7Lsp76+UJHGqC3EmhpgITfJj1VKqDUSAOTeJiJe+js
         ZdFRKO+UHXsou3YF8XtcV+7Fih0cSZm1TeZvBUecOSQALqhO+Ir38DCRwHnmD+drZHMq
         NAC04wmBNYJV7n9/cD6vFVYrM9rIAoJ1+W0KpVpDQjwKtn7y6Rs3BHefLKbY+6p1AYZe
         ojHg==
X-Gm-Message-State: AOAM5304Ni9O+iwPzufGT/XCsqVelyJd2xFXbAFuVAOAuUZrO9Yenntx
	OQ05WJc8+nbVEBz/Fk6yKDZZThrsihVkVg==
X-Google-Smtp-Source: ABdhPJyf8XX9lH8Zzs4C7+u4gmh9K4KafWnN7yix1q+ORbUihMTlD4K+Pb2cx2hX3xlCUCX8cxdkwg==
X-Received: by 2002:aa7:881a:0:b029:1f1:6148:15c3 with SMTP id c26-20020aa7881a0000b02901f1614815c3mr7961331pfo.30.1615095820146;
        Sat, 06 Mar 2021 21:43:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id e185sm6796810pfe.117.2021.03.06.21.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 21:43:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] packagegroup-meta-oe: Add libleak to packagegroup-meta-oe-extended
Date: Sat,  6 Mar 2021 21:43:35 -0800
Message-Id: <20210307054335.2332899-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307054335.2332899-1-raj.khem@gmail.com>
References: <20210307054335.2332899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Exclude riscv

 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 94830e2970..03c509a2f9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -338,6 +338,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      hiredis \
      hplip \
      hwloc \
+     libleak \
      libuio \
      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
      lprng \
@@ -422,8 +423,8 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_mips = "sysdig"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa minifi-cpp"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa minifi-cpp"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
-RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa sysdig tiptop"
-RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa sysdig tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm libleak mraa sysdig tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm libleak mraa sysdig tiptop"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm \
-- 
2.30.1

