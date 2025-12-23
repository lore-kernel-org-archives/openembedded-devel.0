Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E39E6FE26
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 16:40:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104436.1766508011105578340
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 08:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipTZNR6B;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so37861815e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766508009; x=1767112809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlBxYBbQ59HTdGDwFolJBGVjej6mOff3mbuGsGr1Y3U=;
        b=ipTZNR6B6F5afhK8aIy61mqYl+NTOwB1IMOqt/RCxRNov0S//nfiM4foSoumkkTM4Y
         SDcW2xkXxVMqUh6FWQ01jgxl8wEBm+UiI2dHKg4KZQVxS+eO6l/ZQZ5zP7TQbniSzrxI
         75eBO+2xk3cIR3IJJnIauyU0Qcobd2NDji0rJiENWKmxUdPZMY7V0x1mlVP/+0DR3dVu
         gHkp1svEDrF7ZiFSLjvAlEkG94JzlyF/qHRId7TAzkI29yrxHIXy65Nf3Hr/+6PBqXol
         teiYa9guw7TomZ5n2tXsVdyUPAK83Wxjv84YTV49tpFT/tOmMVthqFnfCW4mFquukUnP
         kITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766508009; x=1767112809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jlBxYBbQ59HTdGDwFolJBGVjej6mOff3mbuGsGr1Y3U=;
        b=uP4AZhhMfUuFrmspONllj5LLTjJriQMaighXMYsCLoIcnd9+zOx6Ttj7xYzyh8cwLg
         C63RXawS+DdPImE3trSLpxezpfjiM/gKVo2zd6EzvJ0ibP3wGRNMNRpA9rL0loXtOF+t
         WrHzpm7cdepP3PsgUz7RbVZYQrgNpdqePvPCSU2Y7gKkiitVmjxdQomCR//Lo9szEK/h
         k6d2/4hWV/HIONHmdgvWkbER3z55Z/1NncfwZJMgf6dHct/Ho1Q3PxKlens4RcIjsgoK
         2y2+UZnlwZn56pyj2oV9DDMDNZ5zylwJ8j7wzNyAeYJIeY2Ncs4TJ77X20sJmQbfClBc
         m5Eg==
X-Gm-Message-State: AOJu0YxphqW7c8s+86c50J1cok+KyoQVOKFFv579hGZUZEMooLOFBjRo
	ddUAY9cch6Rw98slAyVH41AE9pONDExC5/iJOPeUrr20lwEc7DgufxIip+CJyA==
X-Gm-Gg: AY/fxX6DJhhh220lN4VRdNYimOCqEfLpn5lNl3rVnatwa23ZA7sRJKqB5P6UbEbeVUh
	n4lI9rdBBhBWX/lpjRhz04jhKSrcEyMQbPoAhynpmOSHxBx39notGFfZKbf47ienuBUkv1iYI/a
	jKGWXZf9bcuCAVx1B2hX+UuBGddDyJ/yxIq1fjTqc5dCT4LQxpkjkW0/gDFUglQgUY5afyrwNUg
	MqbNyN8zgzslmA1MZQVufoByE1na6LEx/0eQrblpVTUWx9ELj3qKOIW+2HRTFQTlevmcbJncUJH
	yCONCPGKkunXz9ADuLgiVae7IdESFJk62Pc4tGJBkRtPoHVJX36VqTCTe+zj+8hklg8KYHGNQzf
	ccQp/3/PerVwHvtMzXM/NXcg83juhmRAhCfU1dZs0euXuEyL6kJrs0yecxjVsJv476a3jNxCL38
	g8CSXxdCBH
X-Google-Smtp-Source: AGHT+IHp/kFxNgz0AKA2MbsdebQe/r/EsWTwzypdl0RJgzMxmlurG7zktvDI6MVxRUJHS7Z8L0/6jQ==
X-Received: by 2002:a05:600c:8484:b0:479:3a87:2090 with SMTP id 5b1f17b1804b1-47d195aa3a3mr128976675e9.37.1766508009331;
        Tue, 23 Dec 2025 08:40:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm29457470f8f.30.2025.12.23.08.40.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 08:40:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] gensio: upgrade 2.8.15 -> 3.0.1
Date: Tue, 23 Dec 2025 17:40:07 +0100
Message-ID: <20251223164007.745973-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223164007.745973-1-skandigraun@gmail.com>
References: <20251223164007.745973-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 16:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122839

Release notes:
3.0.1:
Fix: Problems with IPv6 compatibility and running without a fully working network.
Fix: The permissions of the PTY were not set correctly with gtlsshd.
Fix: Some issues building under MSYS2 were fixed.
Enhancement: A "chardelay" gensio is added. This is basically the same as the Nagle
  algorithm in TCP, but it works on other things, like UDP and relpkt, to make
  transfer more efficient on those.
Enhancement: You can use "gsh" instead of "gtlssh" for a shorter name.
  Lots of little documentation updates.

3.0.0:
The only major thing is all the deprecated sergensio code has been removed.
There are also some minor bug fixes, some documentation improvements, some minor
  improvements, and a bug fix around ax25 where it was reporting the close of the
  last channel too soon.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gensio/{gensio_2.8.15.bb => gensio_3.0.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.15.bb => gensio_3.0.1.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb b/meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb
index 71a05560fc..3427ef3a30 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "5ffe39f4a247ff001661a4c283305a3abe823fe3"
+SRCREV = "f15f54da21697c3656a6fb3ad65a8bec1687c772"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.8.x;tag=v${PV}"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=ipv6-fix;tag=v${PV}"
 
 
 inherit autotools

