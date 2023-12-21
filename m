Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9237CC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 12:15:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.50129.1703160941439070693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 04:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HY45H4y9;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d409bcb0e7so1771895ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 04:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703160940; x=1703765740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBBaaXF1S5p+xXPeEEMnX4Y9cSjJ7paK6fjCoVKb5VY=;
        b=HY45H4y9ugNk6jBeXEzgxVQ5ik8NeJ29d261qFqQdRQQV/yc3NnxV7wM1sP4ogQE2V
         OmahK6cPYkI6+zztaWWJqfVjB7+R8A/0KR5LK3cWUp05jmZdEcK7jSQw9xY7TJGTbo78
         5Kk7UptOnTodnZfdCNSizG0O7B60AuAAKtA+s37gZy6GcBfPQkfTlhQSuvIazGkXyzNe
         mqr0phNxUXsH5Gj/a6r7dPUsOr1KsrsQWAHXU1cdxG2PpkdgAk+kyY2Ywjay2dxMblDS
         Iz0z/9ylAxhunq3nGnDqlyYpCfpdEsC6wrzqjD4BBbniVwqNKhXjFISfn1psRgw+QKrX
         fa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703160940; x=1703765740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBBaaXF1S5p+xXPeEEMnX4Y9cSjJ7paK6fjCoVKb5VY=;
        b=Gs9aM9AOUecq5dqc9ctKjOHY4EauHLfOfZh86BOcy/rXEp/dk+CHHq8QOdko5zOAHY
         obuzkGugSvGOrLvIyIbox0/kwISBfXkAro/zr6Bb7HN/jHrbpRAGoSjIgnExkBanCMJp
         OPXMs4Imx86NJH3Z/oxnkSV3TSHXzw8iXCIsy2MreJYZNxPpOJTSUVoB4ouRDgwumPv+
         fxtc9NeaaDqZ8MSJsGe9cOf37KEPXIEghwM4daVp6groFDLELaDZIGHnYTXpUkpUSvKu
         rLrXKDrzf2+L9YEdOyogYm1a8BQaWmIopRSvadUlM/nRrKL76pDizOHEHRh7phzFOHqj
         1kmQ==
X-Gm-Message-State: AOJu0YxxTxI3VSLXwccCn2ixvi5+hxT/HU8NAquboxZ6qKnf/3qCc9EO
	2ZDUxeybVAJvOZtddN7HpmhYNV0M+MM=
X-Google-Smtp-Source: AGHT+IExbeAxqIALAxJmE/ue5zAzU5s8ReKqJQmyS7cWuHm7IOwkJ5wzMTsjUpuxmMrPvht7WWq0eQ==
X-Received: by 2002:a17:902:ed11:b0:1d3:e7a4:a408 with SMTP id b17-20020a170902ed1100b001d3e7a4a408mr2874855pld.129.1703160939825;
        Thu, 21 Dec 2023 04:15:39 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c42:9a2:e324:6f2:6a5f:68f4])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090264c800b001d1cd7e4ad2sm1512812pli.125.2023.12.21.04.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 04:15:39 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	virendra thakur <virendrak@kpit.com>
Subject: [meta-oe][PATCH 1/2] opensc: Fix CVE-2023-40660
Date: Thu, 21 Dec 2023 17:45:08 +0530
Message-Id: <20231221121509.1880592-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 12:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107709

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


