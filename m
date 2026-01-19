Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5121FCCF2EC
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:40:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33591.1768822817763873830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a5BXUXdY;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so7812110a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768822816; x=1769427616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6z5B3w68YW3W2OwS/74R8pKQ9giCDBw6W7LcK2dcmY=;
        b=a5BXUXdYravZVu58vctNK1NFqSaLPKqYSKOQNrtr0KeUOMO5Qdmxtn1RSsmfgP8pGQ
         xvrJ3CTTLwkSpZRQesjaqIMyl/YoOX+AgnPDfWCixZAgUrvU8vu5DIJJyW1IqDoVUogG
         ierUsyeqQh4kx/gC/X3BC3R1ejHLn3kH7sI0YD3MX2NIbK/j7HeY4UQfzhEj0jAY1Toe
         gjqGJNsvDZUqGE2N6DgqoTQZKOhRaYJQDtU0get5XwPnGf65qlL7esPxVPK3Opezkm4R
         F6sAFxiGZX9r8IlNvvuU2k+9q7GZThlA8Eh9mUJjQfyjLbmYk+15u+OgkokwhvKYsUmD
         6XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822816; x=1769427616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6z5B3w68YW3W2OwS/74R8pKQ9giCDBw6W7LcK2dcmY=;
        b=U7OwFDeKO2Og66HAVI04LD0Mil9cJhgQa4RVSH12/886/sPKcwfj6NzumhsiCCTTeq
         Y7J3UR5IsFa7lyOoTR8pK5uOhFXLIkk9EcyXBNQW2hgO/KxXC0WgHCQWC5SBY0PuaqQ1
         vb+VQOwaaLraE/ocdNsGpo7maToJbaAnfRSNA3u1/rqreVkLT6vsH3GiEPWlds6IYMhF
         u8qk+D6d1sh1Z0MivoFQCiqqoj8RnW6vmPSGA5x++CTc7GFV44jZya1xXE2o3dlDFBos
         7IjTcOjfKR46kTgbMMH4fw4PzYMt7e/AhGWVpjodq0CcF940WFK7SUF/oPohHNZUTtrs
         /M/Q==
X-Gm-Message-State: AOJu0Yz4NKVdJMDWcWTQWQtQXwmL5xMnR8sna6icidIM9fTc/PxK9+tE
	pDeHaelzCJxWyCbH0mZdkTpli/kAtL1tnR4SzQh72w0NAAVg1Fmkd8/vx5LAAhdg
X-Gm-Gg: AY/fxX681aoSotSUzQbuLnEbKoKW0BvgEAShqEpP8Mr6v/vkf4rfBq/h28BtUAatThy
	HixMoAI0DZs4EqzD58UjKQj/DId1UH6YXK9VWL88dZmNt/fF65AhCz9q3bQcnv4pqRytxPjiMyd
	ZMeh8j0WzEd2yB58JTblr3bwaDouLTUoUemjVoOUNTWXUebk9wp+KzpvUP6WU0JFtflVeoFTt3E
	Lp8EU8xJSBv5ow4au5XXYjcoMDfxiThprOaGKvfDahjgUfxKEuM1OXj8swzTW1sMFaust9dJrlU
	7LkZFO+4ZE+9YwxZiHr6kSItlPZ5jVrEa7is30RZkVGMF5REgFcFZQKHyYkpi8lqQONBL1Au3hp
	Bu9VkYVihw2pfqObdTaJK1kjAWbpRc5UqCcE1PtNDxwWZiNUlO7xrhJu42vku0tQm4EryGMB4+P
	exY2fJzI7MYCPwXBHY/X3ZGETD/Xb+c6CDu6N3GWmgOIl0K/6Wf9tkfbayOI4=
X-Received: by 2002:a17:907:842:b0:b87:3168:2ccc with SMTP id a640c23a62f3a-b8793009293mr1041012866b.39.1768822815774;
        Mon, 19 Jan 2026 03:40:15 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.65.mobile.3.dk. [77.241.128.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31fafsm1035087466b.66.2026.01.19.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:40:15 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH] glaze: add recipe
Date: Mon, 19 Jan 2026 12:38:47 +0100
Message-ID: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119113844.289290-2-frederikbraendstrup@gmail.com>
References: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
 <20260119113844.289290-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 11:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123635

---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
new file mode 100644
index 0000000000..f92777a25f
--- /dev/null
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
+HOMEPAGE = "https://stephenberry.github.io/glaze/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
+
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=${PV}"
+
+SRCREV = "a4af950700b8af2659f0d4a37a18a1b9c5300593"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF"
+
-- 


