Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.23588.1612720953917206073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=PJN0TDdE;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id b2so18840579lfq.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 10:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vlt81QezqAo1TFNdQMTdG8w3zntXzqOXOjyuXc3sOo8=;
        b=PJN0TDdE92Mcv4XTFZQ8JRtEU+icgrY+THkY/F2kHUH/npYRts2Q6uz2GBV+tK435H
         bb+OxCx/UmdgD0ZE8MZX/l+OhX3oSlLqc3EIk/Eb7R9WWvmyKDwBmFgH6MUnFHPS1t1K
         n9kjwLTeIWRg7U4pzQoD5zAe4xJZPpLGEcY7oSL0wamAZYJvCjJaTrVsqs9BzEShZUgP
         zU+1AvHVUOHQ8Xcg4I66CGwislBXzlfKx96rlLj5eiKPulVuqti6Qu3vAtvCS9q5ExLo
         FlR0qDzVIdyKDcAUoOc4JGqUs16PCvll09cZXfKWYr6JimsD5piaudwpkDGmD1Oo2+96
         iSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vlt81QezqAo1TFNdQMTdG8w3zntXzqOXOjyuXc3sOo8=;
        b=pO7sN3mPfToAk6IO5WQb4zkl9uTJGhzPZG2JqINRf/7nE6psWcoTqh/28MyKJwd2vY
         NA6ss+PL6K6/euPe1C/QzaAu/7h+goG65RxvDlXnRQFKcEpLohQT0fWqkCZMlhXMAsWF
         LkHrwHhOzbXDHP8+oDi0qACJCDyCTu0mgfUkLL3xl131N5PuvEmHZRN9zuc1ua/kgGLq
         l4JucDu5Uz+Ky6lLVoqpHIkrQqaZOEzGvMng0FAAfA7hVJyXX3UfyRMpVyOFTxs7L2dm
         Ow1WEfVHXjOMFj1UiHNI8shVQMt6019dZWuV0Qpyq0uoFuEgF/Ywd/Xsf1NEnxAKhq6s
         aMeQ==
X-Gm-Message-State: AOAM530/duQL02CdaXD6XUZ85LtTJ+VO2oCva6z6HunC5kMpKEfwQZKh
	0hlmdv8MCwgtA9RmqeYtDoNi+5hqxs8BWJX0
X-Google-Smtp-Source: ABdhPJzJAEsnDn6PcmVSTqPoWAOlFSroP65wzqu/hw9tnDXD2R1nC48+sAmM/PoRsfzFkkGWO3VhcQ==
X-Received: by 2002:a19:a41a:: with SMTP id q26mr2847631lfc.194.1612720951589;
        Sun, 07 Feb 2021 10:02:31 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h19sm1668970ljc.56.2021.02.07.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:02:30 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH v2] atftp: update to 0.7.4
Date: Sun,  7 Feb 2021 18:57:58 +0100
Message-Id: <20210207175758.71521-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed upstreamed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...fix-musl-compile-add-missing-defines.patch | 45 -------------------
 ...d.h-fix-musl-compile-missing-include.patch | 43 ------------------
 .../atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb}  |  5 +--
 3 files changed, 1 insertion(+), 92 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
 delete mode 100644 meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
 rename meta-networking/recipes-daemons/atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb} (84%)

diff --git a/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch b/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
deleted file mode 100644
index cfa8a7325..000000000
--- a/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 543e67919f5cacf309ac88ab091331e41af4224b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 16 Apr 2015 22:41:57 +0200
-Subject: [PATCH] argz.h: fix musl compile (add missing defines)
-
-Upstream-Status: Pending
-
-Add __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__ defines.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- argz.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/argz.h b/argz.h
-index 582be55..bdf9f62 100644
---- a/argz.h
-+++ b/argz.h
-@@ -48,6 +48,22 @@
- # define __const const
- #endif
- 
-+#ifndef __THROW
-+# define __THROW
-+#endif
-+
-+#ifndef __BEGIN_DECLS
-+# define __BEGIN_DECLS
-+#endif
-+
-+#ifndef __END_DECLS
-+# define __END_DECLS
-+#endif
-+
-+#ifndef __attribute_pure__
-+# define __attribute_pure__
-+#endif
-+
- #ifndef __error_t_defined
- typedef int error_t;
- #endif
--- 
-2.1.4
-
diff --git a/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch b/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
deleted file mode 100644
index 093054ce8..000000000
--- a/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 16 Apr 2015 22:43:49 +0200
-Subject: [PATCH] tftp.h/tftpd.h: fix musl compile (missing include)
-
-Upstream-Status: Pending
-
-Add sys/types.h include for u_char typedef.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- tftp.h  | 1 +
- tftpd.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/tftp.h b/tftp.h
-index 12bd6aa..32a3f63 100644
---- a/tftp.h
-+++ b/tftp.h
-@@ -19,6 +19,7 @@
- 
- #include <sys/time.h>
- #include <sys/times.h>
-+#include <sys/types.h>
- #include "tftp_def.h"
- #include "config.h"
- 
-diff --git a/tftpd.h b/tftpd.h
-index 945065e..60d3a49 100644
---- a/tftpd.h
-+++ b/tftpd.h
-@@ -20,6 +20,7 @@
- #include <pthread.h>
- #include <arpa/tftp.h>
- #include <arpa/inet.h>
-+#include <sys/types.h>
- #include "tftp_io.h"
- 
- /*
--- 
-2.1.4
-
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
similarity index 84%
rename from meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
index ff9084dbf..936fc723f 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
@@ -4,15 +4,12 @@ HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRCREV = "52b71f0831dcbde508bd3a961d84abb80a62480f"
+SRCREV = "e56e8845f1070e89a4a6e509396b681688d03793"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd.init \
            file://atftpd.service \
 "
-SRC_URI_append_libc-musl = " file://0001-argz.h-fix-musl-compile-add-missing-defines.patch \
-                             file://0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch \
-                           "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

