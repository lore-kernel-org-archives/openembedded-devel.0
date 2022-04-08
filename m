Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFC4C4707A
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.1302.1649446974176736212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gDesKPNk;
 spf=pass (domain: mvista.com, ip: 209.85.215.180,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 66so8594502pga.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtodhKPyYGtTWephNfI2q+E6oCYiieTVdgQ1u65GHfo=;
        b=gDesKPNkmMbJBbgTxptpBeuoN+maOPiR1/t5JrOX+to5qWaXnkK7bE7dJlv1Djugqr
         7rtX4YsGDJPLn0p4d7j8eaNtXC2i1a8InyFBhsFbDGAmCnUyVORpUYor8eorpnsIfzWY
         P7ZWTKWW3P02MuSfKkWI3F7jOE1cfOBBJ8Bos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TtodhKPyYGtTWephNfI2q+E6oCYiieTVdgQ1u65GHfo=;
        b=GSjPn8GTArHARBxRDN1hB5QKxCKblEwcyWZKigz3juQqdUyUxdRY8mheufA1uPse+s
         rcA2+qaqIQvjqvNU4NfMGC0LtgbbXJqhk3gIz1TBMI7H2DZMNaJdc/bBn3KaN6l/ooIX
         qmhEUsEI3PEsKbQMD6pk8uLWdKHkEY08nkqELt7gkDIqAbqycwSx5hVfGlM4pJw1IVj7
         gjClPUw0qEln0RKY8hqK+pC/y9xFhgr2cRoF6xLRtTp3BBA7DehmhcwCsZOoOXhEOLEu
         h30QlrjOSwa81fujQvlBVc/zyuRvmrbMTigGzLjZDWeruSqcjPQuGtfAlZ5XdALmlKCI
         aVDQ==
X-Gm-Message-State: AOAM533GjZvZGAYp3czlR9tujSZ1UD3h4w7unDmlX6BbJ9d15B9xJKbz
	KjTvyQ26LNgUY/ZddtnKAaPyL8CeXRB6Bw==
X-Google-Smtp-Source: 
 ABdhPJwxg/PMHxJD7FJF76cCE8A+OwfoQo9bRA1YZZwlMecjlXFCQYKOOC9QWQYYxJ3m3jzZwTZR+w==
X-Received: by 2002:a63:3fc7:0:b0:398:aad3:3ce1 with SMTP id
 m190-20020a633fc7000000b00398aad33ce1mr16616935pga.461.1649446973026;
        Fri, 08 Apr 2022 12:42:53 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 mw10-20020a17090b4d0a00b001c7cc82daabsm14225504pjb.1.2022.04.08.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:42:52 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Fri, 08 Apr 2022 12:42:50 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][PATCH] ndctl: Remove run test of typeof
Date: Fri,  8 Apr 2022 12:42:42 -0700
Message-Id: <20220408194242.1224639-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96487

../git/meson.build:213:0: ERROR: Can not run test applications in this cross environment.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...sume-typeof-exists-in-our-modern-gcc.patch | 45 +++++++++++++++++++
 meta-oe/recipes-core/ndctl/ndctl_v73.bb       |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch

diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
new file mode 100644
index 000000000..b47510a6b
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
@@ -0,0 +1,45 @@
+From 3abfe16bf2eb89efe3c823a935a6752c4a5b99d1 Mon Sep 17 00:00:00 2001
+From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
+Date: Fri, 8 Apr 2022 19:31:02 +0000
+Subject: [PATCH] Assume typeof exists in our modern gcc
+
+cc.run tests are not useful in a cross environment.
+
+Upstream-Status: Inappropriate [Assumes modern compiler]
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ meson.build | 18 ++----------------
+ 1 file changed, 2 insertions(+), 16 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 42e11aa..e8d218b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -210,22 +210,8 @@ conf.set('ENABLE_DESTRUCTIVE', get_option('destructive').enabled())
+ conf.set('ENABLE_LOGGING', get_option('logging').enabled())
+ conf.set('ENABLE_DEBUG', get_option('dbg').enabled())
+ 
+-typeof = cc.run('''
+-  int main() {
+-    struct {
+-      char a[16];
+-    } x;
+-    typeof(x) y;
+-
+-    return sizeof(x) == sizeof(y);
+-  }
+-  '''
+-)
+-
+-if typeof.compiled() and typeof.returncode() == 1
+-  conf.set('HAVE_TYPEOF', 1)
+-  conf.set('HAVE_STATEMENT_EXPR', 1)
+-endif
++conf.set('HAVE_TYPEOF', 1)
++conf.set('HAVE_STATEMENT_EXPR', 1)
+ 
+ if target_machine.endian() == 'big'
+   conf.set('HAVE_BIG_ENDIAN', 1)
+-- 
+2.33.0
+
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
index c88d39297..e2049ce2f 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
@@ -13,7 +13,9 @@ inherit meson pkgconfig bash-completion systemd
 SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
            file://0001-util-Correct-path-to-iniparser.h.patch \
-           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch"
+           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch \
+           file://0001-Assume-typeof-exists-in-our-modern-gcc.patch \
+"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
 
-- 
2.33.0


