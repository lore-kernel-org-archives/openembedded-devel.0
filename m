Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14235CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:59:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26541.1762891143903158194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 11:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGs1qdoL;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b312a086eso28322f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 11:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762891142; x=1763495942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDNkVqo66cYJLzKdLq+qOfjzPdcRwfHXuvWfIau0lR0=;
        b=JGs1qdoLQ4rDOltiDRjKEP2iszBL7vNC67yqLsGpLQ1WYFA3dyb3+Z9ly0+hgSxzSC
         9Gl2lMG3rD4mt2Cy83zYRCOy1wQd1boer0pZKg88QVcQGqNz3YepQoJ9OxMnxZ2V6gw0
         mz5YTpbgsZ6h+enRh4jnFnB4rjrAU40rOHDNBD9GWF8k8kyO9FjLCz8jUKwwVgJ43UoY
         ulwvoAeiME67fKHjGxKprZ4zzp4FCpr5tVh3TImETYtp0YpD2wN28dAAdpZxBKe4Cy+V
         0DeJRI9G5kU+WWWhqlhJOoFitkgChklGflLUriVBqALiQJ2Zj/ADBPodLgS72I+vTZb3
         2HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762891142; x=1763495942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDNkVqo66cYJLzKdLq+qOfjzPdcRwfHXuvWfIau0lR0=;
        b=twaJDBzxce/1l48T1I+fZ6MGDiE4sQ0sDiJcuLa5Hea7sWFGUG7lw347EWK2ijNjJd
         GgxgYqX2kx6WCbPLMkqrBjqBw7k7r+8iFdGZgdq6m078sJatCek1jTDKJf1TFsIEX1JI
         ZVJbDZSga6fnDKfAlUDN+2poUB2LgGuFrr+DiUKWNe9na4RZ+L8+4rwSEpKHiwux/P+w
         TlZ4BeBWhzRegGurYz8EFf/0H0GvkYqGLMsw+RMPqCg92NvwM5mk9vRol0YdF6lo8i1H
         cJlAgKZf0FlTfm4JsqZc/RnkUNLWGZEkByFuQRIVIzc6ievu2BrHhAopkGN6rJsDHrX2
         2/wQ==
X-Gm-Message-State: AOJu0YzzSgSWWDVal54PfLMkYPd56Bo7oz0CmlnPS1cXRVAu3z6Zks+n
	+n4Avr5nDurE65FIr+TRuSu0+MQXzxBzBJ8/b2thGVzxwvoY/Mczkn3mOHECNACM
X-Gm-Gg: ASbGncuUNmb81yJpQQZswLS4ivwevJ6gWauoOmmRiQdcx8fduzar8dprWW+d2MPYE3p
	11P3UEyEttWZf3x8aVXC7Jr/g1oibspiZ0oFx59epkfTxGxvv7SFaXYmtTkHgo8EYKocdsnUhV+
	deS/v7ecdRfNbrwkjeek4eCtr0aH++7NPAUzzebPLLS062b74+WpofZkupYaS76eu70rxs0NNPe
	ao6op/1WrEXIga1/8m18qpAo/vs8FNifrSi7X4C9Kh3pAs4S+TeS8dIhBfPOoNRfDXFSc1fDVJG
	xn8DilAPisACbOfp0xzKTqht+YlYPtK431tLxNeoDJKovyNo76onYDQcamubeWfgYIXKsw4g0eN
	HLzOZssauAoqXp1DuwTAYPgBm54v9zClzBK+Hk/23azR4eYOsYhHR+pqKQuzm7ggKYzr78H88OU
	uK3CpDM+/y
X-Google-Smtp-Source: AGHT+IFRfU0CIk0i7MtnWm0uD5Fkxc7x/xxECMokzf1NeXffBU6MOJ93d/JzV7P7aISzhG9sxGYgJQ==
X-Received: by 2002:a5d:5d87:0:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-42b4bdd6b09mr305859f8f.58.1762891142003;
        Tue, 11 Nov 2025 11:59:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b29e4b9bdsm26348194f8f.32.2025.11.11.11.59.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:59:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH v2] mbedtls: update SRC_URI branch
Date: Tue, 11 Nov 2025 20:59:00 +0100
Message-ID: <20251111195900.3250280-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 19:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121524

Branch was renamed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f60db58ea4fc9f24ddcecb2dd2b046c332f9a6ba)

Adapted to Scarthgap (removed tag from SRC_URI).
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Cherry pick it from master branch instead of a local branch.

 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index 610fd0af5e..62e6c90f63 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -24,7 +24,7 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
            file://run-ptest \
           "
 

