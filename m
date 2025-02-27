Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2AAC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 14:34:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11738.1740666836697598989
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 06:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Emu/+FPK;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43995b907cfso6682425e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 06:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740666835; x=1741271635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gY0OQP6sSvM2QyldUH2ofTKp7Zk1N6WnVdbQEm8YEHk=;
        b=Emu/+FPK3CDIArrVubDb6QdywQLTmwBaS6tMw8/7KtmV/96p2lKUdO9qcKj/xtvBRz
         VKrRtN2CSFiqLv1wO8QfEEC+XbFI+Rlb71Jvuzy1bEMwdxpmWNRefNHCQ4LYgyqV0fBp
         mo+gJ/gRkgjs7ei/xcIQ0bINZeGKMUYLQLnzLEuZPsKyCUnP07u8k381pokqmvQUYPfD
         7NqhABjlNCrGszCc+vbjwxzBvqTwumGYQD9YvMTf8j5zHJkRekc9QT7dbLGE+aAgr58j
         gueQBbaKE+ly4pkOBhrdq2/UTaCAdVWvwVfj0BJrfoE3OYErZ5leI2G0jLhzZ6J03VUn
         rh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666835; x=1741271635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY0OQP6sSvM2QyldUH2ofTKp7Zk1N6WnVdbQEm8YEHk=;
        b=BLZGLVmbLDL5Mnu+evHmr5hwufXlWwQ2ULfM4A7/AnomYJlqJ/06JuP4wbwNKxCFFq
         UcBXbjJb58IVMXx0DDcX71kewGRsEfoKTYvFT9PRQmiu7S3DjyGAVQjZZjHh+AaGg6kU
         dptr4wXq2AA7CNllHRjKDIVcHvthOyMhSx+5IvG0kc+TCk8F6d+Xt2EB7hxwePAv5Msp
         mGxQitWEYPUV8SmS5z9Wnf3AlxHyzk+/Ydx++yGQBDFhDlGSIVKL7YdVhf3zLmS2RYd0
         codnRldc0ID8VSD2GZvPU+I47QF8Jb6SA68mAqrrgFeQ9XJSW6uW8QJqDIvuxBC/NY23
         Di6A==
X-Gm-Message-State: AOJu0YxQuxWE5zb1jRy20GDXOs2tpSGBRB3x0lRk4vYfKNE4oUuQetf5
	9aCnCYTY0adVB545STCBhRz6VhLZ8zOVh1WmM2k4lC9ngPiHpyKlVgxrhQ==
X-Gm-Gg: ASbGnct0RwK+15R+ONZv1QzGOPG13cPh9rOnfgQS9jBKvuf7vttT+D8DoeXiokyDodV
	2FOIVRNMYVGUDV+QRKKI9OM61BxvKQfrYGHssdzw2c9/3OY8ig4pOPMSQMaxKL/TsFP6GgzHtgb
	UcaCyoOHqIF7A5FdShyvqeYevb56+qCVu9NsOsSawFFI1/9UoWQc76+DQnBktBwl9C92Tdu1UI1
	4m8Ovn9hKsyX0q6bL284GBKC9budjSJA8vBWhYuuK8jcvP9OEyzg/ceAnXdLo4/IcKglE0Iaiqh
	IrAGc8IKnTS+kFIqN9htHkk6DSiejqDriNsNqoqF2DXTXdPijQ==
X-Google-Smtp-Source: AGHT+IH6VunYKdTbzsQ6RpgL5e0A4KY3mkPruxCipAtpmKpo52FkPag7B4GdnUDx0nUw7VGKYWgYcw==
X-Received: by 2002:a05:600c:4ecf:b0:439:a88f:8538 with SMTP id 5b1f17b1804b1-43ab0f277efmr106932725e9.5.1740666834363;
        Thu, 27 Feb 2025 06:33:54 -0800 (PST)
Received: from CTW01359.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5871f4sm58768295e9.39.2025.02.27.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 06:33:53 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap][PATCH] ccache.conf: Add include_file_ctime to sloppiness
Date: Thu, 27 Feb 2025 14:33:52 +0000
Message-ID: <20250227143352.1896473-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 14:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115690

From: Fabio Berton <fabio.berton@criticaltechworks.com>

When multiple recipes are built in parallel, Ccache sometimes refuses to
lookup some objects in cache, leading to undesired cache misses. The
root cause of this is an interaction between the way how bitbake
constructs a recipe sysroot and Ccache's `include_file_ctime` check.

Whenever bitbake creates a recipe's sysroot it hardlinks the files
provided by a recipes dependencies. Adding a hardlink to a file changes
it's ctime which in turn leads Ccache to believe that the file was
modified thus aborting the cache lookup.

To avoid this situation, add `include_file_ctime` to the list of checks
that should be ignored using the Ccache sloppiness configuration option
[1].

Example of a log entry that Ccache ignores a file:
/
|recipe-sysroot/usr/include/bits/pthread_stack_min.h had status change
|near or after invocation (ctime 1739822508.107677255, invocation time
|1739822507.970071107)
\

1 - https://ccache.dev/manual/4.10.2.html#config_sloppiness

Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4899698297c7783e02aba5388e0469cc83bd2f70)
---
 meta/conf/ccache.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
index 4406ae561b..499e5327b8 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1 +1,7 @@
 max_size = 0
+
+# Avoid spurious cache misses caused by recipe sysroot creation: Creating a
+# recipe sysroot hardlinks all dependent files into place. Hardlinking updates
+# the file's ctime which in turn interferes with ccache's include_file_ctime
+# check.
+sloppiness = include_file_ctime
-- 
2.48.1


