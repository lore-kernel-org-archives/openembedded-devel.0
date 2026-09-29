Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310C9CA5FBB
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:54 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1466.1790722668250888100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NTd/0Mk0;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7213830eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722668; x=1791327468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyS0bHt9EdUZVL8e995Qgt4mAyTAXoTEqF8pihyTiq4=;
        b=NTd/0Mk0tFM+fASmg+4WfiSrSvm+0RcDyLuVZ8Ah9LyVOCeMtyAUpa8h1EVmibYFFy
         Yf8RM9QAZ5LlWLEQvNhHTqddKZugoP/QIQf+BZuZysGP27+1KOT0ux0vU6X4lOKlVLkU
         9NHdDUCA1Yr8HrKTGKfXmpqxDbI5+Wy6Q8Jerxf12rUVXSegUDy00v8y/AfvNHiA0FXx
         /cdnUvEbHqnKn2mOUyfRrXGi6M6VdOvJOr8eQ0bGcbyna43W5T+Z54FklB/deECigtKn
         WH/XGI+9Y3FPoNjs0Icknk65tH/OGqWWsLFGM4UWWguh29/X++8jnGHfOOknfYHw0sUn
         v5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722668; x=1791327468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyS0bHt9EdUZVL8e995Qgt4mAyTAXoTEqF8pihyTiq4=;
        b=LUAjxQb6LzlC9sIsh0YjE9fGcCFLHwdn4C59C+AO9T+qJ4m2oyUOtzTw9ZTw6In/VT
         kYJE4s9+9kS+9V8112IUWvOR1VTrMoWDAuTClAPuXHZ3/BRNW95eQm+RaGViJoHp9T1E
         rHQdtz4wtmNrgqpWSdstRYyB6UD0KDvLExTeqZuiWVAodLR5gv+Bjs3oh+R7ESOEbSL7
         Fk5LUMu07s4OSJlq2Xx3Y/OgSyxvvvJF0r2aBC/tv8TrPEMXu92s/LWdOCpnzuq2FBnV
         eiWcOtzSWkl27w8rLIPOXr5VpysZ8TmItcijRYTqC0dZw5p+sqLOMXS8kVr9wISOnbyA
         OPvg==
X-Gm-Message-State: AFq9FYKKGfocIU0oX9Mu4zoNVZP3w6rWx0kA/Pk79zGTSGcvdQAI2m5I
	mTy/OKDQoagZu3ct3dLTt2mZ4w3ZQrzX9gVhFv7mqZXO7XDXpcdGtfbnLL7XQPI9IGg=
X-Gm-Gg: AYBFou3/un4ciyhIRrVPO3rAsX8UhjzYWt1sG7S6P1Pc7YD7GurR+GD7MsL+LIpB4lx
	Rxa25fYioBwVRznALCPzMzk38/ef43v1RIgn9nH2+hpUBgzaHgR44cpHq5V6gUjOx63HdKi8Pwr
	ys16tQmXmVTuoqP8ewVkFNHBHULs4QdtpptleXdA5yO8M6izqOiLws7sXEQRznQ+ymVbh/PXd51
	FPm7WIl/58Uoqw1qrBKe3dcIWDs0mXDs7kesPrXUfxhgItcaKZT1RK/EYBCd19W16XB19UsMSy+
	q6bC3mZesvadi66Vh2jneiTqFoVWNIcJHxZib1vN4FgSsrespVObhs5aLZWBMaxb+9J/Lm7QWmK
	1Vl9yeStjwj8P1DkUfyl7sMPpMc4+dlkm7Rq9dlsa3KZo3t02EVM82Wlday5r5A3ZLWF6V7kp+a
	p9YH9Jrxq5xIbIJ3YhoPas81JdLcy452LTtbjx+vd9FZAeWKYOXXPF2BRZ8mzuPkTEdgPkUnTx1
	a4V94CvmgFDvvFmhJq36lGfihpi9/LIvjq5TQI2iJDc2VAN6etmsOMi2L5DGZXZZIk/p6qY+NTj
	6vkWjumbyp50LXrSHlsOAWYn5rCgWMguoBb9rvUzTns89oxBm2Avz37k3FwwxZtGJnTDtddlxJD
	KxaYYNzKVtzFYoQEGCQWsWWkxsbeKz/D5o9XvVU6BEiSw00t7IQYkTv/E60Nc07pkg75qBl+MzO
	uNA5mtjkclX9n2v6BAhyu3/OzvdUWt1O2ggh3mYQ==
X-Received: by 2002:a05:7301:18a5:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-34c671e531bmr696963eec.23.1790722667530;
        Tue, 29 Sep 2026 15:57:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/26] atop: use wide ncurses pkg-config cflags so waddwstr is declared
Date: Tue, 29 Sep 2026 15:57:10 -0700
Message-ID: <20260929225723.1046705-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130500

atop calls the wide-character ncurses function waddwstr(), which
needs NCURSES_WIDECHAR defined; get that (and the right include path)
from the ncursesw pkg-config module's own Cflags instead of hardcoding
plain ncurses flags.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../atop/atop/ncursesw-pkgconfig-cflags.patch | 29 +++++++++++++++++++
 meta-oe/recipes-support/atop/atop_2.13.0.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/atop/atop/ncursesw-pkgconfig-cflags.patch

diff --git a/meta-oe/recipes-support/atop/atop/ncursesw-pkgconfig-cflags.patch b/meta-oe/recipes-support/atop/atop/ncursesw-pkgconfig-cflags.patch
new file mode 100644
index 0000000000..60441f4ab4
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/ncursesw-pkgconfig-cflags.patch
@@ -0,0 +1,29 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:56:24 +0000
+Subject: [PATCH] Makefile: pull in ncursesw cflags via pkg-config
+
+atop links against libncursesw and calls wide-character curses
+functions such as waddwstr(), which ncurses only declares in
+curses.h when NCURSES_WIDECHAR is defined (normally via the
+`-DNCURSES_WIDECHAR` cflag reported by `pkg-config --cflags
+ncursesw`). The Makefile only queried pkg-config for glib-2.0 cflags
+and never queried it for ncursesw, so on distros shipping a unified
+curses.h (as this OE ncurses recipe does) waddwstr() is left
+undeclared and the build fails under -Werror=implicit-function-declaration.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/Makefile b/Makefile
+index 3a73bd2..7d1a3c4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@
+
+ PKG_CONFIG ?= pkg-config
+
+-override CFLAGS  := -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0) -Wmissing-prototypes -Wmissing-declarations -Wformat-security $(CFLAGS) # -DNOPERFEVENT   # -DHTTPSTATS
++override CFLAGS  := -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0) $(shell $(PKG_CONFIG) --cflags ncursesw) -Wmissing-prototypes -Wmissing-declarations -Wformat-security $(CFLAGS) # -DNOPERFEVENT   # -DHTTPSTATS
+
+ CC_CHECK := $(shell echo | $(CC) -dM -E - | grep -q __clang__ && echo clang || echo gcc)
+ ifeq ($(CC_CHECK),gcc)
diff --git a/meta-oe/recipes-support/atop/atop_2.13.0.bb b/meta-oe/recipes-support/atop/atop_2.13.0.bb
index 625a7b0937..28292f244a 100644
--- a/meta-oe/recipes-support/atop/atop_2.13.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.13.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
+           file://ncursesw-pkgconfig-cflags.patch \
            "
 SRC_URI[sha256sum] = "ea182f84c9f52ca922e5af4f17dff97ff424400a4f2f92393317a6af66e6a874"
 

