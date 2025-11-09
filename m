Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1198CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 14:54:06 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25958.1762700044838480458
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 06:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V1nbLVtb;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f67ba775aso2662607b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762700044; x=1763304844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF+IqHQob+hGVOQn71SBXY+a0nfJlfxF9DOHGLjEayM=;
        b=V1nbLVtbBZRyjdE0u2g5stkeoJRefLmhH17wBpZfU9dbu/FH9BErPG16vNmDJ2oUWJ
         2DVDXZ+lteA2l79IMa685+1ZzXXtSuTIJVVeoijSNs+StORjtXnwLet+vzsxEZuviA/+
         mqiZ9CFSfEeUedYgQrK/X0QEtUJogHOyKeN2yxggIQ8dgK8WfWmf4y4Y+UAoMqIaRBxj
         6ev+tdCcpN9YbWPsJvLm3UAsSmg/RGX6NsF1XT1S6th6vvF6rhzW91/tRjWLTaa8xRDk
         wPt5J2TobVToHo/aQIiOf+fVqJayytzqbhdGz2D24/YTTxjKwRo6gVeDwyUH0QxYUwNQ
         0B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762700044; x=1763304844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BF+IqHQob+hGVOQn71SBXY+a0nfJlfxF9DOHGLjEayM=;
        b=DwB61p9Bwfzp7J5r5jn9+XIuDQJfXnYWp4niSCJcKC9o62JfWE0xNnYpheZ77KZI2O
         jFs2z16LUfZo60haSFy7/MNYMp4WpZej+UIbJxf7ZffmQa2OG4VYfu/nK6Yh48U1NKiE
         5H2f2IL/zGNxVgxD7l5KqlKCz1fkPwg6crgGOhYbVpmYt8wBYtmImh8SJUniP2rI1Yk7
         0nf/v/gDfK8Um3F58gnjiqLkDKUQRKb8G6LK7ofmvRJpMKwOOLrQU6o0vWGELGiUkEpj
         SdCdpUa83xynVgMZfDSRjihX1muMUGikqiXrh6LHLDLoK2noGjxNa+NAUcdogAWZIcgp
         Uogw==
X-Gm-Message-State: AOJu0YwkuPlq3SbXc5bz7AfwDpD7jF4b30/eCtQSgHPHv9AvdhTsDklq
	YNTml84Jx9It9BZr4Gk2YeENc/bMZeRAGWgE1HV5BIOorE9E+pGmfupre0BmzfVT
X-Gm-Gg: ASbGncvzArgk3juEltKXPNDeEV22CYSps2sWEQ4gEFgQsQbh6iQjPPUVXRzShoakXbA
	uEdafmeXVfBVxm+jT1xsAyKQZoli6vmVU6+kpWqT1pwP74QA32CC9PZoSJJUca/DOr8u91sbazz
	5oiA6mjiOG/Xv9IMmh8qUF0GNVOMcu1DmP/epk3k/RvMJN9Wdp0JfjPvJk+W0Q5QsfbvmMLN0lX
	eZEhxh6mLHHmwMJ7rrkhVG+mPAn7aJLUhyjNupXIYVKxK/oWqfjb/hKI1sjOWriswn2WxrrND/H
	2ycK4A5HD5lCIoG1XxY+qfzEQRopmsrZIyR4118BU1dCGki744eGyXMGi7EWfFNT474Chckvs93
	4D1maFTnmWkYLrg57nYktDkvYp0k2eLpQatImI1t0zcf4RYKrnuT+nh2tDrjJCCDyMl+F/rOv5t
	/z6GRlszxXJ5Tdh4CEHTGogbNII+eQOGYrBjJhj2b8VKRaYyK89lc7h+1fusFt2FRabSYUZtdx
X-Google-Smtp-Source: AGHT+IGK3rIbMFL0HTH3U/v2J0q6N28zFHrl2GR2eWVHpS4GIAceIAfLW5aEUoKGne6KEN1JpqDm1g==
X-Received: by 2002:a17:902:dacf:b0:295:350a:f9b8 with SMTP id d9443c01a7336-297e56b8533mr83749335ad.29.1762700043938;
        Sun, 09 Nov 2025 06:54:03 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93cebsm116223735ad.90.2025.11.09.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:54:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gensio,audit,syslog-ng: Disable and remove tcp-wrappers support
Date: Sun,  9 Nov 2025 06:53:57 -0800
Message-ID: <20251109145357.784999-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109145357.784999-1-raj.khem@gmail.com>
References: <20251109145357.784999-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 14:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121416

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb | 3 +--
 meta-oe/recipes-security/audit/audit_4.1.2.bb        | 3 +--
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
index e064f5acd5..71a05560fc 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
@@ -12,10 +12,9 @@ SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.8.x;tag=v${P

 inherit autotools

-PACKAGECONFIG ??= "openssl tcp-wrappers"
+PACKAGECONFIG ??= "openssl"

 PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_HOST}${prefix},--without-openssl, openssl"
-PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers, tcp-wrappers"
 PACKAGECONFIG[swig] = "--with-swig,--without-swig, swig"

 EXTRA_OECONF = "--without-python"
diff --git a/meta-oe/recipes-security/audit/audit_4.1.2.bb b/meta-oe/recipes-security/audit/audit_4.1.2.bb
index 2cd28e85f1..ae06b6023e 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.2.bb
@@ -24,10 +24,9 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_PACKAGES = "auditd"
 SYSTEMD_SERVICE:auditd = "auditd.service audit-rules.service"

-DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native python3-setuptools-native coreutils-native"
+DEPENDS = "python3 libcap-ng linux-libc-headers swig-native python3-setuptools-native coreutils-native"

 EXTRA_OECONF = " \
-        --with-libwrap \
         --with-libcap-ng \
         --with-python3 \
         --with-arm \
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index 1b46d66d6c..3eb46b775c 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -61,7 +61,6 @@ PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
 PACKAGECONFIG[stomp] = "--enable-stomp,--disable-stomp,,"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
-PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
 PACKAGECONFIG[examples] = "--enable-example-modules,--disable-example-modules,,"

