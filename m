Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.43721.1589813428172856695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJzfr2Kt;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q8so3253915pfu.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OXyOlGIO/eMR/VJknmmCRlTpi6UCrxLOxp+XPGUdb40=;
        b=YJzfr2KtChqFET4JI+IPHSNvntk5n8gnGScvWC5uiNgzjchN8bJr3kW258/IXjWCnK
         6hYNs1RHoqXgUEH7d2VUFr7j7WFf6ojTAg/NRpv2Lgd7CpbZ09toQDxs2bpFaA3wmJhy
         iYwyRcZ+FdgHwnutw90f9X7rGXNCe8p9sgrz0VwpSbJgNoo1X0uTIwgRPXGtlhLtytOt
         IJUANQxrzqXBYBci/8jVFVvlYcI2A7yS3ePnrK/0Y8D+/LBUCGRDw7L7saq0X+CEHiqB
         0bZ1cm2mkGsDgL2xPjGsPWHLhxgcRdl3XXqaPYDqWOEQngY6djvA4cs81Tl1YwjBdU2U
         0b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OXyOlGIO/eMR/VJknmmCRlTpi6UCrxLOxp+XPGUdb40=;
        b=gSr9AgFtcoqAbxzjXPd/O7r8BG9IQNxCRgCxL3jGEq/jcPL3m40q+uYYZbQ7CyyVfK
         4zZiBsdMWrSFXEAcM0+0B2XXsgBlw92Q6GqOYAIIPxgN+uitXvytUyorTtrHhOb62ULf
         zC77OOUrfWBrO0jeLxdmZ3G5fg3jIoJ6Symjy/dEHQTXbKfQqlEBCUxMAKExaBX660lA
         c/YCHeozx3Eji4h5DYUMYacbvLm9py82VVv/gUX+dNgsUqJ0aOrN9aPneowK2YhtHF+2
         QfeAHKqGwJjtVBN1OTcH8XI6bnuY/7PtI6CkRcpxEG1gDKqeU6ZcfqIN+IcvUCGtA8wJ
         usCw==
X-Gm-Message-State: AOAM530j+wxv1xdFoaxxREg/Fn0zkWe+Usjyo2S7GjD2lhKvvUFR6TUK
	g8iYs3DcILWDBg19KA525BUzfGqc
X-Google-Smtp-Source: ABdhPJyzVehweXg98Hw3aOKvHLuGV0guyjynZHoGsyArFOhS71YnOwHNvJGyELTdoULxlKffCzpSpw==
X-Received: by 2002:a62:3c5:: with SMTP id 188mr16519612pfd.41.1589813427404;
        Mon, 18 May 2020 07:50:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 20/57] x11vnc: fix xfc NULL pointer dereference
Date: Mon, 18 May 2020 07:49:25 -0700
Message-Id: <7601fbcf5c3f5e44072b55656af161e7e64beb79.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8eecca63640b47d02665fa9c4caabc9776b830d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...sor-fix-xfc-NULL-pointer-dereference.patch | 30 +++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch b/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
new file mode 100644
index 0000000000..a571ba2838
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
@@ -0,0 +1,30 @@
+From 95a10ab64c2dbbec2c8dad91a5ffb73a0d68474b Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 16 Mar 2020 20:04:06 +1100
+Subject: [PATCH] src/cursor: fix xfc NULL pointer dereference
+
+xfc->width and xfc->height for the XFixes cursor image returned from
+XFixesGetCursorImage(dpy) are accessed without first checking that xfc
+is not NULL. This can result in the server sometimes crashing when
+moving a Google Chrome window.
+
+Fixes: 37c946191a0f ("Broken cursor bugfix for 64 bit systems (#49)")
+Upstream-Status: Accepted
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/cursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cursor.c b/src/cursor.c
+index 39e73a6..74a08c6 100644
+--- a/src/cursor.c
++++ b/src/cursor.c
+@@ -1311,7 +1311,7 @@ static int get_exact_cursor(int init) {
+ 
+ 		/* retrieve the cursor info + pixels from server: */
+ 		xfc = XFixesGetCursorImage(dpy);
+-		{
++		if (xfc) {
+ 			/* 2017-07-09, Stephan Fuhrmann: This fixes an implementation flaw for 64 bit systems.
+ 			 * The XFixesCursorImage structure says xfc->pixels is (unsigned long*) in the structure, but
+ 			 * the protocol spec says it's 32 bit per pixel
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 0d84c420a1..e3a1914fef 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LibVNC/x11vnc \
            file://starting-fix.patch \
            file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://src-cursor-fix-xfc-NULL-pointer-dereference.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

