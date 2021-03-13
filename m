Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.653.1615621037674729722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 23:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wa4yqYZ+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p21so17328291pgl.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 23:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NoJZLfnQ93MAdWwjMsWkyyzHYxoTEzRZURmzzwz4Io=;
        b=Wa4yqYZ+XaUJCSsS1zbpgiRXEHwM93J7XoZvRdbHMjllJE0//wMWBQkGjAQKE/BDwm
         GcSHA7ZWC7c09YxErPKubPzpmsYHiFywFguqlpKRwHPYa4+Q7Swiws+k/NS/0YczHbj+
         E2RfUDCnTKiL7zS2wtrkr5G8tVeWui9gIVJi3Jr+HulZFVomPanmhGnaQUkvtl2/bAPr
         8u3jJ9VQv3y/jOkiosSix4epe9z45qjCFFr7B/o3lDeGMKdg67spOGsrBMQFQcl14/9a
         jDRnBTy6H2QAcD8KALEprlajGgtyp2GeBDjDNaIDzXs8z5z2kjL0F7ZVsAsc6adpHufo
         WsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NoJZLfnQ93MAdWwjMsWkyyzHYxoTEzRZURmzzwz4Io=;
        b=VcT50n8rrLcR+YC8MTvmvaE0beUrs3tLRkV44tE1wvv+UzvXszZNiATCmdZZDe4rBK
         BRFrxnCc94ohrkW40yAQGTdDkHGU9MQCDw8ZYi+I7WZ0x6RDTMnjCgBNrDXsXdc/6fqA
         U2t1L+kkhnI4nVFAVb0XB8yfD/8/ZMAPdBXp6Z+/wrXj42gNdv9E1UdAzunfo+suSd9i
         aOM8M1aayHhZzkkyLTcvsxApn+nkNWyDaOPuVRdPZaLJ5VDz1PrSvlg6mqhCOg/DCyGd
         ylAqH5yk0CVCA2wBlSAO/td3tcaSGy4hAI0rEXerUAz9HFe3j67nskzPO7RY+3LaaleY
         E2Mg==
X-Gm-Message-State: AOAM531XtIYl0OUpXBbwVkNFfa7EydtloKINJfrsknsRgb5oHAtVt8A7
	AC/83QKLD5sPbhf1zJ2Du22JA98HfR4/iQ==
X-Google-Smtp-Source: ABdhPJylo5TYYyzNwRA+4/9Eh6mlDou2hFWfLoTd+xeLAOxzJO+AOI+mpAue60fPytglZCZfRUarjg==
X-Received: by 2002:aa7:9205:0:b029:1ec:8eab:7ca3 with SMTP id 5-20020aa792050000b02901ec8eab7ca3mr1983785pfo.20.1615621036854;
        Fri, 12 Mar 2021 23:37:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id u7sm7157057pfh.150.2021.03.12.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 23:37:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ltrace: Fix build on ppc64le/musl
Date: Fri, 12 Mar 2021 23:37:14 -0800
Message-Id: <20210313073714.2672888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltrace/ltrace/add_ppc64le.patch           | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch b/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch
new file mode 100644
index 0000000000..dff61b1502
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch
@@ -0,0 +1,39 @@
+--- a/sysdeps/linux-gnu/ppc/ptrace.h
++++ b/sysdeps/linux-gnu/ppc/ptrace.h
+@@ -18,4 +18,5 @@
+  * 02110-1301 USA
+  */
+ 
++#include <asm/ptrace.h>
+ #include <sys/ptrace.h>
+--- a/sysdeps/linux-gnu/ppc/regs.c
++++ b/sysdeps/linux-gnu/ppc/regs.c
+@@ -23,11 +23,14 @@
+ 
+ #include "config.h"
+ 
++#include <string.h>
+ #include <sys/types.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+ #include <errno.h>
++#ifdef HAVE_ERROR_H
+ #include <error.h>
++#endif
+ 
+ #include "proc.h"
+ #include "common.h"
+@@ -49,8 +52,11 @@ get_instruction_pointer(struct process *
+ void
+ set_instruction_pointer(struct process *proc, void *addr)
+ {
+-	if (ptrace(PTRACE_POKEUSER, proc->pid, sizeof(long)*PT_NIP, addr) != 0)
+-		error(0, errno, "set_instruction_pointer");
++	if (ptrace(PTRACE_POKEUSER, proc->pid, sizeof(long)*PT_NIP, addr) != 0){
++		report_global_error("%s: set_instruction_pointer",
++			strerror(errno));
++		exit(1);
++	}
+ }
+ 
+ void *
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 5710943d74..17264cef5e 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -30,6 +30,8 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-Bug-fix-for-data-type-length-judgment.patch \
            file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
            "
+SRC_URI_append_libc-musl = " file://add_ppc64le.patch"
+
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.30.2

