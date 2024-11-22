Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC90CE65D2B
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:30:33 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.17414.1732249827778281476
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7/Zvh1Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fbc29b3145so829763a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732249827; x=1732854627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6N660fF3EsXcff6grMC9hgjRO1I0Q1k7Z8gq8RynWg=;
        b=b7/Zvh1YAfMzLb3x+D0HATDsLXlbYJ8Tt0AZWb0dergxLNJOJy5Vl/DigUpxZXa+FA
         6qZzm4MFkJi2zT6EmEPT9uYLcLfGi78KEtcEoz7Bs5ybFaK8KoHDbmkI/Z5rko9nTq3D
         3tpddTQo9jIxbTpwONbDuvxwPP8zXEWxS77z+SQXP1apmvNK+vcskchWSsl1u9OofeQx
         8AhigpXutxWdT28UKHBAnVtTSXXloAJ5e1Gu+FEeP4v9cPyntMyw1v12HMOp3DXhmoF0
         /7xrqxpD6z4VoZ52gjjZb0h6BNLTaoSEzfM23broMy+cO51jt/5iS6bJvf3YWrv2lmXI
         6mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732249827; x=1732854627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6N660fF3EsXcff6grMC9hgjRO1I0Q1k7Z8gq8RynWg=;
        b=nahY3GeXjg/c21KATWlUFLEUZ1UsrsiOfhVd01YHSZP6468O1SwjJ222ZpjKZpspUa
         Tydmr273vQqQ6sQnPsj026Ts6nB3naZuyQhr3oLA9/G2JcmumS+MaYn6pPA9FmwXQSE4
         5X8XB8d69DaZtVpyCuhCPVIxie+DTfOm0PqpPam4ypVXw4pmwTB54e3Cl41kx5X8PP6O
         pUbJfjMZQx/rCsDXSewn1IFIze/1LFpoLCC61xubwahzfIHQAnXQxLaRt6jNOB5ISFUW
         pR4/fL2pZLRDZHTCna4C/mw3nmn+fzGXxNn6SuG6QAzRXwFH4EC0aHLnn6lUTTldAF7V
         og8w==
X-Gm-Message-State: AOJu0YyZgTJwBZIAfkd2crdoYLeiDVGDvxxce0CTa2qBKPipw3QYeZoR
	ZKoXycEyiZ1G8sSJk2vmcibx/TiDY2gzn4Mojv15L/ydT9rtCUQethTdxg==
X-Gm-Gg: ASbGncvkLFnSxBL7q+/wfrPhEDQ5DS27fN0IbwpA9MROvh75dmaADPFrbZ2IYqA2viU
	m0/ZF1KHJuTzZtTiGBWdj7OiGduQn0kqnT72V1AKWzVhZ/F81GlywCgGA1NgD46XukEijcreUhP
	zp/zTo5UMsr9HwIGwTfoLydujg8fbbwYVuyCfmEjIOZCx0x9VzjFvTiiEoVKj5zWQCABIPMVAfo
	726wIAJ53rEMEkrgoxsDsxHwdYt8+Pu2axcoczOFo8f0lnmoCc=
X-Google-Smtp-Source: AGHT+IEvN3Ruf/1KqgzjsUzomGHABSbfe6W1QDles7EyKYqlgqLmG9LXKgfkbJxxhDWchiMBmKwW0A==
X-Received: by 2002:a05:6a20:a11c:b0:1d4:f7b7:f20 with SMTP id adf61e73a8af0-1dfacc25849mr9846315637.21.1732249826727;
        Thu, 21 Nov 2024 20:30:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc41b4c2sm634803a12.82.2024.11.21.20.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:30:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-marshmallow: Add missing rdep on tzdata module
Date: Thu, 21 Nov 2024 20:30:24 -0800
Message-ID: <20241122043024.833546-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113988

Fixes

{'python3-marshmallow': 'START: ptest-runner\n'
                        '2024-11-22T04:11\n'
                        'ImportError while loading conftest '
                        "'/usr/lib/python3-marshmallow/ptest/tests/conftest.py'.\n"
                        'tests/conftest.py:5: in <module>\n'
                        '    from tests.base import Blog, User, UserSchema\n'
                        'tests/base.py:14: in <module>\n'
                        '    central = ZoneInfo("America/Chicago")\n'
                        '../../python3.13/zoneinfo/_common.py:24: in '
                        'load_tzdata\n'
                        '    raise ZoneInfoNotFoundError(f"No time zone found '
                        'with key {key}")\n'
                        "E   zoneinfo._common.ZoneInfoNotFoundError: 'No time "
                        "zone found with key America/Chicago'\n"
                        '\n'
                        'ERROR: Exit status is 4\n'
                        'DURATION: 1\n'}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-marshmallow_3.23.1.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
index 0ea6424f34..964e32c10f 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-simplejson \
         python3-unittest-automake-output \
         python3-zoneinfo \
+        python3-tzdata \
 "
 
 do_install_ptest() {

