Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BCBE7E0DA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45786.1770637148591142305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OfMZT+eh;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so40863825e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637147; x=1771241947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ri3xMkVZ5+RXOYSczPgOjovSZ3nm4B9iyvrlnD4kiDo=;
        b=OfMZT+eh8QsVaK/kvalSXymPeULzOzQuDR8avuOGwjl23ZS+JtIeKQZh03oeD9xocP
         +4LkyLn8TuTJvtlDisBTQR2lqcstRHywfpa/vZdT+Xm7XV+Qh78kgmZaXeCgpnSItI7W
         zEwI/oadBEcakaOWRCDv5CDaaDa4vAwBnnnLMPGIjl37xZuOAr+/BIfQZHFV+1w1jfYV
         Ez30tq37MLrEPKPUEAWLwETBvLZi9K+LK0z/nJgIGrT2enniUkkZTpHUZPfGtrLHmmeZ
         yhe1SuJvFgtMLaqRZt2RVk9segG47Z/siEOchu9PJKVBosjKdY2HXsM6yMfwSl7R2MOS
         Heww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637147; x=1771241947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ri3xMkVZ5+RXOYSczPgOjovSZ3nm4B9iyvrlnD4kiDo=;
        b=kAveuSgQ/ghPuAn7GiBrqGRXZ/orM+aD5umakVJRXADiNEcTPdNbdhK5GPRpkgDJW3
         jyypmOfPF1uf+RyVj6Khc8EX3uEe/zi+M+Pl5dJhXoSjy74xg7JyzXhMrbO/8nOmvlwg
         h691i2sAJseO4jc/kpjpGBXU8ikarQSlHVvNpwPRxDWXS5I9EPuxN6PGSAihu8iU+dFX
         4CUP6EjLQrEPx9zwRuaoTaFodsLw8kicyDSiPKFisxp6UuL32ZQD2oGm8GELb911weK6
         fMsILqWSIxTUI6VMg7VMkYzU0ys88pFuOYPb2D+PyUfREIyI9p8j6u+CUfJ5leLBZCQK
         FACg==
X-Gm-Message-State: AOJu0YzmLXzhWBNmEfT6RJV9epdwu0Aqn+OsEPpUryvX3pl0ZqhsnRWU
	zYCT1CENdtStnxPRBc9K7fqQO1f0BpwDR331fPLHITvGrOxGUYKWp0zYi0A0Mw==
X-Gm-Gg: AZuq6aJlTMLwiDzH0e88Zdr/FD6GnLyWs4RupRqCZYy1qGNUPqkrYviRiN3XxO+4cpS
	SyGoTZQMjd0dNxt2R6kJTKYSjvO+VVT3n5VuSMxnqu71Dpe+cZXtZjhZpCM27hPmSZw8UKiSlup
	m97BYtqeSCKGwu7mrwkZJVNV695uV6xvFqUclWMfZbPIthAmXRd57qy7oOuSHtvHKBT2ibfznYI
	IkUjqci9oRtE7Jt8agOFk9QbRcBikYT3u6F2hR2nSnPx+wZszC3UWafGtMU9ERw6GC5LEvUJ2R2
	Pcon952cWItPocjef6ULdTYOGW5/Oizp80LWVYwq0jqyFmqI1S6S5WHiOPdjUAA8iF4/fB3SXMJ
	8mOgNQqhQOoCQ9cCvEouoK0Op27qHxYk8VQZkqlFXFV6lpTKK/QVbpYZToVn7ASS33Jqg26sje7
	Aj5T8tNh7W
X-Received: by 2002:a05:600c:c84:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-483203d54ffmr165043675e9.13.1770637146766;
        Mon, 09 Feb 2026 03:39:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 03/16] sox: patch CVE-2017-11359
Date: Mon,  9 Feb 2026 12:38:50 +0100
Message-ID: <20260209113904.3442496-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124298

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
index b1cf516f62..205b11b506 100644
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

