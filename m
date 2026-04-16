Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EFEF433FD
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:21 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6942.1776318670793084517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RlQbuEs8;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732165d1eso18899186c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318670; x=1776923470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW92aHkmB88JvVkNJSwQItLngCZe79TEadJVp2wTIAM=;
        b=RlQbuEs8PIyYayhtccT4KWJa+jUJ3wzKFpX4fOWdqmpc1vg/AJvUCrsgW14PYNfaPQ
         ssEyFkAlyzvN5JugrtkieaWa6D48bJB23ModGhKtsSV8JQev6NYS2qtxWQN9qY7Ih3ya
         kaaYIWZkeMOqRqEGzcdf6CybJmTr2iCjMNfoUHFxzzHBYaQujaMCtjFNd4A9OtzSj+iN
         kAj89LWx8pmciJjRgRN59PG+nqYAvH+VE8s/keFzUkdNkbPlLI68zqbhcZDtV+FjFPq5
         XSKSprLSWDlq6c9YvNnQQlZ7GttVc9XqPF8DQ+v+avI0iJ+YOz4cf4vDYGC29sskCAhY
         fPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318670; x=1776923470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fW92aHkmB88JvVkNJSwQItLngCZe79TEadJVp2wTIAM=;
        b=RU2gjze0gha778BC8aU5kIy2ffsCJJ3vHniZ6YdWxFVezSNRIbLTnqQmi2CduroOE2
         qTd+7z08LuFeaEPM7ZuG+Qg2OidfSG50R3N5kE398RCYik5Qo0ob7QSlHRhWULIu8jtr
         X/BpYv5xo9FmyQQZxfNt4nZJoT2+qGeME9B1bPDV2DSeZJj/SmXmB0n+J6oJWzD71BQo
         0Ui5iVTdj0pS/g2lTCCEqBWwWekrw8ifFlteeSf82/8+qVKBV5P05Qa9teByuRE1DuJ7
         QTLKAT9ryh+aHB6PXwUCjSytUUMnlTzXOS3pEk+fLesxtwsEjVwUi0q4CTKcK4+/M9jr
         YaHg==
X-Gm-Message-State: AOJu0Yxz04wgIBhOgsRaT8jOZLqxPmRR/h9JnvX3uWYCcSsLxcBAHCqG
	gT6023enDlL0hzojnIjBn1bav+LeF2mMxeu61LFa/bD8f+9+44KVmi0zwo6Z11Kr
X-Gm-Gg: AeBDieuRxQRp7++6a3Y8pEIOTkIVEc9eE8VFuyYNQY3cqm5vYqW8QnuqrEmV+5R2nOg
	aqSui7knpMN+QmDc8/Vy6rEvwG0um+19/3oIP/h8W+LmxooLTDCujOhlWez1TraBGapUSMcU5qa
	uO/53c9PEEofDIkaGn3WHdk1pElSnC86cCJhjecWnVwuAHMZAbirh9dgkVwReRTzowqmdSPYHH5
	rRJInviXfOgMFHNOWX9jcxdkzLpFJUR6a+tQky2u+mquZTvg8FS93LvkEl+K5SelghTvFeHTHAj
	C/cmoojwAfvp+4rKAiV/JA4RsHjpIirsNLgy3swx1jM/xwHfX/ESjaQdPpeHgbDZGnBxZkEgGmF
	9MSPkHyR7cmJioEK5Y/ULBsFy4m1mjB7bzctKoApkX/rH909900fTfJMKT47A5wVidXYwTfByTy
	vSaSRdwDIDEq4UrnRLUuXFFkejZZDRedI0bwt6j6a9Q4rRGHWJhBIUBxv4MM+pkGnt76b4CQ1iW
	aow6pJbCe3vXJZFFBPu7RCc4CxSAkydTINTwW3U/FVkGyeT/llYfJ53Z5FQWr2yFYBP1JjFmFgI
	A3OzlYp5up6jLhpw+3a32b3XTyEps4fVbg3NkYrzCmAKskpaSAQ=
X-Received: by 2002:a05:7022:eac2:b0:119:e56b:989b with SMTP id a92af1059eb24-12c34e37b7emr12993410c88.2.1776318669837;
        Wed, 15 Apr 2026 22:51:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/18] dante,openflow,linux-atm: disable C23 support to fix configure check
Date: Wed, 15 Apr 2026 22:50:48 -0700
Message-ID: <20260416055058.792189-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126387

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb       | 2 ++
 meta-networking/recipes-protocols/openflow/openflow_git.bb   | 2 ++
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 52cfba4c5f..6a1eed3edb 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -25,6 +25,8 @@ EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
 DEPENDS += "flex-native bison-native libpam libtirpc"
 inherit autotools-brokensep features_check

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 CPPFLAGS += "-P"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 1588245f8a..d506dd4d01 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -40,6 +40,8 @@ DEPENDS:append:libc-musl = " libexecinfo"

 inherit autotools-brokensep pkgconfig

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 do_configure:prepend() {
     ./boot.sh
 }
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index fd18ed7386..f87aa92932 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -32,6 +32,8 @@ file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"

 inherit autotools pkgconfig

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"

 FILES:${PN} += "${nonarch_base_libdir}/firmware"

