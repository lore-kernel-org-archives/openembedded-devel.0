Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3843.1794729082477747277
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Sd7IhOFL;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so3487096c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729082; x=1795333882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvN7U7cS8Vq2lp/Dw8xi59pFMkv1aMt8h2BkOJXstsg=;
        b=Sd7IhOFLK9xfMHJpvlwUGlZmKe8RqfWUfh+J2lgPfoW9d8vvgz2JySrAYHQS6zjFsq
         lhSSicIjlxMQ1ndkCv5ILmeSgmlPxkcNJ96VqQI/DdJ4UWdv9kTqctNjUFyS885gHDiT
         fvHlMiL8kXT34UCGJF5orPRRCOg+7MV7CqgazgRN7MxMqIjFmcr3WgVefUOhq3PUv/aw
         BtsusqbanamvF5iLx2T6l+lz7JJ8OdlJkIQ1oStETbZGI6nafp9DE2nB+w6PrH5k/MDe
         w4tBWggAHq30K96KJGCbDBmlfuvwU8ij1D31FrruAEXRiM6oYu1ZoTRIoujQEHU/TDjb
         TeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729082; x=1795333882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvN7U7cS8Vq2lp/Dw8xi59pFMkv1aMt8h2BkOJXstsg=;
        b=FEsQa7yFUia4GnC55LRe2nX3PMYwhPNSs1DSJC/IyDpB3KBrbSA8s9sZ2x65WxVGe8
         QbOnvhCK10EQyjfd/h/XVoEofwvaM/mVVNbLK+76sX21BLpDO4JYSTN9B+imzWVL56eM
         8roM+ndC/uJUfWOTDsRN2LxJtVCIv8GICfiYPWUPfIUUAjPpzoFRgu8aj/QlKF4bMar4
         Ph/MXkRr4Qs+dxcN3uEATZfFDTmGyJZQUenPo7XkGyYF8fHMQOSTokGz06rOH2GJ2VLW
         Sb3YhXOTR4KpBWhCUtjWs3RnuTtMePSrT3MEVomGip6Nk4Bo3FoDrczOhJggmVtuKxpP
         q5yA==
X-Gm-Message-State: APuU4Z+acq9ZBjRP9Ur8YtfXZKWf3ZfjMojzK4cV7rUd4WUpONqdBjWh
	GLzOzfb56PUn1/MWxVFkrHTUGsE/ocQq/LLFqGetfYerKx27NVDgHViLe2DPcd9Y
X-Gm-Gg: AYBFou0Ok8jHztOV9xD2eKVrbc+dCBeWj0cemrsYBaocxt+0KhH1TDh/er28ntfEsu1
	KvK7S+k5DRlucMdOhqf4UzLwDtL0qvvn77wy6BQQ5oCVosozdcnd+p9oLgBV1FP4l8dclcf9KQZ
	NXx3LiKbAwfnvLq2C9U45QWNknzqYpj8Mi4IwVErL39VFIR2x5tqakjjCSwwKPdaD11x0I11ic7
	vWGzOUdt64G9OiHkie4R2esf9P2rfgaBWS7ZXZquE+P9EimoCnFpW7pECsjhywRE2f43jpZ8see
	HyLX7NjhDeOQG5X/sr6SuMBnNEO4LJm5P0FFsVpXus3oztNABsoL7kxrMGlilxSl3NuN0fEmXTZ
	qLOTTwbZGaW8/5+nvQt6RIKkPAeSeHzddkKNIWxzaGM/Uqs61Ep4Gu+AdyvbskHy22TBbBJP2vm
	dyEqNvM7bLALfplBKus7VXkeIpmAXo+/+LKnYoQPDpS6HwAM+EyiXzfjWTqlA6W/t+r1NBRcU8d
	QvpcT/yuE46My1SEWn3qcub3UdpW2ClyX3g/1raoBEluTDSo6fb6uyndczvOQzFm09gn55YC0p3
	EqWCkM4686XdeGkIQT/foFJur6O6z3m7SlPqEar2GsHksTMUinqKBBDrFM0EhxyNJXVcDSprDlc
	/wSKeJAkKd+ToTGdb1hMVMj2VlIBvAcwMDJqhPE7LuBwPaI7NlI+kxdZj67sCNhjJRjrdfqfWOE
	wuZdZnDs7rMALDAxQZlsVdZWtnamco0O035C0PyVzqHQ3f4yXooPAoYhMpHFIv11ffbtxrr7J+D
	1hbUOotkvYuXuDpzOzZCbSPRZOdwoCoyFaKHt/Bu+XAjQCdlWaAuVPqKpL+RmsEMQuZDSLAQR37
	2Ha9
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr8597830eec.34.1794729081685;
        Sat, 14 Nov 2026 23:51:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 74/96] freerdp3: upgrade 3.32.2 -> 3.33.1
Date: Sat, 14 Nov 2026 23:48:52 -0800
Message-ID: <20261115074918.2932593-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132344
Content-Type: text/plain; charset="utf-8"

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../freerdp/{freerdp3_3.32.2.bb => freerdp3_3.33.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.32.2.bb => freerdp3_3.33.1.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.33.1.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.33.1.bb
index 2a985522c0..483017ae6a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.32.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.33.1.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "97eff6ddfbbfaa8e42a126d362686bd001ff8bdc"
+SRCREV = "65bcca1913a28cbdd7eb913599f692bd2b707991"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
