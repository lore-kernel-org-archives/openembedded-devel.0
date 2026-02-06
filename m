Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA90EB28D6
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6907.1770366050904333960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=crgK3Efs;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1910820f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366049; x=1770970849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fc9Z3WDxjdhXtlJr4ImBI1LWDtmRXZ4R4RjvmbNHdXQ=;
        b=crgK3Efs9ITW3RcJwD57g/yOc5/T7Y7TaaIN0vspgmMwaTes2bbcqiZfi4dkSoEcr2
         fL8kCPyDOSEmandMjYV2z1w+sQDu8sMkVDF7lzasBlNJgEFj7Rst00xevbRuAezRXzmO
         8K8UzSTgxHBRCo1FF8DOPJDdKgQnZwqafUGEBsGtZSmVxtzTlp5zhG68pPmsDK84ux2e
         o/NktrZa8kpLo0o82IULWmZGL5XcKvEqqXP93yiXYfrPSDvFC/spoZLTtj7DBx4NPclV
         U+U7Ho85ZV6zZsp+CjKD8dRigssU9oD5cQQ6sKPqaW4oS61QliiyOac9edvm2NJnLD6A
         ALDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366049; x=1770970849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fc9Z3WDxjdhXtlJr4ImBI1LWDtmRXZ4R4RjvmbNHdXQ=;
        b=oIg2uzg4z3+S2n/ZTUoGCnJhVZBHyn/5OcBWiop0gNgNtRx5zVu090cLNnlA/+gQZT
         quC02kJt5lTvkGNXgyVMM/CwHyHc+Ec72qXNFNUYWaJSop4Wrdg+UATchQF5k4g3VzLV
         k2SnaTMagnrSQXGXb7vcR/agxl0ln125vXnS0TOcLgD3XJF7pP54acqUt9I3Pp4S3Hq+
         de22P6/FsrakDaYuOzrxNDjzkY7MLI88B+0Xr0bjbdBGd5viwAx0NqcWQpo49WSvDVdN
         e1n78le5bOUjqHL9707l3ZhqMMZaonPyyYuuIDXFeqWGf2uosDCSJpNqpqNpE7JG/dID
         3zzg==
X-Gm-Message-State: AOJu0Yx6qLnndOPIhkjM+F6d/YrinPLddesaumIXTKxlOkAc2ySN8+EK
	R5ikKON+l8N0ix/cAJw/sON5sX4TZaR8Uqf6Ak7Vu3MUkus+JcZtcBMLDP++5g==
X-Gm-Gg: AZuq6aIUzDJ2kVlDX1szvDe3pHQlK0JNX8jC+tuOZlFwgbwVonH0RrNFP/y+g9ywUtd
	XVAHyfW6W/IS3sLh0OA+oLEa8huGIOUqUzXW9cMMC0Uc//sDLouU0Kd2PGVnR5KnPQ14ddBTmUG
	eO1siXJYmT38P/WdobTSECa2g7RTJj55iu/qc1UfrmOIEf3Ql/BR8xJ2VUJnneHWDecHoajo8PR
	ejNvbeuB8e9Mjd0+Whzo1Vhm6cbMThMDVhJ1g5UkKBuFDB+kPFH3s9rZyypnfXl091ZDair/JPL
	sKoDbaw5FT2lVy71Y6QfEU13IksdVCejmJGHA55zlroecHP0zVwsRPfKcmHPyRYIucevVo+xOJ1
	/y47r/ZUPiZWCXy5GwWi8jGBX+IpllL5vvxTh+yRs892QfBdzmFbrq7XEuUmj5QkNRRhjpjnjGH
	x4FpBpEoiq
X-Received: by 2002:a05:6000:1acf:b0:42f:b9c6:c89a with SMTP id ffacd0b85a97d-4362938b3b0mr2571849f8f.49.1770366049164;
        Fri, 06 Feb 2026 00:20:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/8] fontforge: patch CVE-2025-15279
Date: Fri,  6 Feb 2026 09:20:41 +0100
Message-ID: <20260206082048.1442403-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124230

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15279

Pick the patch that mentions this vulnerability ID explicitly.
Also, this patch has caused some regression - pick the patch also
that fixed that regression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 21418bce907ee06695d29f8ad759f2d9dfeed5b9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2025-15279-1.patch          | 41 +++++++++++++++++++
 .../fontforge/CVE-2025-15279-2.patch          | 34 +++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  5 ++-
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
new file mode 100644
index 0000000000..91306c57c6
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
@@ -0,0 +1,41 @@
+From 545b5eedf2a6866aecc04102f2e0853089cb760e Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Thu, 8 Jan 2026 15:47:43 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Heap buffer overflow in BMP RLE
+ decompression (#5720)
+
+CVSS: 7.8 (High)
+ZDI-CAN-27517
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7d67700cf8888e0bb37b453ad54ed932c8587073]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 5a137e28a..133336787 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -181,12 +181,18 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 	int ii = 0;
+ 	while ( ii<head->height*head->width ) {
+ 	    int cnt = getc(file);
++	    if (cnt < 0 || ii + cnt > head->height * head->width) {
++		return 0;
++	    }
+ 	    if ( cnt!=0 ) {
+ 		int ch = getc(file);
+ 		while ( --cnt>=0 )
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
++		if (cnt < 0 || ii + cnt > head->height * head->width) {
++		    return 0;
++		}
+ 		if ( cnt>= 3 ) {
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
new file mode 100644
index 0000000000..8ef833ff63
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
@@ -0,0 +1,34 @@
+From 3bbdf6c7c161ff45d793e3bf5047720156e466ae Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Mon, 12 Jan 2026 22:45:16 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Move bounds check inside cnt >= 3 block
+ (#5723)
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/720ea95020c964202928afd2e93b0f5fac11027e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 133336787..ad365158c 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -190,10 +190,10 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
+-		if (cnt < 0 || ii + cnt > head->height * head->width) {
+-		    return 0;
+-		}
+ 		if ( cnt>= 3 ) {
++		    if (ii + cnt > head->height * head->width) {
++			return 0;
++		    }
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
+ 			head->byte_pixels[ii++] = getc(file);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index d470ff12d4..c625566f69 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -21,7 +21,10 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
            file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
            file://CVE-2024-25081_CVE-2024-25082.patch \
-"
+           file://CVE-2025-15279-1.patch \
+           file://CVE-2025-15279-2.patch \
+           "
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

