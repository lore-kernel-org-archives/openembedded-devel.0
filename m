Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.10203.1629865833991366376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/+w6o12;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id oa17so15720250pjb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 21:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fzkhG7DG7xsxnJaoXJdWhvtGHAZ4jsDpAKONTQyNqdU=;
        b=i/+w6o12Vs1HEjVwUuUTG6qEfXp1MiaK8ntjNS9tY/RB1Q26kpNUZs4lh6gsFS+7M7
         QtyIv959WOYaF8KvXQrC9bSdAqfZiKjGDfo3Apa9jSy6TWVCPeHIIOQxQDw065wf263d
         rCLkIwQse1EXcpJkgB3X3BWXiOdY274709E4jp4agpxLAQ4mXVYj4XVcJ1NnFJ4PkNfm
         nVMSkwGLCak/ZQAqEC4BCji8pwlA9UgiO0Vj4pX5hu03/wh1bU29VR/DpvpoJFMDHUIs
         BQ1yZpzJ0FVxNTFph7q8ysZ5peV4reKtpT0LZpTfnDmINNOyWuHzE3tSq+HtSLxMaexG
         7wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fzkhG7DG7xsxnJaoXJdWhvtGHAZ4jsDpAKONTQyNqdU=;
        b=QU98gdDQAOUCVVRfaGVbqq1TieGedXETtg5NBOayQS8XB+EwDIdKrt34aR7yTHytkB
         6GL5h6pNgyXI0gLAgRttx8QzrPOLz69tbVU1hytvV2ylQJ1pxEUNcarEUDT+0nP/F0QG
         qw9jZhzuChSfXvllYjpV+fGmgYC7DYqfEQXk5BrfCZ9LS9TVmclVn8+oeURufKNEX+tF
         CVHYFeNNerukgtQG/VJjwFe2vCUMX3ei/6BcQc0rGo296ifSLOrDDLvvKjXuLB6EPeg/
         rqRahIqBMybvmIQhU2KDdxTZ3IISWb1PANJYvBoKUtx1s7UCoORMo5b1pXh/TqYuYriw
         XCsQ==
X-Gm-Message-State: AOAM530q4uig8zPS2k+7mZDQSflSifX4R+bcjPDQwnG2dGbfFASrJ3F0
	fcACH+jaGdmaUBj7V/MrmNjKxiAfwSY=
X-Google-Smtp-Source: ABdhPJwf0lthhCB/Q6SiqFiPqX2czVsctuX+HJnuTpk1iXsBMWyEeS9kJL4vzBqPpC3AEeMNDv+gCw==
X-Received: by 2002:a17:902:8685:b0:12d:7f02:f7a6 with SMTP id g5-20020a170902868500b0012d7f02f7a6mr36339503plo.49.1629865833087;
        Tue, 24 Aug 2021 21:30:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9989:489c:6f9c:8144])
        by smtp.gmail.com with ESMTPSA id b190sm23864007pgc.91.2021.08.24.21.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 21:30:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH 1/2] xterm: Security fix for CVE-2021-27135
Date: Tue, 24 Aug 2021 21:30:29 -0700
Message-Id: <20210825043030.33513-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Debian.org
MR: 108848
Type: Security Fix
Disposition: Backport from https://sources.debian.org/data/main/x/xterm/344-1%2Bdeb10u1/debian/patches/CVE-2021-27135.diff
ChangeID: 00f53def87b8b95e62908581f8fb56a69118dd32
Description:

xterm through Patch #365 allows remote attackers to cause a denial of service (segmentation fault) or possibly have unspecified other impact via a crafted UTF-8 character sequence.

This fixes CVE-2021-27135.
Leverage a patch from Debian.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/xterm/CVE-2021-27135.patch       | 68 +++++++++++++++++++
 .../recipes-graphics/xorg-app/xterm_353.bb    |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch
new file mode 100644
index 0000000000..937b2176aa
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch
@@ -0,0 +1,68 @@
+Description: Fix for CVE-2021-27135 from xterm 366
+ Correct upper-limit for selection buffer, accounting for
+ combining characters (report by Tavis Ormandy).
+
+Upstream-Status: Backport
+https://sources.debian.org/data/main/x/xterm/344-1%2Bdeb10u1/debian/patches/CVE-2021-27135.diff
+CVE: CVE-2021-27135
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ button.c |   29 +++++++++++++++++++++++++----
+ 1 file changed, 25 insertions(+), 4 deletions(-)
+
+Index: xterm-353/button.c
+===================================================================
+--- xterm-353.orig/button.c
++++ xterm-353/button.c
+@@ -3928,6 +3928,7 @@ SaltTextAway(XtermWidget xw,
+     int i;
+     int eol;
+     int need = 0;
++    size_t have = 0;
+     Char *line;
+     Char *lp;
+     CELL first = *cellc;
+@@ -3962,7 +3963,11 @@ SaltTextAway(XtermWidget xw,
+ 
+     /* UTF-8 may require more space */
+     if_OPT_WIDE_CHARS(screen, {
+-	need *= 4;
++	if (need > 0) {
++	    if (screen->max_combining > 0)
++		need += screen->max_combining;
++	    need *= 6;
++	}
+     });
+ 
+     /* now get some memory to save it in */
+@@ -4000,10 +4005,26 @@ SaltTextAway(XtermWidget xw,
+     }
+     *lp = '\0';			/* make sure we have end marked */
+ 
+-    TRACE(("Salted TEXT:%u:%s\n", (unsigned) (lp - line),
+-	   visibleChars(line, (unsigned) (lp - line))));
++    have = (size_t) (lp - line);
++    /*
++     * Scanning the buffer twice is unnecessary.  Discard unwanted memory if
++     * the estimate is too-far off.
++     */
++    if ((have * 2) < (size_t) need) {
++	Char *next;
++	scp->data_limit = have + 1;
++	next = realloc(line, scp->data_limit);
++	if (next == NULL) {
++	    free(line);
++	    scp->data_length = 0;
++	    scp->data_limit = 0;
++	}
++	scp->data_buffer = next;
++    }
++    scp->data_length = have;
+ 
+-    scp->data_length = (size_t) (lp - line);
++    TRACE(("Salted TEXT:%u:%s\n", (unsigned) have,
++	   visibleChars(scp->data_buffer, (unsigned) have)));
+ }
+ 
+ #if OPT_PASTE64
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 06c285924d..264320212c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b1
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
+           file://CVE-2021-27135.patch \
           "
 
 SRC_URI[md5sum] = "247c30ebfa44623f3a2d100e0cae5c7f"
-- 
2.25.1

