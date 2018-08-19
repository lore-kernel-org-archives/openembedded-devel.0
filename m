Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6350B7934A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 23:04:53 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i26-v6so5790884pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RrtDo1C60HztkhxH63ds8UFzZeN31pEsXTUKckeDq3s=;
	b=MLXvtyx12HG3JyotWXegNytX479yxzocb+KYSYkrDTuif07VoM7s0WXR1ruQhpCGJe
	g6gp/5oHkDa/1VB0vroXsjW0rFiwCteN3KLAOlrG3skJLBiQgLJADx8fBDUG5jQedZ4/
	beuqMLRbpQco4T+NFlGZ+892iXULsjrq5vn0Q+9oBTOtwiUzbyceH5y5bDX3Izx8CKq0
	OHZeIeIJYcem7iM+S+A+WNzfSPYkcLnHXF1Ui+Jvzk8iXtJFO+Ky2G5yR412+yGEcujj
	zE6LMkqxRIsGMKWr9fNbU9XRvUQzgQGvbpNbvoce86RUuS4ctMLsSUw3vz20FLjsYC85
	8CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RrtDo1C60HztkhxH63ds8UFzZeN31pEsXTUKckeDq3s=;
	b=j4i6dkyR1ye+IgSHs+SamKTTKL7WCqpXSK3JANBWAdgb2X9CojKkFggqrdEj8Yom0R
	VC+2Zww8MLj2rrkR8IjiPMF9qr4yNQdr2OL5Rur7dGNFYdfb1cUbXPU+SCbu0zGWGqnH
	WZQY8xIUvxkfi2GSzmhqJ7A7mAvlHFcgi3uIx+g+vYU5iQsJ6LS4KygIwp+C9MrBw8v9
	Eu8F/WQYHeGfE3UQyH3X3Ho/oMXlQQbVf6jknrL9uQKaxGYprkeyx/JHhWsZ2bx308gd
	KP6eYVxzsYByoUK4yQiJ5QsIOEjseFUU5zebmU7C7qfOvtZeseNLJya2nhOiEbRZejx8
	nRGA==
X-Gm-Message-State: AOUpUlGYpNWDA9euqiq1RwJ8BbiK7Pf1hM2unP3qbU4NUgbbElFpY1wO
	3MhJdnZZdHVzKsWbD0FiTx8F8Oo0
X-Google-Smtp-Source: AA+uWPw6TbtQEeH+lsMYbnPk98w6WTL3W4FRUv+k0/VxXc2i8usrMD/8N3nUeJDPNxHcKEiA8qOw9Q==
X-Received: by 2002:a63:6343:: with SMTP id
	x64-v6mr10634027pgb.173.1534719894150; 
	Sun, 19 Aug 2018 16:04:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	m15-v6sm14241217pfk.149.2018.08.19.16.04.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 16:04:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 16:04:44 -0700
Message-Id: <20180819230444.42440-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180819230444.42440-1-raj.khem@gmail.com>
References: <20180819230444.42440-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] dlm: Fix build with glibc 2.28+
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
X-List-Received-Date: Sun, 19 Aug 2018 23:04:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...acros.h-for-major-minor-macros-in-gl.patch | 41 +++++++++++++++++++
 .../recipes-extended/dlm/dlm_4.0.7.bb         |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch b/meta-networking/recipes-extended/dlm/dlm/0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch
new file mode 100644
index 0000000000..6f9a0a45a3
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch
@@ -0,0 +1,41 @@
+From a55ab8a07770296bf6a622df14f2f0445be16327 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Aug 2018 15:58:49 -0700
+Subject: [PATCH] Include sys/sysmacros.h for major/minor macros in glibc 2.25+
+
+sys/sysmacros.h was included though sys/types.h until 2.28
+glibc release removed it therefore it must be included
+explicitly now.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlm_controld/action.c | 2 ++
+ libdlm/libdlm.c       | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/dlm_controld/action.c b/dlm_controld/action.c
+index 84637f1..2b8ad6c 100644
+--- a/dlm_controld/action.c
++++ b/dlm_controld/action.c
+@@ -8,6 +8,8 @@
+ 
+ #include "dlm_daemon.h"
+ 
++#include <sys/sysmacros.h>
++
+ #include <corosync/corotypes.h>
+ #include <corosync/cmap.h>
+ 
+diff --git a/libdlm/libdlm.c b/libdlm/libdlm.c
+index a9e6195..499eb6a 100644
+--- a/libdlm/libdlm.c
++++ b/libdlm/libdlm.c
+@@ -14,6 +14,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/param.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <inttypes.h>
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
index 18843a61f8..027864a1a7 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
@@ -9,7 +9,8 @@ SRC_URI = "https://releases.pagure.org/dlm/${BP}.tar.gz \
            file://respect-ldflags-also-from-bin_ldflags.patch \
            file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
            file://0001-dlm-fix-package-qa-error.patch \
-"
+           file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
+           "
 
 SRC_URI[md5sum] = "aa604a10d5ac2d3414eb89ec6984cd12"
 SRC_URI[sha256sum] = "639ddfc82369272a68d56816689736c00b8f1b6b2869a6b66b7dbf6dad86469a"
-- 
2.18.0


