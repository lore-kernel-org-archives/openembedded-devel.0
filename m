Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.2213.1612488811755949227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 17:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3Yy553v;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id t25so3424784pga.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t32NemIing07SZWJMVsIywUfiEID/c9zNypReEdwuos=;
        b=C3Yy553vEFZv5yiYVRT9+Vb6IHO33OJzzYkyxoHzwSzZkcf5z766ZB2OPJwlueXkrG
         rlJ6OVYOr5PrSLYbXXnthC6uAck46tNata3wW1oa2/oM416WLGD5kTsuZ58WfOKb5TIV
         6XxqkpPZY2ZmBO9fKyxEMkHRVyh0zVMALc1fScjxGg6b4ucNCId1JxuhJR1ShZJuCjjt
         3WjoSSI8gbO783ED39OJNH/FyMtQ9wlWzsAvZ3GVr+70lC2AjuoxxzmWEdAFGnNw7nwK
         us5j6pOmHaVpU0ApAUH+udqlRgk95qSuSJqs1tnDi07j1D87xxbEcVLqHYelXpRAcW+p
         2efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t32NemIing07SZWJMVsIywUfiEID/c9zNypReEdwuos=;
        b=Gk8v/nJbi0B9JrnkbYaHcPwVoqd8C1X0nCreSBy5YW/JdJkh0QzC3UpFkRoFnZglJ4
         1ruzPic1sKPf7nCFtyRggzhp7BVZaKztOSnjBZp0SyWsxjHRWhSat6xcHMfTCRH6ha1Y
         G9aLImfH/GOHKZgYv4ybKKKs6f3fExmkblE3SiBEK0O/JRMCKzaLVSGl6hRb44Idxop0
         SKgOAY0QHedUtt6nzloAAVd6mCVsl3tk2GOfzdKo8a/3PY4ZGUzaefqt7W2O7FXzr9uX
         Pm3u/dgzIS4u9rKzweW/3RjHDH//Ucxo9yEarimeSNPwyo9oGDxSE6LB41vwOloVWdT1
         xtfQ==
X-Gm-Message-State: AOAM5303OrWnQJVrdJyl7ZAe3JYZfUtamhrcUIsLuocKi0mHSw3fDyY+
	YOFLX0sg2Dvhvyde2kQiOACLWmS/QqHzKg==
X-Google-Smtp-Source: ABdhPJxsGqCn3vxBx0iW5LK14GwPB+vH5WOIVedFBqbAos1JCBas4bctlzGlDmcWpScj5luOu78Pew==
X-Received: by 2002:a05:6a00:1:b029:1c1:2d5f:dc16 with SMTP id h1-20020a056a000001b02901c12d5fdc16mr2138749pfk.55.1612488810913;
        Thu, 04 Feb 2021 17:33:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id y5sm4802292pfp.42.2021.02.04.17.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 17:33:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] libsrtp: Update to 2.3.0
Date: Thu,  4 Feb 2021 17:33:25 -0800
Message-Id: <20210205013326.773042-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the local patch, problem is fixed upstream a bit differently

License-Update: Bumped Copyright years [1]

[1] https://github.com/cisco/libsrtp/commit/445c1c94dc3df48fb633779d1b5d0b743bf522a4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Rename-conflicting-variable-mips.patch | 73 -------------------
 .../recipes-support/libsrtp/libsrtp_1.6.0.bb  | 18 -----
 .../recipes-support/libsrtp/libsrtp_2.3.0.bb  | 16 ++++
 3 files changed, 16 insertions(+), 91 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
 delete mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
 create mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch b/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
deleted file mode 100644
index b56c78959a..0000000000
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3dc8a678a844247d0afcf7e30fb3cbd5ccbd828f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 14:05:06 -0700
-Subject: [PATCH] Rename conflicting variable 'mips'
-
-Fixes
-test/srtp_driver.c:344:12: error: expected identifier or '(' before numeric constant
-     double mips = mips_estimate(1000000000, &ignore);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/srtp_driver.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/test/srtp_driver.c b/test/srtp_driver.c
-index 8872971..d38ea19 100644
---- a/test/srtp_driver.c
-+++ b/test/srtp_driver.c
-@@ -341,7 +341,7 @@ main (int argc, char *argv[]) {
-   if (do_codec_timing) {
-     srtp_policy_t policy;
-     int ignore;
--    double mips = mips_estimate(1000000000, &ignore);
-+    double est = mips_estimate(1000000000, &ignore);
- 
-     crypto_policy_set_rtp_default(&policy.rtp);
-     crypto_policy_set_rtcp_default(&policy.rtcp);
-@@ -353,33 +353,33 @@ main (int argc, char *argv[]) {
-     policy.allow_repeat_tx = 0;
-     policy.next = NULL;
- 
--    printf("mips estimate: %e\n", mips);
-+    printf("mips estimate: %e\n", est);
- 
-     printf("testing srtp processing time for voice codecs:\n");
-     printf("codec\t\tlength (octets)\t\tsrtp instructions/second\n");
-     printf("G.711\t\t%d\t\t\t%e\n", 80, 
--           (double) mips * (80 * 8) / 
-+           (double) est * (80 * 8) / 
- 	   srtp_bits_per_second(80, &policy) / .01 );
-     printf("G.711\t\t%d\t\t\t%e\n", 160, 
--           (double) mips * (160 * 8) / 
-+           (double) est * (160 * 8) / 
- 	   srtp_bits_per_second(160, &policy) / .02);
-     printf("G.726-32\t%d\t\t\t%e\n", 40, 
--           (double) mips * (40 * 8) / 
-+           (double) est * (40 * 8) / 
- 	   srtp_bits_per_second(40, &policy) / .01 );
-     printf("G.726-32\t%d\t\t\t%e\n", 80, 
--           (double) mips * (80 * 8) / 
-+           (double) est * (80 * 8) / 
- 	   srtp_bits_per_second(80, &policy) / .02);
-     printf("G.729\t\t%d\t\t\t%e\n", 10, 
--           (double) mips * (10 * 8) / 
-+           (double) est * (10 * 8) / 
- 	   srtp_bits_per_second(10, &policy) / .01 );
-     printf("G.729\t\t%d\t\t\t%e\n", 20, 
--           (double) mips * (20 * 8) /
-+           (double) est * (20 * 8) /
- 	   srtp_bits_per_second(20, &policy) / .02 );
-     printf("Wideband\t%d\t\t\t%e\n", 320, 
--           (double) mips * (320 * 8) /
-+           (double) est * (320 * 8) /
- 	   srtp_bits_per_second(320, &policy) / .01 );
-     printf("Wideband\t%d\t\t\t%e\n", 640, 
--           (double) mips * (640 * 8) /
-+           (double) est * (640 * 8) /
- 	   srtp_bits_per_second(640, &policy) / .02 );
-   }
- 
--- 
-2.13.2
-
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
deleted file mode 100644
index 6c868185f1..0000000000
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "library implementing Secure RTP (RFC 3711)"
-HOMEPAGE = "https://github.com/cisco/libsrtp"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=15bc16b9d2e305974dde47e733883714"
-
-S = "${WORKDIR}/git"
-SRCREV = "2b091a4fb21c9b06fc5d4b5763bdaec97542fcd7"
-SRC_URI = "git://github.com/cisco/libsrtp.git;protocol=https;branch=1_6_x_throttle; \
-           file://0001-Rename-conflicting-variable-mips.patch \
-           "
-
-inherit autotools pkgconfig
-
-EXTRA_OEMAKE += "shared_library"
-
-ALLOW_EMPTY_${PN} = "1"
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
new file mode 100644
index 0000000000..57b6108a95
--- /dev/null
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "library implementing Secure RTP (RFC 3711)"
+HOMEPAGE = "https://github.com/cisco/libsrtp"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
+
+S = "${WORKDIR}/git"
+SRCREV = "d02d21111e379c297e93a9033d7b653135f732ee"
+SRC_URI = "git://github.com/cisco/libsrtp.git"
+
+inherit autotools pkgconfig
+
+EXTRA_OEMAKE += "shared_library"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.30.0

