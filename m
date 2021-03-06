Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.9955.1615049845573975291
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 08:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PF847FOu;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id n9so2556000pgi.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UOrCagFNeSzbAsRxlwQDg7frBZsd6aLJ5lGIIdeV9Uk=;
        b=PF847FOuJNrH9N1Qohimqlcj/VSFWHh2SzdctfO/yIBY0zYKSkaOCqC/TmkhpVZxFn
         N9suoKvWDc6JNPxZ034nteUFATqiGexxJUuC03weK0ESI9Zl+zreAcgGByI4JGDdNxjL
         K+3GlgQOc6Av8PLrSOB/GPY4JjLTGoa3kk2KSWPh2osYjQFGrnHj0LkeMIk888dGpfG+
         LtqYRPIXGbIGTxZxMRbPcLnabmz7kn+8YTpdddRagoe6ZFiEeOhJ/R50n5pGprwN0QrK
         dJn71KQqev841txXg5A/rI+mNBhXSLqC4JnGnALY/Zhnz47trcS3FFggILfFz1hIT+dU
         dRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UOrCagFNeSzbAsRxlwQDg7frBZsd6aLJ5lGIIdeV9Uk=;
        b=ry5V80FRYi+NXUqqawKYFiQHJDKvzlRQQcmGElIHnAYW8U+Nbt/ySAtTl0PLY43tpA
         ls9S0e6FtkJqFVo8bi/i9MMHnB88O21nxz9UC25jduRwuiCnQgS1tYh+/ivXpLOEAXDG
         TZ8Ruq58DOKzMu6n80k3vVnnlOFyjNkMjmXZXSP3CFXLCYKEF58Z1QSq9gUUTFvqpHa6
         PFRQUZfQw6R/Qda+NxtO9HGxhLdyI7zHqKjcDT2NzWQoqYRfwlkVZI25gYfXCYYsqcwT
         WzBAMx30xvzgnFONZwASY1xjme/aNGMC/iWzSoM6A57YnGsvvYtpKkH1ve071VDqEZMu
         PDLw==
X-Gm-Message-State: AOAM531omj8isnJqa50oJvE4Wyg7PQUz0D4GNdJeYqU+Km1iapuVRrGr
	Y1WrYJ1I4EfdHs8SLUKQ+qzk2HDB+do7OA==
X-Google-Smtp-Source: ABdhPJxVzbLcrEzfFhDgOAlr3hA9tEiCLaKylvGEk1Oy8xi5Ip51Ic8RYiAum3QPdiT5Ye17aWi9zw==
X-Received: by 2002:aa7:9e5b:0:b029:1f1:5ba4:57a2 with SMTP id z27-20020aa79e5b0000b02901f15ba457a2mr7072115pfq.59.1615049844846;
        Sat, 06 Mar 2021 08:57:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id p26sm5724132pfn.127.2021.03.06.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 08:57:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libleak: Add recipe
Date: Sat,  6 Mar 2021 08:57:21 -0800
Message-Id: <20210306165721.863371-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210306165721.863371-1-raj.khem@gmail.com>
References: <20210306165721.863371-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-respect-environment-variables.patch  | 25 ++++++++++++++
 .../recipes-extended/libleak/libleak_git.bb   | 34 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
 create mode 100644 meta-oe/recipes-extended/libleak/libleak_git.bb

diff --git a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
new file mode 100644
index 0000000000..bbdfa3c960
--- /dev/null
+++ b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
@@ -0,0 +1,25 @@
+From ea3f11a7846ad27926c6eacc0534914f4873504f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Mar 2021 19:30:09 -0800
+Subject: [PATCH] respect environment variables
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1d70f17..c7e726e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+-CFLAGS = -g -O2 -Wall -fPIC -Ilibwuya
+-LDFLAGS = -Llibwuya
++CFLAGS += -g -O2 -Wall -fPIC -Ilibwuya
++LDFLAGS += -Llibwuya
+ 
+ libleak.so: libleak.o
+ 	CFLAGS='-fPIC' make -C libwuya
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-extended/libleak/libleak_git.bb b/meta-oe/recipes-extended/libleak/libleak_git.bb
new file mode 100644
index 0000000000..b711112710
--- /dev/null
+++ b/meta-oe/recipes-extended/libleak/libleak_git.bb
@@ -0,0 +1,34 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "libleak detects memory leak by hooking memory functions (e.g. malloc) by LD_PRELOAD"
+HOMEPAGE = "https://github.com/WuBingzheng/libleak"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://README.md;beginline=18;endline=21;md5=de4f705f12cdedbe452b2c3524572b03"
+
+DEPENDS += "libbacktrace"
+
+SRC_URI = "gitsm://github.com/WuBingzheng/libleak;protocol=https \
+           file://0001-respect-environment-variables.patch \
+          "
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "ea2bb608ae25701692269a37d39d77e966b887ac"
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -Dm 0755 ${B}/libleak.so ${D}${libdir}/libleak.so
+}
+
+FILES_SOLIBSDEV = ""
+
+FILES_${PN} += "${libdir}/libleak.so"
-- 
2.30.1

