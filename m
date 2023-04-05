Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBBCC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:03:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.132520.1680707035216646214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=JYnBpcY8;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id w4so34659605plg.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680707034; x=1683299034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVgXATGht+WK34CG7eYxkyelC9g/xF8U+hiA/JTdd+k=;
        b=JYnBpcY8Au+U67hBL7e1Ti7gW55K+I7rHpqMVfbGOUzMfaf7UgGfeC67HtbAAYKDYA
         OnlS1N00lFjbvDx0PStjczg4j/7Ml398bqy8qDN3x2/6edyZifVL8DmK7Sp+KgE/Ja5v
         vByfe9tnp+SzT2bMvyUI6QUBnwRzSiJXv3ckN9hgofrfjbllBmKreF1PkVxMCK7+v+vM
         I7EGieTkXuCE4eAGY71vnsGmKnEc0Jw4a3xhLiqRkSFJp9tsL53Y3v1N2Mp0IFnj7xxp
         cfhtnWUhv70Iwd4wp/eCUAs3Idqp9y0IT9WY/1Nmrty5ujdr/ihjYoRY4eep1HP+5KIj
         v7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707034; x=1683299034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVgXATGht+WK34CG7eYxkyelC9g/xF8U+hiA/JTdd+k=;
        b=Tixk8GgpMxFnQS679wfUNFNHXi7WQYTytUFgffhNeDAH90EW1f3blA5lnViUZZwhk3
         w5UKGzOjWwMfbR0OFRt5DOQXu6UNXfailHIjAt2UwcFjP0RhZKMcic38V0hQ0JdAjBZq
         IABVUclL21RqUKEamu44Kh1Z8p0awaCF3NUU7y883TzAl/TdzgctUmCOSBn/FhKsmdyj
         opqH5vPTUGPlsARihtodqslqoxD+22F3Roe+eIftLzE5v6QmsIPBsAEekp4oekHBpoSJ
         +/anD5bFE859PNDm+1NwH8N/GZipauuh/su0xac/cbuBkJ5tXPxXx4g6PjmkCHcNfOYs
         pa1A==
X-Gm-Message-State: AAQBX9dd8w6DIbZ6P8xoRsnLXcotT+Jxnw+V+/+XtWACkNKJUiYOyivh
	UeK4GGokIFJBEUi8EgoBtX5qPHcJWL4=
X-Google-Smtp-Source: AKy350Ze2LF6OMRwTn8uw2Ct5v8aDPafP72M51AwBUCLucxuztOHfCgIPuKJb8hyZsNE5MVRNBDjrg==
X-Received: by 2002:a05:6a20:b04:b0:cd:74aa:df55 with SMTP id x4-20020a056a200b0400b000cd74aadf55mr4911322pzf.25.1680707034136;
        Wed, 05 Apr 2023 08:03:54 -0700 (PDT)
Received: from localhost.localdomain ([38.41.69.49])
        by smtp.gmail.com with ESMTPSA id k9-20020aa78209000000b0062505afff9fsm10385231pfi.126.2023.04.05.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:03:53 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][dunfell][PATCH] c-ares: Fix CVE-2022-4904
Date: Wed,  5 Apr 2023 20:33:46 +0530
Message-Id: <20230405150346.3546817-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 15:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101960

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add patch to fix CVE-2022-4904

Link: https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d.patch

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../c-ares/c-ares/CVE-2022-4904.patch         | 66 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
new file mode 100644
index 000000000..dc937c616
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -0,0 +1,66 @@
+From 9903253c347f9e0bffd285ae3829aef251cc852d Mon Sep 17 00:00:00 2001
+From: hopper-vul <118949689+hopper-vul@users.noreply.github.com>
+Date: Wed, 18 Jan 2023 22:14:26 +0800
+Subject: [PATCH] Add str len check in config_sortlist to avoid stack overflow
+ (#497)
+
+In ares_set_sortlist, it calls config_sortlist(..., sortstr) to parse
+the input str and initialize a sortlist configuration.
+
+However, ares_set_sortlist has not any checks about the validity of the input str.
+It is very easy to create an arbitrary length stack overflow with the unchecked
+`memcpy(ipbuf, str, q-str);` and `memcpy(ipbufpfx, str, q-str);`
+statements in the config_sortlist call, which could potentially cause severe
+security impact in practical programs.
+
+This commit add necessary check for `ipbuf` and `ipbufpfx` which avoid the
+potential stack overflows.
+
+fixes #496
+
+Fix By: @hopper-vul
+
+CVE: CVE-2022-4904
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d.patch]
+Comment: No hunks refreshed
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ src/lib/ares_init.c    | 4 ++++
+ test/ares-test-init.cc | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/lib/ares_init.c b/src/lib/ares_init.c
+index 51668a5c..3f9cec65 100644
+--- a/src/lib/ares_init.c
++++ b/src/lib/ares_init.c
+@@ -1913,6 +1913,8 @@ static int config_sortlist(struct apattern **sortlist, int *nsort,
+       q = str;
+       while (*q && *q != '/' && *q != ';' && !ISSPACE(*q))
+         q++;
++      if (q-str >= 16)
++        return ARES_EBADSTR;
+       memcpy(ipbuf, str, q-str);
+       ipbuf[q-str] = '\0';
+       /* Find the prefix */
+@@ -1921,6 +1923,8 @@ static int config_sortlist(struct apattern **sortlist, int *nsort,
+           const char *str2 = q+1;
+           while (*q && *q != ';' && !ISSPACE(*q))
+             q++;
++          if (q-str >= 32)
++            return ARES_EBADSTR;
+           memcpy(ipbufpfx, str, q-str);
+           ipbufpfx[q-str] = '\0';
+           str = str2;
+diff --git a/test/ares-test-init.cc b/test/ares-test-init.cc
+index 63c6a228..ee845181 100644
+--- a/test/ares-test-init.cc
++++ b/test/ares-test-init.cc
+@@ -275,6 +275,8 @@ TEST_F(DefaultChannelTest, SetAddresses) {
+ 
+ TEST_F(DefaultChannelTest, SetSortlistFailures) {
+   EXPECT_EQ(ARES_ENODATA, ares_set_sortlist(nullptr, "1.2.3.4"));
++  EXPECT_EQ(ARES_EBADSTR, ares_set_sortlist(channel_, "111.111.111.111*/16"));
++  EXPECT_EQ(ARES_EBADSTR, ares_set_sortlist(channel_, "111.111.111.111/255.255.255.240*"));
+   EXPECT_EQ(ARES_SUCCESS, ares_set_sortlist(channel_, "xyzzy ; lwk"));
+   EXPECT_EQ(ARES_SUCCESS, ares_set_sortlist(channel_, "xyzzy ; 0x123"));
+ }
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 25ce45d74..408a5ab2f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
+           file://CVE-2022-4904.patch \
+          "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
-- 
2.25.1


