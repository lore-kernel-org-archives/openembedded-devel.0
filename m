Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB0FD8778
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:59:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76631.1773755980270912725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 06:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CTFybmr4;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b43f5990dso1407279f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755978; x=1774360778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9BaSMZEjH6c+mq76CdVckS0LF0k0xBkci7XprAOfR8=;
        b=CTFybmr4H8iivI1Yjmds+kwFpKR8o4cCxBi+wzZ0KX+/FS4bJQDJZ7YZUgR1/9oRwn
         KdXtEQz4/Dv69TV9pVvMIrXdZ3OFU4QbmkmC1OFZiEbN+HlL8CxgWDeB2F941ZCac4U4
         lFT2cpKEGJjSs9Fen1vTUvrZbh6y0jy83Rzua3XDXESdu7LDJtAmI18GUDfgiiE5xKOw
         MkUa+/D3Cj2n+R9slAYT/KfsA1NhAaYEddUgeFyC7M4z/0JhaH7RVao1j8mAQ6CvJkkU
         AW8mHY5inLhOW1ldXWgPMH9EkCFS77YasosaHujdu7ezqRsgn7YQmtsxiPw+rMWJ3/Ii
         7Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755978; x=1774360778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9BaSMZEjH6c+mq76CdVckS0LF0k0xBkci7XprAOfR8=;
        b=QxaPkVnqT7kibZ2SFgDS9Z454MDTTYemI+3N7jYlK5ysKj6srORvb/i2CnQEsGOJcz
         UpOyl74iePlhZAWwTGjohyLf6OaginEPOl5J6vUXZoUX2kuuoVkeeaGx9m4NhCERUjlr
         Ou5XOye3zs5idqhIRp3lo/bAveydpEBVKu9qJcZfq2iv77JaV+hPLWoi5IIWHiwdAwaz
         oK0lz5a7dt1hJNHPsfjqk4ndihqwOoLMwMERlqFcw+kzRrFNXfH3yiVQAqxJi1L4xuPN
         vgp7Uf4T84huj7H3EoRhjQ3yi+ec8eGHrrhJw6Nk3d/+KA+l7+uDYU6pCGMFFrGdgqEs
         wkjw==
X-Gm-Message-State: AOJu0Yx3FlzyjFC7blo3qOlD9JcIquy0L2ufX2gxEZzbUvUJNxwKm1TK
	my6+FBSvkMp6DnmDGLZ6OmKRXNeJl3nzKbeoJREqk9XHlzsP5Cey40/2WqBZOw==
X-Gm-Gg: ATEYQzwioB0XBQ0WCMg9B1YwRbIiRX2cgihyXejJfCQo0Zun5dDZozDIuYOQWLAx61E
	+8MPFC5sQMKys3ta+V56YP3t3pmDobEzsJFARXegyUJxe2C0QswyFMQnzwfK6SA9u4XWjRmuI87
	UEWmZ2gx5n8us/0LyQmhz4R89hT7PsTZkaYjjXtoWDMjTHSleVU+OLejQbbxfZLIEG9dCuW5vW4
	PxTsvsRHaIbHtMo767/0LqrBlRspSCz7DlRNZHtJNbqAhVhmMa+R2zXPzh/WcatG9UfIEcWvAeh
	/8UDkD1t8z9dhZe/Z6cKIyHimCyBZENKUEExtkweUYsqXWQX4ZINGqxWBURSDdLUma0QQFsMfhM
	4ip4js79N2oArClEtUm5UlxQ2k5stAlo71KXFEVWPIwpzWa/5bQPdtRR5XkrqDgZzqGAYZuXWO0
	bMhkBTLqRgIXJlQXW7BF8s
X-Received: by 2002:a05:6000:2386:b0:43b:4d25:95a8 with SMTP id ffacd0b85a97d-43b4d259700mr4335554f8f.33.1773755978370;
        Tue, 17 Mar 2026 06:59:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm57141054f8f.27.2026.03.17.06.59.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:59:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] freerdp3: upgrade 3.23.0 -> 3.24.0
Date: Tue, 17 Mar 2026 14:59:37 +0100
Message-ID: <20260317135937.2521898-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 13:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125314

Contains many bugfixes and CVE fixes:
https://github.com/FreeRDP/FreeRDP/releases/tag/3.24.0

Added build option to use internal rc4 and md4 ciphers: this is due
to a recent change in oe-core. OpenSSL's legacy ciphers (like RC4 and MD4)
are not disabled by default (with 'legacy' PACKAGECONFIG), however
FreeRDP3 relies on them.
To ensure that the required ciphers are available, build the
recipe with this ciphers' internal implementations instead of
expecting OpenSSL to support them.

Ptests passed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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

