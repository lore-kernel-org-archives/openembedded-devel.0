Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC012C0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:46:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.321.1737744397849271483
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzhMzOIq;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso15867645e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737744396; x=1738349196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wJEj0UIujTYhTAZeNNlsk81saLCbFGEgnqC+WqUlpU=;
        b=BzhMzOIqijLTiC2T0QmYGZTYoxzEPsaConXgsvzHgRNGiAUq/Sxwl3XBZAXMX2zfqn
         8HBUC/I64+rfjhjzjOFSyWx9U7t/Y2glMeP8E6x1LgcE7VUg3b+5FgpVIi6k7EZWJuXf
         IBfjOhRIELRplHgWo1EmZwp5tQIKvBAowIeIoiA6KR63spbDvZ0lDFuGUySwfoBiG36G
         tMF5VJtSoFLvltEiSYr7Na+sDU3VERCRGeHnAfLZ44nYtwkrJJ+qZ+GrqRw/ZTZ6DQp9
         uvSkItd/Bgv3bDL1OwHoHj2VA5jmMPVXGB0kOss+DD7PdZfql2Lbg55Njf3ckJRsbNGv
         logg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744396; x=1738349196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wJEj0UIujTYhTAZeNNlsk81saLCbFGEgnqC+WqUlpU=;
        b=diqYFzT3jBUWx76JWim2KIP5ig4DWhfTRnTs1j/mfi8TtBeAHqnlHvLwV6WOQ07SU2
         SkBUpZTFqUrH2v2Xt5G3QhLge2Nh5LstiytyYP3NA7OqlbLYNRVjFlnm0j3VcEM+BzU1
         sSPWAnWIv71wStAKKh9eNa3GjOqZLKz2kGIl+HVlbLgd/kwvaCD5LzW62C5BmnAyJ4yU
         QOmqHHBxK6FUftA+3ob/jjl1s4MeoDWNw/JMqI/pdhZSNWXY6zSenfK2Ts2xXoaFbte9
         u4kfpqJr1fDALZqRsFYS8m47LFlEOCvhD4Kxyv3mgVskzFvNR4yK//ptQzz3+3K70QY9
         H7qA==
X-Gm-Message-State: AOJu0YwFr4j5spfq7DtbvaCpWbg8lQFqyH1ddAZBAJ3LW7/1c0CADHV6
	/nmNALwOXiZXaB40KJ5drQcwtsz5Yzj0XzxGV5NUE947dX+QBclcUB+w9Q==
X-Gm-Gg: ASbGncs7kHmgfqqgkZE1D8pdSSxqRzfH0EJYwlHKY1vwAT4RFVbCBQsK7pD9O1PwQOs
	gSEHrJ/V31vtDn/N9r/izeVgQ4l4qrNZsL2/wW1uNEjUa24pzrfvUsRy0M7kYp/0OWFTkCU8Q9+
	RoQg/VK/mechiKf7ijgLZrNhZ9P40cIs/68M82M6S9DjHfdlaLODv7BmzOGFL+reL/06/02edmq
	A6+4zQGxsrdoh/KCzBwia3ExeN/Zqf2xPOieX8hbTPiG9Z7yCfSmXVy1ejoDFGvqZj3IC2Td8y/
	aq+p7sedSrmFguw5R3Xa
X-Google-Smtp-Source: AGHT+IG5qFefntvPq3QoQN3dErPdUdhHSlFhiiOjsexoLxOHI7hiel7oirZUfMmU3OOHlQ9466er0g==
X-Received: by 2002:a05:600c:511b:b0:432:d797:404a with SMTP id 5b1f17b1804b1-4389142e0e8mr272758615e9.22.1737744396101;
        Fri, 24 Jan 2025 10:46:36 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa46esm35676385e9.1.2025.01.24.10.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:46:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-robotframework-seriallibrary: correct license file and checksum
Date: Fri, 24 Jan 2025 19:46:31 +0100
Message-ID: <20250124184631.35956-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124184631.35956-1-skandigraun@gmail.com>
References: <20250124184631.35956-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115072

The PKG-INFO line referenced in the LIC_FILES_CHKSUM variable
is outdated, and points to a non-license related detail.

Instead use the LICENSE file to verify the license.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-robotframework-seriallibrary_0.4.3.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index 0f34a1366..c48c3e2ce 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Robot Framework test library for serial connection"
 HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=1af2e051b493d9552af443cf2f99d480"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad407cda031a6aaf51a1fecaaa6e7d29"
 
 SRC_URI[sha256sum] = "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03fa66bae54777e6bb"
 
-- 
2.48.1


