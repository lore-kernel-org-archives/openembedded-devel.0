Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332E5D13C0E
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18914.1769432711585670680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNAqaqF7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee2715254so22874845e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432710; x=1770037510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qo+ikf9LOafGIvcedXQhu38imrG3t0FM8NYphNMJeb4=;
        b=VNAqaqF7PAz/6z5oNrrQTqVXY++41M/m9rRO9tUd12amAlHsLw/dewIfr0AGzuvmas
         +FgQp6hK2OwRMDZz+Kis6gV3fOVIgD3916s+Ha4u0Lp9BTlYh+9LQPbI0e02laKje3/7
         uWxsCfZmNWsHAFBkhCNBf8tRAs2+Q+ZNFqz3mB2nAeZSELOEIBQfO8GjRiwCuJUB+RMs
         NEnIHcNrSidwIHcoJq3jgOMtRTyV6l7l/2aC/oytldFdP2EfrsalAvvAOhyuMD0dONVm
         H+e7A+Ew+kdtjlR0gzKqdeB9LNEn+I09XOx/D0BOfhQk0rxQEm3SIq4wPvObpRIg+QtL
         jrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432710; x=1770037510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qo+ikf9LOafGIvcedXQhu38imrG3t0FM8NYphNMJeb4=;
        b=qBk6JRhi605X8Hpfv8RxpXJ0AIdhzsN7mytrtfz152VvgIkkfY2tBkwauAqqbMq5wo
         G47UMpQj39yRKNBOiUyxUtPm3l6U6Wi+sN/YYKYsg5FwpBV35LT3Uzu+29Sb/o2fWqDq
         J9E+B4D4XA7jMEili1dd4c/MZbtZNEUIJaUgYl0fWKokvPLy0DevKCwg72AxkQq6Ok1B
         XWgs1CNpvBimvyVJrkgkDun9m99vEFMa/r46CtUxldhGcs7BXwnzIOnIWpSfmcmUxHf0
         w2IQAe/Vg1dSqnCWKKFx3/GFP2xyAzmbPkdJICN/XBJJS15N3fq3/U8uVqgDOhV4RJKe
         q06A==
X-Gm-Message-State: AOJu0YylvkIYARwCjwyXzXAWBJ2G/Yyay2xkZaC5xsHODyq7ZbGZWPCJ
	ra4+l2q56q/co+HG0I+jK3kQ5XL2ZfldXoEthRs+fcnIlp9fjZEtxyw/7FKG9w==
X-Gm-Gg: AZuq6aLQTOSI92qpvUlh8SRueLZh11g8UENR44F0ighdXT+9uAZgE9o9Tyl15czvU3x
	WrLw4RjMUyBWjK7M3OVJmlGgayJ03T1c9xzXzuDmDtoxMcbpW6p2d3jKRg5IH9Mjbm/+wWxQ1X+
	7e/KoG+ChGiRuPIHWiboy1IRYQJl/4mkDzlGPAAfhqGaXlZn66bGaFPJsomG76967S+85BEYETw
	7Zs91fcSTdIWZAm8zmvASNmozSjQFok4YB5CPteSo9jFaMeZfgXy5oxn2SZBh5y5zXEhWPX+000
	BQkFheNemEdP/uw6VpSf2vC70RtJJ3mVfqezxD+BG9PSV/3nKa27Kn2b9O3cOr7fUpMsDJfZhTX
	lGTntZ8RWMmlpOQW95n6Rab98M2Wywb3tg6YRMbHxmDX0K9inYaqtKTnYK9xoTkHdEeVhI0JceH
	pnywnOvQFs
X-Received: by 2002:a05:6000:4381:b0:435:97ab:1299 with SMTP id ffacd0b85a97d-435ca399137mr7063796f8f.51.1769432709597;
        Mon, 26 Jan 2026 05:05:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 03/11] sox: patch CVE-2017-11359
Date: Mon, 26 Jan 2026 14:04:57 +0100
Message-ID: <20260126130506.82699-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123880

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-11359

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-11359

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-11359.patch              | 30 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch
new file mode 100644
index 0000000000..fcd3e4af50
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch
@@ -0,0 +1,30 @@
+From bcdbdbecea8fae984e895fb5f9b20fedb3602945 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 17:02:11 +0000
+Subject: [PATCH] wav: fix crash writing header when channel count >64k
+ (CVE-2017-11359)
+
+CVE: CVE-2017-11359
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/8b590b3a52f4ccc4eea3f41b4a067c38b3565b60]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/wav.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/wav.c b/src/wav.c
+index 71fd52a..eca1cde 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1379,6 +1379,12 @@ static int wavwritehdr(sox_format_t * ft, int second_header)
+     long blocksWritten = 0;
+     sox_bool isExtensible = sox_false;    /* WAVE_FORMAT_EXTENSIBLE? */
+ 
++    if (ft->signal.channels > UINT16_MAX) {
++        lsx_fail_errno(ft, SOX_EOF, "Too many channels (%u)",
++                       ft->signal.channels);
++        return SOX_EOF;
++    }
++
+     dwSamplesPerSecond = ft->signal.rate;
+     wChannels = ft->signal.channels;
+     wBitsPerSample = ft->encoding.bits_per_sample;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 8f6808b0f0..18ce9a95d0 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-Update-exported-symbol-list.patch \
            file://CVE-2017-11332.patch \
            file://CVE-2017-11358.patch \
+           file://CVE-2017-11359.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

