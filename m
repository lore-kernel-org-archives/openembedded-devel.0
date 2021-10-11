Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B5C43217
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.2743.1633977723407425621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XE1/WGTQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m22so59254385wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WUiRtgtgg592WQbjLzRGElBoIvj35AMcqU4X7rkcySU=;
        b=XE1/WGTQq46SrTwiqw/VrP1vM8lWPLuIpyvsNKNBBoHDOBhlxbNKGpz6oIbn0Q4AcR
         Tihh8YJz1g7eK/QXsz84qqb0t6VvUESQtPAWkC1YzK46a+4PK3aQC3ZCxefKl6p88KxN
         8RI842PAPwvurCCVU0U7dhM8f70EGTCfKtZKeSTVKnnvCGc61HWFXDUmM480Uw8ayl65
         aIdos0u+IEYWoCjcAZwqI81qwDKxIL347ZIMiZkc2LSSvy6ffsmNeXDY5yVSSXhaHFFN
         nsx1IgXm83YjNnWiHfxCyJ463D8dfsG10JPvxxOJuxPwDDZulNgCoL85eLRtBeoqV827
         v9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WUiRtgtgg592WQbjLzRGElBoIvj35AMcqU4X7rkcySU=;
        b=ltn8872zGu+iKeT3L+lHtIfSKc4F+CJnCKGxJ7qk37m7kGDs/YwX9aIt/SAdFanOeE
         8hKVDoh3RLGF6Y5BnLPMihC2/bzWCwxo1lvIiuOR6zjFY+Q/qhgmfwgC5R7hGOtJRPZP
         k93Cl0MRXhFqaheYCCTuQDf5KPcQvOxO/5WrtXvmsGnod4ejpKFOybj37ZMT+Akwpsb9
         jBTqX+fPPy02ggmgYVKlmsOG4FccWKgl1X+mzg1pwtVsMAZ88cca3OH2qxFXxyva0Q8c
         crmRaKeomWrw6FHHNRJXZ16/+zVo6s8y5jgzX19ggR+LcUWGJEnG8skCIgrUHR1c/eI8
         RfBQ==
X-Gm-Message-State: AOAM5333V1XgB8wexTnuY2YIW0qDeDanx3cHA1WxUTpGwEAMqPDpc9ST
	jxKVoCKB1MnM45oxKODq2MXE7KAqIoaGwQ==
X-Google-Smtp-Source: 
 ABdhPJwQmKmPjjr6P1aGpYXSaWwOSZbe3b6cq5FA9ft9unQWAMm7dx2lthSpG2/0Xwr1+TV8vEvOhw==
X-Received: by 2002:adf:a496:: with SMTP id g22mr27606181wrb.13.1633977722054;
        Mon, 11 Oct 2021 11:42:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/24] freerdp: backport openssl 3.x patches
Date: Mon, 11 Oct 2021 20:41:37 +0200
Message-Id: <20211011184140.653609-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93235

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-support-and-build-with-OpenSSL-3.0.patch | 43 +++++++++++++++++++
 ...d-calling-FIPS_mode-with-OpenSSL-3.0.patch | 28 ++++++++++++
 .../recipes-support/freerdp/freerdp_2.3.0.bb  |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
new file mode 100644
index 000000000..04fe644d4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
@@ -0,0 +1,43 @@
+From f703b1184229796d504a2e833f72ace4cc605d15 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Wed, 12 May 2021 12:48:15 +0200
+Subject: [PATCH 1/2] Fix FIPS mode support and build with OpenSSL 3.0
+
+FreeRDP fails to build with OpenSSL 3.0 because of usage of the `FIPS_mode`
+and `FIPS_mode_set` functions, which were removed there. Just a note that
+the FIPS mode is not supported by OpenSSL 1.1.* although the mentioned
+functions are still there (see https://wiki.openssl.org/index.php/FIPS_modules).
+Let's make FreeRDP build with OpenSSL 3.0 and fix the FIPS mode support.
+
+See: https://bugzilla.redhat.com/show_bug.cgi?id=1952937
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ winpr/libwinpr/utils/ssl.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
+index 3a8590390..03b23af43 100644
+--- a/winpr/libwinpr/utils/ssl.c
++++ b/winpr/libwinpr/utils/ssl.c
+@@ -244,9 +244,17 @@ static BOOL winpr_enable_fips(DWORD flags)
+ #else
+ 		WLog_DBG(TAG, "Ensuring openssl fips mode is ENabled");
+ 
++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
++		if (!EVP_default_properties_is_fips_enabled(NULL))
++#else
+ 		if (FIPS_mode() != 1)
++#endif
+ 		{
++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
++			if (EVP_set_default_properties(NULL, "fips=yes"))
++#else
+ 			if (FIPS_mode_set(1))
++#endif
+ 				WLog_INFO(TAG, "Openssl fips mode ENabled!");
+ 			else
+ 			{
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
new file mode 100644
index 000000000..728638e15
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
@@ -0,0 +1,28 @@
+From 4dbf108c0ae5e997d5c432f3da4b4c5fd7b35373 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Sun, 1 Aug 2021 12:14:43 -0400
+Subject: [PATCH 2/2] winpr: avoid calling FIPS_mode() with OpenSSL 3.0
+
+Fixes: 26bf2816c3e0daeaf524c47cf0fcda8ae13b65ad
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ winpr/libwinpr/utils/ssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
+index 03b23af43..74ef156e7 100644
+--- a/winpr/libwinpr/utils/ssl.c
++++ b/winpr/libwinpr/utils/ssl.c
+@@ -364,6 +364,8 @@ BOOL winpr_FIPSMode(void)
+ {
+ #if (OPENSSL_VERSION_NUMBER < 0x10001000L) || defined(LIBRESSL_VERSION_NUMBER)
+ 	return FALSE;
++#elif defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
++	return (EVP_default_properties_is_fips_enabled(NULL) == 1);
+ #else
+ 	return (FIPS_mode() == 1);
+ #endif
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
index f46834445..78af5389b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
@@ -16,6 +16,8 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "14c7f7aed7dd4e2454ee0cd81028b9f790885021"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0 \
     file://winpr-makecert-Build-with-install-RPATH.patch \
+    file://0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch \
+    file://0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.20.1


