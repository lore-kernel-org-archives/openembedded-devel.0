Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B62FD3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:40:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10654.1765294798123951993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vszwrr9I;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so61756545e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294796; x=1765899596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBiEdjzEvPKFjDRRWFlyoARwzqjG5d2LxwKBTnx20kU=;
        b=Vszwrr9ImWk1nVV2IfOjO/hjnkddv9k5bxVkkktSMm+Pr0d6IfSgKSsSqaSM/iVqvx
         AZ0dmS6g29a5db4DtcCwubtDhbpD0eRUVdLnk0eL9d7yFZK+wiyyvNFQspis7jlGbHR7
         ORZ7EdoM3VuHWlOi8BSwcMMA7KcuKB8pjoWqfbpGk3g0/ijaNmMSTPwnPH3QYhWvgLLq
         e99Jlj3rNKPTt1HIbHQwhYVFfQzDQ1E46SAr6d7aTBcqj04Ub2HofgRcDBU2j4OTioO+
         DLw9OkvbzfrdZfW7v/gwA1ovjrQ8G/OLgb4YFxGJ1tUk2oWeCy9tTV0ReobfIvsa9GgB
         dLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294796; x=1765899596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBiEdjzEvPKFjDRRWFlyoARwzqjG5d2LxwKBTnx20kU=;
        b=Y4HG3h7ooNRVh2EyYvbD8qcS5AGk+HyGoRTNOIDyzTde+GW4sgHQfeAEqfkTndGBnZ
         MjtJxhx8gebESFYTXgnUi2g9AeSCphJiNDZe8srs1vFD6o6RfbM7XxAWXNEMIVKbkZLA
         W45O8TIOeSPxVwFpUmTPoC34X4nk945AgLAm6GWTcX83DRpT88CjtU/JiMXG2N/2ncQ9
         dKrXfUc6XyB0jVclvMdSwtNDUNAQYlR5oHUpm/17yj9kavN/XHM8vWc5smFvRFiCi/sM
         AJf0iiPmJMuV50k8MjfT22BnYllZGtMZ3Qq3N8t2UvFIRLgVR0+NyP4LIYtDWjpRvuyL
         jqVQ==
X-Gm-Message-State: AOJu0YyBG/7IdRfE5ifmqlKOpkyQKat6AxChcxc4f8ees6+Qnzbj8Oy1
	JYELmsQ5ehGPnqScaHSTeZuMtdgi0jihp7NAU/OgGnTlDx6dSFxEpqTpEqmL/Q==
X-Gm-Gg: ASbGncsQIjC9E8p7mJp/bRjDnDmEl+af7HOAvcwMFC7Trt6S6Cd0/09NFcfFbLLZvWR
	AeAF9sBztkvWJ12AnoLX/5BeyzRjVJYonlIwj7pmUJMziu+fJkxsghe1jLb5hGtvH2/Zh0N66Qd
	WbUR+V0wgJMljS5334UfNpuCjUjKfW+z1dmbcloP+jmSYAh31zLsVAu2bAki8bhjaDSWNGwKgLH
	8sL+XdCO8jx7OKsc+0kY2DDSjcvItCtugpM4jafh/HEZu7Wktr3O4/2ikzEXnmQHa9PcBiC8qY3
	op0KRvXMzmsMB4Mzn3Igx6p4EYuo4IdqTOoru+QgHCaqdCdaiZMspau0Ns1DXhFkAowTKCwPSGB
	XCjF3dQEbFx1BNA9n0ZY0HcniNtHJb1gIQDIUAAahsJ2NIXvx6XeS6gt14iX02ja8tDOwbWfH/N
	cx44p7h87p
X-Google-Smtp-Source: AGHT+IGsbh6/dnC8eWZplbwGA56VvwRwTju7XuJQmS9gIpgf+HXap8K/kMN460/UEFQE4c7kyBvPAQ==
X-Received: by 2002:a05:600c:4f81:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-47939e5c540mr151380245e9.35.1765294796399;
        Tue, 09 Dec 2025 07:39:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm46375495e9.7.2025.12.09.07.39.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:39:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/5] dante: upgrade 1.4.3 -> 1.4.4
Date: Tue,  9 Dec 2025 16:39:52 +0100
Message-ID: <20251209153953.951218-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209153953.951218-1-skandigraun@gmail.com>
References: <20251209153953.951218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122463

License-Update: copyright year bump

Changelog:
- Fix potential security issue CVE-2024-54662, related to "socksmethod"
  use in client/hostid-rules.
- Add a missing call to setgroups(2).
- Patch to fix compilation with libminiupnp 2.2.8.
- Client connectchild optimizations.
- Client SIGIO handling improvements.
- Various configure/build fixes.
- Updated to support TCP_EXP1 version of TCP hostid format.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dante/{dante_1.4.3.bb => dante_1.4.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb => dante_1.4.4.bb} (90%)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
similarity index 90%
rename from meta-networking/recipes-protocols/dante/dante_1.4.3.bb
rename to meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 901167f1b3..7aa1103855 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -9,11 +9,11 @@ what could be described as a non-transparent Layer 4 router."
 HOMEPAGE = "http://www.inet.no/dante/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=edd508404db7339042dfc861a3a690ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3a8e7dc09bb720460f28c9d3796afa5"
 
 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d"
+SRC_URI[sha256sum] = "1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec"
 
 # without --without-gssapi, config.log will contain reference to /usr/lib
 # as a consequence of GSSAPI path being set to /usr by default.

