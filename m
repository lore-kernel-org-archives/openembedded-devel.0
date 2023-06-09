Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ED2C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 04:13:06 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.6097.1686283984025398740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 21:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=PL7AfiNB;
 spf=pass (domain: mvista.com, ip: 209.85.222.174, mailfrom: vanusuri@mvista.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75d4b85b3ccso129349385a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 21:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686283982; x=1688875982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3J4lTQ0BkOKIgUHs9tSepoRXd2ICbGuLVb4V+j6/vSE=;
        b=PL7AfiNBTJspaxjVz+RniXlRQo4dowtXRQP4DELNg7Xz49HF9MDgOQlNSY63m1AB91
         laE2QJ74kCk+AivRT0A6kHaITgIpIn+bjYoQIU7pV5JqUcBMuGXm1nrJXhyRIql9irvx
         G+we91pC+VIGx4g3QMmt9VdHnUDFrahj5gakc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686283982; x=1688875982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J4lTQ0BkOKIgUHs9tSepoRXd2ICbGuLVb4V+j6/vSE=;
        b=fk9RUUVyIaIhsR8ZFTcDAlhVEtVaVoYvDxn6DNHY6+oR5PxrU0+6BnIC8P9chTZ1pd
         Qw1NapQBim9rIqTbAc6/7nGy1Lq/b4W8GNLluI7IenU2AdtgbzHNtJkuqQLRE4nGLJch
         5WVQ75ZaKLvrSHs8rgqP47zACdStRswALh7njkVG5epUx8GMqFZzeEsgf1ZJqPlSVqTh
         WV2O02iDT8jVIZ+XLuoDe1Ptb2k637Rw+PdvheucMbQSfbqvNru9wCFMXSASmMM3kwBc
         X4gTlZJNxibX/WY0JNdttrIt1OUjd+u73gG0RnGhm2GuzE3gYr7jwq2xtYjSU9nQPENH
         7j2Q==
X-Gm-Message-State: AC+VfDwPgmrDaD3Ec4igXrbJ8wN6JUrTwm6zRRpzHCaubufqtFoJVXdx
	BW6GJliqVRcHrplBGJT7kpg00ygp5L4WyV6h7Y8=
X-Google-Smtp-Source: ACHHUZ4QcpK0KdjktmqX4Ig1xLhc8gXEkzI/m+wBKe1CA1ODZLujrPxUMsC6FYiHDSGeU95xmHzVgQ==
X-Received: by 2002:a05:620a:1b9a:b0:75e:d4a8:7292 with SMTP id dv26-20020a05620a1b9a00b0075ed4a87292mr66335qkb.41.1686283982445;
        Thu, 08 Jun 2023 21:13:02 -0700 (PDT)
Received: from MVIN00020.mvista.com ([27.59.199.11])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902da8400b001b04b1bd774sm2140944plx.208.2023.06.08.21.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 21:13:01 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] c-ares: fix CVE-2022-4904 & Update SRC_URI branch and protocols
Date: Fri,  9 Jun 2023 09:40:45 +0530
Message-Id: <20230609041045.610000-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 04:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103195

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=092e125f44f65427d42db95db3779daf4893d10f
& https://git.openembedded.org/meta-openembedded-contrib/commit/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb?h=stable/kirkstone-nut&id=b402a3076fbafe05d0b8621e50603b65c3fe8147
Upstream-Commit:
https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../c-ares/c-ares/CVE-2022-4904.patch         | 67 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  4 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
new file mode 100644
index 000000000..fb0aee372
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -0,0 +1,67 @@
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
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index 25ce45d74..6a367e69e 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
+           file://CVE-2022-4904.patch \
+          "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
-- 
2.25.1


