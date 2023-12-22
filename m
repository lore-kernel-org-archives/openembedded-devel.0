Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5DBC46CD4
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:35:23 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.17297.1703226917613532294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMNw8wiI;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbaf9b1674so873062a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703226916; x=1703831716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBBaaXF1S5p+xXPeEEMnX4Y9cSjJ7paK6fjCoVKb5VY=;
        b=gMNw8wiIevWGl2cBF8w5Bj7TgRD305ZQQnz+ApcQXKk3ix96Du2QiJDhlhuGVcuxlc
         sZDzDvYGln5wdqmK66V6UEc7hfaW6qEdCAZbpIqahEIjNRKVatsLqL7efk96IR09CL3k
         Hy7ip+9MWaM453ZM32R179BMN5ATuv3fjpytWw69XoXHD0TA2PrxXASnm0mqlUk4aCVp
         m0DRmPTrpYYM2PEfhAaXf00xFzbX1gZhMgc8d6M63vdhdjq2hUm6XgajJzgC/2Nh+cKG
         zccv4Kh0AcMeRSBPpIGv+Rttch7Z1xkMM/HRQws5bWzNl29OMFxDs3PVGIKLzXOvQX+N
         +bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703226916; x=1703831716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBBaaXF1S5p+xXPeEEMnX4Y9cSjJ7paK6fjCoVKb5VY=;
        b=poSy9KdHaCOJrknokwNTRUud1GlVFj6/q7WTyD4m1eN82SdbsJI0nxe3Hfsa13fZcw
         6e+RbCMsQa2iD2gOx0oATQ41CvNl3Nwt81hcGYI7k6OQXvvauJ9bw5mAYJ91aqzxRJ7p
         1aKeP02IPcYRhrf3KsrBrN9RPfEv+D+m06hdyD75yjPlC5uFJNP8A434NY2fYinU7kLA
         QT8au1Yyc/OP5HPz+apJ2xGwfL06+BKIEWQ1DvUiEzf16u+rjyysBoAbCjtCZmavJXmP
         cksEVYgzEdSVxJPAhpAGqZehRQncV8xUJQMKYG5Prasv+VoIY39G7C0RDrPatYFhL8Ly
         2jxg==
X-Gm-Message-State: AOJu0Yz+VzZ5XkJ6TliLJcOFGjMAw/atAsp7nPuzQz1kvaOh7u9emhA0
	Cgf2LZ7mfWhf1+ypCLU6ZHCjH4dbokA=
X-Google-Smtp-Source: AGHT+IHYTH4Rz+ExDRUKQaDtTfipwC9FBHd8A/UYeiuW29DH508kMIX+nSUykFwXIpscIF7zZJvMQg==
X-Received: by 2002:a05:6871:e70a:b0:203:edf8:8ef4 with SMTP id qa10-20020a056871e70a00b00203edf88ef4mr1087604oac.82.1703226915934;
        Thu, 21 Dec 2023 22:35:15 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c42:9a2:7919:ad63:823a:e702])
        by smtp.gmail.com with ESMTPSA id f29-20020a63555d000000b005c60ad6c4absm2541360pgm.4.2023.12.21.22.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:35:15 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	virendra thakur <virendrak@kpit.com>
Subject: [meta-oe][dunfell][PATCH 1/2] opensc: Fix CVE-2023-40660
Date: Fri, 22 Dec 2023 12:04:57 +0530
Message-Id: <20231222063458.2762114-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 06:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107744

From: virendra thakur <virendrak@kpit.com>

Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/940e8bc764047c873f88bb1396933a5368d03533]

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../opensc/opensc/CVE-2023-40660.patch        | 55 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.20.0.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
new file mode 100644
index 000000000..74e547298
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
@@ -0,0 +1,55 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/868f76fb31255fd3fdacfc3e476452efeb61c3e7
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 21 Jun 2023 12:27:23 +0200
+Subject: Fixed PIN authentication bypass
+
+If two processes are accessing a token, then one process may leave the
+card usable with an authenticated PIN so that a key may sign/decrypt any
+data. This is especially the case if the token does not support a way of
+resetting the authentication status (logout).
+
+We have some tracking of the authentication status in software via
+PKCS#11, Minidriver (os-wise) and CryptoTokenKit, which is why a
+PIN-prompt will appear even though the card may technically be unlocked
+as described in the above example. However, before this change, an empty
+PIN was not verified (likely yielding an error during PIN-verification),
+but it was just checked whether the PIN is authenticated. This defeats
+the purpose of the PIN verification, because an empty PIN is not the
+correct one. Especially during OS Logon, we don't want that kind of
+shortcut, but we want the user to verify the correct PIN (even though
+the token was left unattended and authentication at the computer).
+
+This essentially reverts commit e6f7373ef066cfab6e3162e8b5f692683db23864.
+
+CVE: CVE-2023-40660
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/940e8bc764047c873f88bb1396933a5368d03533]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ src/libopensc/pkcs15-pin.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-pin.c b/src/libopensc/pkcs15-pin.c
+index 80a185fecd..393234efe4 100644
+--- a/src/libopensc/pkcs15-pin.c
++++ b/src/libopensc/pkcs15-pin.c
+@@ -307,19 +307,6 @@
+ 		LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_PIN_REFERENCE);
+ 	auth_info = (struct sc_pkcs15_auth_info *)pin_obj->data;
+ 
+-	/*
+-	 * if pin cache is disabled, we can get here with no PIN data.
+-	 * in this case, to avoid error or unnecessary pin prompting on pinpad,
+-	 * check if the PIN has been already verified and the access condition
+-	 * is still open on card.
+-	 */
+-	if (pinlen == 0) {
+-	    r = sc_pkcs15_get_pin_info(p15card, pin_obj);
+-
+-	    if (r == SC_SUCCESS && auth_info->logged_in == SC_PIN_STATE_LOGGED_IN)
+-		LOG_FUNC_RETURN(ctx, r);
+-	}
+-
+ 	r = _validate_pin(p15card, auth_info, pinlen);
+ 
+ 	if (r)
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
index b8cf203b7..3e77b8884 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 #v0.19.0
 SRCREV = "45e29056ccde422e70ed3585084a7f150c632515"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
+           file://CVE-2023-40660.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.25.1


