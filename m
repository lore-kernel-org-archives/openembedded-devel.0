Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD8DCAC5B5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14120.1758625603143664770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtE1vghD;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07e3a77b72so941217666b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625601; x=1759230401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8UzWR6BFRpUChv/m49kv2SSHaa8yMsViIhVB5dqWNY=;
        b=RtE1vghDt9hhyCBZkRsYT61r+RTpUv0seJXvwguCDaBgf0Px9FdBYnqGdPN14T0yNA
         XEdP+VngTkMQNp+B+Hi3Z32fs8O9Pqv1YyLND7DK8vL7kEjqknllKUV2W6XsUp7uqFb+
         wDN5cLs+R37FC6pDHHHDzclboAgLy7yWlvtOSUrzLE1NnQxQty8pCiJT64R5VoSPviVf
         F8jYDqnAyXD+1qiJGkxwRBynaoOtzJb8eRHn0JEmBVS94hiWOO3zdWndzq0ug6A5ed8E
         YPuGLSQTO28rrq2l9RGk9WfryXr0fPoR44BL2fke5g8soHWXgWKJvvKVfQBdNtUE5W0r
         Ywyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625601; x=1759230401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8UzWR6BFRpUChv/m49kv2SSHaa8yMsViIhVB5dqWNY=;
        b=Qej0BMo7x396R8Ga6gMibtnQfYXyMgoILhzcwIEh4qDLHBj8i9PBXHsCk/mvVowet3
         x68NO8m60bFEYiRXYna018sO8Z7TgO2WuizBpVuf9FB4en1o/lIHyZAfbkxTAnlr72Xw
         nW8QlB/MTfzwnax6uTnT58cO3Qz1hNB6EquS4Htcbrzhx3YEsoWTjtBQH/xQfX4Z+Ayl
         GoXMzbysjtnlHqeCovvf8WKHGOJElwIGe0CgZhyFqEb6sASjvq4LJ36sMGFjCD8QggE4
         oQg47UjFPlBKQOtERPvk6STo3aPRiHjcL3TFQgco5XsvJdLGqs8ochyp0glrgrNwthIO
         Qmow==
X-Gm-Message-State: AOJu0YwhidWQoccfyX3xeK8hrfF0a1yi1/IDIVwmAOWfvDKYDJQI5Y+t
	m6vwq5N1kLCywB4gjEm0hJ8OODC6yiELFpHaVdep74c920edrytXZw5E8F2Bdw==
X-Gm-Gg: ASbGncsVqA+aO6qVarL601IimDsrAUDjVFvWruSEmZFzxXab+Su07hNZ7c5CXWRR8Jm
	/nV23Ya31J6oByN/m0TXrhy1oqiLFbdREyL4qUrnSLR2kDCYUd9FRUdEzZmjsRK6pR6lZ2i6u4a
	Zw4RdcYKQ5LqiQsEl1k95RGHrinBZc2IuiJWiUSos0KSen0nTT54/9wnrrS7Sd5tYEkIFxSrDL4
	sfhfKMz62LulYAaCObBLLM/UjXZ+yPGQ5jpnfdFHAFntAVzHPXqIsJP2ODZeTDgv19qkOyFw4MC
	thc7atKTLK2wQRkkuXG33PxdeOM0soCNXo6a3IPIO1VDuBHYvTCSpVJTtqApL/NFIn3NGtA1/sj
	NWRF2APaGSYJXv4TYgxl9
X-Google-Smtp-Source: AGHT+IHTJGYEX+UHU2lJLjW7ryYObWOmSEsp+Y/WZvKLEx1ycnPpwI7/Cs2q77fldSl96Yj3jdkk4g==
X-Received: by 2002:a17:907:3f94:b0:b0a:de08:737e with SMTP id a640c23a62f3a-b301d4f9c6bmr205200466b.23.1758625601396;
        Tue, 23 Sep 2025 04:06:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/22] evolution-data-server: upgrade 3.44.0 -> 3.44.1
Date: Tue, 23 Sep 2025 13:06:20 +0200
Message-ID: <20250923110636.3413021-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119670

From: wangmy <wangmy@fujitsu.com>

Changelog:
https://download.gnome.org/sources/evolution-data-server/3.44/evolution-data-server-3.44.1.news

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a9c78999b224ca9f47f031e336c69e79f7b1678)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 81b02914d2..8f5f6defe0 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "0d8881b5c51e1b91761b1945db264a46aabf54a73eea1ca8f448b207815d582e"
-PV = "3.44.0"
+SRC_URI[archive.sha256sum] = "6e05a90204a276f99d932097f1032cc17dd1d8e265c7c56727c63240fd4c0ccf"
+PV = "3.44.1"

