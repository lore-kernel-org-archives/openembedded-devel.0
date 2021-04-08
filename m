Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.255.1617899822896005701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LnIanRaw;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id a8so2770802oic.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yeGrtuND6eKeGGwUhA/kXKpeAXYPBKktmuZ+ZQHqTVY=;
        b=LnIanRawCHPFHEn5qGqaNVOF2LB8p5qVgWPIPoW80wVgbBOmlju0x0IFk/g2Jdz3ZC
         xJ4M9Rm4rV6sf1V+BUNa9KJwLB/7NFu/+/hxpEETD8+1I2T9SX3Aeo1bPnJd+kFnbjsR
         n82jkQQA7CY1XD2Zq/va8A5GKYDEMTbluy1lPvg8gO4fDEnajzZ6Hc4s9xftnpKClkCw
         Zy55ErIsCfRzV5xcNJWT2mqPXVjQWor2xKlBHazq4YI+AMuAC2gVJMXJqeXLXEneycCa
         AnGF+P5TdYWtLBi2AhhpKR9B2rqjqMpVcznp8wLaZfwexUOI4O5G2KclI0Ybyjr03kzt
         aNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yeGrtuND6eKeGGwUhA/kXKpeAXYPBKktmuZ+ZQHqTVY=;
        b=A/M43DHh4SYApJsTPJ82UooDycVAm5ZJ1TxlDFmAJW6AJyRlhcllDSoQbGsVGsBo6/
         SpWsSL0bNKrlC7r1Y6jaDL9UpX+0nJ0FglYVB/iI7BRQkKT1pfzPy7x8aN1KsWqbxuIg
         o9/14mLhRIRbncQU/Rn4/vN1pjbenj8Rzu9x4ti1oagaLlbkrT46tTrWG0wW1dazb6OZ
         bDVLAwM75Ql9fCC+O4WYHZdMecc/CYKLo98fP8guU6Tgh/Y4j7FyNYPlMOdA8OxYmYFa
         5vQB8itRVl8eZbp7C1UN3bOeDmkvGsBF6/4Pr7wfi0zhLm1+123C+JPVo8WdmZihpONB
         JpQw==
X-Gm-Message-State: AOAM531UnuhNeil+K5BPmtNT6BUwJcB1RfD1jjMlb1y7m00lZWaLzXed
	yxvZpG4m/uPMiIc018lnyKDIRu7CCTQ=
X-Google-Smtp-Source: ABdhPJyxmUOuQzvII9UtFrI9lERWmGwmLpwkpI0reTua/5FOa+g5No6356Qx3Y8HUy2UDRwYhfw6mQ==
X-Received: by 2002:a54:4883:: with SMTP id r3mr6944467oic.147.1617899822151;
        Thu, 08 Apr 2021 09:37:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 53/64] packagegroup-meta-oe: include glfw, icewm, geis only with x11 in DISTRO_FEATURES
Date: Thu,  8 Apr 2021 09:36:00 -0700
Message-Id: <7a854b90c35a9607cb63298d401ec2a0adea93e1.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* and also opengl for glfw

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3bffa82504f27d2da7ca87aeda799632b717d831)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4eb2e8c11c9..2958eac6a0f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -192,7 +192,7 @@ RDEPENDS_packagegroup-meta-oe-core = "\
     usleep \
     dbus-cxx \
 "
-RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " glfw"
+RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "glfw", "", d)}"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv64 = "safec"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv32 = "safec"
 
@@ -355,7 +355,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      libuio \
      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
      lprng \
-     icewm \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
      md5deep \
      indent \
      jansson \
@@ -712,7 +712,6 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ace-cloud-editor \
     frame \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
-    geis \
     grail \
     asio \
     augeas \
-- 
2.17.1

