Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10288.1616279980828662221
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 15:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvaiAC4C;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id j18so12766346wra.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU3kg53DYfWhCaT7Po4KP786Dugu7Qxzy8itVDZXxR8=;
        b=BvaiAC4C5sWx2Qt047S001JF6rAaJzmTzvOOa8qpKxvQbBiOD93bLILZdKkaayNOod
         XLHSAiWh1Y9AucbfXtuuufOE6Id2S2yytA1rL8b6Ez5WGztMhwa1hom3JtxCW+L91awb
         ELtQnEGJ5WX6Z9am/1dQ77tXLPiBfZxIgny+UriYyEyAjHYwhxjx2o1/6u7JYtlhgEBu
         VIgk3VEK+MgaKhwvA6DZFqVE0a0GSS21sLiP3p3dOr3Mc/ql/US3rPOpjLMDH/L0EdXW
         /xYOkQakCjU0oU8gVvlXWMlJ0EZUeY/f1L1bUgyoLcfRjMY0ea8n0NOltSzqncDRSYb4
         1KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU3kg53DYfWhCaT7Po4KP786Dugu7Qxzy8itVDZXxR8=;
        b=rSzHXi7ii50akZAsHxHqDEpHayGHv7Ye8o6fyg3gPBHXxv1nEX1lDlw6qOvV36hxxv
         /gFuAvFnFxvqWoUJM55MuD7VEgk6cIYW9K2Ro24a6ZlG+blPYo7mudRW+tZ0RZ6Zn60u
         u1MDOitndf7PWooq2YQUeFfpLVdmP/uO5xPzWfXCXkl+rxGP83lVHX1k225xsZdrs84y
         aivuv2X09WVzhHozQGzme1UirJThkKU2pzH4r+tjooXtRm3pFvJyXr4s5Zof7vfCA1jv
         2sxdrdRn2Hoyc1OXx2wGfDwzrNBHigi2mRPFV66n/MgqEa1iNxL/RtB9Qd4wdHhZJJGh
         RUwQ==
X-Gm-Message-State: AOAM532NIiS/DhwVCoUFXQq6e644fn4t/JDMc8e3kTvVMGJxSc/Oz+wv
	KDJBeAHG9WJeJOnZ7gHh0XgsPFb7cIOHKA==
X-Google-Smtp-Source: ABdhPJwUw92qFBgq0BlqLdZcOqjgwnwejhZwitYCBoh31nvEQGS6w3PcrQXpSG9lM20oVCcggaWQOQ==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr10957825wrv.10.1616279979272;
        Sat, 20 Mar 2021 15:39:39 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id q9sm14739971wrp.79.2021.03.20.15.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 15:39:38 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-networking][PATCH] usrsctp: drop receipe
Date: Sat, 20 Mar 2021 22:39:45 +0000
Message-Id: <20210320223945.40947-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only receipe that depends on this lib are the gstreamer1.0-plugins-bad.
An internal copy of the usrsctp lib is provided in gstreamer1.0-plugins-bad-1.18.
So it is not used by anyone in OE-core as well as in meta-openembedded.

No sane distro would package libusrsctp and Debian definitely does not.
Also e.g. Firefox and Chrome are bundling the code too. There's probably also no
API stability guarantee at all for it, and by bundling the code we would also get
around some of the problems with the library: global state shared between different users of the library
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/870

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../packagegroup-meta-networking.bb           |  1 -
 .../recipes-protocols/usrsctp/usrsctp_git.bb  | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 231d8d4da..1979d32cb 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -166,7 +166,6 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
     zeroconf \
     pptp-linux \
     rp-pppoe \
-    usrsctp \
     xl2tpd \
 "
 
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
deleted file mode 100644
index 4f8e4d428..000000000
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
-
-SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
-SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
-          "
-
-S = "${WORKDIR}/git"
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-inherit autotools pkgconfig
-
-DEPENDS += "openssl"
-
-CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
-LDFLAGS += "-lssl -lcrypto"
-
-PACKAGECONFIG ?= "disablewarnings inet inet6"
-PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
-PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
-PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
-
-EXTRA_OECONF += "--disable-debug"
-- 
2.30.2

