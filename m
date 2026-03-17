Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A163CFD8779
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:02:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76672.1773756151735084943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DS08vywr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9789425fc5so109441466b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773756150; x=1774360950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JH+KAv0T5Brnpm2ZE4TwNc9EAb69IXsx4DaYjGCXHUE=;
        b=DS08vywr33A6h9UOm91V+BRl9094X1PHdPhLmZk+JwE9H+RPy43vHRPZ6782s5M/wi
         yaPiW8RY3Ia2gV8G/RGjg0mwdWJYuGqlKYu4meEqRBzLgEbf+dSv/64uTStpg1kpg7vT
         pUhNgUQAOhio1FOWI+PXSkWpl/Qr50p/wKJ6u95g94Z9lqNwYuo8ogWfaJR+CS9amUFm
         so7TlYZDI+ZkoX3i/gs43turWt57AJfjdVKKj/ehqwmh2SKWCNvJjglqhGfL5mD+3x86
         lPOc8amVMIfoHo1PI+CUJGiKE5BnvKzfMe/te6pz+ajBzARlWJmBRoP5+W9I0Rv5zO7K
         lGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756150; x=1774360950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH+KAv0T5Brnpm2ZE4TwNc9EAb69IXsx4DaYjGCXHUE=;
        b=gaA/BJNn+C9RyFHr5Ydp7S2pqU6ATuujS8xSlMb8Op7AQGMjtcuSmbTKsHZPoPOmGQ
         q0iwI2Aifs1BKmHO8sZodyp+q3dpwaZBiknUIpXNf6ap9qBKnRCB3ldtdDfTFVglr206
         ZQX7J+Mp12xesnRnTQXNoKm0WHta34Y7ki4kjGi9jc5E39nyleBF46CTqj+ImsY6Mofu
         lbbUcxIg0Cncirou3womSU7m9y9R7Vvunkna3huFT/ievvrd41U5/tLOpv2IcXEri3dr
         /OVeJ3kl0i+hm8hkJycfr0CSmycdttrg9h2rfPyst9VEQrhldtrVpc14F1WVHasrrSTJ
         me8g==
X-Gm-Message-State: AOJu0Yx3CucachN616mZ6MqwKhkyVkqJKDW8tGUhA80c4vLv9hAfnH6I
	v0rPFGqUPZcEDSt9Tca9wXmSpQdXPPGYW1E6a7d6q8USoHnIlDjUe8HXzKYCTg==
X-Gm-Gg: ATEYQzykf54JVOaFi5/mxzGPyxGdUNf/eNslIfKPS+xjki8+fzf7QDoDgEXyG+kpKXQ
	BIH6bpOspdZgMNaYcNKJG/f7xdI1XDtUDlzbfmrHQd3g/bTkAHzYyoUxvGYfelgMbqTRnV+0phz
	IqWAraiB1BTaJjm1CNLSlfeSTC6feYM53X9FvGA3rNlGpPjQUawis6ks9Q2l+SHbEuWmSHBuzFp
	+D9VTE/AwpsqyWaB65fzKW1GsENrYXrULum1DylU3LYGQSHrbO+YK3d6moRqPpXj1z7VlPM8nWp
	/Ng0sbsOlNJYvAy3OBKm+wXVVjvB7u2STj/pYKiIrehGVJPpYptKaIAUx3Ep8hJ/45IaxL+hyc6
	lL4lWa8aB68sl/gqSYBD/L7D6Fgd8MZtPs4M2YimHJp46Pjnj98gMroXcT6Ofp2ZXNj6m5qh5SE
	EroiXKYO22GwgNOYWsrlykniqkSYHaTnE=
X-Received: by 2002:a17:906:4fcd:b0:b97:c068:555e with SMTP id a640c23a62f3a-b97d6c11d30mr243573466b.1.1773756147359;
        Tue, 17 Mar 2026 07:02:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9360866f8f.34.2026.03.17.07.02.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] freerdp3: upgrade 3.23.0 -> 3.24.0
Date: Tue, 17 Mar 2026 15:02:25 +0100
Message-ID: <20260317140225.2522171-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 14:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125315

Contains many bugfixes and CVE fixes:
https://github.com/FreeRDP/FreeRDP/releases/tag/3.24.0

Added build option to use internal rc4 and md4 ciphers: this is due
to a recent change in oe-core. OpenSSL's legacy ciphers (like RC4 and MD4)
are now disabled by default (with 'legacy' PACKAGECONFIG), however
FreeRDP3 relies on them.
To ensure that the required ciphers are available, build the
recipe with this ciphers' internal implementations instead of
expecting OpenSSL to support them.

Ptests passed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix typo in commit message: "not disabled" -> "now disabled"

 .../freerdp/{freerdp3_3.23.0.bb => freerdp3_3.24.0.bb}        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.23.0.bb => freerdp3_3.24.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb
index 52ec74d5d7..3c0fed5dc4 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "b933ae18d9ad2a1d73c610868fcc30eb61654070"
+SRCREV = "b00402d3258402c868224b6ffed04182cbed78d9"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 
@@ -39,6 +39,8 @@ EXTRA_OECMAKE = " \
     -DWITH_SAMPLE=OFF \
     -DWITH_CAIRO=ON \
     -DWITH_MANPAGES=OFF \
+    -DWITH_INTERNAL_RC4=ON \
+    -DWITH_INTERNAL_MD4=ON \
  "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"

