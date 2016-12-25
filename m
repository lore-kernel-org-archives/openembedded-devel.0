Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E2CDE71CA7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 23:07:54 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id hb5so13777183wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 15:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UnWhmAZhY2Wsz8lmjj+UqoL9BIquuqKQAOflGiVueRc=;
	b=h5I2H072oKlFEOYnZE/YP/YiE7J/Ca85w8tMpKX76D5m2CrxRfvze7m2qsvPPKi5Nq
	V/JlpQRNDjDqex7XASehKqREpdKNEPwlhgapzr7EL7so0k2qxnsHm15xybdJ+QxSLWPL
	5fgjSIMbcnPodQ2XCy+ju0Lr852DpyMLBDIWstDFZI9TNQUcN2VCvShjeatr3lv1RxHv
	HIa9oIJmZM0phvSCEHGg9VNNHlmd1QOSdlPs4CjJw+1TxeS+aDphs9A02bN6YpwoJUIE
	a7ggl1J06Kxfem10yVd26JwHgX1tHQmokvGn1+vaKMBd+NErK3MYM1NKwHORzoEL7t5X
	9lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UnWhmAZhY2Wsz8lmjj+UqoL9BIquuqKQAOflGiVueRc=;
	b=MV/Bx9qAIbuY1JT8M5Mg1cOsHqjLX/ZEkSQideEFS/PEXeFM25vHBfmF+rbiBHaQLz
	643L4080QAbsH/h8gSykwbwT3jhJjE08xUvenKOTGKmpDU7jtC4y2hWH2cv2AFHCax7m
	f+F3yiXFPVyy+u45FXc6wATj4fK8HHne/CMe4wy4C/F2lPTt60eYmKcG9FX0qVTOHipo
	m37t1PO3nTO72p9PvZ2hViLynvN+hJ7n+roKh198YUb0iizPYQ5szcUUYT3YXPbnlpAg
	IqgOV/QknCmaJ5q8z0PJjByDhdzHLgRw4i6IxcMRjn9oCtscJ65EhO17u/woLC9gLj6d
	RnEQ==
X-Gm-Message-State: AIkVDXJM/H3M1wuznq469Ji+0lHIZyPnN7j196Ezk5hPivf4G6xrIzGW7NXQjBBtMSZ6Vw==
X-Received: by 10.195.9.74 with SMTP id dq10mr15999567wjd.80.1482707275352;
	Sun, 25 Dec 2016 15:07:55 -0800 (PST)
Received: from localhost.localdomain (p579F74DF.dip0.t-ipconnect.de.
	[87.159.116.223]) by smtp.googlemail.com with ESMTPSA id
	k11sm48659848wmb.18.2016.12.25.15.07.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Dec 2016 15:07:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Dec 2016 00:07:39 +0100
Message-Id: <1482707259-26271-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482707259-26271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482707259-26271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fftw: work around segfault when checking for presence of ARM NEON
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Dec 2016 23:07:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Mixxx segfaulted during start. Remote debugging lead to function
  'really_have_neon()'.
* qtractor segfaulted when adding instruments as whysynth or hexter
* seems autodetection fails in some other environments too [1].
* if TUNE_FEATURES contain 'neon' we can assume our machine supports NEON so
  we don't need runtime detection

[1] https://github.com/FFTW/fftw3/issues/30

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...todetection-segfaults-assume-neon-present.patch | 80 ++++++++++++++++++++++
 meta-oe/recipes-support/fftw/fftw_3.3.5.bb         |  5 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-NEON-autodetection-segfaults-assume-neon-present.patch

diff --git a/meta-oe/recipes-support/fftw/fftw/0001-NEON-autodetection-segfaults-assume-neon-present.patch b/meta-oe/recipes-support/fftw/fftw/0001-NEON-autodetection-segfaults-assume-neon-present.patch
new file mode 100644
index 0000000..6340f42
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/0001-NEON-autodetection-segfaults-assume-neon-present.patch
@@ -0,0 +1,80 @@
+From 97af5a2efbe30726ce4d7c921efed6afc32a314f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 25 Dec 2016 13:41:19 +0100
+Subject: [PATCH] NEON autodetection segfaults: assume neon present
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If TUNE_FEATURES contain 'neon' we can assume our machine supports it
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ simd-support/neon.c | 46 +---------------------------------------------
+ 1 file changed, 1 insertion(+), 45 deletions(-)
+
+diff --git a/simd-support/neon.c b/simd-support/neon.c
+index 86b2cb6..8d6537e 100644
+--- a/simd-support/neon.c
++++ b/simd-support/neon.c
+@@ -23,54 +23,10 @@
+ 
+ #if HAVE_NEON
+ 
+-/* check for an environment where signals are known to work */
+-#if defined(unix) || defined(linux)
+-  # include <signal.h>
+-  # include <setjmp.h>
+-
+-  static jmp_buf jb;
+-
+-  static void sighandler(int x)
+-  {
+-       UNUSED(x);
+-       longjmp(jb, 1);
+-  }
+-
+-  static int really_have_neon(void)
+-  {
+-       void (*oldsig)(int);
+-       oldsig = signal(SIGILL, sighandler);
+-       if (setjmp(jb)) {
+-	    signal(SIGILL, oldsig);
+-	    return 0;
+-       } else {
+-	    /* paranoia: encode the instruction in binary because the
+-	       assembler may not recognize it without -mfpu=neon */
+-	    /*asm volatile ("vand q0, q0, q0");*/
+-	    asm volatile (".long 0xf2000150");
+-	    signal(SIGILL, oldsig);
+-	    return 1;
+-       }
+-  }
+-
+-  int X(have_simd_neon)(void)
+-  {
+-       static int init = 0, res;
+-
+-       if (!init) {
+-	    res = really_have_neon();
+-	    init = 1;
+-       }
+-       return res;
+-  }
+-
+-
+-#else
+-/* don't know how to autodetect NEON; assume it is present */
++/* autodetect NEON broken; assume it is present */
+   int X(have_simd_neon)(void)
+   {
+        return 1;
+   }
+-#endif
+ 
+ #endif
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.5.bb b/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
index 7bce6f4..71adb89 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
@@ -3,7 +3,10 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz"
+SRC_URI = " \
+    http://www.fftw.org/fftw-${PV}.tar.gz \
+    file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
+"
 SRC_URI[md5sum] = "6cc08a3b9c7ee06fdd5b9eb02e06f569"
 SRC_URI[sha256sum] = "8ecfe1b04732ec3f5b7d279fdb8efcad536d555f9d1e8fabd027037d45ea8bcf"
 
-- 
2.5.5


