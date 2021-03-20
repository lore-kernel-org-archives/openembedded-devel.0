Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.6139.1616259354497806916
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 09:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l89IiaOC;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id v2so5798660pgk.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M+dOMny1OKx54zcHqYp5bJWLLA2q53P5qY7e3kzlq58=;
        b=l89IiaOCkYMcZlz57BZsB5vWV3rJmWAOViRLW30EokavbN44ETWUAio4voM7T3oUka
         FMgRiI2PMNR0A0qSAA/nt2ZiY2ihg3+uVzjf6tuElUKj7ZjPQBzS3GlJRUZ8qUhGfcbU
         lKlUBKVi/bT+WH1MFRU3qgjkACQQ5yyFC95GW0yJk6WL6McxDxWtpK/XcnFpElTRoWJ3
         KBE+2fB+/t8LQ6WCInkMj6pMzjyTszgh4xNwzxX2uTqNHooP07Jwe2guf3/tBN2bfjBi
         VRG0wzr8fLIWPJ3waNije/bJcyXJDgO5wUc1BBGTTnuE1C/shrmIOxPy1EuaRCGdDjLf
         4p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M+dOMny1OKx54zcHqYp5bJWLLA2q53P5qY7e3kzlq58=;
        b=Qr/U3wRO5HKDkXKE88VC2PUjg2n3UnA0dcV4z/0tNmg/Fekw+BkvgWNDWJ45i3Ng5L
         CjNdUYjxw2wfAPvcOhQeMICK4Ad62t2cwX0t6mBmCMh9cI7gkyc7dIMRhr0f+I8soKyC
         Af8Cctnlf+ufjttd/jVaIJazmk80bYoLfVkv+9fJNRMqqVjs4fjpfgR8VkMp8Wk1kgKN
         NQ083Y7pmPQxUlScvWYFsUCrGE5PEJByo6OQGOL/dl7sH9NgIBXrk/Vy39dPHwNLZ9VP
         5NOuk2HHVw8L1rkx3FU97poyBG6JTbtJPEteodhgHfCtp+FDTZWASs9lT7odeZxulu41
         M0Rw==
X-Gm-Message-State: AOAM530lO6wbzZ/xt7m9F3b5EoZ8Ua3n8/PStiCPZG7zz/C9+HTZAaoI
	aoT/E0VhpH39ug9fU1DHvuCeqyQAZrlo3w==
X-Google-Smtp-Source: ABdhPJx44AlkZMpv3ExdvC77TbHfk5gYf+HzMCyROSV1pp9aZj8tl5EvMNrMkhnFbM2cZOQU4B8HPw==
X-Received: by 2002:aa7:9e43:0:b029:1f3:a2b3:d9fd with SMTP id z3-20020aa79e430000b02901f3a2b3d9fdmr14640411pfq.74.1616259353585;
        Sat, 20 Mar 2021 09:55:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id y17sm9106874pju.50.2021.03.20.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 09:55:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gsound: Use () instead of {} for makefile variable in gsound_play_VALAFLAGS
Date: Sat, 20 Mar 2021 09:55:50 -0700
Message-Id: <20210320165550.3815276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes build with latest perl/autoconf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gsound/gsound/0001-Set-vapidir.patch      | 28 +++++++++++++++++++
 .../recipes-gnome/gsound/gsound_1.0.2.bb      |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gsound/gsound/0001-Set-vapidir.patch

diff --git a/meta-gnome/recipes-gnome/gsound/gsound/0001-Set-vapidir.patch b/meta-gnome/recipes-gnome/gsound/gsound/0001-Set-vapidir.patch
new file mode 100644
index 0000000000..ffccfd56f2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gsound/gsound/0001-Set-vapidir.patch
@@ -0,0 +1,28 @@
+From 0a790273aca3ba07dfa6d2f61e3aaa7157c1a3bb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 09:22:18 -0700
+Subject: [PATCH] Set vapidir
+
+Use parentheses instead of braces, it makes automake and perl happy
+newer perl does not like ${} for VALAFLAGS
+
+Unescaped left brace in regex is deprecated here (and will be fatal in Perl 5.30), passed through in regex; marked by <-- HERE in m/^${ <-- HERE abs_top_builddir}/gsound$/ at TOPDIR/build/tmp/work/mips32r2-yoe-linux/gsound/1.0.2-r0/recipe-sysroot-native/usr/bin/automake line 5759.
+autoreconf: error: automake failed with exit status: 255
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -8,7 +8,7 @@ bin_PROGRAMS = gsound-play
+ gsound_play_SOURCES = gsound-play.vala
+ 
+ gsound_play_VALAFLAGS = \
+-    --vapidir ${abs_top_builddir}/gsound \
++    --vapidir $(abs_top_builddir)/gsound \
+     --pkg gsound \
+     ${NULL}
+ 
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
index e4478e14a3..65ee1e1c12 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
@@ -9,5 +9,7 @@ DEPENDS = " \
 
 inherit gnomebase gettext gobject-introspection vala
 
+SRC_URI += "file://0001-Set-vapidir.patch"
+
 SRC_URI[archive.md5sum] = "c26fd21c21b9ef6533a202a73fab21db"
 SRC_URI[archive.sha256sum] = "bba8ff30eea815037e53bee727bbd5f0b6a2e74d452a7711b819a7c444e78e53"
-- 
2.31.0

