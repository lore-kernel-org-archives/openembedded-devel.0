Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.304.1597264911420913301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e/TV5JI6;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y206so1597984pfb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0GKOA7jOzq6AkHxKTkYfkdaVG1hoGf1Wioe/dtC6+cc=;
        b=e/TV5JI62F5j1+ndIW3hAgkGGyvZMNowFqICaicR9WwnD5574YlYD05ArxQ6W88hAV
         aqTiOZZdFbQWMbvOgZylsdR2/YH9v/MMMoTXLdSIDV5eAJvvLDIeW1FOHlWEU60cO718
         neFfcYFUKG5W99N+W0so4DIZ6yvi89KKcPimnUAA9oIH+2Gc5HJvTF3XTp+/5P+/mCR0
         5XHSCiOMnkip15VIELHb2JjWs14dO3DrkTjTtAbz3sMTeYyEoyMUvQAb9ZjeWSyeU9bD
         QV+wT9VRmfZ2H9QIouajkwn93sI1UfVZfmtAW+LvZ4PXC44FkMfeNpdVW9KyfT80bTFu
         5+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0GKOA7jOzq6AkHxKTkYfkdaVG1hoGf1Wioe/dtC6+cc=;
        b=rX8PuOrWwF6jFWDoaydZ7/W37S7QiWPFoteLkUNEp4tPujuRZv+MUNNyu/+L6t5UED
         U2vpLt3nViCa0aYatF7TnhsIvRhLfmxqLHVU19XAvKVFHESKlB9ViB/K1q723+D+Xapj
         uW/TOShZyTscuKFUJ6/Pj7GT+7XG3r2yxqM9J9F9AbdOTGmQ9JaK+/Ut9/ZmcFI6GCfq
         b/0dIvC6clD7SmFqcy1cq0wdeMps+58cQ7ZrJUl3gnZr4ATwvFEbMBVisKoLO+9eiGaf
         MVhrI08TINuGycx07lxEqpBhlwLw2JYRWMIlQpA0oK39BZ9kTSKXnzY0MXwPoK4jFkJn
         pZvg==
X-Gm-Message-State: AOAM530MZCol+Td84p6sYkPcBL1iJvDUV8HdezeNhnHU9TrK6KfG48Bd
	tYMTgzVzudo4YcGzakVm9xgkJYGb+uM=
X-Google-Smtp-Source: ABdhPJyGpz1prMPV33lo8Eq5AjLFZhPOHTw44NGd7XGlF4Fr85/T+GcUkjqqgeq0uacYnRH4jvVwUA==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr870165pgh.76.1597264910340;
        Wed, 12 Aug 2020 13:41:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 18/18] iftop: Fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:30 -0700
Message-Id: <20200812204130.1012160-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iftop/iftop/iftop-1.0-gcc10.patch         | 68 +++++++++++++++++++
 .../recipes-support/iftop/iftop_1.0pre4.bb    |  4 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/iftop/iftop/iftop-1.0-gcc10.patch

diff --git a/meta-networking/recipes-support/iftop/iftop/iftop-1.0-gcc10.patch b/meta-networking/recipes-support/iftop/iftop/iftop-1.0-gcc10.patch
new file mode 100644
index 0000000000..28391a57cf
--- /dev/null
+++ b/meta-networking/recipes-support/iftop/iftop/iftop-1.0-gcc10.patch
@@ -0,0 +1,68 @@
+Patch by Robert Scheck <robert@fedoraproject.org> for iftop <= 1.0pre4 to avoid a
+GCC 10 related build failure due to global variables in a header file with omitted
+"extern" declaration, see also: https://gcc.gnu.org/gcc-10/porting_to.html
+
+Example build failure output:
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: multiple definition of `screen_list'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaktotal'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peakrecv'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaksent'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: multiple definition of `totals'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: multiple definition of `screen_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: first defined here
+/usr/bin/ld: ui_common.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: multiple definition of `service_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: multiple definition of `screen_list'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaksent'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peakrecv'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaktotal'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: multiple definition of `totals'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: multiple definition of `screen_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: first defined here
+/usr/bin/ld: ui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: multiple definition of `service_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: multiple definition of `screen_list'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:36: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: multiple definition of `totals'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:37: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaksent'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peakrecv'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: multiple definition of `peaktotal'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:38: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: multiple definition of `screen_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:40: first defined here
+/usr/bin/ld: tui.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: multiple definition of `service_hash'; iftop.o:/builddir/build/BUILD/iftop-1.0pre4/ui_common.h:41: first defined here
+collect2: error: ld returned 1 exit status
+
+Patch from https://src.fedoraproject.org/rpms/iftop/raw/master/f/iftop-1.0-gcc10.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/ui_common.h
++++ b/ui_common.h
+@@ -33,12 +33,12 @@ typedef struct host_pair_line_tag {
+ 
+ extern options_t options;
+ 
+-sorted_list_type screen_list;
+-host_pair_line totals;
+-int peaksent, peakrecv, peaktotal;
++extern sorted_list_type screen_list;
++extern host_pair_line totals;
++extern int peaksent, peakrecv, peaktotal;
+ extern history_type history_totals;
+-hash_type* screen_hash;
+-hash_type* service_hash;
++extern hash_type* screen_hash;
++extern hash_type* service_hash;
+ 
+ void analyse_data(void);
+ void screen_list_init(void);
+--- a/ui_common.c
++++ b/ui_common.c
+@@ -24,6 +24,12 @@ int history_divs[HISTORY_DIVISIONS] = {1
+ char* unit_bits[UNIT_DIVISIONS] =  { "b", "Kb", "Mb", "Gb"};
+ char* unit_bytes[UNIT_DIVISIONS] =  { "B", "KB", "MB", "GB"};
+ 
++sorted_list_type screen_list;
++host_pair_line totals;
++int peaksent, peakrecv, peaktotal;
++hash_type* screen_hash;
++hash_type* service_hash;
++
+ extern hash_type* history;
+ extern int history_pos;
+ extern int history_len;
diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
index 0c8e494c19..c71ecb32e9 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
@@ -6,7 +6,9 @@ DEPENDS = "libpcap ncurses"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76498170798db0f4f0fb685a225f702f"
 
-SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
+SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz \
+           file://iftop-1.0-gcc10.patch \
+          "
 SRC_URI[md5sum] = "7e6decb4958e8a4890cccac335239f24"
 SRC_URI[sha256sum] = "f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97"
 
-- 
2.28.0

