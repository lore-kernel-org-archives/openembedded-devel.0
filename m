Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2FCC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:46 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.39639.1744003244856621753
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mu6t2OBm;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so2670852a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003244; x=1744608044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLcPaU2NAEi+MvdnPAsJ+lESq1/NMdbzXvseIyAkCSc=;
        b=mu6t2OBmIeZC/BYQhmWIO2cIkFI92JjrkF5mPRzDT5pIDklvYsFE+yOc4Wjah4tVXV
         MIDe3n9jzGptuE4zW5+A8hFnTa6G8DDecsXJL6PQNHWulbUA7IautP3ufrbGtYkRFNNd
         RPunSCi1voMbFw5vsrrn06XDMcTNnWcsjlJbkJwPO7R8ccPdqcEM6172CenvMrL66b6O
         qHBpmvU7fHjRhRNK7yWgUQxI8Ct1v/XW9qna0btsh+6VyYULmJSzdSm0JK6U1CllU4Ry
         3UcWReGwj6b9tnXrrKAMbgPSQ+AfangmqUG7jkL2H4WGXdgQeyEoTvK5pNv0xjBcrM4A
         9fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003244; x=1744608044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLcPaU2NAEi+MvdnPAsJ+lESq1/NMdbzXvseIyAkCSc=;
        b=au6VyDfcff9uJIwETNUzkZIjI/fhiu3Di+NxO4AVechcYvpL7wwcmdkdZOrmsaLOWH
         C8/HC0V3/cEJeZE6w9AUapKxcRYEMXbDKNUeLAhyjbyKF9vlrN6Iag4MhJwhafI6rl5K
         w3n5R5a788s8B7h/6RZCbmWDNAkzMlx7GDhJvWSbBvOYXDB2g24YkUX3l22gzlUHWF58
         FTudNBcQDh1nw05ngdaUNMSJv3gvkjsJ4qc1IHX0MqBQqEHOH+3UlV31ndCAnigEpZb/
         epkV4yucxTn6OQraE3MXvN9tdvwO3hQeElV2lYBUljDg353hXUAPoqCR0a+NOIB+E0+S
         dGiA==
X-Gm-Message-State: AOJu0YwROWU/YuqWDtCtvn3YWrvIQDOCBL81bMDdDVtoPI7LbUDOjt4D
	tetbEjP1aHTRgI1jn4eZYITOpWs5u6NA1u+VKsmLjSyOl2i1T4ZwQBeG3CdD
X-Gm-Gg: ASbGncsgCnq5Tq3cjRiD+lwlzPaQa1LbpB8mr+an7N1Ey/zAa57VA90ppwAor5qonrL
	5v2KspGaL6RfCAU325zLokfafCeha1rWVswbWDfZfuorh7vLUJg4SsjMERsV9O0kgj3a+pS2d17
	E5M+l2bSvp6eMJrbkbih8/JU8LAyGZWHItn1t6Sgs+uUTd99c+Gz5nVIrUorNSA29q6DgFUZvF9
	ZtS7E7U5TwtaUAyLfuuUzfTspTdqQrBLznEuuaDLShBNpbcEEWV6nKeNl7uTYCG5DZra4MNpZ7c
	EQd70xIYb5j3/2fuU6GbcymQUe2mhMNLLfhT
X-Google-Smtp-Source: AGHT+IGTd9XMzUL+sK8oUNhz47+i9SMaUtkEClv9Zg7ovS75hAr5UHhdfGFNASV4swUYCMW4nR0N+A==
X-Received: by 2002:a17:90b:2e03:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-306a4b91dfamr16188257a91.35.1744003243755;
        Sun, 06 Apr 2025 22:20:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/7] python3-lief: Skip to build on riscv32
Date: Sun,  6 Apr 2025 22:20:34 -0700
Message-ID: <20250407052037.502341-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407052037.502341-1-raj.khem@gmail.com>
References: <20250407052037.502341-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116620

It needs pydantic during build

   | ERROR Missing dependencies:
   |   pydantic>=2.8.2
   |   pydantic-core==2.33.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.16.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
index 294f8fd1ad..67bbcbf7b1 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
@@ -33,5 +33,7 @@ DEPENDS += "\
 "
 # https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203
 COMPATIBLE_HOST:x86 = "null"
+# Needs pydantic and pydantic-core
+COMPATIBLE_HOST:riscv32 = "null"
 
 BBCLASSEXTEND = "native nativesdk"

