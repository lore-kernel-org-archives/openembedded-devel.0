Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.21056.1610905018365232852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IF/3LE65;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id v1so7976473pjr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C0dE7kIQrfDZeDROs2E7njNKSOcS3rPKiGsr+opRvAs=;
        b=IF/3LE65enBTHcx3Vn1O7KvKOqaecDU/wQZdK0FHYLvJXJ1SWPzHDH6bY04OTT4bwl
         2C/c0KwFogVaFbvJbl/WEXvAvwYRotGYWN3jy9rxgOHxbHz+GjQifIBdgx+wmJnPMJDj
         boRLLKATs2AezZ9m2evX/cusiXEnplIGaZ74PtU0gw1PR2f4cesS8rsvRSIqrv1qLJmt
         jE4nJ9tiX9Z3o1GNGLSn0rAdbWAqN1cLH6Q8nDIhtxlvmM4FqimdTUOzcCZWdlhCfTpn
         njUguPw445qbe1xJMbMXF4Xvbjw+ID62aGObnoLW+d23TSO27nsSTKItQ7c9vgBAAnxn
         nORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C0dE7kIQrfDZeDROs2E7njNKSOcS3rPKiGsr+opRvAs=;
        b=Fi3GVryqVUx8CNJPBQVtl6VzN8QV4WJQhqz+oMnOW10jivmTPzHFA9xvk6lpK24Z3U
         DrwCDUn71D7So2cHwAzBCIz/riQ8UN9shOSY3XRHdlWweUsitqgv0MURVKpstg6APnxg
         pIrcRofGoxDWV60aONnBlePa2Ie9dY36+6DEAZPOEXgIZqeG2bv/TDV5ojyQTXnRiU1Q
         6tIK+uH5L0cUb6sboEhh3PvRrMmMOqywBGhd01TOOmNUkMWhT3VCK4uYjJQXOa3JPOuX
         taVgTJ72Ut/xdF2ekqzEVxGun5kWdE6fLXxhB+gs3QcjDwiVJA/J9q4E1bYXYvBeY28l
         j8+g==
X-Gm-Message-State: AOAM531W3RSwESHPD8Ti+Qwa/f7oN8TK0ayCbT2L5mfYVkTPcXCEXWBe
	oGEbDz/buXBvf0WsJSBLSvlkxFmmWoDKXw==
X-Google-Smtp-Source: ABdhPJyxtarSwWtYRbpetbLczJfsOB9drTCJRywTQqGlmvdb2ngAU85whlt9XrjMfYxUjAATEKzsAw==
X-Received: by 2002:a17:902:be02:b029:da:c6c9:c9db with SMTP id r2-20020a170902be02b02900dac6c9c9dbmr22322026pls.69.1610905017815;
        Sun, 17 Jan 2021 09:36:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 18/31] networkmanager: Fix reallocarray check in meson and configure
Date: Sun, 17 Jan 2021 09:36:23 -0800
Message-Id: <165ad9ad4c86c9e63f3afcf3172c8e1d3629f3a5.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62c2f4a48a244ead00d4b32f42b10f52441afc1c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fix_reallocarray_check.patch              | 27 +++++++++++++++++++
 .../networkmanager/networkmanager_1.22.14.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
new file mode 100644
index 0000000000..0a8de54106
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
@@ -0,0 +1,27 @@
+reallocarray() is coming from stdlib.h which maybe indirectly included
+by malloc.h but not on all libc implementations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/meson.build
++++ b/meson.build
+@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
+ # FIXME secure_getenv check is not useful?
+ config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
+ config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
+-config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
++config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
+ config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
+ config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
+ AC_CHECK_DECLS([
+ 	reallocarray],
+ 	[], [], [[
+-#include <malloc.h>
++#include <stdlib.h>
+ ]])
+ 
+ AC_CHECK_DECLS([
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index 2613076a7e..aa8ab899bb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
+    file://fix_reallocarray_check.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
-- 
2.17.1

