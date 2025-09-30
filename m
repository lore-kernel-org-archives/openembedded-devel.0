Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F0CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:18:59 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.20994.1759223937315478632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEW2Jk2K;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-424d3c1256fso34502705ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223936; x=1759828736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kFMYxjB9UV+apcrxFv3L1tT/YQmjnBUWE/VNE/smsM=;
        b=nEW2Jk2KeYRrzKbScPwGvbBlHuTY8P2uFu+3N0UvOLlYrrGFRM8tAZ6wWb/QUnvmu5
         Wg7bITYYm3cOtxIoJGjKDtklP3OJVZGOKiyR/ywWpmrBBne1UNjZYMfMwzSkHGd8Xd3L
         RGISsx3ABQtFN5kUmR9qn4JUy8LgHO7CQ/790gKm3LhwT9F5LA0XkCqxyitz5hD4F4Dd
         7sB2YrgGfp7yKNHDIYOuplY4Giom+yRz+e4j6RZddTj7h9mJ7zJ/z/tukKGDgGLmPxQx
         WzxZgINDm9POVZA6jncihTNWCTPtJ1WNuS+IzAGPDJcWc8v5DrP1hgYayyiJhY0ZQtGY
         /ZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223936; x=1759828736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kFMYxjB9UV+apcrxFv3L1tT/YQmjnBUWE/VNE/smsM=;
        b=RaD9SqiGVU2qNTg5VqJIb5R1a9CgI5IopvcDyI0mlQ0JQVFufHT22KwjRoDUIPpduX
         dPOtbF6sI6YosXylzERfwQ5w2ADiMENGZj9NYfqYXpzp39zX8nznr/3egJbB4X/UwZPB
         Ye4K5nx+GUUekkLo5wp7TFU5hx8mqc9spVFGRJXHxg8tbI8ZGPxiFLgsEEjfA+0o8lAi
         BDmO5CvOAdookum2j7C/2tz8CpqSnU+DjYy3OVX+kj6dwIX7rnlI1h533OCiq66pBQTt
         cxvcRlYFyZKcxY9xf9I7Ry2gvlXUNkL7D0SBVv945eMf5CjMHC6GhQ+GEIqOXLAuXjFV
         ykyg==
X-Gm-Message-State: AOJu0YyVDkaCrhSi+YPxhdzin4MHzjlUW776tpo/10OaIF3vmI+mvL4v
	OgFKzhsY4n0u4smzqUguNiO506RFKE3LH2PSB+p84exBKE7CGvLSh/zhSFz1ITx4
X-Gm-Gg: ASbGnctVDG3Y6+9CI0BKB3uhkTftf0vBwTqTb6uFebJRTmZG8fpyIt/Upk6DfntWPf3
	9gvWXhBbs7GgnZKqB7VKomZBSBN+KFZVsRhezGeKHNfH1xqRhdmbwCLYmWon5pRaOm2WGDSnvqY
	k9cz9vjrdSFjMcPrHfz5gTMi80EBv3lA1XWrStvdIouKova42qInUI0xe3aYDFkdq+74C1ljdfh
	OERVd+z+rbGnYzAMd9O1jpptn/bSVs7HuHvfBew1il0CyuWWuMWfLFfPZ34Dfu6SVumV6T92aY+
	UOg0vWVSHW5/4Uq3cko8nYFr5QoD0YPTMVoUZKf8Lidolz0GHf9KxQ+1KNcDkJOGlZNGeOSW6VS
	J2ynPZU9Qj+tv2aaBHlKxlpRQoR5J77NkjjbR/pjjdfVtoGcTsyLzYQiXddxpvyc4WjdUf2Jvf8
	Q=
X-Google-Smtp-Source: AGHT+IHWmpiD89AlzZurvqeRT9ihShXMpdwSmXNNzovfx3+/Po2XNCeLnj3Zjlo1/LA5tUkX2j54TA==
X-Received: by 2002:a05:6e02:219b:b0:425:849c:52fa with SMTP id e9e14a558f8ab-42d1113ba2bmr46072965ab.15.1759223936414;
        Tue, 30 Sep 2025 02:18:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:18:56 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 03/22] parallel: upgrade 20250422 -> 20250522
Date: Tue, 30 Sep 2025 22:18:22 +1300
Message-ID: <20250930091841.1693131-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120055

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a01da40edd694bff85e4af4e38e76db44aededa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20250422.bb => parallel_20250522.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250422.bb => parallel_20250522.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250422.bb b/meta-oe/recipes-extended/parallel/parallel_20250522.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250422.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250522.bb
index 88d1cf040b..79ea168675 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250422.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250522.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "10f0a7b7fbed87edcbd63a403fdc0ee1a1f86c241a3605f33162b4b9aff248dd"
+SRC_URI[sha256sum] = "b4b28f475f8cff8bb6ed4b03cc5a67041f18fc73fa256923b23181b56afdb2cb"
 
 inherit autotools bash-completion
 

