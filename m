Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050B7C369BD
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 07:33:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3107.1745048011308136226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 00:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V7M7BrAQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2849421a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048010; x=1745652810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gTWkeqLCJO4PDcwPY3TvX85HEEE/MxefDrQWM7zkP0=;
        b=V7M7BrAQwD6TlT3xkA0FGyCKFrSo4Pwm1GHFzcKnbinLJ7KKTqjJrUvGurik15w8qM
         DOC7hUSyEYLstA0rSCz10Pt/bdqbdG/VxJE1xDt7Xz0l5kEBvhZVAlMsHGjTRC+3OS4K
         cJBjjjSDRjNcgtY195MhvHWZvgChNLj7HdFvVsBpQBs1yBeL5qDGTVo0W1B03psodFZf
         8dB3qK8d5vgibt2xrMIKgkuh+u8ELNnFYEDqOJhPNlpXId1ZKg1ehK2bpyj0KhBHV0q0
         F1vnTa2AlB55oR0WTCRipFeMttAjDe5Gtuay068t5owPcQYm5XkfzDJDYEbFSi9sKiV1
         XS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048010; x=1745652810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gTWkeqLCJO4PDcwPY3TvX85HEEE/MxefDrQWM7zkP0=;
        b=HWiJSAxPFzlRjeedPVdH7vG9ACovP5NZaUGKiPtWcOUSDDht6LTgl9CkqjTPMLywL/
         CHorYwLpenDQM8QD9MZgBXvMvqVS8e/Kljb2BALmgcuB4EZUodOBVTH5APDzeYlAhEyn
         X02Vpu3Kol6YKV5OukEg/RJi2BmtwroC9dV/4NGWvYIGt8GHzgZk6ssU2UCNgQfoVi5o
         MRPBqMkLdybs2K5Oxy9gYNADxOxR9z5pkN1evBcZqZMaE/5BtzjqQpbkm6LsSiVwD39Y
         lS7iCmvkQnVzn6qwMrAuhcUfVDGUaD0GzznP38DXh/kAquTlHNzcrAwerFlmmpYuiqIs
         hdjA==
X-Gm-Message-State: AOJu0YzuPK0th/ia2X6sNcC2yJZmNa2MwD/GRYzd2KSlXqZ6rXMQtpAQ
	9gGdHt7OWvtyPBx0m26DcUNOleCmjeflrmCDMAjyXMOpDrEA4bJI3OH9dwxJ
X-Gm-Gg: ASbGnctANvslDbU+BVd7MlGUaUawL8l5PbNRmda4577MHDd1J0wCqkT6mPgKDkHO4ju
	cnGPpcC8Qr3ol3AXTGDm1QTQOJUy/RnjpdgXQ9FbVlLHIZlszNazv19bV6JzzzVQdOU4W0GNMhx
	LeRJEPXeVb5tJfJC93pjf5cJvTfHmbq9NauzMvioXaPMCyKBq3Z1Am/Z4rplmyKz2qkDTpIPorf
	9WzDVukUstJCoTN+QM+dpNXYe4xl1OwkAwUCqsqHQbND5rzLtBXr9Xll/pjp344XoDHykXcXZEv
	7z0mH6IFlgZGzTmq5NWjufs5ragQjmQL8Bbn62DJ9S0=
X-Google-Smtp-Source: AGHT+IHoddrlqkY+GKB6FFJfXqhiV9VDjD3aS+R8eJEsQFMPcazPl4Ulm7KZ/smHmrGvSmKHQfwa9A==
X-Received: by 2002:a05:6a20:c90e:b0:1f5:9098:e446 with SMTP id adf61e73a8af0-203cbc0573emr8699249637.2.1745048010214;
        Sat, 19 Apr 2025 00:33:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13ad7d5sm2429763a12.31.2025.04.19.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:33:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] gphoto2: Use :space: to identify space characters
Date: Sat, 19 Apr 2025 00:33:24 -0700
Message-ID: <20250419073327.2468160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116976

Sometimes current sed expression does not work so use POSIX
compliant expression

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index 6a2f7164b5..d46ed2b07a 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -20,5 +20,5 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
 "
 
 do_configure:append() {
-	sed -i 's/--sysroot[^ "]*//g' ${B}/config.h
+	sed -i -E 's/--sysroot=[^"'"'"' ]+//g' ${B}/config.h
 }

