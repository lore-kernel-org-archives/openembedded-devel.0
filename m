Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.1389.1632245379383062155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O81SWGsu;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id s11so21394144pgr.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aoFKnf5zK3850/nGduKe/lO1Efbsw77Tf0g0T6p9+D4=;
        b=O81SWGsuj/DtCYxARIv7I/r2n/2FoatBcdy+Cl1t7s/fc7ZTXzKpex6eJCEQNG+sMg
         Xx6WY5W1hKtHZb5MuANmm+7L3vMdk+E2v2bDy+bVEhyFp1b4G4p5y9Xrq+PtnPrvitSG
         +IduQw2r74/gWbDcNDLdjMCO9iHkHPS1pPD90W8MIgb+R5VTEgdx2L8FgfSGNTmzD928
         VgDEnvxpTz7mLdNnvV3QtIMdv+KsOSpoVfuJ/FqKVDC5/ug4WHvSQmNoTB1dszkGd7oG
         LuzTnquz02cNyoVTG/9QyoSk4yN//RvORwgpVhcaEYyoscQOvv/uUAjkIbG6dElayAyh
         PqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aoFKnf5zK3850/nGduKe/lO1Efbsw77Tf0g0T6p9+D4=;
        b=srArQuVqdMZvOeXZVv+/YS/O+kNu1xvbv5fHgoRJpykcPhb/1MndRjmy+gm4jamZ2O
         MFn1Q6mac5PRUc7/n0OyTVn9fpzSkLAzJ2CNTFjpozh2PwYCUC+beFkS4qk8Zoh/M4OM
         0PEAkUd3VOil1T7zMyMI92NDgtukj6SVsib1Z3TARVC5mUXfyDyPVmFxtfqdwcv6/yS4
         TBX+uIGfB4+NhTEhFww7DFevAmH6v0n/iAb/KSI4etX3HslMB46VppISHQA+XY7EZPmt
         sXHaB0HAlBr6UqLU5g2pJCUYUsOHHXHRQvh5xv52/s45nDjlmQRXpvVI+dVhR+n6kr5k
         Rhpg==
X-Gm-Message-State: AOAM533uRaTSbTj7u45qpP8EKAA3fXxmzihHrO/PSRvIStGAr0e6rTER
	WPObDAfZh+Zkx+8nqky1X58pdYObKctzpA==
X-Google-Smtp-Source: ABdhPJzzqX+A5XIUhY7W3Wn99kUbdQKAIM5P8tVOyd1kYQ2V4WotdyjR7cUVP4Ll007Lk/TBznZtew==
X-Received: by 2002:a65:52cd:: with SMTP id z13mr29199528pgp.405.1632245378743;
        Tue, 21 Sep 2021 10:29:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id r193sm6578530pfc.197.2021.09.21.10.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:29:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] site: Remove local site files
Date: Tue, 21 Sep 2021 10:29:31 -0700
Message-Id: <20210921172931.3132388-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921172931.3132388-1-raj.khem@gmail.com>
References: <20210921172931.3132388-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These entries are either in core or redundant

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/site/arm-64        | 13 -------------
 meta-gnome/site/riscv64-linux | 16 ----------------
 meta-gnome/site/x86_64-linux  | 17 -----------------
 3 files changed, 46 deletions(-)
 delete mode 100644 meta-gnome/site/arm-64
 delete mode 100644 meta-gnome/site/riscv64-linux
 delete mode 100644 meta-gnome/site/x86_64-linux

diff --git a/meta-gnome/site/arm-64 b/meta-gnome/site/arm-64
deleted file mode 100644
index f474d2cc40..0000000000
--- a/meta-gnome/site/arm-64
+++ /dev/null
@@ -1,13 +0,0 @@
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
diff --git a/meta-gnome/site/riscv64-linux b/meta-gnome/site/riscv64-linux
deleted file mode 100644
index e3a41ea0e1..0000000000
--- a/meta-gnome/site/riscv64-linux
+++ /dev/null
@@ -1,16 +0,0 @@
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
diff --git a/meta-gnome/site/x86_64-linux b/meta-gnome/site/x86_64-linux
deleted file mode 100644
index eba1fee2bb..0000000000
--- a/meta-gnome/site/x86_64-linux
+++ /dev/null
@@ -1,17 +0,0 @@
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=8
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-
-lf_cv_sane_realloc=yes
-as_cv_unaligned_access=${as_cv_unaligned_access=yes}
-
-- 
2.33.0

