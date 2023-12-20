Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C2BC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:47:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.22848.1703083640675830961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 06:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AjW2JfM6;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so7230927a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703083639; x=1703688439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO/71XNwjf23yv5LO7px3DVJyQH3zCeVt95MjludRhA=;
        b=AjW2JfM6mwSs0WimWRcgvoXP9fsRDv0szZ6EFL4rr+cKWFnQw71m1F+B58NFewYrEx
         uFUCW//KrD4ltcaHSS3qTiJBY40gxUgN0nv9CrECbt3Wh7zb5+tV9EfOIFlMYK+MBI3o
         ii+6Va6IYRMxVkJK8aOkv3GT4RHYr2Ug527sBi3mFoAaqZT41OJubkNSJZzZrmHjiKf8
         40sXgrOPHt4mfUBJJItDCibPwSHh8MlxR1/9IEjEAP+NO8hksBZYy5/nvWHRKlryrx6g
         wGCJm8C5ODkcvnmd5jjIEo0R6A9iQ5ZZV+6KJXUcJXqa2WSipiyUiqiXrjDqb8EvEQme
         zWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703083639; x=1703688439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dO/71XNwjf23yv5LO7px3DVJyQH3zCeVt95MjludRhA=;
        b=ekHvkPDQO5mHpjkeujpKu3UQv9EGl+o6BjTRXrTEGdFmrQCHwgSX4A1coOMREDSNJv
         8w5Ce1JPX+P02rcteZ6/KJ3dvTAepj4eaL02XlTVMjMcEsH1HXXARFgmij/8bFXjmEf0
         OrtFAWt6RW70PbBceO5EZw17eyBd3EGWKwBhe1BxedcbO5fLroHWA83rrmJSyiIyYI+p
         8d9rdtDMo8HNxXtuVt5WugRumZ9wP0EBy7xFhLe+l52mBi3fRv+2lIwkf4V+Xed0uTCa
         OBWDMpFVgkA2kdEIyMwmkYmGvvV05eIR5oLg+kv280p7JwnTMmw63kvouh4f0bAgyfYc
         FCww==
X-Gm-Message-State: AOJu0YzUN6c/fjQ+siJDFyWvX8a/crCebFUrNvZkzVWOEiAyeNS9Q1w5
	eW9nsOyj75XiX7tqle4mODj5eDuUHJk=
X-Google-Smtp-Source: AGHT+IGgE1IyiRzcLmJl3v7EA9P/8Qqsqa5ljFPJgJ/P8e8EzJ+6CxuFRLk3ne4vFZYeNOe1baxPCQ==
X-Received: by 2002:a17:906:1841:b0:a19:a19b:4218 with SMTP id w1-20020a170906184100b00a19a19b4218mr6276758eje.131.1703083638917;
        Wed, 20 Dec 2023 06:47:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lm11-20020a17090718cb00b00a1cf3fce937sm16686923ejc.162.2023.12.20.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 06:47:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][nanbield][PATCHv2] poco: fix branch
Date: Wed, 20 Dec 2023 15:47:10 +0100
Message-ID: <20231220144710.438752-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220144710.438752-1-martin.jansa@gmail.com>
References: <20231220144710.438752-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107660

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix branch again, now it has "poco-" prefix

 meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 12532e4ef1..dc73497257 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.12.4;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0001-Fix-data-race-when-create-POSIX-thread.patch \
            file://run-ptest \
            "
-SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV = "3572a1fb981672e2cd1d2533ffd836da7db0f414"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


