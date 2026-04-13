Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DEF34C60
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:59:51 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.274750.1776092389248132496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RV1Gw+mo;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso6306078c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776092388; x=1776697188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDNqnOzHi7jAJj3CZEiXtG+k4toJYZzsCSkK1h63uJE=;
        b=RV1Gw+moQ4XOrMQztOxf6lkHqFj/FhCDvH4eE0oX45kgB2XgHlsJxstggXIC9UjO/V
         QZgRxjFqU9OMC0u7Gklq1NkHTzTvYcKrDDsfM9Na3/RmF4Ri6RrC6mrWbXdSpZZf671G
         HfFJvZZf8+heLunZ9HGkBtVZQUykiE2e9MBqf3V/skFOEawIu4kyMVfXslcoV6SKWloI
         l4G4X5EbH9LZoiNZVsu7jAmRBz2QIKGzoISpmoAgLZ+vnBMezA5H3VjZPHpakbminOax
         2dH3v3BznVdWv9ukHk4ewkxt9e5pdMeh+7oWBBiNZwZFTnWC8j+j+woDl+bRK+tgzPRU
         5ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776092388; x=1776697188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDNqnOzHi7jAJj3CZEiXtG+k4toJYZzsCSkK1h63uJE=;
        b=KypZQQR8gDlCfuqaegsGwrhkmuGKe3Dgk1sTEcbmuW315fqwPXjcSg7M62psJYUXme
         OTBfzaO39SYHoiDChis1NzSUexI4yj/IrvR4DZXoUdG3XmZBEKWlcPQ6aLoDAh0EcynS
         hjHxXYQy493uhwPg69TIeO8P/otGDf7fBo3hIN7UZgY7jFUeqw0clw3SXTTlBZqfuF9N
         0I7+g3305ftmJyZiJiAgNU61DO9yaT+so8egBT9zbCjiQyQvDGCPHJcHTSp0bg9SiZZU
         yA4KgoWMhbALX29y/IMd0jo783pKzsLaB1ZGqxQKEmsrXCSQb3vsQ4jaeW8SvilIsVPj
         cFYg==
X-Gm-Message-State: AOJu0YyqH1dwifrw0wuN5wBKg4u4oy4WtggGQYTS8uEd4vsTOYJATiMy
	7akgKhbs3+XoOMvZIEO5ZO5RUz23+W50VfTfzpyXVjUxxtQe3s5X7JOprmuRvPya
X-Gm-Gg: AeBDies4CKcZ7gpe/cwwUrVjrDVG45JojpHu3e3w1wMt5KXnPJc3ziAGaCJQPMqYdyz
	7oXVIj8iNx5uLVvHgMR0r66lpwg8gWV7LUSjRF6Blsj2fs2EagerrivrXkz82g4y+sgHYbRpbvo
	J/MwEEXNI2JJwgrNQOF/e35WG60bYHlkFLHik3hYqmgShnWE8EfogHQDHmOY5aZ/pUMoKSqoYen
	+F+M4ecO3lugxBDN1DiH27Y09g3TY5uDMvR5f4TqMZrJTQ7aStnMY40TKjfhfQcdT7jgf7yD6At
	RhtXwwuDW2SeNlY7aB6cFMMcjRjuxUIpDtwuWNRGHaiM+uJB9ZTSxf6uV3Y931s2QY1KZ8yYe6F
	k2L2NcU9WNNVqrcICkyjcfs22Qw8/HOwM+1JivWjDfkLJqISI1LCmFaXJ8XlggQR/3oEDiIWB+U
	VNin3UQrqWeFBES2G7av/nGyKcXi+MrLQzl2bWHyTjlV7g74YMjZR9eVxG6FVNZ+VS8v2ejHyYW
	6JphYejzwu3pJrnpGfA3Sa5nlUrWmxvBSVuSm8dL6khm2pviaVxovPuaFhfL2IrT/fJGxXft6si
	AauEcnyT5UohVOEjFAMYa3tT+Whw0xZSzXJJHCC/
X-Received: by 2002:a05:7022:670a:b0:12b:f881:d8fb with SMTP id a92af1059eb24-12c34e3979dmr7715550c88.3.1776092388224;
        Mon, 13 Apr 2026 07:59:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm19322445eec.15.2026.04.13.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:59:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] keyutils: Fix build with lld linker
Date: Mon, 13 Apr 2026 07:59:44 -0700
Message-ID: <20260413145944.2207388-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 14:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126279

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
index 86f45656f6..2e7503cd42 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
@@ -44,6 +44,8 @@ EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_GLIBC_KEYERR=1 \
     "

+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 do_install () {
     oe_runmake DESTDIR=${D} install
 }

