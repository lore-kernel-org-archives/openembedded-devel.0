Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2893C2A094
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61168.1767607365993959356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OW2Kudg+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47796a837c7so89530035e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607364; x=1768212164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2Aji10S5AuOWbgp0geqFQGOPg+bFd+nMfpt1gUKbao=;
        b=OW2Kudg+7MiQp3M45b0/Osglc5xdiRMABxI5h1QGXslWQd2RbqKt4E3i4aD6fgEkE5
         irTOivpVJ/xIgG0h4yFUJULSqj7Z3xtXvxD1fQmmV5hasZu7BJt6OyYfCS/yGZvvT+n0
         QbS5nVxZqIvElR2KYijFUyi4JelbFp8efIkk15TOhv6T1VLfvMx3CEWIcsUnLtBtTnKI
         gL/RQvckV3pwjSSNLzfAWBTCFGnxsWrJ6dBEzVWpm98VeVLxxaeUQSe51tKhickgMTbZ
         VO50w/slhNBz/suH8oldClVcMpslZK6N2TD1zmM3o5QoWz0hTE+SOPgK80LDtHN7Acd5
         81Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607364; x=1768212164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2Aji10S5AuOWbgp0geqFQGOPg+bFd+nMfpt1gUKbao=;
        b=VfQe4KHfeVPxwd1v2VdTMgxPm1znNbtwS0MGfIckn2WaJwxAyoa6NQ3ZQ/Og/1EK7J
         7Wnd1fp70gHv+I4bElO/WvB3Me08VzqmRINZKeUoNQ/KIwqPV9iQK6jkMIVj0IRnoUOF
         xhS24nsG+T3NZfsXzEbCLH/dhLYrRyDpetUSp/0FlLopz6K+l5oyLULfwOycyhdvf5mG
         KADBTVkjJhI+IQ++M7VYcBrvtS6FXdFt37rdQOPNTKqT+oNCox7hR2TZwpBxqoYMr+PD
         qvfiBOePKan6Dq4xhAdEdLw/7WlZp+JzITh15VBuNT0rZj/yw7tt7D2yZyVY/xclmKk7
         cBrQ==
X-Gm-Message-State: AOJu0Yw2TTpHr/EXzYCKfBm9nFF+Z/68p9wk5Wcyggp0a2yV7FGx6zDN
	DbDE7YtDt3deIn4wcv2agyVVUmmK2Q1UaMPhMD4qmps/A6Qtk1CIr9SBpfPuNQ==
X-Gm-Gg: AY/fxX7EeQpiD7CpfalWcUgIMaFuLCGHTFlhodsdqnvRtgX4JVR3RvA+X//dWi5zj1L
	55lg+rKWA+dliL9H36DuvPoj+yKZjZ4Olfjuilgk4rfkqj3Q6WnuAtYeF4CUeaZMVVvc1ULfjH/
	aNuFXffe+qd1ScvrM7RkP/LL82B/Wd5IzbREDRAK6OjLD4nZyrS71F/zRqT/gadiLMk7yjySd2U
	Ipk1QbIbGJVsR4Inhfs46DYnlmumT2P375HQyEbCyZT8U3o5Wg4NqknBRLYqwKkLjIjWnxNMt8Y
	tOttEVemimWErxpljyDxlBmmLj+UdsO5QPkfpf18RpBeRNPc8fTIYRFgpzeezsUyT6eKUDrhhVu
	PlBB9CjzVWx+v53KArofzY0YxMntg665xbLxe9mkBUM5Lw4ZssAmKWMoisYe5xTKswkIHbf64cQ
	orTpKzboIa
X-Google-Smtp-Source: AGHT+IHFTId/6VuKM8xJC4f3w5PJf9ODvM7EZvz5GXWmhaJ3EyWIrxaoipYvUO8WjlTedcPEV3pXnw==
X-Received: by 2002:a05:600c:45c5:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d4fbee7b1mr363298655e9.12.1767607364213;
        Mon, 05 Jan 2026 02:02:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 08/17] imagemagick: upgrade 7.1.2-8 -> 7.1.2-12
Date: Mon,  5 Jan 2026 11:02:28 +0100
Message-ID: <20260105100237.3081345-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123139

Contains fix for CVE-2025-65955 and CVE-2025-69204.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-8.bb => imagemagick_7.1.2-12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb => imagemagick_7.1.2-12.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
index b445ae8f62..b804c64cfb 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "a3b13d143fd7dea44cd71d31aa02f411b597688f"
+SRCREV = "bdd4fa561d7bf4c6afd40ee9c89e9f9e82b6e88b"
 
 
 inherit autotools pkgconfig update-alternatives ptest

