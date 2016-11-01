Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6093371C2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:30:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so4634752wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=R7iL8/XY/JWCn3xXqxmJErCuvMeQD3btmStpy4bIT40=;
	b=MWMVIU2BxVBhb0J3wK670/55+51yHpnXG6jtFkutKnSc6lYBi3e/lEWMaFIvp8JE0K
	pfT3RHmQ0GTZ5hB2XZNJf2ivFm0XospJujdYKOuz/DvEzvoq7ip4Q7lAFXuX+MSvUbMk
	hGerxsQukWP682yL4Jw5YdiIT7a6Az/II1fHhKAdpbjfkEGP3w9cg2BBH/olOluNobkB
	gisCwgJnYPf9u+AlH6sl7algrg0qOYyaUxX3PS5ol7jDxEIXs0RaqA5xSsYXHJozPzaQ
	+NGxJ/Oi9MSqVj+5d0gG01SDkt6C+oDDacZ0R/PrPkBm6uTVB0TqzI4wmhEpZzLBJCMA
	FWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=R7iL8/XY/JWCn3xXqxmJErCuvMeQD3btmStpy4bIT40=;
	b=G9MQhlhgFvgNl3HikcxES7efdJV8BKABxupvUIqq44QZE6ywJI4dQd//cFymJpiWm/
	135ATRBPQiAGmIS32yL4c5r3H2WeIZgQ690gYOJHkpiVJvPLKrAPf4iPcOYKqY5oanrd
	SrjsErZ0oDWTRi4uwIbWifrZKItw29sHyLRARnRAS624IXrQkKTPikE/xgHVpmYCO49V
	NyjoJ+1Pbf1nEJXXFDl+oeSQha501wAOKHR5yfXGLXjq/0h7wKCIoqyrU0ZMGHNCqfAm
	DnFrZJQS6eFTfA7LLdhF0nOdemyvSW1fp6k16swzL38kaiXKlIsNyBsQLysKtiyRrfR+
	V6UQ==
X-Gm-Message-State: ABUngvdVHNpCbo/MhZwFdKGX7xYBCx7nMpJ5+ntKYnVYR2b/nCMqsRQU/SMAjt1+Iwmgwg==
X-Received: by 10.28.88.18 with SMTP id m18mr20186wmb.26.1478025059060;
	Tue, 01 Nov 2016 11:30:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D1D.dip0.t-ipconnect.de.
	[91.10.61.29]) by smtp.googlemail.com with ESMTPSA id
	m194sm31902763wmg.11.2016.11.01.11.30.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 11:30:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2016 19:30:42 +0100
Message-Id: <1478025042-25619-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478025042-25619-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478025042-25619-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer: fix rare but annoying build errors
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
X-List-Received-Date: Tue, 01 Nov 2016 18:30:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

same as:

commit 63707b56b5352ed72f1c5291967455b78f50fb7d
Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Sun Oct 2 22:16:52 2016 +0200

gst-plugins-base: fix rare but annoying build errors

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch | 32 ++++++++++++++++++++++
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
new file mode 100644
index 0000000..8db3966
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
@@ -0,0 +1,32 @@
+From 4b145ceb22bbce7ba6e209c6ab61f2d5867e69f9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 1 Nov 2016 19:02:30 +0100
+Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+we are definitely not one of those poor souls mentioned
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ common/m4/gst-glib2.m4 | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
+index b01f02f..4569ae5 100644
+--- a/common/m4/gst-glib2.m4
++++ b/common/m4/gst-glib2.m4
+@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
+   fi
+ 
+   dnl for the poor souls who for example have glib in /usr/local
+-  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
+ 
+   AC_SUBST(GLIB_EXTRA_CFLAGS)
+ ])
+-- 
+2.5.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index e3bd5e5..512a28f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz
            file://gst-inspect-check-error.patch \
            file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
            file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
+           file://0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch \
 "
 
 SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
-- 
2.5.5


