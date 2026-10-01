Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500B4CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:06:50 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7528.1790849207283622539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AjJT42kW;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so29358265ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849207; x=1791454007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxKWdJm2rqmGKH6GNOk5z6l4eC4ia8Z7XEXwqe2HFnQ=;
        b=AjJT42kWckxyg9+r7cC5/nxfvQcl92KMxzDMHHFWckFNgLL/4/tSbOD1V4klp0Ah6f
         uop8utsbhS3+psiYSCY1JW5+PY1nwwBZlHnxbXuNO6b6Aa8CLSoL9QEOxzuwHvfiXP9M
         pDX9XvWXb9QHUor/zhxusqX/75Xzjy2r///LMAcu5ArF2EuLxHZ2vpUL2YR69UBptJJ1
         Q23THFAJ9h8bG69yiaGB6qb8LEATSWAphSLeukLgyJXsr7iUWWWr8pMrKMwhFt4mwvJ6
         n7UDxg88r70zadtfhK1sP4SFvvL5GKYN7I8AHkpkz4rPjemny6jfAji5rivt1g+9yH0+
         UgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849207; x=1791454007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxKWdJm2rqmGKH6GNOk5z6l4eC4ia8Z7XEXwqe2HFnQ=;
        b=Amh4MJMGdTvZY6q/CooNY+D2LPthwQQ9ljbbm8IP+LZRijqQy60Iop1QlYnJPu6iP1
         ojNvUkKe4rH3c9lsBruD+k5jSpMLsSkfsf2DXL2AfGoMNtCh9h6xxxv4WivlQFIsmPeb
         wdwEWcMu7wSqrOEcbR02SbeZDSshPVp8MsS3L4xG5H4LJR9M00p53BxBZAVeD8cPRXUT
         MKusDdJMz0E3CTLswPU8mYbhXQYXKN0obvmPAkoajNw5j4GuUeY+W5a0XU6OH4NBJYzh
         VEjyB4IIeVN2K2M07it+FJGS0Nhizeig/nc/YacJq0qls0elLrY20Y2zHcpDHzGlfViT
         tcKg==
X-Gm-Message-State: AFq9FYKl2XZSGx/lBIM5/9Gn70fGyayf7MulqBNVMtA4lGzzaTNuQfpc
	0/Q4JdNxXKqHM3jqga3XlHQPJGdnpfYSIZjuFcYg79as1isBRsYKNoSpRk3K8A==
X-Gm-Gg: AYBFou1/8khnz/sHKhZOnMyBwhbJedAcYsFzwkkJzzLbULENBsxDazLtrPGWIQAX9II
	oDjO+O+Vuzmq7/hOFTofSCJGLPenuQaiPdy34w65d7qPcrIoIzdmw3zUXE20dTw3MuyTolpXzj5
	Yrkx0eunSOme7QJz+M2O972p0usJfo2GAoRNgiOm8NkSHTGyoKfueN7c3/CpLHVQTD63E3+p50x
	f6v/d3tkPZV/qagec3gPsBfE9pfHWAe5idZj7HHOnrVo2HWsfDLyPve31OsY7epGU0BaVFsHUr/
	5BJtbFa8diSLCV1ZwdGKu6R9ftQ9Z5WCBm+CAllt38hpHF+PAhUSeymD+tUb9n8vWeqmS+A5jFV
	Sr3bS6cYEBYAQhqJeAnRuu4RcTOPVl9CHCsRQnDSG6expiDQFdjUCpyAbTdGaD1DA6g+HJ4wAA0
	ReGR9VFp9/7++zRSEzWBRlRRmpg4ah+NCINXjILCplhZhwnlf9RpxPzs7qNuudY1BLvKb57ybwo
	JA+boN2T2WzoFdiozsvMVg=
X-Received: by 2002:a17:903:2308:b0:2dd:c053:ec73 with SMTP id d9443c01a7336-2e2e4b6b73fmr34737925ad.38.1790849206570;
        Thu, 01 Oct 2026 03:06:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/11] libwmf: upgrade 0.2.15 -> 0.2.16
Date: Thu,  1 Oct 2026 23:06:26 +1300
Message-ID: <20261001100634.1992725-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130569

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: changed to LGPL 2.1[1]

Changelog:
https://github.com/caolanm/libwmf/releases/tag/v0.2.16

[1]https://github.com/caolanm/libwmf/commit/8a2627632b83f5eaadbc6da2db6866678da1ce1e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libwmf/{libwmf_0.2.15.bb => libwmf_0.2.16.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libwmf/{libwmf_0.2.15.bb => libwmf_0.2.16.bb} (85%)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.16.bb
similarity index 85%
rename from meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb
rename to meta-oe/recipes-extended/libwmf/libwmf_0.2.16.bb
index a093c6410b..bba3a97f3d 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.16.bb
@@ -3,8 +3,8 @@ SUMMARY = "Library for converting WMF files"
 HOMEPAGE = "https://github.com/caolanm/libwmf"
 SECTION = "libs"
 
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5"
 
 
 DEPENDS:class-native = "freetype-native libpng-native jpeg-native"
@@ -17,7 +17,7 @@ inherit features_check autotools pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d00b314cc5fbed48fe79fd3acdcf42324d2f4b8e"
+SRCREV = "a916f30f6232cf3e28df285fcba5753ee5b1aa0f"
 
 
 do_install:append() {

