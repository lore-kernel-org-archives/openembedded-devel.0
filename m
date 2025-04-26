Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277DEC369DE
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7491.1745668602861335263
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+rpAMn8;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6072903a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668601; x=1746273401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrHLDW3cKD0hYEDzn6QbrvUnuBfj9ZfXRcdhJZB8298=;
        b=Z+rpAMn8dfwT+hBvj0d5pVhM6UqmvanXz04PvwxkjJuC6td7hJUMWnGkONYgX2aCRZ
         02cKqJJnB1Janm3lNKd2Rop2fKcDJcmAVH9NNb09++mVwJOjtag0HmcVW1Rd4//lPpkp
         UHB3sziz4A4pBaWZQIVZf031tFd38OykaRlye85m12G9RR3EA1H5dCxhHFBobD4KxuEt
         L4OPsOiGtoCwwpWYaKYtceaNRPhfixqEHdtG4hejCnDA1BbgfjLIGOyuTkfU5AfRCxJv
         wJOOcWKDM5tWSQup2dvYeg2sh2/snA0UqWCU4oPKsIbnpDTIJZK/Tyza64caYVkaXPRx
         bnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668601; x=1746273401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrHLDW3cKD0hYEDzn6QbrvUnuBfj9ZfXRcdhJZB8298=;
        b=ajn3RF62M8vtxluzVdyfHQfumxS+cbl+WqQ+JwKJmouSJsyafHC1r7Vy1O/CwNMg3J
         LetljcMN0gFmsLcO4KD1Oh4ii9UXTjdVVFo7c3Ftz0EDmCnmxdFQqOALeS3K2bSHUU3G
         gb7xhAi3xxSo0ysk9siT+YRQn+Aqs7c1fWP9LMI7tN1FLOKRXp+L0ZBhAQVKHOql8U9g
         OOlUnTuxDlJnuHq8XxwzUS5FHvwwHdY4fAtLzIFXlfI2YxBITpvSSoz5HwyVqdktEwel
         4iU0cxzII/gUWqLNA0pFMVHInQtiv7Y2mV/zA6eard7Dx4iqHB+RFG/b16ZeaqS6/Obn
         r6Xg==
X-Gm-Message-State: AOJu0Yy5QZQkoZmcw1xAXydUwxQ6zU7tkTykln6Ztyoks4YodZvXDhyE
	m0sDxfFGeWWPWloVBTX8v78vKPeXjr2mqJn0dItywmPMh7fyIWsDnc5X5B5A
X-Gm-Gg: ASbGnctCI5BYK1HOVCWTH9pK9GnLZDMgUhkkxCABDng9BnCz8KE0gav1dYMknn0bLKQ
	lJo+p/ydkdSWYRvA+jVd1Tl4IDcaCHKMhXJU2dQjoivgz7Vzb9OcJPQFv/Y2xXHNGo95mXXvYEW
	jUe6/Og/diG3lCblMGpAxSjxpBwkjjRCdUbs9auRmiT8KFE0pdCheYMN0/aYvzZeRN8BukNhNKo
	hpH6Y/8o/benzQZqiCc80jLvcIptM+Wq9SeucUu8CuxiF9sAlekM9pLeiIxWCRL37eekssVcWnm
	cKNjL99hWKuXCigTarsAo9BjlLcOLJ2jBw36Qr6aCIQTxqEFOmS2/KxRgdoCqOfCfBUCktyzcvz
	JJZS/+3xX
X-Google-Smtp-Source: AGHT+IGi0a1RTM0V8WvFRSDOnAQQYgys04tU1zNg4bj0L26+hF7QfLrMmUC1pKGSWzoWTt97ND3gEg==
X-Received: by 2002:a05:6402:26d2:b0:5f6:fa4b:8a6 with SMTP id 4fb4d7f45d1cf-5f72297d60amr4694919a12.17.1745668600994;
        Sat, 26 Apr 2025 04:56:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f70354514csm2527774a12.52.2025.04.26.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:40 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/8] proftpd: upgrade to 1.3.9 to fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:18 +0200
Message-ID: <20250426115623.2732743-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117144

From: Martin Jansa <martin.jansa@gmail.com>

* fixed in:
  https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../proftpd/{proftpd_1.3.8c.bb => proftpd_1.3.9.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.8c.bb => proftpd_1.3.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
index def5ca623f..c6782fcdd3 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "30eef4d42d9efbc4aafada28130abca993af99a2"
-BRANCH = "1.3.8"
+SRCREV = "ae25959adb05ae1d6ebfa1f36bf778c9c34e9410"
+BRANCH = "${PV}"
 
-SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https \
+SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
            file://basic.conf.patch \
            file://proftpd-basic.init \
            file://default \

