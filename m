Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B920C61DB3
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.96461.1674798884372085416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DIMcckHQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m11so3647060pji.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3zBRjazlwkDdJ1BQrd//sITmgiOW5QFmk7X/40pztk=;
        b=DIMcckHQWn0ld0tFPE7JieALNMTrr/yJr7DOhNDP78chjPRDnqu5WTu6MPFd+LnGbw
         GmGYCQQeW7deUqADymvrTBuHxxV8pIUfd+bblx/xt6dnLlr82w661oZJaIDxGNwhJHXh
         Q208Ytjhvl5jVTYtiO+UgPjY3ZS6JCcORe7mc5ef7SKx51jYh6gnf7bmeaWUHTq5xV+x
         ROx606d018181HTj6HDx2sSFW0SxwC/zsDPSoSgAMtFaDicSylQhz/WyoHT1TbyDAF7N
         NxiSZ8gElcymdMx6PC4rKy2nt2RKRThs/BL8UNJEC9TwrO+Icht6vCz4K+UQvSUhPidl
         CVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3zBRjazlwkDdJ1BQrd//sITmgiOW5QFmk7X/40pztk=;
        b=wQrwk+o3MLu7vQ304KMq2mV83zddaa1qHn0XXGdv13d3iZlt4YO3jACqwwI2SaxhBC
         bAgf7J+H6aQrV0MSPl2TFyuVWH+wC6xxTXLl55XRGBGzSZev2LRR/TAsiDxH2iCHekHg
         5C1iWr/mQKJuKQyirrAsGxLImA0tMjUm5tnr/TRtGfu85lZMx1FeMfckDqwzC4WcQjCx
         iAP2KiofNpXHfDHLjiCpDRYNQmx+z6Kmsgx5PAvA2hQ8xvFPWMe5nLNE2EEjUjep3Jp/
         8GZoDwO8NXNFUrODTF++ioELTK87iBYcS0JAeXox8/wQbF3Byd4LETN8YzsLXd4aUzvT
         bO5A==
X-Gm-Message-State: AFqh2kqv+ZajTYLrBYOY1smpo2DJ754FuLJcqEA9NY4A+SfGvrSO2CwP
	zRpUjfqgqJfO+kFQrYwzrhjDZnqNu96lKg==
X-Google-Smtp-Source: AMrXdXtkEEOxH7nT+Vs9R6IFHMW2bDKjoOQwP9qJ9dZiegnyMYnGFSXN3UpaRZ+E7b8/i6EG/FZqIQ==
X-Received: by 2002:a17:902:d888:b0:192:991f:d8e8 with SMTP id b8-20020a170902d88800b00192991fd8e8mr38688169plz.53.1674798883540;
        Thu, 26 Jan 2023 21:54:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/10] libwebsockets: Fix build with gcc13
Date: Thu, 26 Jan 2023 21:54:32 -0800
Message-Id: <20230127055440.2108933-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100806

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...int-mismatch-in-lws_tls_server_abort.patch | 32 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.2.bb      |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
new file mode 100644
index 0000000000..41d004d9ff
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch
@@ -0,0 +1,32 @@
+From 722e44cb5b74cae206f47a6dc0d985eba8ed1b2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 17:17:49 -0800
+Subject: [PATCH] Fix -Werror=enum-int-mismatch in
+ lws_tls_server_abort_connection()
+
+GCC 13 is findinf this function signature mismatch.
+
+../git/lib/tls/openssl/openssl-server.c:713:1: error: conflicting types for 'lws_tls_server_abort_connection' due to enum/integer mismatch; have 'int(struct lws *)' [-Werror=enum-int-mismatch]
+
+Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/2824]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/tls/openssl/openssl-server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/tls/openssl/openssl-server.c b/lib/tls/openssl/openssl-server.c
+index f2e77324f..43d65e030 100644
+--- a/lib/tls/openssl/openssl-server.c
++++ b/lib/tls/openssl/openssl-server.c
+@@ -699,7 +699,7 @@ lws_tls_server_new_nonblocking(struct lws *wsi, lws_sockfd_type accept_fd)
+ 	return 0;
+ }
+ 
+-int
++enum lws_ssl_capable_status
+ lws_tls_server_abort_connection(struct lws *wsi)
+ {
+ 	if (wsi->tls.use_ssl)
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index d401a187e2..67269b05af 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -7,7 +7,8 @@ DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
 SRCREV = "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
+           file://0001-Fix-Werror-enum-int-mismatch-in-lws_tls_server_abort.patch"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.39.1


