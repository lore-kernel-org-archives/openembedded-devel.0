Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAC4CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:58:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.5110.1758164327017474078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GlOQx2tY;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5500891f00so186341a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758164326; x=1758769126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfkMeM2XgX2+9gYh8xjDCh4GT5HR2q8MIYtZbt5BwX4=;
        b=GlOQx2tYu48UfV9zK6Z4NrMBCxoVKyZg+HJeLVxoHElihEp8aTd/JyKPDRyBoRMYYX
         Uo7lBYVl2o1F5JYKcLNNuDZoB3tsWbHn7tN9MEhpJSpDES/9b37RgGHaB/PCPIWz/vqj
         peM5o5RdOHIwbcOzmGNFP7tO/LYfGc3wV8nBmbyAZGD5R+CkxpiKJS54gcpS5AqeQmzM
         0Doc94YiX9/kHaoSze5nuGyMcXOnTswgV3rNY9F5l9WrPL3WFnTpNQmy7PnKaauA1zRB
         fsXYLooAqUMFSecmwDxN11QXchyU/pt49XfKJn7DOBtS0qEYMKoPpt1ixhJ9XWGb4eVx
         ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164326; x=1758769126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfkMeM2XgX2+9gYh8xjDCh4GT5HR2q8MIYtZbt5BwX4=;
        b=l37unNd08t8JBq1Y/FnhbK52BlLDNcA3fTaOOMb1i3T/pLPqiIhfDlDjL1H4zFo3bC
         6L7e1MmT+hoT9ckbXKSvCkGgZmsTAuya+NJRLksCMMI8oufwpe8QTLPnqz7E6GlypnVd
         kzFyarct3YsxypuxYuAf8IEaJxfuQpMJgkA0UJnxH/LvhohxrKnbm4cPT7Qlso2BtzrD
         K5ML6mB5LbdVigKUmp/U/ZlHsGo2TZ3Pb5PeM2oyyoPKg8ljPUW7Wm7YchFSfeeU4IYM
         UF3NlxncznpmCt317vB4lN9KLxsmjVuJX7hEnm6OweWJ/voLtNxWd84jU05EQ9aA2jly
         d4XQ==
X-Gm-Message-State: AOJu0YyrkAZydc1ttlYxmxqYsqjhrW1/Ba9y0ud3TEharHz4LlHlNagN
	A45CicCoGykZs5QW4Feh7OtJj7TC4VmVAswgLXUeokbu5yK4H2bdN//wXyaLXHpQYoE=
X-Gm-Gg: ASbGncutExJ5QGIUwwQnny5Eu1MFortLYydxLAkPHfllaiU3CuQIoCFD4EbF4aby9Ht
	WlND1gVDTOxlRMJN5gIRD/J8AAfC0/i9Ntdj7l8ZnNnOUjw0bLdjww7llZCI4Z2HdA44caKUNrZ
	1b7+tNfrLCEgPjrLoQHsFFSUhqzxlzaMALFLy12kzRl9cYElQNa6gUz3QLT6N8z2EXQX1977kOB
	vkkeB2K+57AMArmmY+KXb+/s4ZtHNcgmXILGspeYHMO0Y142gNwaoLFd3wxUD2uGgEWWDSUA22Z
	tFgjhUn2S5KnshMaOMqHd+y+CYmJbxOkWq0LNe4rftKV+Ath298s/xMrNPsqgBLS3Fwcu3LT/FM
	ojBFtbvVzsTxLHdXfheaocglX+eNQUWaLoNewSJT7Y7PLg8oLuCriXAW4kTGZYUWmo9EI7kQ9Ha
	g3FMy69F3LkMz9n9lH1fezcU5e+5x0EFRGSxXw/wMJfy+w9ph0EEWI8Yf3mos=
X-Google-Smtp-Source: AGHT+IF/AI+ISN5C311+Kn6guHQb5+IgPm4qXhMDsAPAMMhbXWppLMrdkj/ICN9B8TXwiXiLkUF7sA==
X-Received: by 2002:a17:902:f706:b0:267:6649:ec10 with SMTP id d9443c01a7336-268119b7b26mr54014375ad.4.1758164326093;
        Wed, 17 Sep 2025 19:58:46 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368ef4sm9458795ad.149.2025.09.17.19.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:58:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] freerdp3: Upgrade to 3.17.1
Date: Wed, 17 Sep 2025 19:58:41 -0700
Message-ID: <20250918025841.2170106-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918025841.2170106-1-raj.khem@gmail.com>
References: <20250918025841.2170106-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119505

* Package proxy-plugins into their own package
* Add missing dependency on json-c
* While new plugins have solib prefix .so are still
  packaged for compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{freerdp3_3.5.1.bb => freerdp3_3.17.1.bb}       | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.5.1.bb => freerdp3_3.17.1.bb} (92%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
similarity index 92%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
index 7f58820eb7..93a9d15aa7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://www.freerdp.com"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg"
+DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "eda5c99686e15327f2f37b9cadf307e852b96adf"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
+SRCREV = "854937b55bbb81a92114cc1e6f5ddcaa8d22a669"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
 CVE_PRODUCT = "freerdp"
@@ -59,5 +59,12 @@ do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
 }
 
+PACKAGES =+ "${PN}-proxy-plugins"
+
+FILES:${PN}-proxy-plugins += "${libdir}/${BPN}/proxy/*.so*"
+
 FILES:${PN} += "${datadir}"
+
 SYSROOT_DIRS += "${bindir}"
+
+INSANE_SKIP:${PN}-proxy-plugins  += "dev-so"

