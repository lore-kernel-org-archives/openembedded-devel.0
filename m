Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB271F46C7A
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:41:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63290.1775504504531656702
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=daq/kbKo;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso59154615e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775504503; x=1776109303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvp0r/+gAXLK4O2AgUlbd6tfhbneNWGfZIgxSbwcjPw=;
        b=daq/kbKoknivaGKibnjjKrnT0wmQpmhhgl6RqP3HgoOYKy5sBsl1G4r6QJmO2+0odz
         a/cDVqzO2Se+CWQGEfm1UQmt2T9UFtMeU2aoYc1GkUrTDwyhiimXVmqr8PUcgijrJK2x
         M5+T1hjF8nVnHScIIl6YUihEtJsSPiDgGdwag6e+dj5lcDmd/4xGqiPOo1OKIfROH3Xo
         F5yJcQ0Q/EF1/mVyyiNvzQsjtfQDKXb3sR8o9rzmbBXgLQqKDqpZuWNNdpeG6POBAlwW
         7Sp2UwpAvxAF9rvuJJH508oQbDy/MCkaxX+NKpPywN8ZzUNHIr6Djj+8ej4/cfeqI7ex
         zYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775504503; x=1776109303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qvp0r/+gAXLK4O2AgUlbd6tfhbneNWGfZIgxSbwcjPw=;
        b=SSkHKZS5CUhGYaS+qlL70ieMm/4S/Ah+BOWtGo8ZGimSd5EvCeUtHUYA9v+Xc+0AaZ
         X8Rt7uJmK83wov9x0BX1l+N5qCeA6w/EyEz/ft1MX/w/cvbbqTIpFMVgt74O/H1lZNMq
         8/aGiL/e1+qFW1o7UgRSIS2pK5BWU3jKnUyC2bjDerj2JEy2xi9y5oytpuhkUyXBPBc1
         QnIO7iQ/AOgPvguc10aLUaAF9822MoLDYQ7GP3u0m7ZYWjyAUn9IzPhh0QzxaGQN1Wn4
         b/XyodO5rbli71ZA8hVdTvkDGTkKtO9Koc9mWOiFB5o565YWAHfhfmv5lRRarvtoYbOG
         GbfA==
X-Gm-Message-State: AOJu0Yzwa/C/wyAQa7zjQ2oiE9BjSOLpLz+X3oCJcZA1WeHUIDsCdoQu
	iUydkJ1jmLza9A55dgiiAL0TqKFXKm5e5yPyD2Aaa9j728qU/KR2wE3nTXogBQ==
X-Gm-Gg: AeBDietfsZJaEAA8BhmYrBZSJiwIzBwJJ7h0db9hNvVnFwebuCkbtpjYTNRBBKK95eN
	EqiRpLT0vv2Tt3jw8k2V4LnlIHtWQuz7c8r/JM7AVf1SCnraUMLkvJe0hsGYXNiOabppQUYw9v9
	Tckv95gGcMYQXT8T8Q/IRrC5FQt8pnI9nY92T7Pomzd5xf9SHsbRSlNp5lvPaYHDikPWvyA5PLY
	PG7RJc1kJufrjgKYhgaY48w9AZj/v7zi8b4cVWma0uoCRVWxsWOVYIYid5GVgFzqLzer3xIqFOC
	soFfCnGIQN1Fd0A317dnzCehIMkJEl11Tf6z1RJ76MGvXG5wp0s3/xAmAqNDYY94K2NZLqZirKq
	oHw7SVShiDaT/ydSI54WtTGnCz8ME9tiP7OD7vWpdsemzKxWM5e3+Gu7b2lY1KtFBvUL2aQE7iV
	7YMNwatnHwDi3vCVV6R+wD
X-Received: by 2002:a05:600c:4188:b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-488a2aca466mr72607335e9.12.1775504502549;
        Mon, 06 Apr 2026 12:41:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a8ddfde7sm316825945e9.5.2026.04.06.12.41.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:41:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/2] giflib: Fix CVE-2026-23868
Date: Mon,  6 Apr 2026 21:41:40 +0200
Message-ID: <20260406194141.3893319-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126065

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://www.facebook.com/security/advisories/cve-2026-23868
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-23868

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../giflib/giflib/CVE-2026-23868.patch        | 34 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
new file mode 100644
index 0000000000..4243344d9e
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
@@ -0,0 +1,34 @@
+From f5b7267aed3665ef025c13823e454170d031c106 Mon Sep 17 00:00:00 2001
+From: Eric S. Raymond <esr@thyrsus.com>
+Date: Wed Mar 4 18:49:49 2026 -0500
+Subject: [PATCH] Avoid potentuial double-free on weird images.
+
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106]
+CVE: CVE-2026-23868
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gifalloc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gifalloc.c b/gifalloc.c
+index 47c6539..cfb6e33 100644
+--- a/gifalloc.c
++++ b/gifalloc.c
+@@ -349,6 +349,14 @@ SavedImage *GifMakeSavedImage(GifFileType *GifFile,
+ 			 * aliasing problems.
+ 			 */
+ 
++			/* Null out aliased pointers before any allocations
++			 * so that FreeLastSavedImage won't free CopyFrom's
++			 * data if an allocation fails partway through. */
++			sp->ImageDesc.ColorMap = NULL;
++			sp->RasterBits = NULL;
++			sp->ExtensionBlocks = NULL;
++			sp->ExtensionBlockCount = 0;
++
+ 			/* first, the local color map */
+ 			if (CopyFrom->ImageDesc.ColorMap != NULL) {
+ 				sp->ImageDesc.ColorMap = GifMakeMapObject(
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index aa47f93095..8226e9b6c7 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -10,6 +10,7 @@ DEPENDS = "xmlto-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
+           file://CVE-2026-23868.patch \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"

