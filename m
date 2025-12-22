Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887DCD711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 10:19:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77709.1766398757958514000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 02:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B210mqx9;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so24893745e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 02:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766398756; x=1767003556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmlHWLJH6R4gU5XILtF3z55Au+/DGD8D/8cNIvacdC8=;
        b=B210mqx9DDr1J4iM9qMWL+gInlIybAARpqOInxFem+yiIFiaHOKvLwcVApwr0L9X+A
         B8niizZ5/aM6jZvUG2XSbL3nWTxTm4niCKy7e7KLrd0KkD1nbxCLAUD38pbbsDFUdSQU
         elw2F5MPU9QFdmrgq1IjIyo7Dgx7ZQo3lS8OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398756; x=1767003556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmlHWLJH6R4gU5XILtF3z55Au+/DGD8D/8cNIvacdC8=;
        b=AiEp/Hu/tTUm05N0c8mB/W1IHRW6++Hm3oaU0CwMqxGBRwkJ7aNzhOP0Bol2/74zTU
         eT6XT9Q9/JW+kxD7h4CgqOe61u515WGY7xHhzPtLgqcgd0FylHx+tFwDmfmJX4sdudKj
         0fLgwU7zFzJgZcbL6y+r4dmsC/7PQlcNj4ZrP+euBy08lRuajcGjRJKdJufVin9FfrqQ
         ZCVVWgh232QNzHmB2ImUyzt16rmZLcUF0hujh25WXwwrB4ytCOxz3fphKKI0Pstg81S1
         D3RqbDG+5BQjhVPNzP4odNHoXyA46AhYJwLoHfPO4BNLrftTGyT+zY1L3ngr9fSN4GVz
         Tn3A==
X-Gm-Message-State: AOJu0YyRaZyenOQMlRE5WHo4sXzfr3hwA2H8gtxsZ0+X1O/+etRNBtsX
	gHH9whLDhpvR6nCSbC/e3dyDvBXmeIG51z+t0i+quos7AamOIsSB2riCqtMLRcRC57KE2FHUdw5
	NJlJ1
X-Gm-Gg: AY/fxX73qd6BvJlmtFOh1ZkKM2Zfht1m5RO3cDf8zbrJBR9uh8KAQ3CG72amjBiazpQ
	Xp78GfjLO/V3Et2ppekgf0fPYuYwTujiFl/IQD9MDeT7VzBS6/FAj5qpAVUIRgmTRrup1lbS5+k
	NnWuESg+LD/qiDSfzuKJOY7sXEB2G9FIhR1zeGc/Xg63peTJ4tYSeqaWQg1BZ44Ya4B0nVy3/vX
	i3JRREynotGm9ZrL3S+VmCzmYGSd4xRguSOEheYgIofLaTS8fEx4nKJvygfmg0NZbcOWe9ZSnAa
	+ta+k6KYSORIczKpnDsCBPjXtPefLrvtMzt/aA9L2az/EKKd2tnUQFq3eZffhK+N3RCFa75i0LP
	30xp+SYC2VhYUsfADabdoj6505AoPEO/dIR2Ym/yHE/P8bV2HSFA85m14O3YkXx3qKKuES+64Zs
	IlgTdG3/5Npe7LdtK12gCMaQ0wSKGBP1U13FOt5oe/dJa/BamedE15zPVXo/aL4m7guTKn1vn7z
	S1HN9+4xKZAG1U=
X-Google-Smtp-Source: AGHT+IEllMguM0DfnrwOd1NdVLDAYeURk5Hlw57Gbl+tLz23z3p6+lDplP3hj+DOrkwUsRvqRYaJ/w==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr102887705e9.34.1766398756023;
        Mon, 22 Dec 2025 02:19:16 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a40c5dsm95108445e9.6.2025.12.22.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:19:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH] e2tools: join lines in generated file to fix buildpaths errors
Date: Mon, 22 Dec 2025 11:18:55 +0100
Message-ID: <20251222101855.115501-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 10:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122786

From: Yoann Congal <yoann.congal@smile.fr>

The generated file "config.status" contains WORKDIR paths in strings
literal split across multiple lines, like:
  S["foo"]="/path/to/work"\
  "dir/"
These line splits prevent the usual sed from working properly.
Make a first pass on the file to undo any line split.

Fixes this error (that may happen depending on TOPDIR path length):
  ERROR: e2tools-0.1.2-r0 do_package_qa: QA Issue: File /usr/lib/e2tools/ptest/build/config.status in package e2tools-ptest contains reference to TMPDIR [buildpaths]
Seen on AB: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/79/steps/13/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-utils/e2tools/e2tools_0.1.2.bb         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index b7b925da0e..c9631f6219 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -39,6 +39,20 @@ do_install_ptest() {
         ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
         ${D}${PTEST_PATH}/*/*/autom4te.cache
+
+    # config.status contains WORKDIR paths in strings literal split across
+    # multiple lines. ie
+    # S["foo"]="/path/to/work"\
+    # "dir/"
+    # These line splits prevent the following sed from working properly.
+    # Make a first pass on the file to undo any line split
+    sed '
+        :a;N;$!ba;  # Read the whole file into the pattern buffer
+        s/"\\\n"//g # Delete "\<newline>" ie literal string line break
+        ' \
+        -i ${D}${PTEST_PATH}/build/config.status
+
+    # Now remove/replace the non-reproducible paths
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \

