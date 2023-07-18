Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCEBC001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:10:19 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.5909.1689682214105208671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OLCrTAYv;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-992b2249d82so793759966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689682212; x=1692274212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTaC8jciu4/IHnlt9JVPeuExOBdj5P2+Pb3QyDNRLqk=;
        b=OLCrTAYvC7iMDn4yId5Rt78wpjI0arqR65JjUjbE9yPxY2AQCnKrxlup9puL3bYejO
         HmnurP7PruAfKhW67xeMDJkZ2IIOg9q49+wx93FxSnFJaNbUQ3niXp9RN5Q4NRvqN7vH
         FuBjbL3mb0DtnZYKtD3FCoenGWUmFPt54R7BsuG4n4jPIyS3JKyfEALcWtruwQRadDX3
         lxFQd0ixZTxlS8r/pidnD/vJMGSg9nulMn5brgeXqNXH+/isp8i0OhOd3gmyRdtDzbB0
         k5CWlTO6IgCugqhTXVPWjEKHbCUJPrYGYMBtn42HyjBWscaM+7tkUa3igz5Txp2TFdk/
         DSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689682212; x=1692274212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTaC8jciu4/IHnlt9JVPeuExOBdj5P2+Pb3QyDNRLqk=;
        b=T5wRD9p7eeUqULoeMiKZmYS3MfSnLphRfNhdbNK8qQNxrJcNTsD4NuF712oadXoOLy
         C39GcFNVWFU56Zd/Ub7EYN4a/oOtISjPfKBzzeqntDuhNEpjL7hXDdvQynjX1JA+/lDr
         Uv25Q/ZtNtkFTBAFhLl9mGud2LoyjuTR+NQy5z9lrZQwMht+2AoWHE+uqoqvYqS8m1Qd
         in1mMN1yDtbqC0PQEhnT4OFljYUnKhd0TKhcSjgExtkC9XU7nJZZDUt3/wpXpn+NtF5x
         imrF6gTtSN8MV9QQP1OBkGIuvkgzZNUsp+POkfq/j3s+3M3nC8mnQWfl+iwjfHRWtyld
         Mn6w==
X-Gm-Message-State: ABy/qLZtv6KCse5IxdbYG6SDd+6gj0GIihl9Iuj8UHeB7l8HfH96Cvar
	m8OIacms3mI+e06MEd1r+tUpyYdG21Y=
X-Google-Smtp-Source: APBJJlHZgpSu47uaLw2HwQU9uwRL5JXuF/xoTldW9KCaAumk3W9OAV95454xGhv4/8FY3JVJkjd7MA==
X-Received: by 2002:a17:906:64d6:b0:997:8a65:1cf8 with SMTP id p22-20020a17090664d600b009978a651cf8mr7746921ejn.8.1689682212386;
        Tue, 18 Jul 2023 05:10:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r4-20020a170906c28400b0098921e1b064sm944144ejz.181.2023.07.18.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:10:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] libtomcrypt: backport a fix for CVE-2019-17362
Date: Tue, 18 Jul 2023 14:09:37 +0200
Message-ID: <20230718120938.2048623-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718120938.2048623-1-Martin.Jansa@gmail.com>
References: <20230718120938.2048623-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 12:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103941

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
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
 
-- 
2.41.0


