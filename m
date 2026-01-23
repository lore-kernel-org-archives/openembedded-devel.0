Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80CAD74EED
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:49:19 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1150.1769183355581779580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 07:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jN5WENls;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b879d5c1526so465567966b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183354; x=1769788154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMj7Wl8bm1hTDyuOFJdrcCZNq/CtBQSmIjQNBAickGQ=;
        b=jN5WENlsaqbw0zzXC2ZsiUpILmeWogQNFQ9RMTu9XqXEEAedNf9HU/NPmjKCEWMtX2
         IB7upRW9soYyrfxijjK9vcLaamDTTyLeQNBPpq2Ghmq5CN/+f8eGUjtkhl/lS/B/VQMK
         WxjZ5/MKRJeuLc9mR+NeXcUg/25LJfUDLqer5Il1bOdHmRg9bFskKP8w+ft0mP9qpr6h
         nrW8ZTUtgS6IlyFtipZ6uX3acb2a/FvL8s6v5mixh7TbQLo60Mty/O+uaewjSzqWlXgo
         c9Wk89wuLpcPD36hZqN7gaJRJOEbWA8SPtworRGF90ysSJoClC5eLGPi4bGy3nLFE48m
         2cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183354; x=1769788154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMj7Wl8bm1hTDyuOFJdrcCZNq/CtBQSmIjQNBAickGQ=;
        b=gz7od3QxiIu+O6Tg4se3HUQYv4OdEorts0o6PQbP0ilRsAxxv5vZy5eKzhargh/UWJ
         tlwTXRl4NzqASCKKT1sDT4Y4EcaGQWVdO3BgwFqX0Fugin7WX+DQljLj3isN3LHYgMEq
         y7wJHQoY/QMoRi0ky+c0uElraeLhwMRcl8UHI0pSv+Bj5FBllHQN4o8QMO8pugcp8oYy
         UhVPcFrmzFkAEnJr9GGPaHQWpq0NPVjOGsoBgUTP/OHce1vYurxtud0E0fzD+CdS/Lfx
         2cX8cfrCQH5qfiNT9JEuasyXyuIxGUpGCEqNm/Braq+TW9WJI3KfA73qfBvuef0w8ABf
         ydBw==
X-Gm-Message-State: AOJu0Yy9atdMsLiYOnonQbDaQX7Gn2up7t0gYW3DVWuFcJwveIVGWbvs
	UQLBuT/ykUqm8KJBavcHIs5ayU7nwgr5fGKSXALwvQH/4j7eNOhaFajMecPQAA==
X-Gm-Gg: AZuq6aJ2xiX4a4p8BbbHtyiSQ+YcFaF7CzWE8mavErlaP7kAw8uRWftUE6FnmIXrgVE
	hmWeb9gwAfb5bkFTU7Aj4O7sihlDTJY39dWpLxo7cfYG7EuOOmUl5Te7c1TQV7YGA6jEe3jrsEF
	ndJWngbtSDncPk6OICl9tB/yXIevT0IlB02ezPX4FaallozQYGcHfRO0985a2XqKRmvY8KiDs1G
	1/kCPKBhDDukFTfTh8ARTh/WvuNALbxeR9EZevWWimlxb1nDPJiC/YIOE14dCUbAonwXkH9EnGj
	JmRsMLeVv+7JmcK4vCszJZgTc36/9b0FG1IVFJ6EjsNhiNpJOx0qeCNo9BQ7zM2cFPEaAh9a+iB
	aOnkWnmH29puWy719OdIuxfGAFK67fkqxC+X+GFJ39iqWjpKneAzrAFDVdX2FDRl2b1kFc83896
	umG2nWdSyrFu83hjIV49KqQmzK31fIUQpKBdp/untIcZ/owNt0hPi43jnk+j5L4exwEuZ8OFg0J
	Ck=
X-Received: by 2002:a17:907:7b88:b0:b87:7485:b4bf with SMTP id a640c23a62f3a-b885a821dfemr260236566b.0.1769183353812;
        Fri, 23 Jan 2026 07:49:13 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b96d6besm1077080a12.30.2026.01.23.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:49:13 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v1 1/2] cjose: Add recipe at 0.6.2.4
Date: Fri, 23 Jan 2026 16:48:42 +0100
Message-ID: <20260123154842.1635662-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123154842.1635662-2-frederikbraendstrup@gmail.com>
References: <20260123154842.1635662-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 15:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123784

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
new file mode 100644
index 0000000000..f6a5d15a9b
--- /dev/null
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "C library implementing the Javascript Object Signing and Encryption (JOSE)"
+HOMEPAGE = "https://github.com/OpenIDC/cjose"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
+
+SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
+
+PV = "0.6.2.4"
+SRCREV = "8d94c3ad3237ab6a83d2e92fa541542b1b92c023"
+
+DEPENDS = "openssl libcheck jansson"
+
+inherit pkgconfig autotools
+
-- 
2.52.0


