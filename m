Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9724FE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 21:20:28 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.2028.1734038424035362436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 13:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a7d7c1b190so3987995ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 13:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734038423; x=1734643223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mS1qKzqnhwYpFzzFMnqBV1BIDNNyjTU4TwVV6/dEeNo=;
        b=QqLHFLKbHGQTpD0nXiwrvLbJUWmcRAvbwJquXal5JbFwRQujMqr8CqxYZPZ2iO4Wfq
         NlUMnMI55325NZhjXAhhm9i3ypb3THnmP+t2XPDzSS0gJdMx7qbmxRC2F2nfCwpEgNgB
         HiVIxLpqDjafnirLvrHHv8OnEvQ+Nt74j0Y24JZoEsEFwnIgPhQl758rh++G4Mszp4te
         5/Qx4b8gJG7d7d1TWd9gR4+vG6aIXrFwFmq65SxqqSZ6US28xdiAhisuhNv5x1IWlqkA
         gXE1VudpbzCs6K0SSTEieAhDt19YFFptbMPE2QPGRvizMgYGxkGlY7YQUT51Dgq0O/6Z
         RMGA==
X-Gm-Message-State: AOJu0YzAodvaO2va9MAIYHy73G+xj5uBu2n5waJKjMkR8+OMEmNlfwl2
	JQ/sEo5Yz4XJmoGUfPN4mUf+KCzwgUWYpnKJyqYe07oYf+1oB24eBQrCRw==
X-Gm-Gg: ASbGncsb3XJ+Ow9fGXEJWdxHomfBVzMZKM/vBzEiI8Sc1S3hH+lMsiQ0oX7vUKbVu5C
	oXWFa3kelYho/bLZ7a5mclAXscpmo4UzIOavEo0cms1PsMt3+HM1HGesYBekDYxIqpS4JrbRpsc
	g4/zaH21GVX318m15hmYING7zrO3kaQftLwTZ+BY0oQVcyra4KZCkOrRVkUUfkKRxjMjn9CbXfO
	S8ypSKjB8Npaj8uPzKlxYjYT7+nzNQuZAalhG6FJoveVn1UkCf0fn2c8pseQLciTxrKHFVUu23f
	aFwqnj6w2emwpx+GF0YN9Yihag==
X-Google-Smtp-Source: AGHT+IEP+cxfh9p6gcQdKToFaP9FV0Kxvut+rziUxf6l1qMjSxSsM86dVDQovLINdNNCr/MeLhAMiQ==
X-Received: by 2002:a05:6e02:2188:b0:3a7:99a5:a207 with SMTP id e9e14a558f8ab-3aff470f565mr4028645ab.5.1734038422925;
        Thu, 12 Dec 2024 13:20:22 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2bb66b153sm2376537173.137.2024.12.12.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:20:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python-prompt-toolkit: set the value of UPSTREAM_CHECK_PYPI_PACKAGE to enable version checking
Date: Thu, 12 Dec 2024 21:20:13 +0000
Message-Id: <20241212212013.3548343-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 21:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114304

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
index 3ed18905f..fc9991e37 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "prompt_toolkit"
+UPSTREAM_CHECK_PYPI_PACKAGE = "prompt_toolkit"
 
 RDEPENDS:${PN} += " \
     python3-core \
-- 
2.34.1


