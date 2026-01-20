Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73513D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 06:48:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1310.1768891686881654050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 22:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JPXac7U2;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso28922235e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 22:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891685; x=1769496485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIbqigSgchYZkkw6a0F91WmRbwtGgaHQFt2b/odxtY4=;
        b=JPXac7U2lAo0uGfYsS49WCcqPUDZPoU5a/TMbRi7DYM/sIC4nF56Wik3Rgi9tdOR4H
         zr4xuUzd9PYwpmTIkgBKR8pGCsj29P/soPEXDrUf56NY+FyRmBjIQYbk37M7WZiRxoCj
         xdJGV4Ru6b0oA6W0b6qXg50NvkINJaN6qBYwAnBU7V4E4hQzLJDk/jQQbAzf62LLgiGx
         kHRjuIZoh27A2Rbp8/VujuHJwNSZ0gQnZCo3yR9wIO0zOCeo2KOfgaCBmmsWwoossR29
         8OiSZhyTEanEMyrJJTPMQ6HTVmeHCoYwPWWkwH+3gEkrKDTlE4wpw77cVx58qnsjS6jx
         cG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891685; x=1769496485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIbqigSgchYZkkw6a0F91WmRbwtGgaHQFt2b/odxtY4=;
        b=Ztd12z1iVl/rIuaxcsA3sbmTwSuHPodlva0Hk9bj37EbY8gF+H4RcZaADd/dy9ZEBH
         QFg3o8p85NtGwT4kaahMIK8AnKzxH9lqltoVmMImYdbTpxBAgB9Eyx2Npm0MdRjOaq2g
         ak2Ekr7s5zGwl5fgtdpZjvi868Piu/IYW7DfKY7NO4oCOcdAo//fnFnxd+uPwrR/cNV/
         4LHbmAZ8SOmAAC1fUkCE7BexfI2n0mQGxQoRBLKl5NRMmiafSqxU9L4vimd24TUuecZV
         9+ze9739lTg+NUC22oDLkp9tfYXY8bpuT3dL1SsAc6FfbNNiaoUptZ2O7/OmqD7Rlg1x
         mH0Q==
X-Gm-Message-State: AOJu0YzgZ83P/82XeQ/FLELo3b+OpY+0yffs+z5adkPzPTp2ijiKExyC
	AiGu7Mej9H4Fbj47/8H3HXGezzTOQgj2mNzTN2UqakbOU7oH68NFFgWtWmynTw==
X-Gm-Gg: AY/fxX5L0aPrkO7vvXrfr7p7OKuI4KOK9IobWaIkBxQ82rHoMBVF+3wWlYsmWoa7yuZ
	QfW1fRoKjYg6ITU41FeJkuVJXR4pxQQP5sdjSMEUMsu55/8wXRVsQweakZ+rkjeo6037RfLcTbj
	dYHG7Ogd6nkLyGqEJLHkwgEyENVFlJKhB5kjzvmpeVVlt3E1oyKEPkeKfpRnd+E2A5pZv5+UGTL
	ovpSwU3LXyOBn6LbR/9hyul5N2flHJN/QWPvEtYVTzHUzoq8LHPOjr+P01N3QgSlbdtuK3hoFsg
	v5RzIhQ1m4JuV6wscXmvR0yJaGzliH7hkvwWdCzpcwHsh4ypQ0t8U9Hd6QoSrJsJubNmHQ/7kaM
	PT0pZylp/VbUUrzL/VhuRD17wb3ZHfnzdHE4ZQI4NGZSa2Ftx9Xt+VCL4CSgWmL9Io31zAfwnmP
	cOx8SStbFU
X-Received: by 2002:a05:600c:c4a5:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-4802721c0eamr138644165e9.34.1768891684918;
        Mon, 19 Jan 2026 22:48:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm26469633f8f.38.2026.01.19.22.48.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:48:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] freerdp: patch CVE-2022-24883
Date: Tue, 20 Jan 2026 07:47:59 +0100
Message-ID: <20260120064803.831507-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 06:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123654

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-24883

Pick the patch that is mentioned in teh NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2022-24883.patch      | 102 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |   9 +-
 2 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-24883.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-24883.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-24883.patch
new file mode 100644
index 0000000000..12f5efd8e7
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-24883.patch
@@ -0,0 +1,102 @@
+From 3912ccfe5bac0db647b9e1c26b50e75055aee4b9 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Fri, 22 Apr 2022 14:42:11 +0200
+Subject: [PATCH] Cleaned up ntlm_fetch_ntlm_v2_hash
+
+(cherry picked from commit 4661492e5a617199457c8074bad22f766a116cdc)
+
+CVE: CVE-2022-24883
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/6f473b273a4b6f0cb6aca32b95e22fd0de88e144]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ winpr/libwinpr/sspi/NTLM/ntlm_compute.c | 60 ++++++++++---------------
+ 1 file changed, 24 insertions(+), 36 deletions(-)
+
+diff --git a/winpr/libwinpr/sspi/NTLM/ntlm_compute.c b/winpr/libwinpr/sspi/NTLM/ntlm_compute.c
+index dbd7f7fb0..48c07d5c1 100644
+--- a/winpr/libwinpr/sspi/NTLM/ntlm_compute.c
++++ b/winpr/libwinpr/sspi/NTLM/ntlm_compute.c
+@@ -206,59 +206,47 @@ void ntlm_generate_timestamp(NTLM_CONTEXT* context)
+ 		ntlm_current_time(context->Timestamp);
+ }
+ 
+-static int ntlm_fetch_ntlm_v2_hash(NTLM_CONTEXT* context, BYTE* hash)
++static BOOL ntlm_fetch_ntlm_v2_hash(NTLM_CONTEXT* context, BYTE* hash)
+ {
+-	WINPR_SAM* sam;
+-	WINPR_SAM_ENTRY* entry;
++	BOOL rc = FALSE;
++	WINPR_SAM* sam = NULL;
++	WINPR_SAM_ENTRY* entry = NULL;
+ 	SSPI_CREDENTIALS* credentials = context->credentials;
+ 	sam = SamOpen(context->SamFile, TRUE);
+ 
+ 	if (!sam)
+-		return -1;
++		goto fail;
+ 
+ 	entry = SamLookupUserW(
+-	    sam, (LPWSTR)credentials->identity.User, credentials->identity.UserLength * 2,
+-	    (LPWSTR)credentials->identity.Domain, credentials->identity.DomainLength * 2);
++	    sam, (LPWSTR)credentials->identity.User, credentials->identity.UserLength * sizeof(WCHAR),
++	    (LPWSTR)credentials->identity.Domain, credentials->identity.DomainLength * sizeof(WCHAR));
+ 
+-	if (entry)
++	if (!entry)
+ 	{
+-#ifdef WITH_DEBUG_NTLM
+-		WLog_DBG(TAG, "NTLM Hash:");
+-		winpr_HexDump(TAG, WLOG_DEBUG, entry->NtHash, 16);
+-#endif
+-		NTOWFv2FromHashW(entry->NtHash, (LPWSTR)credentials->identity.User,
+-		                 credentials->identity.UserLength * 2, (LPWSTR)credentials->identity.Domain,
+-		                 credentials->identity.DomainLength * 2, (BYTE*)hash);
+-		SamFreeEntry(sam, entry);
+-		SamClose(sam);
+-		return 1;
++		entry = SamLookupUserW(sam, (LPWSTR)credentials->identity.User,
++				       credentials->identity.UserLength * sizeof(WCHAR), NULL, 0);
+ 	}
+ 
+-	entry = SamLookupUserW(sam, (LPWSTR)credentials->identity.User,
+-	                       credentials->identity.UserLength * 2, NULL, 0);
+-
+-	if (entry)
+-	{
++	if (!entry)
++		goto fail;
+ #ifdef WITH_DEBUG_NTLM
+ 		WLog_DBG(TAG, "NTLM Hash:");
+ 		winpr_HexDump(TAG, WLOG_DEBUG, entry->NtHash, 16);
+ #endif
+-		NTOWFv2FromHashW(entry->NtHash, (LPWSTR)credentials->identity.User,
+-		                 credentials->identity.UserLength * 2, (LPWSTR)credentials->identity.Domain,
+-		                 credentials->identity.DomainLength * 2, (BYTE*)hash);
+-		SamFreeEntry(sam, entry);
+-		SamClose(sam);
+-		return 1;
+-	}
+-	else
+-	{
+-		SamClose(sam);
+-		WLog_ERR(TAG, "Error: Could not find user in SAM database");
+-		return 0;
+-	}
++	    NTOWFv2FromHashW(entry->NtHash, (LPWSTR)credentials->identity.User,
++			     credentials->identity.UserLength * sizeof(WCHAR),
++			     (LPWSTR)credentials->identity.Domain,
++			     credentials->identity.DomainLength * sizeof(WCHAR), (BYTE*)hash);
++
++	    rc = TRUE;
+ 
++fail:
++	SamFreeEntry(sam, entry);
+ 	SamClose(sam);
+-	return 1;
++	if (!rc)
++		WLog_ERR(TAG, "Error: Could not find user in SAM database");
++
++	return rc;
+ }
+ 
+ static int ntlm_convert_password_hash(NTLM_CONTEXT* context, BYTE* hash)
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 9da8b27c0d..2271be3c6c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -15,10 +15,11 @@ PKGV = "${GITPKGVTAG}"
 
 SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
-    file://winpr-makecert-Build-with-install-RPATH.patch \
-    file://CVE-2022-39316.patch \
-    file://CVE-2022-39318-39319.patch \
-"
+           file://winpr-makecert-Build-with-install-RPATH.patch \
+           file://CVE-2022-39316.patch \
+           file://CVE-2022-39318-39319.patch \
+           file://CVE-2022-24883.patch \
+           "
 
 S = "${WORKDIR}/git"
 

