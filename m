Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0AFD2A545
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.32009.1729107315208790574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AO9rrXQo;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43140a2f7f7so1923215e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107313; x=1729712113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41WZqyVGydzNpS7BAEbMEAj9JZrIhVDWNyf+2DSNKfA=;
        b=AO9rrXQoxIyNyysr0kmoHM8op+KGhtobJnZDMhwUPnJMkHfiHPBX3+PwwJbIb9VYGQ
         J43lcsm8+xzjaO3TlVZE59WRQExHeQRn+I2//6KgJ4RsN96ykZ6/bHQ9qlw4tksie14i
         93X+lELMbj2sg6CHw23zGbh98uvfB01+wioJKVjA5eVr9s8taeWsg3eEN7KKNGCtXO0n
         KPwtmII8KTyqz/Grhp4Jm4ASoUFlMxakwl59geqe9QqjOXIWkh78l59vIlwztCjCt9jH
         3uoTZhfVye2n9RjKxhPjOVWp9SBWVtLdfWO/jGlTJbIHYX+RaxsC/cTIGgcuOSZgBexX
         Qluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107313; x=1729712113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41WZqyVGydzNpS7BAEbMEAj9JZrIhVDWNyf+2DSNKfA=;
        b=bmQeuieZmfI9T1CPHHTj+D9qLY45q1+ZnzWzq1UF8j8D5lVIdl5m6z2GvC9MDaxXqZ
         JV+a4mSoBC6k6heEpsCjEBxYeUjlg7ybv2bE4ch8qqw9SwVGg8wdsKbvzlrhO2BM+KnL
         O3VVYN6mWnSXljlMfPZ9unNLyHgLOdtBSAItewTuZYkrNnBKIjJ4qsLFoml0xN0d36tn
         UbdT4DgCBClXQJhuX17INk5X0HZMpoz5+7JIeMhhiloVSrj83w86s7twuoll+KoWRQlZ
         dEp6YUf+MvbM1llKdleisfwa9B0ox3VLRP/BhqkbpVb8/dnUZfWTFoKq4YkqWJLFwuiz
         JLkQ==
X-Gm-Message-State: AOJu0YykFISDHzhHjR2pKfaKJpVXVFX/HUXzNqXDK8XhxBee+92ftbCt
	DSx8F74hi4ZdJ1/8w/ECFhltuMPP7JJYD6Xaes7t3dJ3ZY/UInYYOS8CYg==
X-Google-Smtp-Source: AGHT+IHa3A9ML60aY9SZtwkDoCgftc4zt5ziS9ia+DLr5fTOrqBPZ0JisSLHfSXgrLclFIV7CmdVHw==
X-Received: by 2002:a5d:4d87:0:b0:37c:cd38:e7bd with SMTP id ffacd0b85a97d-37d86c03222mr3375405f8f.29.1729107313482;
        Wed, 16 Oct 2024 12:35:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/13] python3-html2text: remove python3-cgitb dependency
Date: Wed, 16 Oct 2024 21:34:54 +0200
Message-Id: <20241016193505.3459828-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112943

Not mentioned anywhere in source tree, and no longer
available with python 3.13.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/python/python3-html2text_2024.2.26.bb      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
index 4a7ce1e5b..6200586e9 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
@@ -17,8 +17,6 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
-RDEPENDS:${PN} += "python3-cgitb"
-
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-- 
2.39.5


