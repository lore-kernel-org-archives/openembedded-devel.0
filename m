Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3A2C54EAA
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.2124.1674324088920343131
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bCC6a6r/;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id x24-20020a17090ab01800b00229f43b506fso6877336pjq.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPIeV3faIKQdfS7mfu8VqadUB1zM8xenrNhNepNhcaw=;
        b=bCC6a6r/tyvEE30XEP+qtoFJvK/CQHfoz0slkkywpSI/53gnoECwd1GRSH+tud8AAA
         k1fin0hmo7nBSEI5uphD1Ml3ZTNMbva/2tB2PZ3yw7N3ujXmjAOnSg+1uvMgp+r1uPnD
         wTvvwEI6y1/L3qo+featUDskW4GW6yz3Zq9fBMp3NcF6OIDCoKyeVjLxeWRQUPgW4eA3
         8G5gbzJ3onZHtpqvWU2JBnfh98AcTypxbnCiik+L8ck8mWGmxEiyvh41TwMJpGec/nPh
         0o+CuLLNRHjywBdV0pEnMXPB08p/W8WteWhKxrqasGUom14+faOh4gYWW3vt/rCNEQ8D
         m91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPIeV3faIKQdfS7mfu8VqadUB1zM8xenrNhNepNhcaw=;
        b=Z3cspNsk/Jv8Ur0E2p6khH+pQp0LcJD7QoD5C8Id48hoZcxq/7p/nQ8NBVcJ7Dr06Z
         Qd05XwaD2DYVrzyTg5zt+jzF5Xo4/mNqi7gMSlfsFFB53eP6qzRPCX2P1isG8h7+MpWx
         8XP++Z2BNHTu4ATEpgPY9b+tpmHC6/PjrK/JZ8ZEe6fOmbVt+7Uf3EKM7Thk9PnHNCl8
         hOlbG8ZUPGyXBzc2ed9Z0EhOJMli3kS73WSGzN9GCJSTEsYcQ2pTVRmvtovIX7lI2FwU
         qiukYCyQxthEzpgCMSnXQSCVe8D6ifd83uiHsxXunsr9wlTYae4mHf9N0pUVxcUKUQgC
         is3g==
X-Gm-Message-State: AFqh2krB+ghHztWbdXkzDVhuk9eTVSdpuocd0QdlZsnhZ8vXp3EHcUqS
	lk+E2Z2v3ptYQMjCE/1NI8cTfOPs7iixTw==
X-Google-Smtp-Source: AMrXdXtQxErwIQzOOtyhS2co6SFBnEjN4umlosxCdgM2s3X1gwpPVJj4dLh52zGWUAC9jJ2o1/aSaQ==
X-Received: by 2002:a17:90b:35c9:b0:229:8e0c:68b0 with SMTP id nb9-20020a17090b35c900b002298e0c68b0mr20651766pjb.19.1674324088056;
        Sat, 21 Jan 2023 10:01:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/30] freerdp: Fix incompatible function pointer type
Date: Sat, 21 Jan 2023 10:00:56 -0800
Message-Id: <20230121180121.1229895-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100672

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-incompatible-function-pointer-types.patch | 32 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.9.0.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch
new file mode 100644
index 0000000000..ce230dbf22
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch
@@ -0,0 +1,32 @@
+From 9c785ca0535d9c24e6699ee1243b427c1407acb5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Jan 2023 19:31:17 -0800
+Subject: [PATCH] Fix incompatible function pointer types
+
+clang 16+ is flagging the function pointer prototype mismatches,
+therefore fix it.
+
+Fixes Issue #8487
+
+Upstream-Status: Submitted [https://github.com/FreeRDP/FreeRDP/pull/8622]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/X11/xf_disp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/X11/xf_disp.c b/client/X11/xf_disp.c
+index 32ddb626c..ef0cb93ff 100644
+--- a/client/X11/xf_disp.c
++++ b/client/X11/xf_disp.c
+@@ -248,7 +248,7 @@ static void xf_disp_OnTimer(void* context, TimerEventArgs* e)
+ 	xf_disp_sendResize(xfDisp);
+ }
+ 
+-static void xf_disp_OnWindowStateChange(void* context, const WindowStateChangeEventArgs* e)
++static void xf_disp_OnWindowStateChange(void* context, WindowStateChangeEventArgs* e)
+ {
+ 	xfContext* xfc;
+ 	xfDispContext* xfDisp;
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
index 0856a60bed..3b8fee0f5f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
@@ -16,6 +16,7 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "fa8e1b1c765a4466030ac52240f052c0b440a4d1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
+    file://0001-Fix-incompatible-function-pointer-types.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.39.1


