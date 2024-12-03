Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B30CE69EA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 15:27:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.22759.1733239615997060708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 07:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SseuyDvO;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385ea29eee1so2117981f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 07:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733239614; x=1733844414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKCEsVulouu4z7vHkypS7ufYPZV473W+2BGAwvDGZ54=;
        b=SseuyDvOO1cDRkZQShyeCxvss2gwtjHG/WTF4EacyKGJGfMnEaAmAIGym+Cmrrmc92
         MuSpPCMaou1PXLOJ00o11JJi+BhQD+PmlmuSOif6mYMoHktJ/yZaVEERpzyn1hYEyu1d
         v38vKWF21d4Kn6K+VxN1kKOAxhW1V67oK1x8D4/btgfWoHSvuyaDFXIj5Gdg/fqVkgxs
         iKkwSFOlfmy2/1ZTr1ucQD8PKkIGYmCrk3NPsNYTdXOadDECtNhUTLmLTARfPvP5AdA3
         e0NK1Kw44GfExkFSmJdeBpQipiD8uHl+Hq65V95Asb5NeOOFxrlxq8zzyI9q3z4G+eZU
         9bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239614; x=1733844414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKCEsVulouu4z7vHkypS7ufYPZV473W+2BGAwvDGZ54=;
        b=XAfvVYcHONlIvJZ1YcQZwq85YHo2j1nk6FOhuKUJZXTUqESwivORtdR77U5yNhKjmM
         0DEpWYitkyrYGRp3zcsFL0rf7m4PZyQ5rKWRxmmWh8cf+JWMRJhGKp3d8Yl2NB4GoXw/
         WAlE03Xv8liarnbSCI5hGR5lFmP9taZp3bsCi+QI7p1IjvDa6P+oRMGHfkkiGoqEsM+t
         SpVjApSwmbP1FIub7ahzJ9a+Vd/5CTzrF/urYbaEXprmt4h8WgWtKDQHqdmgzxWNQjmw
         /Zm1jmFTW9JRUVWi1roFerSmhKA5EW3NvbI5fAs9tJINlY0fKshdRr4nN5LZijg8eJdz
         Unng==
X-Gm-Message-State: AOJu0Yw2cadKlYgunyVtmDI1FqKQzQ79XDyXOs1Pc6Bp798CLv3Ydz5C
	pBlFLt1fcV5svocwnRh0LmFbkXhRclcf13YVUgAcyIyQecG9XRAa8xVo9w==
X-Gm-Gg: ASbGncsbQzebHub46C4SayM2O55IsdJry+2o2nboCzsB8Qf4P8D1FdgNCfw84IkXdwa
	Q97uuBNzkEstq7r46iZojAfTJjjKotVKEsx/oayduFxVE8ZPxM/jfL9G6BEVQQaghU9xIMeMW6V
	HaFx4QSCHKFM6mNiWWmcpyUThBbkItZ1NJjtuKWD9YPvvtNA2EKavZhufdDRaW7Slt716i6IU4l
	FhD2143g89NDcyQ3NZz5eIQ13imNirheUkWkoR77JNlHULDC89hr8bJl+vJpKTUV/g1zLRq4+8=
X-Google-Smtp-Source: AGHT+IF4zblzV11gaABcXkaie1iiLiaV3p9r//rlTuXXUz6K/8O6qXR1SzFcGzAlxBSyYYe0PFDvsQ==
X-Received: by 2002:a05:6000:713:b0:385:e170:d5b8 with SMTP id ffacd0b85a97d-385fd53ed15mr2188391f8f.42.1733239613845;
        Tue, 03 Dec 2024 07:26:53 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e9fda2f6sm8796849f8f.107.2024.12.03.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:26:53 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: upgrade 24.10.0 -> 24.11.0
Date: Tue,  3 Dec 2024 15:26:29 +0000
Message-ID: <20241203152629.4664-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 15:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114183

Changes:

https://github.com/twisted/twisted/releases/tag/twisted-24.11.0

- Twisted's implementations of twisted.internet.interfaces.IReactorMulticast now accept IPv6 literals and allow for IPv6 multicast.
- TCP throughput when sending data is slightly faster.
- twisted.internet.endpoints.clientFromString can handle "tls:"
endpoints with default [bindAddress]{.title-ref}. This was a
regression introduced in 24.10.0.
- HTTP server can handle listening on filesystem UNIX sockets. This
was a regression introduced in 24.10.0.
- twisted.internet.tcp.Connection.setTcpNoDelay was updated to fix a
potential failure when setting TCP_NODELAY on macOS.
- twisted.python.constants, deprecated since 16.5.0, has been removed.
- twisted.mail.imap.IMAPServer.arg_fetchatt can now detect that a IMAP
partial request has been made that is longer than the original
message and alter the output of the response in order to match the
IMAPRev4 spec

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../{python3-twisted_24.10.0.bb => python3-twisted_24.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_24.10.0.bb => python3-twisted_24.11.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb
index 865190fac..6f2894e88 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.11.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
-SRC_URI[sha256sum] = "02951299672595fea0f70fa2d5f7b5e3d56836157eda68859a6ad6492d36756e"
+SRC_URI[sha256sum] = "695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


