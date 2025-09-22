Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B909CAC5AC
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:53:48 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.43259.1758512205242198094
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 20:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHkYYzZu;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-61e68a5dcb9so93226eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758512204; x=1759117004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iW9Qo8NF5IAaCUaDN97Nw+n7eoz96P6EvGJl8WOlc+A=;
        b=CHkYYzZu9Jhu1MyMuFcX7SkPo8rR723NBIAonlAe+P5fLoWiripgel50uAZT0oyPRf
         RMjVOIXC3OuXQp/nKeq2GY3cmnuU6AgcvGfZ22Elu90SCcvKGjTXIWhIBGBnKHTJXgKS
         FDzNQuJgbgywhLabCuQO49JODLR6RClW7MiDRMpQa286YOAU/J4+w1P0aC8J6O4IplbX
         y4gt2Z74Lr8gvYCAxBLZahcqiL+1qp++7EI/IUm42y+SXp9awQDinkwTdMlA+1fM5Elt
         byo9hMuDp/hhU+l0/TxxyYV7w7ikQDGVzy+mmLJwIkAebM0CE0/42o2+pdbtk37mQKZa
         REvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512204; x=1759117004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW9Qo8NF5IAaCUaDN97Nw+n7eoz96P6EvGJl8WOlc+A=;
        b=T+C9Hx/XT2f+ozvwKQRmzyB2nmrz6/hWXobr0XVGkz2juLoBA2Om5fs51Ijc00NqPX
         aUcIW+zVG5C8j+00CB7jVbXT1mXtegd77/pQZZdYKn6815JGmxTrsUR4I7penuC3XSUH
         aSsOL8sFnqhcWOP3ieO8pTuakhwBiyw3pWopm/AJX8Ia43ATYoVL6dS8B021zEAzAjCD
         IYXcpZ79TXuO5lDsoZh0wOFuDjyGHtrx8Y38xGHDLen4WLUn5ydNSu9IwZzqHTo1sfrO
         NQnzqlDepBKoZzgWMN+sUYvcRE5DJSDpWQR+TmvuyO5YUm3EabHIrclc2Ux8UslFSMAj
         krtw==
X-Gm-Message-State: AOJu0YwRXOuAQ7GFet+fsxL+z7t9ITdUhodUVnaFYzU2NYa6zTonlSkD
	vFY8rLQKhJZU0JWZg4ordGEcenGiQ08eb1rsW6NkNYM3iu3Tp3yXDH1rs6A8ng==
X-Gm-Gg: ASbGncuq3LVVO/ytKP3ha3HkvAdUiOWiIkPFgJuWyRGR8t2BD9VulPG88bzl//v2Eyb
	GVMhaoi8UrEFD/L1ZeSRxDog8Gk9m1uGpNtenhJCGVdR+hEFbAUFCL2lawhsZFrDMyH4ePna0Nn
	GQcG4NZ9NI7Fvpy6ZACbmcsRjv49aNY2ua2MxsbVImOaafG2HAhdJ3PeL9/HF0W6D+Stw9VOxAD
	UCk36Y0Nxxx4Ib3luduEu4lZR1UXiuGI8o0wg0LphgB/Zzi2ncJI3St8RmNTo0d/SmW57qmrRHZ
	JAxnvPGOooOgtphl1J6McaTe1I8Z5StC17OgAHQVNG47FKyeXVKrDFFxj/+JUy4zEpUpD3wjxm8
	i9oHKCQju+bcy1CrhNzIcia6K+EK5Y+a7cbrvpg==
X-Google-Smtp-Source: AGHT+IHAruqYXlKvVVlJgrPh4JZvgjrN0YqYmosSe01fDSXtInoelxnBcQcaOLamwj0nGeK3yui+UQ==
X-Received: by 2002:a05:6a00:999:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-77e4d02d562mr8135831b3a.2.1758511736310;
        Sun, 21 Sep 2025 20:28:56 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.85.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2d41435bsm2801192b3a.8.2025.09.21.20.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 20:28:55 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [OE-core][kirkstone][PATCH] iperf3: Fix CVE-2025-54350
Date: Mon, 22 Sep 2025 09:00:34 +0530
Message-Id: <20250922033034.2096266-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119642

From: Nitin Wankhade <nitin.wankhade@kpit.com>

remove assert to prevent crash due to assertion failure
on malformed authentication attempt

Reference: https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 25 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..c02d9ec0a3
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54350
+
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Comment: Patch is refreshed as per codebase of 3.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+--- a/src/iperf_auth.c	2025-08-19 12:02:47.706337000 +0530
++++ b/src/iperf_auth.c	2025-08-19 13:16:01.653471517 +0530
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -150,7 +149,6 @@
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b02..41f336a11f 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://CVE-2025-54350.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.34.1


