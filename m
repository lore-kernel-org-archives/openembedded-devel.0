Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.12373.1597383432180987203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AlYa5pwv;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id f10so3672132plj.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=39CDMIrK/ELnnRR74cvKajtJsWOjQynbJyMf9tg9mjY=;
        b=AlYa5pwvB3eWyXthSL6SOtHSRHJHRFyBRF2JGr345CStTxz2tB1/HkaEiF/jOMur3q
         s7wCySjnZWwqk+T8EnYwjoniAwBSpUy2mSxOVYva47aM+3d2CJNy3wBqJWCac04jfcjI
         rlJnlLbcbZEJW0Qty5XzqY7JL3ZZzYSYU074kozAjFo7pWgL0u74OxcClC6yIWP72hdB
         b87lzA0cPH+ga8f6mTKGmvm7W3TDu3rb9/rbuyarhGyNu0HdsAnDxXLBWiVKzmXvhYZe
         sXoLwTAwg9ioJfvIL//SmAwuwdNqne++hzZvHyd6pAbD0l525lKsOSKHdhkiBO4hWPW1
         96+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=39CDMIrK/ELnnRR74cvKajtJsWOjQynbJyMf9tg9mjY=;
        b=ReFM6iN1fhDkjEYzTbuWP9EZ/FH1iV8kcxtNQWho7kO2qA2IjOSAI/eKDvk9PbJuNL
         23iwTJou9t6hd+XppWjYwQ/NbJJcGj3XQYlVY4q+5ceuOKB4AM+0iBcdl1hYH4dN7yRT
         iI94eQYAA0ZTy1wHPWmJI7L1DJRP0grvDmN7kE9kTlIzOT23WfZmdgvskwlrdH7Tr4bW
         yy9QpxJMhMktR1dUGZxDwyPXU0xq3jynFxacST5x9NXlwOhMwd9dPKBwIA77zjoiDBJe
         pPvxF7u8fM84I8iNA+N+dgsTUL5Fd31Rp3Fgp+GAEMSRjiQMIiT5gSGbZXR9gCqzdL4f
         JJcA==
X-Gm-Message-State: AOAM530NjrTMD5PBe2OAYY77DwfqJRe/LnEKv3V8onhk9yJ308z5p0r0
	cr5QrhpBK7WwWmXHB6GzRmeuqGisfmm5Lg==
X-Google-Smtp-Source: ABdhPJzgXBU6cJ9Mj8VDYtepxVMpogVjrq7PAHI3LOCXHQBROwwOO7WbRW/8oO3Ofb3Btm76QEqFjw==
X-Received: by 2002:a17:90b:470f:: with SMTP id jc15mr978139pjb.166.1597383431202;
        Thu, 13 Aug 2020 22:37:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/21] libforms: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:48 -0700
Message-Id: <20200814053657.1701247-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-extern-declarations-in-header-file.patch | 46 +++++++++++++++++++
 .../libforms/libforms_1.2.3.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch

diff --git a/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch b/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch
new file mode 100644
index 0000000000..619bad6d02
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch
@@ -0,0 +1,46 @@
+From a57c498f6c25aa297e49533c242525f2b9da7048 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 18:20:42 -0700
+Subject: [PATCH] Make extern declarations in header file
+
+curobj is a static object in other places as well.
+Fixes build with gcc10/-fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fdesign/sp_spinner.c | 2 +-
+ lib/flinternal.h     | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/fdesign/sp_spinner.c b/fdesign/sp_spinner.c
+index 04f2c19..6206daa 100644
+--- a/fdesign/sp_spinner.c
++++ b/fdesign/sp_spinner.c
+@@ -29,7 +29,7 @@
+ #include "spec/spinner_spec.h"
+ 
+ static FD_spinnerattrib * spn_attrib;
+-FL_OBJECT *curobj;
++static FL_OBJECT *curobj;
+ 
+ 
+ /***************************************
+diff --git a/lib/flinternal.h b/lib/flinternal.h
+index 06d847e..577bd10 100644
+--- a/lib/flinternal.h
++++ b/lib/flinternal.h
+@@ -138,8 +138,8 @@ enum {
+ 
+ /* events.c or event related */
+ 
+-FL_OBJECT * fli_handled_obj;
+-FL_OBJECT * fli_handled_parent;
++extern FL_OBJECT * fli_handled_obj;
++extern FL_OBJECT * fli_handled_parent;
+ 
+ void fli_obj_queue_delete( void );
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
index 999d53d4a9..35029f5176 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
            file://fix-link-to-xforms-man.patch \
            file://add-absolute-path-for-include-dir.patch \
            file://fix-path-fdesign_LDADD.patch \
+           file://0001-Make-extern-declarations-in-header-file.patch \
           "
 
 SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
-- 
2.28.0

