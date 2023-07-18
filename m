Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D1EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 23:39:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2648.1689723566036345115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 16:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=H2ZRpKrL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-993a37b79e2so837180066b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 16:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689723564; x=1692315564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL24286ntq/vosKmahAJjonrDVJCJoxcSIP36tCt+ms=;
        b=H2ZRpKrL4Ak4WyEvTo9HpDijgPAbftXzlqlLJTVg/y/JrhEiXxSeR1ICoi4Sd9QKhR
         IusUhdnvFapY8HfqnkpLCFLyOdVR9VZ/x5n0vUQYpLFhoykt/tCnwL6JLhIa5+vv+HV+
         NO0hGMaTSkM0ybV9IWOGyA/uUzJcGBB3ji5lDiIOPYdIHFLcDedTVMZY5YUPnT4H0hBs
         oH4/nb4SgeTlydh8LCVaKpqdmXo3kwEYNXgcBhUPLXaA3vJ3S+msNqm+uKxEvGGFsoc5
         TSpxUc+e2P38QwWlzcAdVxhtiXJhmTQyosJNbUxB+0RVzs31pvNhXXAQy2hxhMqBseTN
         D2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689723564; x=1692315564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL24286ntq/vosKmahAJjonrDVJCJoxcSIP36tCt+ms=;
        b=WzIrIQaevFIUVEMcsqNzAF6a5cL5nmNJu/Mq4W5gVz7gem1Eyhc8EJqKr9snDRpHlw
         X1haRVtTRvHTTSv0Rril0g07YQGqZGxCUy6nV8ue7IEuNOeOSboDjNBO1VOQKgxr9MTu
         J4S7bYenSe4eGBnEmdh88q486K4qPaRO8/qAMtEdPi2VFg/s0YlrUX8I3/OqeJ8oTlXK
         FHoaHmaayWvBZ+UZ8K5d9+sT0fyspxNz0bArf6PFP41o5ZByFLBYE5LT1/34Jge9IsFJ
         98exj2+Ri9yAYfyTa8yHetJZ6WvIcf28T7XClcTW0bGKmqVqiGKa82ynaTbRbwT4sX02
         I23w==
X-Gm-Message-State: ABy/qLZzzC7uqkMbr8ITspGFfMjZ/KAcg1/tgWRUmsJLvKtmieGNPC7P
	cV06j9N19Nf6ns9pcKDbZzOiPt265jg=
X-Google-Smtp-Source: APBJJlFsOJGz2WK7s/YA2HnjtAMc2eKj3N1TlfBFnyIVsuwDcKs4OS1IhVAjTQevXYSNbSgADMZTwQ==
X-Received: by 2002:a17:906:10dd:b0:991:e458:d14 with SMTP id v29-20020a17090610dd00b00991e4580d14mr876176ejv.34.1689723564172;
        Tue, 18 Jul 2023 16:39:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906549000b00992b50fbbe9sm1574980ejo.90.2023.07.18.16.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 16:39:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv3 2/3] libtomcrypt: backport a fix for CVE-2019-17362
Date: Wed, 19 Jul 2023 01:38:39 +0200
Message-ID: <20230718233840.2461756-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718233840.2461756-1-Martin.Jansa@gmail.com>
References: <20230718233840.2461756-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103952

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v3: no change, just to send v3 of whole series

 .../libtomcrypt/CVE-2019-17362.patch          | 25 +++++++++++++++++++
 .../libtomcrypt/libtomcrypt_1.18.2.bb         |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libtomcrypt/libtomcrypt/CVE-2019-17362.patch

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt/CVE-2019-17362.patch b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt/CVE-2019-17362.patch
new file mode 100644
index 0000000000..8b7348a11f
--- /dev/null
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt/CVE-2019-17362.patch
@@ -0,0 +1,25 @@
+From 25c26a3b7a9ad8192ccc923e15cf62bf0108ef94 Mon Sep 17 00:00:00 2001
+From: werew <werew@ret2libc.com>
+Date: Thu, 3 Oct 2019 19:57:10 +0200
+Subject: [PATCH] Fixes #507
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libtom/libtomcrypt/commit/64d1153e5a515740ab56f39c46baf4cf6991a9d3]
+
+ src/pk/asn1/der/utf8/der_decode_utf8_string.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pk/asn1/der/utf8/der_decode_utf8_string.c b/src/pk/asn1/der/utf8/der_decode_utf8_string.c
+index 94555b99f..d3ed82bea 100644
+--- a/src/pk/asn1/der/utf8/der_decode_utf8_string.c
++++ b/src/pk/asn1/der/utf8/der_decode_utf8_string.c
+@@ -65,7 +65,7 @@ int der_decode_utf8_string(const unsigned char *in,  unsigned long inlen,
+       /* count number of bytes */
+       for (z = 0; (tmp & 0x80) && (z <= 4); z++, tmp = (tmp << 1) & 0xFF);
+ 
+-      if (z > 4 || (x + (z - 1) > inlen)) {
++      if (z == 1 || z > 4 || (x + (z - 1) > inlen)) {
+          return CRYPT_INVALID_PACKET;
+       }
+ 
diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index b144338921..8b73cdda85 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71baacc459522324ef3e2b9e052e8180"
 
 DEPENDS += "libtool-cross"
 
-SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master \
+   file://CVE-2019-17362.patch \
+"
 
 SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
 

