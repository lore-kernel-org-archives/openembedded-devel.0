Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7999.1794465776275911061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=clPV7nLP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2706254a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465776; x=1795070576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUtJPAeCrhUBkn+vBZ4XlrbE3oIM8CkBGCkpA1/rsOU=;
        b=clPV7nLPRbaUxncf0VpQZMjRQCm4QeMH/Z3L5FqbeQ/IbG2aHzru/OuYG5R+6LmE8P
         PHjhLyBiapYUIUZYuXpvJf1yjVsQH5OCeu+3zPwN3rdFqoEkwqOkKmaK1IsHgxRC+WTA
         YO0ySkNIZnsfWskas1YXtkXWMPqsVYOmhdo/he75EHmq1FKDy4wgp7UllF0VNw4rd3H6
         mfEhz+ZOVBe6HE1b0fL41Mw79ym5MybCzs/9uDo2ll8uF9iw3gNDLdxBx3GczJCyw+sU
         EDrczR/PqGpfquF4OZCdOX4lxO2Dbh6zrmlJdQ9kA8fvUlcPcajNh3TF68queVfhgEnn
         5pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465776; x=1795070576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUtJPAeCrhUBkn+vBZ4XlrbE3oIM8CkBGCkpA1/rsOU=;
        b=nasoRLNsUsFVmE05xrD9zwTTmlwx3RVANVgeLwsXKcaLOs21bPf+PfImUknSDvTkgq
         Gz3ybrOc1CJNN6FbtTc5rvyN+KdrCr4ijtrQHXz9HbXXawn0X9y+ScYGD2MvampvW/cs
         l1NWF62pSOd88/6r68c9Q2XP6X/iLE+1inDzJ/+1OQ1m25akZniDDyPJxe4KTAU4/tD8
         skJGO+m35tgJnrWp0rXaXzS6HLSHMAb924OjxBiyW7IyzvJEYi3a9VEV6qXEhJrWDd9t
         k5+r3PEpAfkXWN0kggo1QrHI7mcD0CNfqfIyHbuXGCIJkCgxn6sKscjPmSKUdfaSSpa4
         qopw==
X-Gm-Message-State: APuU4Z/9GAxkHO7KkpADwztHj/AccCSMLuqGq1BNcL/Zxsj75oWo8iYq
	YCA9xAJVcTV9A+BmVc8BbC5FsON0/UPHznexyT4x5n4WE+HNIeE6iv/1QhSL+bmcg+o=
X-Gm-Gg: AYBFou0wYPcOoE28JbokiWQoS3E7IZJaYKpFwVNpGazIwbrbuDCWhZRUMi+zCaxKuno
	k1+90wfdfY2krAUdK/akeQAc0MWc2ib3eJbww3ShD3TzOYxDX3T0DK6WXdY02mNQd1rL368dYy3
	qrWlbMqk0Fll6E3lwdXuZ/j+UcDNoUDyXtKQLT/uyq3oqFcIPeF/59Fkf8Eu7KAd6QR2nV+Y3LD
	I5IeaKWaAdFuWdsH28/WUE3zh2bSazn3QzQ6BRPmqcXr20NP658kmsRSfVgWOGAHX0AGHrnBVbO
	e5t+uaLW356V0CB6H/6swSDPjDZpbJgy/n9Oa7IAEk4RIrM7CpUuo2noEfE/9C7qpbE/oxnAJOw
	Lx90kxv5i31r9i/a+GUV9kQ0J9DByY6HJdSwjHF3GEyIxj8c6O+ltEBNGrc2VUmGpF0w7HKNuXl
	fbrbfjy4PVOIdR6VNV2FOxx1dW+HOU6zb9YlmB24XiPLuWPXvqp6CsooDpsz41eWvNBMpyBiSIg
	orS6NhWeKdAlR07yrwhHBE0NOKywpPib/nbZmMGEiSpbE4VkwdwMC5e2YMr7fHdJzwd0rMZ7kho
	IjjO5opJndG23E2LsT2jow/c8AMeBDI+tSZRdGWjBc9N9uLVG1UjhV3eUhyzz+pp7+ldoc43GLd
	ovCeeWa683E2XO479PjEBZy1Ib4WSyUCwm98VsgLwffxaA+F1+FCxneNO27Om6XI4q0emninQ6V
	n46cY/WS+K0+IB5pg/L+25uM33hgRtPT2CGHSFXG/0ARTyJlMDFO6AsETJeU1GtJ3dFDL6PtIsZ
	vLWz4WfVNYnFgZ13w5GoIO+U72Z80OhdML92TkKyKWl0FF/UUN5sqlvPNhfDCEL6imKktpAm6es
	nLeGLj4aTXZ6+xpL5ySFBUvb2Q==
X-Received: by 2002:a17:90b:17c8:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b182edc482mr4888490a91.29.1794465775527;
        Wed, 11 Nov 2026 22:42:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 21/24] drbd-utils: upgrade 9.34.0 -> 9.35.0
Date: Wed, 11 Nov 2026 22:42:21 -0800
Message-ID: <20261112064225.2410019-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132190
Content-Type: text/plain; charset="utf-8"

Update the drbd-headers submodule revision to the one used by the
v9.35.0 tag and refresh 0001-fix-the-hardcoded-legacy-helper-path.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...001-fix-the-hardcoded-legacy-helper-path.patch | 15 ++++++---------
 ...{drbd-utils_9.34.0.bb => drbd-utils_9.35.0.bb} |  4 ++--
 2 files changed, 8 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.34.0.bb => drbd-utils_9.35.0.bb} (96%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
index 3d7c95b4a8..49c3340790 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
@@ -23,22 +23,22 @@ Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/user/v9/Makefile.in b/user/v9/Makefile.in
-index fa12f79..980c67c 100644
+index cf23ca1..77bf201 100644
 --- a/user/v9/Makefile.in
 +++ b/user/v9/Makefile.in
-@@ -70,6 +70,7 @@ CFLAGS += -DKEYUTILS
+@@ -72,6 +72,7 @@ CFLAGS += -DKEYUTILS
  endif
  ifeq ($(WITH_84_SUPPORT),yes)
  CFLAGS += -DWITH_84_SUPPORT
 +CFLAGS += -DDRBD_LEGACY_LIB_DIR=\"$(LIBDIR)\"
  endif
- CFLAGS += $(EXTRA_CFLAGS)
- 
+ ifneq ($(filter local package,$(ENABLE_COVERAGE)),)
+ CFLAGS += --coverage
 diff --git a/user/v9/drbdtool_common.c b/user/v9/drbdtool_common.c
-index d07d054..ea95a16 100644
+index f85a067..403ceac 100644
 --- a/user/v9/drbdtool_common.c
 +++ b/user/v9/drbdtool_common.c
-@@ -332,8 +332,7 @@ void add_component_to_path(const char *path)
+@@ -334,8 +334,7 @@ void add_component_to_path(const char *path)
  
  void add_lib_drbd_to_path(void)
  {
@@ -48,6 +48,3 @@ index d07d054..ea95a16 100644
  }
  
  /* from linux/crypto/crc32.c */
--- 
-2.53.0
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb
similarity index 96%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb
index abc406b5e0..4bd313823c 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.35.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            file://0001-fix-the-hardcoded-legacy-helper-path.patch \
            "
-SRCREV_drbd-utils = "7fe34d56a7264cfc92fc5270471827bb3f7773e6"
-SRCREV_drbd-headers = "8ab631bfa8eb606e53c86f50b9f2d6f51d0f9ca5"
+SRCREV_drbd-utils = "e1e02e77e6d068f626cef7c3998ed08b0fde7669"
+SRCREV_drbd-headers = "bdf8650ea6e32d1c4518b7ad6c2d7469896d17ff"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
