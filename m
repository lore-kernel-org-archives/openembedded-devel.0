Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.610.1597269848122557873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c2RcNeVN;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id c6so1806165pje.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0k+DkrMCZWZFlOYNdPtpn1du5b98XOkmY43F3nDVNs8=;
        b=c2RcNeVNDQkYgCPLOL98ij98WHLs60PhqFaYN12eaCP+Ec7xp70+zr2KIt63VauNMR
         pRIgbeDX3LtmFYhfOL6bnLXCflY3jg+IgmumSigMHTRFnSYWm9rDAca2JVyMDj/0qZgW
         eqZE4AS9Flhtix3qzZ3ss4phn0jGDfiNLWbbs5haTu14cayYxGUQL/Tkd8XaX+uJzmSp
         Co76Qem4YMFk0Z/f7ZcZ7dOMq1FU5Cupco9hZwADkVWLO/WZh55RtijIJKrzUGIYQBgz
         Wurn43RWPTubitJaNXBQxwvROgpFMMqrQM51YG0HaZg3hliqWrmGe/KNoPlOm122j+h1
         8k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0k+DkrMCZWZFlOYNdPtpn1du5b98XOkmY43F3nDVNs8=;
        b=ozQC/E7CrcmbgNNQyLaiHVH/pP4fQBYXoYIP+25Oey3ribWrTA4Dxv8FJNsQVEVF9j
         ElW6hNn5H5tI/c4rFsbDZbFY/g9Wjdif/0yTcZRx1XKS+KUrlKFfMVp1isJOTF+mu82o
         oQybJKnJlfqe30lDAk8BvhY1YVA/2nsakfRnqJp3JgIYbUVIO5BlFvjQKdPD/v+HrsRQ
         ijBOzBa4VI+Rcncr0RaLQG0Nr6UCSP9EReVZImPIvsT7Rit3dYuNc2aWxE90Ap0xmDqx
         3wuk75DGEjPj7TwPqBy4tUh7HD+/dg0amMXP6LLZCB/5e59JIBx88B/PGR3Tfos1PMIE
         u4HQ==
X-Gm-Message-State: AOAM533Bro2bIHPsJB/g5vIWwLNA8+hDUZOQ2uz36SHWaQmc3JAYvrMM
	wK9UiibJg27FfLDK4uFMf6y3CbV31co=
X-Google-Smtp-Source: ABdhPJyPw6MO/pau0Ha84LAkuu9LpucWto22JrAIXyVAdNY0Fqy/QxHTmHQ8sDDnFJOzEU+HYBT4cA==
X-Received: by 2002:a17:90a:ff07:: with SMTP id ce7mr2104384pjb.192.1597269847109;
        Wed, 12 Aug 2020 15:04:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id x136sm3390745pfc.28.2020.08.12.15.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:04:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/3] xfce4-cpufreq-plugin: Fix build with -fno-common
Date: Wed, 12 Aug 2020 15:03:57 -0700
Message-Id: <20200812220358.1690080-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812220358.1690080-1-raj.khem@gmail.com>
References: <20200812220358.1690080-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e4-cpufreq-plugin-1.2.1-gcc10-common.patch | 33 +++++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.2.1.bb     |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
new file mode 100644
index 0000000000..d5238d00ff
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
@@ -0,0 +1,33 @@
+Fix build with -fno-common
+
+Part of Patch from https://src.fedoraproject.org/rpms/xfce4-cpufreq-plugin/raw/master/f/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/panel-plugin/xfce4-cpufreq-plugin.c
++++ b/panel-plugin/xfce4-cpufreq-plugin.c
+@@ -37,7 +37,8 @@
+ #include "xfce4-cpufreq-linux.h"
+ #endif /* __linux__ */
+ 
+-
++CpuFreqPlugin *cpuFreq;
++GtkCssProvider *currentProvider;
+ 
+ void
+ cpufreq_label_set_font (void)
+--- a/panel-plugin/xfce4-cpufreq-plugin.h
++++ b/panel-plugin/xfce4-cpufreq-plugin.h
+@@ -93,9 +93,9 @@ typedef struct
+   gint timeoutHandle;
+ } CpuFreqPlugin;
+ 
+-CpuFreqPlugin *cpuFreq;
++extern CpuFreqPlugin *cpuFreq;
+ 
+-GtkCssProvider *currentProvider;
++extern GtkCssProvider *currentProvider;
+ 
+ G_BEGIN_DECLS
+ 
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
index 6addc3b65d..5dce51b925 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
@@ -7,4 +7,6 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "ccd8f0f7aef51bc4caf1049986d9614f"
 SRC_URI[sha256sum] = "c5e044c0dc401d2066f208a3df82a588b3e51ff01425f155d0a1d0f8fce8f5b5"
-SRC_URI += "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch"
+SRC_URI += "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch \
+            file://xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch \
+           "
-- 
2.28.0

