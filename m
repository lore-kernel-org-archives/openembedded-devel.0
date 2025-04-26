Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA78C369D5
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.7358.1745668600902277545
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQVJ65lk;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so562502866b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668599; x=1746273399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNP7VQxH5Zmw/VvypAyiyvHKu4qT1b8xVfEyZ8jCFNI=;
        b=nQVJ65lkpbO31rMIkqxlJwGuENHhfOHvZf2KaFoQUgNQRMgFlbqkmlDx7sB3lsQiVD
         QrVOQ+T6mjxqQNjv8Rsk42Sh+8WsoicHTblknplR4PciRl2HL8l5jaYVfmwEdY9wKCxU
         HB6YTIljB6X4q8EddjJOqD4ZpLC1F3UR8NV2W5o4wfuAbnosAveoWAxaEYAmv9aRz5tC
         LAVTjjOZrj7J8M+kT7O2kVDwIRLlaWCQtYWavvtjWgWxgcKCYnTc+djTk4XGOvlw9a60
         kUs6epsMSbYnkacl89v+PGT2hbYvu6zxq6upljRqQlcUjcW7nF1imq8onWQtHZ2L1Utx
         Se2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668599; x=1746273399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNP7VQxH5Zmw/VvypAyiyvHKu4qT1b8xVfEyZ8jCFNI=;
        b=BlNDE60qgfVoLCB8OUhQ0fzhlA8hBH6E0tTbqWcGf7M1FsxhKz20n6WsZ30eEo1iqo
         rgsv7fF2qlPCzogrVdiN2emobN0sFjOXTHiaZP6XkRkJRx/5iI9asF0d3KwpwktKEwIz
         jbNxFlH4cAmNHVRa5vk36ZOsj/ouZYiW6JpyTJuDa2fAcrcbgORJV4QSIQk4ZT8R9EU3
         pnInMeF6wDClzq31GwJlQfNeymEqsSHZFkoxF/Q15PQJxKhTigJPwvgdVl4aBpeneFzr
         Qt6yx6iOTqOJUFzBq4C6/cSit0Kl6G6FUhFaXEAA9lZCf+3lc+TTGljgpj6jbNdaSfxr
         gOhQ==
X-Gm-Message-State: AOJu0Yx7fPo3RjIA1ws2IC+Wn7iLMIoVVc1WtSM5cIAAScsmmwoA0Z0O
	Wtyn+/d+nmXklLPztgIrVKJaBVS6fDMkyMYWknqtPJ8DUh3mtdYptKJa1DU8
X-Gm-Gg: ASbGncvJnj+/Qa1T+WWgsXXPIE1T2WV2pN73PKWE9huuJLA6ZC+0uF8vrO8M6i58YfQ
	OCv0o6zB2MTOkfrFj1fjlJZRVg/g1U4swX0klLL3UURg9QnKQRJmw9+4AJwt7vZHMyScUl0wI2W
	KxHtbgauN243PguE2CSfMm3gRaEPk+bJpGXEWqjt6YAMFE0TP3o+CPlKRdwbsoiJSlS3dZnyH11
	YB1fn3ZRAwlGDeikdTlyviqaX3BBL8ZQZobIPV/yZ2BE0rI4n35T2TCbQtldiOsZ/t69oyHaA9U
	4CeogxGGRAAWw6zpBBlqVy+IMhCPhxEvotFPqgXQfwtX1c53r6LuQ77mBrOzp5hJyjQzjFgftA=
	=
X-Google-Smtp-Source: AGHT+IHinpH/t44titfg2Ey1NcAgKK34kyLWaD5uiuMFep80Ac/7WtNcwrgXd2SKiKH1C2NIR9iaFA==
X-Received: by 2002:a17:907:9803:b0:ace:4fcf:702b with SMTP id a640c23a62f3a-ace8493cc4emr214138666b.28.1745668598926;
        Sat, 26 Apr 2025 04:56:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4e699esm279521566b.39.2025.04.26.04.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:38 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/8] python3-icu: upgrade to 2.15.2
Date: Sat, 26 Apr 2025 13:56:16 +0200
Message-ID: <20250426115623.2732743-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117142

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/{python3-icu_2.15.1.bb => python3-icu_2.15.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.15.1.bb => python3-icu_2.15.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.1.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-icu_2.15.1.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
index 462b9d1f55..77013330d8 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
@@ -10,7 +10,7 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "a9e6c3056668e3c75568da7172a7b0eb24727eb2892e8528b370faa122522f02"
+SRC_URI[sha256sum] = "561e77eedff17cec6839f26211f7a5ce3c071b776e8a0ec9d1207f46cbce598f"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 

