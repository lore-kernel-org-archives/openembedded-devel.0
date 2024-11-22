Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE4DE65D39
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 09:22:14 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.20744.1732267330514714350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 01:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGSjLWs5;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71806621d42so964343a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 01:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732267329; x=1732872129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5A80hvmneULNcaKKq2ZHrvHUxA4APKevhmK7eZ65X+I=;
        b=fGSjLWs5k2Ze31AagDatu3ty5OEbaazQktKdi0uWfTwsyHIU6C1wKb4ajWiPdK5d+J
         W3E2z17klhQnlyuJ9kt//KcWyyHxH/nxmRHOBg5YVQMqqkOyU5gLFtPyjYhc0ZvADnD3
         jU7cRJ6fnVnqKuHwZfBHo0fc644UD9JnoRZ8+wCtISa+qpmu7vTLdtSJOm7Qa1vwP+eb
         s6CaZlzLsSN7145G+NG32AfrkcKR1TIqgAKk6oEmEHAbiMh6Q6WSxlGWcDOtPAErSyM2
         eZIzNFAAgxn1aBZszX2ncDpwVhrRw1DWARJN8THlIIwoXdoAemKEt8QCDkyWdwmg1Ht2
         MBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267329; x=1732872129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A80hvmneULNcaKKq2ZHrvHUxA4APKevhmK7eZ65X+I=;
        b=LXb5EsDgLmaCG/L+hqRDGtC0iHcZ5+H4e8AKaQlt0YlAReKoz6Z41hx96MBt395eTf
         GQS91FjHmHeXgD58TvQ+U0fFZO4xE48Hg5al6MS3Bu7cYC6W33DzzPl0ilhEJ/Et83ah
         d1n5j0IcDf9tm+0G274kcghe1IcgAYIkZF8WB/0Pp+2bn1uz1JI2MDp1WMSb8fHWE5yN
         RCQrvyOE97M12dsljFB/q+EME+yAlvxbMQEh8/ZrjHx4YxSAjmiblYOwD8VAo6/yl0zy
         4UDz4640Zu25oGQJfD4l7VEi1zLB2XodpdMjI0YayvfvgYmNO48DSolrB506VjCC9OIq
         naTg==
X-Gm-Message-State: AOJu0YzI78bGQEl5mlcu/cThUU5CwQbPcEO0fw6hdd8MC7w6+UW2n3Rq
	dguChkippBjglyeCyM24YwMppRqzGnb2O9gGof8rnsD6e4vKHTHMM8Qp/w==
X-Gm-Gg: ASbGncuCr70Xdufth5ZBX+0OVOn0DeOb+t91P7V7ADz97CRsW95UC6BxjcmPcdHLEjq
	SUrHmh9/exdzO8zLUPsJVSPG1vZMlMmkhtc9ErBC9vUC8xx+5st2Ed7th3JC39oJYMLVtN4XsvV
	I0dZQxaOArWjfSd5/7rgDzv5uhCCVfkre+Prq8Zy5j6rLLdNMzmk7grTw+2WVca/XzuLRnGAmWz
	KnIUn4jHR/a3o4snEm3s146jCzo3w0op/+E3AerndwOmFR6GXY=
X-Google-Smtp-Source: AGHT+IEt/vUn1mBZP1WB8bev3hZ3++qxvk6c0cYBSJxcAtv2tYshYKUmz/iq9o8/4gjcu8AqqxYZlg==
X-Received: by 2002:a05:6830:638d:b0:718:2eb7:4ebe with SMTP id 46e09a7af769-71c04df3968mr2173063a34.27.1732267329336;
        Fri, 22 Nov 2024 01:22:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3fb34dsm1174386a12.78.2024.11.22.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:22:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] taisei: Fix build with clang
Date: Fri, 22 Nov 2024 01:22:06 -0800
Message-ID: <20241122092206.989939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 09:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113992

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...armful-Use-overloadable-func-attribu.patch | 40 +++++++++++++++++++
 .../recipes-graphics/taisei/taisei_1.4.2.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
new file mode 100644
index 0000000000..d1af07416d
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
@@ -0,0 +1,40 @@
+From 6f40a8cfbc4dd5ca4c3156338e8e35f25d4d4599 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Nov 2024 01:16:25 -0800
+Subject: [PATCH] util/consideredharmful: Use overloadable func attribute with
+ clang
+
+When building with glibc HEAD, it has fortified headers with clang as well
+and clang reports errors e.g.
+
+| ../git/src/util/consideredharmful.h:33:7: error: redeclaration of 'strncat' must have the 'overloadable' attribute
+|    33 | char* strncat();
+|       |       ^
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/taisei/1.4.2/recipe-sysroot/usr/include/bits/string_fortified.h:145:8: note: previous overload of function is here
+|   145 | __NTH (strncat (__fortify_clang_overload_arg (char *, __restrict, __dest),
+|       |        ^
+
+Upstream-Status: Submitted [https://github.com/taisei-project/taisei/pull/393]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/consideredharmful.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/consideredharmful.h b/src/util/consideredharmful.h
+index 3fe1f047..c6771956 100644
+--- a/src/util/consideredharmful.h
++++ b/src/util/consideredharmful.h
+@@ -30,11 +30,11 @@ FILE* fopen();
+ 
+ #undef strncat
+ attr_deprecated("This function likely doesn't do what you expect, use strlcat")
+-char* strncat();
++char* __attribute__((overloadable)) strncat();
+ 
+ #undef strncpy
+ attr_deprecated("This function likely doesn't do what you expect, use strlcpy")
+-char* strncpy();
++char* __attribute__((overloadable)) strncpy();
+ 
+ #undef errx
+ attr_deprecated("Use log_fatal instead")
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
index 4d34239a98..db38bb1547 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
@@ -31,6 +31,7 @@ RDEPENDS_${PN} = "\
 "
 
 SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https \
+           file://0001-util-consideredharmful-Use-overloadable-func-attribu.patch \
            file://0001-Remove-strip-option-from-executable-build.patch"
 
 SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"

