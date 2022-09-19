Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E40C6FA92
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.19284.1663590829949256404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KRJk/8i3;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id y9so21684340qvo.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=EbrrHhFPyCg+3SYKwJmnPnxF0ZrI+pZ/GMqutTtcAgs=;
        b=KRJk/8i3ETWt8RabVdlrzL+k2ZsSjSGn1yZI975SJYd6VYuI27AueM2j09tDqYZXlF
         yMcvBQCvVFTVzL2ZFaPEQdeDUHxplEmLcSGhN6Y93ocmFCeW7fTowNg16jIGxpREnbgi
         c6TM+cmiajhXIrTXfuvx88SHHZQGZIEvLDrSbfQViw69K0+CLzT+JkoafRLzFoIU4CwR
         yeqxckspoi1g3GoiPFnwYLGAzswcBhphLpf3YcHoidjQUet3FGn/XnYhi4+v8cLZK3ON
         jfTQhgnmPaunVKdNsU4OZY911zCQ8hFcFiJJ0vrUzFoDH6+/HNQTlQOhbaw17iF7g7Mv
         LkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EbrrHhFPyCg+3SYKwJmnPnxF0ZrI+pZ/GMqutTtcAgs=;
        b=6l+D3KmWRnklENaQI5SVqUMVT+fY+KN4L3RwyO7stDyiPHvYAlJh5DFXkhHFeV4GOQ
         IIeOe3GNEXFkXHocir00Q/Rn58fwlH8cwcd+1TsmaqD5Epuol4KWT/VgJlPY7tOKb7tj
         yx9up2lF/Yjz/OPW7nS7XrvfzsijcWv0ACj/ujRWCIUUg2fe2hZsOakyt/il0wVm+Tqo
         GB0Dp9jY28+nWnnYRTOGxwQ4sY8F7cebz3cRR1kt09Qd9eYCSVlLnqHKqcytv1pfcFOj
         4/jSzCsZUo5GqWTU6lYoIFprUaVTS9CN9RLbkpPNpilLU7B8OZi5LYOGfdq4WUw9H7ru
         mIIg==
X-Gm-Message-State: ACrzQf105HKwdaoWjzTzssF7m1GztQfXI0ZYRnDUDxiY9UUZ8xI8IPIh
	Y9WjKg+SCzhL/Dn7F5YuYEArB+FoRcQ=
X-Google-Smtp-Source: 
 AMsMyM5MXE4b5QX3LD8dWXnhdniQVk8dYdr5tWmpgoeUuuO3wbNc8qLYidCF9NYfz7fTITj5YYEJkQ==
X-Received: by 2002:ad4:5ba3:0:b0:4ad:3465:787b with SMTP id
 3-20020ad45ba3000000b004ad3465787bmr5238374qvq.114.1663590828620;
        Mon, 19 Sep 2022 05:33:48 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/11] safec: Remove unused variable 'len'
Date: Mon, 19 Sep 2022 08:33:33 -0400
Message-Id: 
 <8e8f36ef97b3c0b4d9f7b41a9d6bf02ec0156c3b.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98857

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8cb8931757214d63c9140cdba83ee5dfc968bc28)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...strpbrk_s-Remove-unused-variable-len.patch | 42 +++++++++++++++++++
 meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch

diff --git a/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch b/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
new file mode 100644
index 0000000000..4fd36ab8ab
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
@@ -0,0 +1,42 @@
+From b1d7cc6495c541cdd99399b4d1a835997376dcbf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Aug 2022 23:42:33 -0700
+Subject: [PATCH] strpbrk_s: Remove unused variable len
+
+Fixes
+error: variable 'len' set but not used [-Werror,-Wunused-but-set-variable]
+
+Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/123]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/extstr/strpbrk_s.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/extstr/strpbrk_s.c b/src/extstr/strpbrk_s.c
+index 5bb7a0f8..2cf8a8be 100644
+--- a/src/extstr/strpbrk_s.c
++++ b/src/extstr/strpbrk_s.c
+@@ -79,7 +79,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+ #endif
+ {
+     char *ps;
+-    rsize_t len;
+ 
+     CHK_SRC_NULL("strpbrk_s", firstp)
+     *firstp = NULL;
+@@ -121,7 +120,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+     while (*dest && dmax) {
+ 
+         ps = src;
+-        len = slen;
+         while (*ps) {
+ 
+             /* check for a match with the substring */
+@@ -130,7 +128,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
+                 return RCNEGATE(EOK);
+             }
+             ps++;
+-            len--;
+         }
+         dest++;
+         dmax--;
diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
index 5ffe7d7528..9dd6f1c7cc 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -9,7 +9,8 @@ inherit autotools pkgconfig
 S = "${WORKDIR}/git"
 SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
-"
+           file://0001-strpbrk_s-Remove-unused-variable-len.patch \
+           "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 
-- 
2.25.1


