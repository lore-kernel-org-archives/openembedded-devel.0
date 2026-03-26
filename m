Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A74E10A62F3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49227.1774534346155371860
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I+qI7K9R;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so716956f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534344; x=1775139144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=I+qI7K9RjHa5bIILkpoVDfeEq2KEvJ3kKxk3RrLrQbDP8L9RxOQd27UaRmdvAADAAj
         IsOK3QXKXIcmCyTyayo40UJL4RT6zXzeoQ5mqR9Yl5q0w8RiKqgJdAuHd7UF52jQFwHe
         0lc1pY8uE8GCbYehEDqoXksCyh2O67lSbb6YOzeaR2dMPXxTWWIHqWN5AhhmO8S7co2O
         Pjdlc2TfZsMbeboHZEys1xhJ82AF3Dr6Cne2IlAk2GJvcTq01h3DW4Y+lc8aMukNzC1p
         nTPkmPZMXz1Q7cBZYe0ORR3AclheQ3qoOtkjN3WoYaPoBY3ZAWy5LCOOlP6t3jHYFLGC
         E8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534344; x=1775139144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=dp4kLhLhJSe2KLW5rkmm8/HytBHHws1XSRav4nve/kEsGqaHye3Ssop4A6vXxeA2kd
         GjyiPU7RTEjSjQfVXHLZPfguXPjXsaWT8oOng4J67RMh9LyhfzvqxiShQsbzzJfzJZEN
         6+ke7BTqqSDSWcyoNkpivmxXWPueaKCNYl1cErzHC0KbqwkmO0GjVzRDhCkW5DDFFDHc
         Fe4QSb+IG3xRYPPJSzZLseRAYb2YvzM67Nj9/1B1bIsI7RRmi/UtEL2r6i0z3gB1QLrX
         GgsNKNn626zme61+Y4fsckm5CL1p0EbVVDxQYKMkl0ztkb9kz2ZeFlwsPsfhWqxjugeZ
         ivXQ==
X-Gm-Message-State: AOJu0YzkIDX16116qrh5mIEiN9pVnj9TDGt6wHZiRjfFDeWDItK9/pSm
	oBzKS1Ce+HMiCJHj1YJZLqcMHCQ/OQBwj/pV6rcWx7mH0PGwcWDD9Vy0wWoz5g==
X-Gm-Gg: ATEYQzxfGccvr6VKeuNUhhUzczHYAJubIoomGu23zp4lnmxs7zn67E03idSSgx03kc9
	kMpwnr3OXYHKZ0a0Q4rbdoV7HY9c1NNbnzvu3wBD+UBdCY111bDy+gOiQaNgrSJ1zZ9HsJaVYyd
	IS+3SaefAZm8EWM8IVSr15qHznOZ6Ehl1MTv55zJx3yrchmDalDksgCLfA/0VIHdTlb2aSyd6ik
	ouAFFbxRaSaZfK+XBPbgB8T/vfzutuDaq+7aVTfq7zTg3LGVUtuwyiVffvKJgcrSwYNqIIqsZoi
	PnscDZ8KgAchj6Wm1SmyROb8dWjswi/Xpcn4bjcI0qbXGWek7FB7qqFLMHbJENacknG6zzJ42pv
	zYxWSlcYina4m37wJx/Y9Sv93S4AF6wrbwUNhhuRo0W4kO+Nc7mwxs71BAE5CLOSXw2ysVO29hl
	bYn+91HGLez/I0lQ==
X-Received: by 2002:a05:6000:1787:b0:43b:4312:2cbb with SMTP id ffacd0b85a97d-43b97a264dbmr3387654f8f.17.1774534343832;
        Thu, 26 Mar 2026 07:12:23 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 07/12] gdb, gdb-cross-canadian: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:12:07 +0100
Message-ID: <20260326141213.2081121-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125729

PYTHON_DIR now contains PYTHON_ABI, don't use the latter.
Simplify the linked library name to use -l${PYTHON_DIR}.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 4 ++--
 meta/recipes-devtools/gdb/gdb_17.1.bb            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 7b4a7719e4..c4c62d02af 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -22,8 +22,8 @@ do_configure:prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
         --exec-prefix) echo "${exec_prefix}" ;;
         *) exit 1 ;;
 esac
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
index 9c6db4ca2c..a5d96f01eb 100644
--- a/meta/recipes-devtools/gdb/gdb_17.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_17.1.bb
@@ -26,8 +26,8 @@ do_configure:prepend() {
 		cat > ${WORKDIR}/python << EOF
 #!/bin/sh
 case "\$2" in
-	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
 	--exec-prefix) echo "${exec_prefix}" ;;
 	*) exit 1 ;;
 esac
-- 
2.53.0


