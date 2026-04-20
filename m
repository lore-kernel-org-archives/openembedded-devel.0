Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA535F36C23
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13771.1776666483295118563
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UJhX3ZcG;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso19422825e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666482; x=1777271282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MGZBU1yIaflHWTerP/48mHON6sMsQwxJuo/pNEzPEc=;
        b=UJhX3ZcGOjlQq066/LVUVo/qRPj0tCgnIJRA5dZXXFOwZqgY/siaaZJd1Hn7nf6irH
         d3uPsmQCYH7iTS8tZ7pVjB73AC4LRMn33aogahCUq2ibTes937F6oYpyDstK4wiSZkwa
         dGXKejsjxFuIU7dbfxQemkgG/uMYtDQncZtjPug9MtXBpGlGksC4ByQ8sFBeTIsY2oct
         Dxynh6FkFbFE497t7HhE65tFuWsNFUZ0Rs5s8/htkECgaaaQQkSBA+pOubLaK5WeR4nD
         exOI/ieNAHmV3YhyqBfa0My3dsuz7xKQe2oxIqnvqSYHxAOBStpn5+T59B+bIknKm1C1
         C7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666482; x=1777271282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/MGZBU1yIaflHWTerP/48mHON6sMsQwxJuo/pNEzPEc=;
        b=blW7u/c7t11IIIak4TfajUkiDZnBNQ57r39pygXUD6bTBTATJjQvDo7XwIoMl2tU9l
         9zJy0sh+uL+lRjCrTiu4gD5zI6a4h5Oz+szylAM7n/Ain04RM18BBE5HjP9VtCMWYvri
         dmRBxbG+bwexg/DHl5P4NqGdBVRkBuPDH92nBGnNMChD5bPkPKUFVsnVjEY8R+fZYp30
         GDBmvprEqXohyDd/iAMIRKmTbAxR041AO0uJcqKoTDmICXicJ/KuIS4uaK9BQLxMsvx4
         6dwgqqSO5E8VPlXAwN/P/DS4kuWzOEer23ohZBvomNPzgob+jnIWK7KprK246IKyfeT1
         DMVg==
X-Gm-Message-State: AOJu0YwezQJx0+qmL97GrLyg7lrgr08L7eeQRfr8a0XH5wLK7pZgCQpQ
	kUsIe0IbLX/inSgEcUe/+PXM+30jckGB3xo0ijCmsKRXxYvfrEdEwCzfGsvurw==
X-Gm-Gg: AeBDies+cjgzXW3bMX3s2apjPdrt9LXN8XEhASE8YRRF6w4FeIyncPIJd+1/X2XFsWo
	gmUND8rLo2cteLrmr9kzp13/zp+WW918T0S+cOy3+3oUsrGtMo2p5ql6An7sS5d55+8p+GNnrpZ
	W00U3A6e7/FZwf1/jKmnMuW4m8KZm9Lybn9Z94IedKStIXpxhZDe7rg7auhBuYE6c1ZpOFuGbzh
	1LHV5Tz3BRKfz6z+IPOJ1ASggI3rEa1eIE9mH8d9AHfmnNp8IkJbfQttK2ry+zVGeqa67dc7Zit
	gKViV8gz3qlDrbF0O66Wwq1nPGJ8bOPFU5IFND/70qxSLYNWrnVX8JwR3gxxOxgcqaQQucX33Y2
	2BNtZK8mgN08Qv94J8gJemiVIsO5LPPtYfTsjHdrNwOnUg+lNHUv/6Tr+KHtxdjiJ1+8LNVO+wQ
	2/YQFkDH9o73rNyhUUgjgk4i+htXTR3xI=
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr26709255e9.29.1776666481524;
        Sun, 19 Apr 2026 23:28:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.28.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 14/17] libgphoto2: patch CVE-2026-40339
Date: Mon, 20 Apr 2026 08:27:46 +0200
Message-ID: <20260420062750.3795917-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126478

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40339

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40339.patch   | 41 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
new file mode 100644
index 0000000000..b00ac72772
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
@@ -0,0 +1,41 @@
+From 585e8113b541469347d09c341c2e8b468b431adb Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sat, 11 Apr 2026 10:50:47 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20Sony=20DPD=20FormFlag=20OOB=20Read=20(C?=
+ =?UTF-8?q?WE-125)=20=E2=80=94=20MEDIUM?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_Sony_DPD() reads the FormFlag byte via dtoh8o(data, *poffset)
+without a prior bounds check. The standard ptp_unpack_DPD() at line
+686–687 correctly validates *offset + sizeof(uint8_t) > dpdlen before
+this same read, but the Sony variant omits this check.
+
+CVE-2026-40339
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40339
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/09f8a940b1e418b5693f5c11e3016a1ad2cea62d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index f90d2a5..28648a5 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -833,9 +833,10 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
+ 	   code or the Data Type is a string (with two empty strings as
+ 	   values). In both cases Form Flag should be set to 0x00 and FORM is
+ 	   not present. */
+-
+ 	if (*poffset==PTP_dpd_Sony_DefaultValue)
+ 		return 1;
++	if (*poffset + sizeof(uint8_t) > dpdlen)
++		return 1;
+ 
+ 	dpd->FormFlag = dtoh8o(data, *poffset);
+ 	ptp_debug (params, "formflag 0x%04x", dpd->FormFlag);
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index df23932535..be761bc940 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40335.patch \
            file://CVE-2026-40336.patch \
            file://CVE-2026-40338.patch \
+           file://CVE-2026-40339.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

