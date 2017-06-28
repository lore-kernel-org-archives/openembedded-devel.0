Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5544378070
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:43 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e7so25445493pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L2g2FffHRTU5QNXBDU5sdHZK5lQUWo/IJt8NOx4Sb6w=;
	b=ilimCAwOyHkRjgbxqXTBkBKKnxAu7Vnvf6dAVQAIS6sKRwQ0HJMaR1Ss5O6BrlAhB9
	1jA7lSFB6T/N5KCsv2ps+9YXb11iU9WuHExqoNH9hAyWajkvSnpmALcqPDUjrldXS54I
	NBmCIvZnlQBLOsUAJYSAdyxKBdpbotWo51pESzd8ILy4wHgUDoJOleYVdtGMESH3aqGu
	3YfgWl6QfTQa3ILT3XjOiBpWqVadicccymaeqsuzhTRSg8ZybEp+GFICuEgmzJSbGrBK
	0lakxLodzV3SwcU2qEPkiPw0C8COU2/NCsfviFNiuRKWmeiFUGdokJ+5gUXcvhP5sNAp
	uW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=L2g2FffHRTU5QNXBDU5sdHZK5lQUWo/IJt8NOx4Sb6w=;
	b=EJ8NDDW/8IezH0YxPjse8hcZZvJgn4X+4B8khxr3gNQ9fiPllWiyrh1u2TXjhckgot
	ZBb4aGerTGLmzOv8XTpPyla2nUUsOGOA5gTGYVNa49w70CUQAkqYv4X1ad33niWvtrei
	Az+62p0M4Fx8/nl6VWcFJDvNbt+jRgWMAcN/RhV/Nx0bW2s1zi9obJeDHKydzDa5CYwl
	cT8+3ttScVtJYx1RoW7LLckwhRQooVkqDGi5aRj5oVEcDO584GZdcUqDIdJoTbRdEhGO
	VpPcikwcbls+JlOgkMYmpl/Q0JvGpPBjgwCj9jsiWRrRYX7mILHWNG6pXl0imcjhmvbE
	vMDw==
X-Gm-Message-State: AKS2vOyUeoJv0EgpKdvHwR2IqtAroY/SvzbWka5ekrDM7uRHPfz2Whfn
	GBUamlJgs609+sB3
X-Received: by 10.99.226.83 with SMTP id y19mr8147021pgj.257.1498615724486;
	Tue, 27 Jun 2017 19:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:11 -0700
Message-Id: <20170628020819.17047-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/13] gtkperf: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-stdlib.h-for-exit-API.patch       | 34 ++++++++++++++++++
 .../0002-timing.c-Fix-format-security-errors.patch | 42 ++++++++++++++++++++++
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb   |  5 ++-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
new file mode 100644
index 000000000..d529ddd23
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
@@ -0,0 +1,34 @@
+From f8ac48abded02353918b02db38629988bd111c46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 08:19:44 -0700
+Subject: [PATCH 1/2] Include stdlib.h for exit() API
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes
+main.c:81: warning: incompatible implicit declaration of built-in function ‘exit’
+
+Patch from Debian
+http://sources.debian.net/src/gtkperf/0.40%2Bds-2/debian/patches/01-include_stdlib.patch/
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/main.c b/src/main.c
+index 888eb36..c226799 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -11,6 +11,7 @@
+ #endif
+ 
+ #include <getopt.h>
++#include <stdlib.h>
+ 
+ #include "interface.h"
+ #include "support.h"
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
new file mode 100644
index 000000000..0548040af
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
@@ -0,0 +1,42 @@
+From 47974b8473c5b928f6742caee466f5c2d4d2e9eb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 08:22:26 -0700
+Subject: [PATCH 2/2] timing.c: Fix format-security errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/timing.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/timing.c b/src/timing.c
+index 0b8f0eb..c0668c9 100644
+--- a/src/timing.c
++++ b/src/timing.c
+@@ -97,7 +97,7 @@ add_test_info_time (AppData * appdata)
+ 	gtk_text_buffer_insert (appdata->textview_info_buffer, &iter,
+ 				timestring, -1);
+ 
+-	g_printf (timestring);
++	g_printf ("%s", timestring);
+ 
+ }
+ 
+@@ -129,7 +129,7 @@ add_test_info_end (AppData * appdata)
+ 	gtk_statusbar_push (GTK_STATUSBAR (appdata->statusbar_main), 0,
+ 			    " Test Finished");
+ 
+-	g_printf (timestring);
++	g_printf ("%s", timestring);
+ 
+ }
+ 
+@@ -154,5 +154,5 @@ add_test_info_start (AppData * appdata)
+ 	gtk_statusbar_push (GTK_STATUSBAR (appdata->statusbar_main), 0,
+ 			    " Running tests...");
+ 
+-	g_printf (timestring);
++	g_printf ("%s", timestring);
+ }
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index e404a7a51..2db91904f 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -4,7 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
-           file://Makevars"
+           file://Makevars \
+           file://0001-Include-stdlib.h-for-exit-API.patch \
+           file://0002-timing.c-Fix-format-security-errors.patch \
+           "
 
 SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
 SRC_URI[sha256sum] = "9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b"
-- 
2.13.2


