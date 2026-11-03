Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1488.1793731044811645640
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EBs1TrZ0;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1adbf62dd31so5025722c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731044; x=1794335844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=EBs1TrZ04sdoVZFxky6rsYTQH1z+53VdRty5JBzOxnGpYd5AXSefzJi7M2ViwcCQG7
         I1zOfZdacVRCE6BzKsNU6DpdHVPOkn8rSESIroFxejfBrPOHF9GwZS7by6h00dETLbKH
         FdRFgzYTlhi/FqaYDZlJRatGbpQ5I/FrkER9x0IKoLa92ht/EQ7VxIVLlZH/HIpjG1L+
         Vp3Vd618NZ0LdSkoOIld95413jBzNqrZMt0mCTiEaWi4pJQJ+2Egumutfc3welDLsAGA
         A/jg3foAwgmgkLORvjmv9USy9wfc1mDVipGR5drFIO3uofj/AbcaRpw+vujPqpPbnfSS
         P4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731044; x=1794335844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=FecYvXoWrX7a284bklAdJgdBYv5FPl31Gy2se9t3mY/6b8Sg6r56ewGUAsA2/c/keO
         umdAk69Nx+CQ8yovOf2IH3ci5IC14vgI32d3gmEX0cywuJkenYOExS1itDol6SHPFJYh
         6aig8vpuwKY5s6sKEquL7IvzJ8oRM+7FKARFuDSNOkZcK2BkRDHfct+QwuAaYY0B8o+Q
         VQWoSnSXyNYpk6xMnNsYTiJ8utALh0J9B6xRhraMH60oj8T0Ir4PNQwu0w2tmJ7/YOh6
         /nE0nnGTVCdvSTFJL09TGf+hKWQZQ0r6mol/5ddg/mypol4aSS2oD/81b/ch6xlb5LqD
         DwfQ==
X-Gm-Message-State: APuU4Z/dY0YHP76L+loETY9QrWs1SyJdRiQ1Tx+CcLWWeryDOsAwTNjN
	JlfrS844sapsJeMc7+wAYBVxmVyHRVH7XFsQVq5yshjpdvluREyPM+yKu8aCzA==
X-Gm-Gg: AYBFou35jxpPwdIizzE2xlM+MEVTAzp/y4U8J9KK2rDP4lTGRtVN4U17UDOMzl9GiYr
	wB1KPZLHBW+uT3FZdHe6PiolWnKb8GaNfHqJH2vuuPkInr+pMMkwWyQalo6ckSjeBQmfASTX8V6
	u9kNfskRX8/V+vLJ9D5eTK+8GXiScRTHYdMiBuL46eyvqwSLAsDwBZCe0JzhqvfhhuknEhLUn4B
	bQC2tI6RXUYewZcXx2LGwtep7TPdVdIS3/HMKcpdijCCvslgeXHVr8cdPh14bJ8zwVFRPef5Gjb
	kODox7U4secLLgEI0muv8LS7q14R9POw6z0a0w3K8yWcgriiCBxukl6bCYdklFqWnPIfZVVNlu3
	g6v+qQu8/WonLyRDXlBbUnlXQz2NG+E+HclU09qN+f2JHedheRQELlRCJgTRjid0eOhL36ab+mr
	CW5Ft2msgjtZ0p7BKY2sCG3gCoAN6YOmaZs0TiB0tdU2IrxeiXIRcM4OTwXAOTXZN5v+of8ripW
	afMT9vPhn446OMyvEOxc+M0K22P8+EreXSw8BTjlK/JB6Gm99zrP9HgdYYCrNQCwGUty2JdxdIZ
	vNZ8C3ArtZctrbeX3H2sVh3PTpmXSqz1UXWYmOn3NtrfDT2A7j6cEGLc+j7Iww==
X-Received: by 2002:a05:7022:b059:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1ac5bbba381mr21289343c88.12.1793731044038;
        Tue, 03 Nov 2026 10:37:24 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 19/20] flatcc: patch CVE-2026-116734
Date: Wed,  4 Nov 2026 07:36:39 +1300
Message-ID: <20261103183640.919438-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131817
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116734

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116734.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
new file mode 100644
index 0000000000..a9e5b59d39
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
@@ -0,0 +1,30 @@
+From 0bdd50b31bfaabaef9cd92c1a3da7413fc091684 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 19:38:52 +0200
+Subject: [PATCH] Fix incorrect overflow guard in verifier
+
+(cherry picked from commit 0df9c097a19badc8bd22d93af8fd47bd291e5d9f)
+
+CVE: CVE-2026-116734
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/0df9c097a19badc8bd22d93af8fd47bd291e5d9f]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/verifier.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/verifier.c b/src/runtime/verifier.c
+index e2d1bb6..19243c1 100644
+--- a/src/runtime/verifier.c
++++ b/src/runtime/verifier.c
+@@ -127,7 +127,7 @@ static inline int check_header(uoffset_t end, uoffset_t base, uoffset_t offset)
+ {
+     uoffset_t k = base + offset;
+ 
+-    if (uoffset_size <= voffset_size && k + offset_size < k) {
++    if (k + offset_size < k) {
+         return 0;
+     }
+ 
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 9defbfac04..330aeccc16 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
 SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
            file://CVE-2026-116733.patch \
+           file://CVE-2026-116734.patch \
 "
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
