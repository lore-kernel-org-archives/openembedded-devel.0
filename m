Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C09CA5FBE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:54 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1470.1790722673568878375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FT8MZe4H;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso4691986eec.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722673; x=1791327473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpjI51PL8jvKNbd6LU/OOAIaCrE/RoE+KkF2HYtv0WU=;
        b=FT8MZe4Hd563NM6ytGi/Sq2fNu2jxergby586qGEssezyq13Mpk5tu6WNyvUx1TREP
         Opp54Gk4lD4tESKqzgizWP/w6cM3BFuyelKJCznWzKs+WDjunrdMTft2LV5jNwYi9Cjv
         Q1PatJLzy3P7d3d87JGww1gBZDP5zriawCX7s++lfM8wFMwPU/HEjgXzSlAH8LyzDsPm
         KobSvI2mosfN8IpxyVCJOOLwNP+S/2dQSRp0U3CiXZ9/cqHeIvsOflsvZMf7x3DmaJm3
         6xYggD0hWZN7mFSmQxr4cgZ4fPOaVsE99jLgiYamA2iM7XLcQ4ifb0uRLybXGIoXy/aP
         BNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722673; x=1791327473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpjI51PL8jvKNbd6LU/OOAIaCrE/RoE+KkF2HYtv0WU=;
        b=Mqv8Ait+Cv5pe0FGZzcPB41a2gb1+8g5SuLm1F5foWbWhkxCU8VAAU7JmO0lGxFpQ5
         RA8nx45lIhkCDw26HGRQANU96i/Xjh3GmTD5hj1XoNQfFZypCtmvRTwuUesh0uuUiHVx
         TrV73kJVRhMv1Uwkq//dbHlCBbONlqtmc7rPzvKl30JL0dtL0wMBya9vMAw+dH2gY4WZ
         1AJsCxW9cg/pPMx8tHf438xlJ8/3UdHxMWxigmgOvlOGAknw1LmmWMlDkWDTImFKESqM
         jDXDrJLnAKBYAZwOnH7MYwBWxGGVZBkWmOWrSRQM2btRtIAOtyDflMQIW7I+FhVIptb6
         AEuw==
X-Gm-Message-State: AFq9FYJ2Js+Fm3zrTL8De+ZTZ7nkE8gB30LLwPsu69xpYvJyek+HWfFs
	Us3TMLVN5OYOqBJ7elot/6iVYdeEqxWKWMp0rX6Vg1nDtyuEg5nrTksc5X+SyNaRf+A=
X-Gm-Gg: AYBFou2hwnV6cdiTYSH61+e5qf2UeVgbPRveXvRZVAC4EdSWhkh4GL2bElInKNkNOfH
	eEiXuvUlk21uAo+K0i8n+h46LWovhF0Jsx0pVLJppRqmcBMp7zSM5q526sL/J9F1x10QryImwIA
	6cE/Ej6AQmI4YAZEkV1i65UlJJHVtp8Y5MChu4g6PRc1fXSOTfYkVHHel322Car6VrAYYzx4Ny0
	PiSW16LHyxkwagIRf48/qf8jhNM6FJBgTye/wqYDVcAEMTkBpxiSQQfdmOyJYeKWRHR48f510z3
	BoZnJJa9QRhzzpjjii38rvyv0c62KNDGh7dwSIAq9OOLH79cv+wcW7TACa5zxbLbfHvCyRcwmH8
	nsCIwopcr0j6ewAtrbQknPg5RqOqxWtfjUh8esH6B/lH9ltAtEtaZxEuZVbaSXpLGKg+oEfx/SZ
	z1NwmkHhFNj6V+iNZim21oALiFPxwXHTenOTLRkbu4gnn41rwuuDLRO1Mp6hIHwxghB3Zi9V9lb
	eeb2lxPIxXZnqQVuFndE7nyIcxupkQguxw90hxSXLANcR2LBve95f08oEeRbzv4LxxIBhBp1q3x
	5ISfM5P8M5sW8C2Y5LFyIcwqftKGykKW+SvYOijHDRm5olnWq5945MsZIzkIFZH5Z4KFSkxzen3
	JQwFsrHCycxRe5sNyjmOGgeSqIxmuXK/itYATbxCiSPs1PtY5WuHLmGENDjDNnMeVHtVjPj6jQg
	h2Uth4NM8lMcGj8k75LBsFsJBNSiW+UM3kGiXvo7GBdv8Ee2JV
X-Received: by 2002:a05:7300:6021:b0:343:bc3c:6c38 with SMTP id 5a478bee46e88-34c63deabc5mr980283eec.31.1790722672834;
        Tue, 29 Sep 2026 15:57:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/26] libmodbus: pull in TCGETS2/TCSETS2 from <asm/ioctls.h> for musl
Date: Tue, 29 Sep 2026 15:57:14 -0700
Message-ID: <20260929225723.1046705-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130504

modbus-rtu.c uses the Linux-specific TCGETS2/TCSETS2 ioctls, which
glibc's <asm/termbits.h>/<asm/ioctls.h> chain declares transitively via
<termios.h>, but musl's don't.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch | 35 +++++++++++++++++++
 .../libmodbus/libmodbus_3.2.0.bb              |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/files/0001-modbus-rtu-pull-in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch

diff --git a/meta-oe/recipes-extended/libmodbus/files/0001-modbus-rtu-pull-in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch b/meta-oe/recipes-extended/libmodbus/files/0001-modbus-rtu-pull-in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch
new file mode 100644
index 0000000000..e584f7609c
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/files/0001-modbus-rtu-pull-in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch
@@ -0,0 +1,35 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] modbus-rtu: pull in TCGETS2/TCSETS2 from asm/ioctls.h on musl
+
+When HAVE_STRUCT_TERMIOS2 is set, this file issues the TCGETS2/TCSETS2
+ioctl requests together with struct termios2. On musl, <sys/ioctl.h>
+only declares the plain (non-termios2) TCGETS/TCSETS request codes;
+TCGETS2/TCSETS2 are only available from the kernel uapi ioctls header,
+so the build fails with "use of undeclared identifier 'TCGETS2'".
+
+Include <asm/ioctls.h> in this case. It is safe to add unconditionally
+here: it redefines TCGETS/TCSETS with the same values musl's
+<sys/ioctl.h> already uses, and glibc ships (and already indirectly
+includes) the very same header, so this is a no-op there.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/src/modbus-rtu.c b/src/modbus-rtu.c
+index 87e0887..1e98e74 100644
+--- a/src/modbus-rtu.c
++++ b/src/modbus-rtu.c
+@@ -14,6 +14,12 @@
+ #endif
+ #if defined(HAVE_STRUCT_TERMIOS2)
+ #include <sys/ioctl.h>
++/* On musl, <sys/ioctl.h> only provides the plain (non-termios2) TCGETS/
++ * TCSETS request codes; TCGETS2/TCSETS2 (used below with struct termios2)
++ * come from the kernel uapi ioctls header. <asm/ioctls.h> is safe to add
++ * unconditionally here: it redefines TCGETS/TCSETS with the same values
++ * musl already uses, and glibc ships the same header too. */
++#include <asm/ioctls.h>
+ #endif
+ #include "modbus-private.h"
+ #include <assert.h>
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
index 1eddfb8bd1..748a87dc14 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.2.0.bb
@@ -6,7 +6,9 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https;tag=v${PV} \
+           file://0001-modbus-rtu-pull-in-TCGETS2-TCSETS2-from-asm-ioctls.h.patch \
+           "
 SRCREV = "a9b025d12289855490b10d77461c99e001abfc0f"
 
 

