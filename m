Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44836C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:57:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.41275.1751291680392644525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 06:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaTBRwSY;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so30967455e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291678; x=1751896478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7NMnWZP67Ekt+EjNoonVOuTjumdd1uP3RB/32/lBJ0=;
        b=WaTBRwSYBBlsxzH671WU9DCGxVv5L6IWQsumq31AwmkWVfHgUBJCIYcLonRx7M3oqR
         Kw5SaAoD9i8YatMFlkja9NfVDDlU5OrQxIElL9LbbmJQIguC5JTUG9kHwy3Vl0ryUaUP
         RlNZUuOgDQ5cOsWX4+9+mK5jUwe3PkwCaVI3nRN+PpEWkA4bSuNx87bQd3q/zJjnTRgu
         l26i9wyk9j5W+cLlX6eJ7bTPhVsRc92+yNPoaTOujqbi8S8wsjfu7GhU/4AnjWVV061x
         qM+wg5Av9XXMO91vNWUrt2uiNz4CjDI6xLuZTdgEhHww2dpsvdritlYpkjzX1ajM61cU
         lJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291678; x=1751896478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7NMnWZP67Ekt+EjNoonVOuTjumdd1uP3RB/32/lBJ0=;
        b=a0si3/z1aqOlRP0inrk2fHJs0NwspxDf8IfQ0IJ2C7cvdEIu+vScSgth1DT4b7XXpl
         QMoJimwKmzr/13d/dBQgMA4oY64E7I4l51qt7SaUiX1/30R7efh0DXQrkRyDwJbl0ulj
         YzGXtq5SHmTnnbqCIA5iuwthxE1iLQ4fvUKjAQPlbU8HqxEwHK3TDNqjceY5d4kDwK0w
         uHw3V/Vs80QzdsTA4vH/y3mwDq/XgDvz14r+kOqYX2f4gxXGqd6ptPJzB5UFd830Q8As
         +d/OzvpVK+N1bBqdhH2tUFgk9KMt2iX8ZHdNgqWFZ4HepdyxtzO52r5JqiQHb/JS5VjA
         EF2g==
X-Gm-Message-State: AOJu0YzO83HVbfOFXIBYdr1HBYfWADyqy6is4Zy9BQ5Lq5yPkab1aEMB
	WKwLlJ5a2EqkO18Gk+kMd63AppBcvGR4/Fa45aiwy4H9g1HzVgz7oC2syNPggg==
X-Gm-Gg: ASbGncvo/R2GVVwyycCAwl2LYPSUhfvkuVtQQ70OydhVW48muoBJFN9rZ1Hsv97gNtY
	TAd+YXLAJxM4Uf6BqRW8GDsXHYyuMjUKq7WYlWGmCOnc9TT4wth462nYG2Y1XxfW2VynBtXdDM1
	u2ePAZ7cdZYqxzSSRgYkoTmGSfIQHD0SGwWUrYuEydjVblhAywi+PWl4vLZB++2wmfns+VZ9MH7
	V+xdpUueEYDpbmV5E5+coSV5n58bN2EclhmSdBLf5TrmkRvwT7uPGSpSMcS7wLBMSJ6RN0a1BzJ
	KmFDt5azenhqX+9V2WUHg+4LdN65dJ6oKdUKBcO+dbB7lMDVv2dtmr7B9jiX6kLrvRXiJg==
X-Google-Smtp-Source: AGHT+IFHjRzckzQbWCNEH32kLemAmo43kPu1afxQAYcUgMvm/HjkS2AUeyQFAOIFNxByXnqRVDE0MA==
X-Received: by 2002:a05:600c:46cf:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-4538896b992mr167160115e9.2.1751291678435;
        Mon, 30 Jun 2025 06:54:38 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm139020195e9.13.2025.06.30.06.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:54:38 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 1/3] zeromq: support native build
Date: Mon, 30 Jun 2025 16:54:07 +0300
Message-Id: <20250630135409.2425189-2-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630135409.2425189-1-yishai1999@gmail.com>
References: <20250630135409.2425189-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 16:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118178

Add support for native build of zeromq

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
index 7569d3200..eb4ee2f4f 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
@@ -27,3 +27,5 @@ do_install_ptest () {
 }
 
 FILES:${PN}-doc += "${datadir}/zmq/*.txt"
+
+BBCLASSEXTEND = "native nativesdk"

