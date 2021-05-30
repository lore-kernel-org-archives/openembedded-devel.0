Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.34940.1622399683200165066
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OLW5Az8N;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t8so471878pgb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vXNn8udisJfiVQpMdV5yRMIsIoLYmU91/2Mc4L4dGEk=;
        b=OLW5Az8NzmxAk252E3PIPWeulMdnK9z0xZtpVyG/tDzSxioY/AgvyaKrT4xEuH/bGV
         tFsoCqPASixVoO18CphyrvSjIorOQA64hueVF7jzsCdHhP7nknSpDe2nPTgBKO6I/Fxd
         16yZ6W5rw6dHz95KzHvp3scKgLVXxrbdCaXu35MK80u8lhcPeySHqrNj+zj9E9trhpzj
         moj+lT+LTaQyvJ4n/ne2mQyFW5UJWSythFP3glASKvAPjFjGuyeAhg6Y0lD2pTE0QuQb
         7ekOcIqe9CHl3vuVXqfIpHF6YjRy+n9iLgJnmx8uM2ZXiD6KRIgAMMpC7wF78vgpZfiA
         sj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vXNn8udisJfiVQpMdV5yRMIsIoLYmU91/2Mc4L4dGEk=;
        b=GlH09N8hxgifYoeKH5GPk7fAS4GM8aANK3DwWRQnWhgM7KIj4yUNEY2Ng7DNxaWWnD
         bcJoYv2qiQkyRSjEXqrsR7NmHzQUV+jtTtCribDwm8vRM9NwmEB0bK++/vB5kr2MdxeQ
         EDsKR780t6vyu7jQPHL23h9ZQlFRrfslZV92HLQzicNmd3aLFDJS7/GcYFYXAKs7hmsP
         0baULuJMfMr87gnGnGzO1Mqcf4jrpZnL8XKrnH6AGdrgO5OCVinglwtatIpVERkgaJV/
         9GrHBY04CGN5u7EI4umVUVS3FfWLaXofkpxUm7PaY0MHk/r1f+nQjgCqcfKwSFyaItb7
         WvcA==
X-Gm-Message-State: AOAM532+PA4+MSdQt4z3H9yT9Kw0V9FjLVkQ2g1f1XzdW72cQ2SNio0o
	lwosAP1nKLBq1mbKEiCrLqyUhzykqq4oxg==
X-Google-Smtp-Source: ABdhPJxFF05tHdMo7rkeS4Q0UL8GnedbF1Hbuke7ijbQa6dmEmXCioFAqJ6tQ7aKEkM4iSbTdXwjvg==
X-Received: by 2002:a05:6a00:c91:b029:2dd:4fff:204 with SMTP id a17-20020a056a000c91b02902dd4fff0204mr13555391pfv.46.1622399682551;
        Sun, 30 May 2021 11:34:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/12] ebtables: use bitbake optimization levels
Date: Sun, 30 May 2021 11:34:21 -0700
Message-Id: <587fe58949c7efae60c6eee580bda3233621245e.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Don't overwrite with O3 optimization. Reduces ebtables
binary package size from 416241 to 412145 bytes, and
enables further optimizations with e.g. -Os flags
via bitbake distro wide settings.

Only ebtables versions up to 2.0.10-4 and dunfell are affected.
The version 2.0.11 from hardknott and master branch use system
wide flags already.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ebtables_optimizations.patch              | 19 +++++++++++++++++++
 .../ebtables/ebtables_2.0.10-4.bb             |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
new file mode 100644
index 0000000000..21d4cfd822
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
@@ -0,0 +1,19 @@
+ebtables: use optimizations from bitbake
+
+Enables building with O2 or Os to create smaller binaries.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+--- a/Makefile	2021-04-16 12:43:40.475431286 +0000
++++ b/Makefile	2021-04-16 12:45:23.654597711 +0000
+@@ -18,7 +18,7 @@ SYSCONFIGDIR:=/etc/sysconfig
+ DESTDIR:=
+ 
+ CFLAGS:=-Wall -Wunused -Werror
+-CFLAGS_SH_LIB:=-fPIC -O3
++CFLAGS_SH_LIB:=-fPIC
+ CC:=gcc
+ 
+ ifeq ($(shell uname -m),sparc64)
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 276784009f..8b6dcea439 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
+           file://ebtables_optimizations.patch \
            "
 
 SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
-- 
2.17.1

