Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8119.1795739793371388186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IHp00cPJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f041f88577so41161195ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739793; x=1796344593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECBfmPnzXTkZaG8OM3PTFCTLT1118i8V8e0Ou/Vbdjk=;
        b=IHp00cPJPpuez5ycdd71ky9+yGt4Rk7996940r9/x7SxKXcsMxyfqsbbryyid84c0z
         RqM50K9XNmM8RjntpoCc8fAPHnK6F/vQ67S/8Xc9369vrcxklAXo1ICrF/Dm0fLd12Hf
         4NbaxjVhTGfaTrY4vTecKl0CoFKbLhst9WYL2oyh2o3NWVmgFr32RF+1BMMPD6JX5eog
         Yg8ynMSvoQdhpzHay5D7GShtTVvL85hoQ5kJ6D9rJ++WIJ3tBy9CSxJPXpEsFvPxL9Pw
         tGvWtpazxmhfvBcwQaHe4+LF41egbQG74lKELAJDxohqNXiX8hfa+43VC+I0Ey1Xsr0m
         fFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739793; x=1796344593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECBfmPnzXTkZaG8OM3PTFCTLT1118i8V8e0Ou/Vbdjk=;
        b=F/3v7Cr4Vqf5FNfLOaJCxt80qrFzC/QWzSIUQWdynjDn688bSjjE7C/G2UhOoAIk0F
         gOlEl49JNmu1qcKbSC8u2pKbhhqq73geQ2P87Fyfc+uICNODso64jKnd8lqRzYgo7tr3
         6BQAeq1nqgyCfe/JTbzskK57R5PEXdObv3wyBqu8Y/ySkWtoSBxPo5AcvD9k+bUzj7dO
         w2fyyIijLQgyKj3PJryNC3VxAk5eQt04PVaOu39AeERvHbipXdg0kUswCGORph6llMWE
         sAiegqIcCn2BeSwSG+YCV2p+F4s37WcPga40M1Wd2YPOOa+WfFvFVVZqs/t8zyHovmZB
         AzZw==
X-Gm-Message-State: APuU4Z8gvHRBGuj7GgmGDO29FhOnuhWEE+y1t5lgUNHXMdbT3Hscdf4z
	jzuL2prqGaLVhjGv72QiRz6M4Z9s8ugyD0Ffw/Kbv22h8jRGKCGtx58wQh2Wz/NI
X-Gm-Gg: AZFdTZcc+rS2GMobmwW8REsVrF/B6p2LfsBsCk3rmwbuQsbVWJQLciF1C5ZujYGyr2e
	/KIZ3VxgrWh6+97QmtdZPALKkOi1ajmogl6P3VxWyoUp7a10Z9ofGXew5pEBJFEWhf1pwlUJFCx
	anw4GRIN8/DXYqRyyxmtad5YkZgrMlQn8K5K7mvfs8/Y799fDu3HbADVzs8FnqEkTY7x3Wpkr+u
	oltXh409pCJ692o+PR1aG+w9+2YlijWREXdD7KwTc0pFv/PxwdrVxpkrqsSJDfjpXsjf0/uJUn6
	139vkJWHb3lTgCTgaBeUzd/Jl/vfUQjyRXySOim+TAROz9QkSMyieMhg5bbO2kCzeXzRLlaHeau
	CY6splgjNP0WvdnstouAQPIVAN6/Wo48nQRbZ/JqXQsYcp1AWm3TOpieQDz6oa/kTnxnSrbzK87
	umc5r2725aLt8yMoNmPB4S1p6IILeuO11K4kJKvOt6CWu0bKIk8SzrYkQ7Xd9ScP52iwG4Othso
	anCfp/iWvk2fMl0c/bP5wkNF76YfSmK9eVUEqelhbDc2y5wPYCwJMeqnPmfuhXrBI10rk+DWjIn
	+oOwzCw0v7hmBH3D+0qcEr3K80dCCOTn2BxfTttYLuUJl4+xP2m9NwagpqRMMxcKgTmQwbVcX1Y
	3Dar+nNFGpH+yNMZkcBvhCLAYVTnPb6xImM5BKjXB23OlkOgWPkq+k/9RfRrH7YkJw61AviZTdK
	IGEKwYQTZY5oW1zfccCZozeSrU3D8r/bRa1ov/07S5/By9pLGLB8dBl1QP7Vop0J/BFM4QhmnTT
	2FPsIPY7G14Uc5UcgjC+PFdp0CoyLFowBlhW6A1zjx8wBruz9JG4jkYqTvkweBYSOAJIo6KC+93
	LB78zdVZLpb85zQ2+9TDBWj7/1c=
X-Received: by 2002:a17:903:3886:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2f03f1d63b0mr244082235ad.45.1795739792693;
        Thu, 26 Nov 2026 16:36:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 23/39] pam-plugin-ldapdb: upgrade 2.0.0 -> 2.0.1
Date: Thu, 26 Nov 2026 16:35:27 -0800
Message-ID: <20261127003543.2167775-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133193
Content-Type: text/plain; charset="utf-8"

Include <sys/time.h> explicitly for struct timeval, fixing the build
with musl libc.

Drop 0001-Include-sys-time.h-for-struct-timeval.patch, it is the same
fix as the upstream commit in 2.0.1.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nclude-sys-time.h-for-struct-timeval.patch | 32 -------------------
 ...db_2.0.0.bb => pam-plugin-ldapdb_2.0.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
 rename meta-oe/recipes-extended/pam/{pam-plugin-ldapdb_2.0.0.bb => pam-plugin-ldapdb_2.0.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
deleted file mode 100644
index 8d0025e0e7..0000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ac86beda314368dead44083a99cece306e72fed7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Mon, 23 Nov 2026 01:10:11 -0800
-Subject: [PATCH] Include sys/time.h for struct timeval
-
-pam_ldapdb.cpp uses struct timeval for the LDAP network timeout.
-glibc headers pull in <sys/time.h> indirectly, musl does not, so
-the build fails with:
-
-  pam_ldapdb.cpp:55:20: error: variable has incomplete type 'struct timeval'
-
-Include it explicitly.
-
-Upstream-Status: Submitted [https://github.com/smackysnacks/pam_ldapdb/pull/15]
-AI-Generated: Uses Claude Code
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- pam_ldapdb.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pam_ldapdb.cpp b/pam_ldapdb.cpp
-index 6b73ca5..cccc33b 100644
---- a/pam_ldapdb.cpp
-+++ b/pam_ldapdb.cpp
-@@ -3,6 +3,7 @@
- #include <pwd.h>
- #include <stdexcept>
- #include <string>
-+#include <sys/time.h>
- #include <syslog.h>
- #include <utility>
- 
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb
rename to meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.1.bb
index 709d798133..418be4f2a5 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.1.bb
@@ -10,10 +10,8 @@ DEPENDS = "libpam openldap"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "f8ad9921f94d683d9cd40566694709308a12ae71"
-SRC_URI = "git://github.com/smackysnacks/pam_ldapdb;branch=master;protocol=https;tag=v${PV} \
-           file://0001-Include-sys-time.h-for-struct-timeval.patch \
-           "
+SRCREV = "bfd92da201b2ce412fc4094442427aa68c2526d8"
+SRC_URI = "git://github.com/smackysnacks/pam_ldapdb;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
