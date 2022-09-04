Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BD6C6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.11279.1662276876139994768
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DWiR1nZV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so9393329pjq.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bgKxXKnO1pVF29bds2rBOUA/w26Oge/MrO5FmjrK6lw=;
        b=DWiR1nZVsHX1JdTZel+AeoRxsYh1GLb/WfqztGUUUa6xBNLTKrYK69xwr/6kFSZfa/
         OkCGw9yAivGiXhk2SalBRTyyOuGvGtK8WdfA2whX3svCX7zG6rzzgtxcTpIsGIgaVefK
         uqH4oJlpxk02MxFGlbwl80nTbQ2VaPAFQ7SSwuF09mFXD9sqVkJ0MZ2IEyFiwvf5MAg3
         vOtfUm9YKXGcmVns/1zo4tVqiIiTUc+x9TatuLxMJxcKiV7cbl8wiCyhzKuOg2joNWo9
         M2l+J461iyWRnbljWtjVCI3QImzUlPriBjyJR4+LWuGTfakUigDxqP6RPhGgWf5mQ5Cl
         1lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bgKxXKnO1pVF29bds2rBOUA/w26Oge/MrO5FmjrK6lw=;
        b=3DOfWGlO7OOsOLogpcqFLdgGvM4hDqPdMw/iJfNjIMckoWqoC597Sa3CiNkRx77y4V
         /Au5apTV5ANvKn02F8GMebG6f2kEhXmLliKMLQlbhQnhJu/0nJGODlJgw+faM6bKy91N
         a7D3K5vpI9Cbgrb5kAQ08w3qfEZCxTpmVllJsUtQTmdMOcmKGvMswEY9kE7nsG5f0Fj9
         Wja2Y91W4hiZpup6Dh0y65PKr0R3ZHJcOLTAOhNp39JwYoZaTppK8iA3txhCShohxHoN
         K73DdG7xFO1h5v1JuZj2rTV7mjVnO1VXC+0ZJ5FIqP8m/q+zQWTDto/TZmKwTT/bjIGV
         ntFg==
X-Gm-Message-State: ACgBeo3HXIfHu26988slaHOG0s6UN9bqnFKiBTE2iupj6Ka+nZrCrx7+
	ysjMVgnzt0GAH2NlOWm+XkvkBHewp4A7ww==
X-Google-Smtp-Source: 
 AA6agR6g+Jtk4anoepuQq4de7amAd7G5S4CP+EEA3GMKzEpOocdoDspEQTZCJKktk5VeR5s3gUt6Bw==
X-Received: by 2002:a17:90a:9907:b0:1f5:2318:ea6d with SMTP id
 b7-20020a17090a990700b001f52318ea6dmr13753996pjp.163.1662276875274;
        Sun, 04 Sep 2022 00:34:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/63] libio-pty-perl: Fix build on musl
Date: Sun,  4 Sep 2022 00:33:28 -0700
Message-Id: <20220904073417.3251865-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98608

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Tty.xs-Do-not-mark-strlcpy-as-static.patch | 45 +++++++++++++++++++
 .../perl/libio-pty-perl_1.16.bb               |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch b/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch
new file mode 100644
index 0000000000..07c7690fb8
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl/0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch
@@ -0,0 +1,45 @@
+From fae771aefc593a0ef798bc0c1e21b0524eb85e2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 20:32:35 -0700
+Subject: [PATCH] Tty.xs: Do not mark strlcpy as static
+
+Some libcs e.g. musl do not provide implementation of strlcpy but they
+do provide the signature in string.h, if we mark it static here then it
+conflicts with the libc define and compiler may warn/error
+
+Fixes
+Tty.xs:190:1: error: static declaration of 'strlcpy' follows non-static declaration
+strlcpy(                                                                                                                 ^
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libio-pty-perl/1.16-r0/recipe-sysroot/usr/include/string.h:86:8: note: previous declaration is here
+size_t strlcpy (char *, const char *, size_t);                                                                                  ^
+
+Upstream-Status: Submitted [https://github.com/toddr/IO-Tty/pull/33]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Tty.xs | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Tty.xs b/Tty.xs
+index aa638f4..4bab39d 100644
+--- a/Tty.xs
++++ b/Tty.xs
+@@ -186,11 +186,11 @@ mysignal(int sig, mysig_t act)
+  * will be copied.  Always NUL terminates (unless siz == 0).
+  * Returns strlen(src); if retval >= siz, truncation occurred.
+  */
+-static size_t
+-strlcpy(dst, src, siz)
+-        char *dst;
+-        const char *src;
+-        size_t siz;
++size_t
++strlcpy(
++        char *dst,
++        const char *src,
++        size_t siz)
+ {
+         register char *d = dst;
+         register const char *s = src;
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
index e714851854..0f1c71b70c 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
@@ -3,7 +3,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42e8ce9d45f628e587"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
+SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
+           file://0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch \
+           "
 
 SRC_URI[md5sum] = "5ee30bf7c76f00cc69f92388ad776e2a"
 SRC_URI[sha256sum] = "8f1a09c070738adc695df903f2e7f74308dd8d991b914c0bc390a0e6021294dd"
-- 
2.37.3


