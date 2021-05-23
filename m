Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.15983.1621809246012411932
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iJmlTsaV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id b9so3574907ejc.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M0sHyMB6TCTQ9GNPm4NVBgiLeJAwNPmIUbe8zHkQAKs=;
        b=iJmlTsaVCLPbYdLj2P4YLjk8ZS4z4XktTomUEAsXSg/drlo3Bg7+eCIPjjbudhlTlz
         9ScD3T43QqGyYSTWBk7MKO8k2eisfJJY5EiBop0RFOGSgzUcniqz4Sa0M8WswX+9IKmV
         a3kokmE+CPnJvxSdGGDzH5ErSKQwjJ3e4X8qtZLgY6mwdBac4dM1WUD0pI1mUggwLmeU
         +FFR68uV+mpcPEnX04knUcGt/o2gw1+h64O0LAGleHFA+tma7UV1LAi/36abmQEnuk9x
         Vyd+59EeJLeKSngLlAon+r2d3n0FmKMyoDAOgh1jUTuUVCN7UN5p83kUxoJu/I6mKPEp
         bUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M0sHyMB6TCTQ9GNPm4NVBgiLeJAwNPmIUbe8zHkQAKs=;
        b=cMcelPE36QAz0qPltFNhagNdwQiIx6b6TUkA2aSwUcNEw+E4hpPzA84oAvvgquDmf3
         RWKDrRIU/COgIR4KP/CaP6P3lznhZeCTmsNFwoKzp9NTRMNgmJmwRtf1qzsQT+jIR+uA
         6ng6gnhzXFRvnCEubj/NwkW2INmXkdSiXSbIiaOZI5Fp6Bn/kUMsmqvwUbOSznF88qjg
         w4Z8XcuWLi4O0kwtwwMiU2iQlbOL7eR6T3VlhBubEVfVhg5pd0qlnOCAf4sJsPTkdgbP
         Ig9sUPVrjZwl6KR1BF6PrOb5M//aDN/dDm3IBmi5EYp/d0iqySkRyfiChMQR8zD4Tz6V
         /+wA==
X-Gm-Message-State: AOAM531lBtj70EXuAA+y7GmlfYlYgnq1J0xwN6nIEjvZ/U8TIS7Mx2nq
	Jtwxu16dPyRO8SGqfvlZgxavHaYhgHE=
X-Google-Smtp-Source: ABdhPJztn6MOkn2tF0sQ4+mNULf4BPZKPQBAsKWZ4Uf7WWBFJgj5Jcls7B8e3PPKnO3uYdjo9/lZ1A==
X-Received: by 2002:a17:906:7c02:: with SMTP id t2mr20298793ejo.0.1621809244630;
        Sun, 23 May 2021 15:34:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] colord: upgrade 1.4.4 -> 1.4.5
Date: Mon, 24 May 2021 00:33:50 +0200
Message-Id: <20210523223353.2576671-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ve-the-function-cd_icc_create_from_edid-to-avoid-u.patch | 6 +++---
 meta-oe/recipes-support/colord/colord.inc                   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
index 278b90e07..aae2be8c1 100644
--- a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
+++ b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
@@ -89,11 +89,11 @@ index a5e2328..dec509a 100644
 +}
 +
 diff --git a/lib/colord/cd-icc.c b/lib/colord/cd-icc.c
-index f231814..2c8fe77 100644
+index 8beec43..398ff7a 100644
 --- a/lib/colord/cd-icc.c
 +++ b/lib/colord/cd-icc.c
-@@ -3094,68 +3094,6 @@ out:
- 	return ret;
+@@ -3114,68 +3114,6 @@ cd_icc_create_default (CdIcc *icc, GError **error)
+ 	return cd_icc_create_default_full (icc, CD_ICC_LOAD_FLAGS_NONE, error);
  }
  
 -/**
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 7497fed51..09e600c94 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.4"
+PV = "1.4.5"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "32c2709a6002d9ee750483aaed6379c8"
-SRC_URI[sha256sum] = "9a0fe80160bf88efddb582a9fc0169f56065276dc3882c47dddb9eecd048c0a5"
+SRC_URI[sha256sum] = "b774ea443d239f4a2ee1853bd678426e669ddeda413dcb71cea1638c4d6c5e17"
 
-- 
2.31.1

