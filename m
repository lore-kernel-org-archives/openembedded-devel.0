Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5927DC7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.11455.1685531616625528124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D89JKRUO;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565c3aa9e82so63587667b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531615; x=1688123615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6erPU1sQkz7VUAk8HA/U6BqUFs5lT89bwdXuRj5Kc4=;
        b=D89JKRUOxhsF381hJYdCUVeiXD388e7uTBpkNnLYR/mgedoVwOVn1407OPzyt9udpx
         DF6S6CXcyyRdGZmcxYaWwGEl7j+fc0a5+JTBo4VuWVFDnz4ADFD8XgY5pqdzlSY8fTeA
         lBmyygeSGs/tkWpW6KwSeWiuYRyMVYxnvmvNterYJFDFIp0hDB09romIxMhgpDU8ShqE
         AFYosEbzbY0+43okcMoYKXh8IBNp8e2vrMGbXO7vpizbU1RgFL1HSb8Hv6eMWnjd2odL
         7PHMPj596Wseq755Y2okIyipYOI0gJvCDccWdIwqhTIvQzzARoyDv0XxwBj1tZbEa00D
         pyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531615; x=1688123615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6erPU1sQkz7VUAk8HA/U6BqUFs5lT89bwdXuRj5Kc4=;
        b=X6oWTOo25FeZOxC5LNVpgFkIJQkUPxI/pt22FmJFZZUNvs/VgYcoCPhaTaN8Ffbh7p
         g9cAvfOskEHYegkMJ+aalmgAAnR77DybSAlo/p+vcblDIaUQVdRJ1cd8NwrtGH44+FUE
         Zs5X+pI0KaTVFgGZoTjOzZLesEx/syOvVKSjI3kCjv7MdyIbdDbzn2Hh6TmYsUrmFT8r
         B/PSC9XhAPZSW9RlqnRE0GgJP56Lp0B4smlQhTB2TCM1NZ/7gVQKH+TGS093TzyP+GsA
         6TfGPFC+gIdhf6ZWYuyotb6rbcUVeSSVKLO4YA6ejgsaiN6yN9OAhwCRGvJBSuBGUph7
         hR6A==
X-Gm-Message-State: AC+VfDyTPyiONEity2/lQTjj2UDDDxudiYmU5Rrm623ap3+U89NPaVoQ
	13hIk+r7pq5kOqjQtRROFYn5W0Nnzq4=
X-Google-Smtp-Source: ACHHUZ4b49BJ7yelseMy1RWezk4xUbh2vHuzyJt6UvSp4EGsLZ0QH3de164ynSAssHHeHXXg0XE+fg==
X-Received: by 2002:a81:49cf:0:b0:561:c5d4:ee31 with SMTP id w198-20020a8149cf000000b00561c5d4ee31mr5780315ywa.38.1685531615356;
        Wed, 31 May 2023 04:13:35 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 25/36] openct: Fix buildpaths being emitted into generated types.h
Date: Wed, 31 May 2023 07:12:58 -0400
Message-Id: <20230531111309.2454603-25-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103054

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d9fb985b87cd8a8057f77801dde3c556e41e7294)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...t-the-first-line-of-compiler-version.patch | 31 +++++++++++++++++++
 .../recipes-support/openct/openct_0.6.20.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch

diff --git a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch b/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch
new file mode 100644
index 0000000000..9bd3d18d6e
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch
@@ -0,0 +1,31 @@
+From 146b5116140d719e4e9ae19748c0b6dee7d82f96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 22:01:28 -0700
+Subject: [PATCH] m4: Just emit the first line of compiler version
+
+Avoids emitting buildpaths into comments
+Fixes
+WARNING: openct-0.6.20-r0 do_package_qa: QA Issue: File /usr/include/openct/types.h in package openct-dev contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/ac_create_stdint_h.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/ac_create_stdint_h.m4 b/m4/ac_create_stdint_h.m4
+index 66de704..4b7223a 100644
+--- a/m4/ac_create_stdint_h.m4
++++ b/m4/ac_create_stdint_h.m4
+@@ -110,7 +110,7 @@ echo "#define" $_ac_stdint_h "1" >>$ac_stdint_h
+ echo "#ifndef" _GENERATED_STDINT_H >>$ac_stdint_h
+ echo "#define" _GENERATED_STDINT_H '"'$PACKAGE $VERSION'"' >>$ac_stdint_h
+ if test "$GCC" = "yes" ; then
+-  echo "/* generated using a gnu compiler version" `$CC --version` "*/" \
++  echo "/* generated using a gnu compiler version" `$CC --version|head -1` "*/" \
+   >>$ac_stdint_h
+ else
+   echo "/* generated using $CC */" >>$ac_stdint_h
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index a873da6339..0d3ea4186a 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.gz \
     file://etc-openct.udev.in-disablePROGRAM.patch \
     file://etc-openct_usb.in-modify-UDEVINFO.patch \
+    file://0001-m4-Just-emit-the-first-line-of-compiler-version.patch \
     file://openct.init \
     file://openct.sysconfig \
     file://openct.service \
-- 
2.25.1


