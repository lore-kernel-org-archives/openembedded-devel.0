Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55FFC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 16:57:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.18288.1717174635236669154
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 May 2024 09:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BIFo3fie;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35dce610207so1577136f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717174633; x=1717779433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDpefX8I8dKKf2DRUIerqaG59Yy8pOoEXRZkzLtgH6I=;
        b=BIFo3fieBI2RN3qTXJJE57Oy7ZnVRfVJhjStrg3Vkk/H+2wOeSl8tKKxeUP5iRe2al
         zng8o8tG8R1OFdJW11ELbT5jPLlkpvvtBqVdKrLq5retC/iumpcVDHq+JjaiNFUNN+Av
         ZkpkhL9T/myPZtQkv7v2eQ+SRb5Ih4QM9B/TE8HhtLPzCGKekhSbhCRxFd2GvT3i0yGW
         bTiuSGT+cRmouW/86zDFnmh0SYURusictnnTX3plHnIKjYeui8i/mdwVcNllnWXJn40D
         1XhQgzDEI2L8mOvAVTPcqd3UBX3lbrLYZjpRSw4c9vRDEXqnjAqupD5ft1MPJF1ghfOF
         6nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717174633; x=1717779433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDpefX8I8dKKf2DRUIerqaG59Yy8pOoEXRZkzLtgH6I=;
        b=Y1DRc0olArfoCIKNY+d4gcZkfUOwfpc3hBTbDAHj4V4wvF3DFbghfw9+Z+xq/i/gpq
         taUIFjGwPRcJ5LyC6rG3x18lZHQWhmL1t/KTb4PI3qBQnvRMC9n+Lp158uqD/r7F2hTA
         iJeomWJ2SvZ5kmf2xeCHY0j6uQB+nG4Yt4zj7/7UpspxnL148UtFpNAY/iqi5J9sUB8Z
         w5/sIfRJqcHMi16b1b8u6JtMKarH8/W4nhmGxkxrpt2ylRwwEL4AuFw16ocLoq9Na3Zs
         a84JSBX84VSJdImpPWqObOMS6pRaBeHORL1NcoQmAifP4dZM7As/ayLj838/mZjQ8qMz
         PR4A==
X-Gm-Message-State: AOJu0YzLKbdlz5sh1Z7gk+VIg0C0HU/MijzZ4zI6iym3kOmtX+aDX81w
	bNUX3jxzgMCq/UI736Q8ULWUWC2VMSzGxa+jQ3wt/tA5f1u2RSjTGfr6JA==
X-Google-Smtp-Source: AGHT+IF2tdQzMmF5nMi0gF7eisze3bC+KwQ4Cj3WS+8s58RAi0rGVnbd2l7SxfKbZQNHbpSaofS59Q==
X-Received: by 2002:adf:ee0b:0:b0:35d:bfe2:baaa with SMTP id ffacd0b85a97d-35e0f255209mr2549028f8f.13.1717174632612;
        Fri, 31 May 2024 09:57:12 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9364sm2229508f8f.53.2024.05.31.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:57:12 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-flask: added the async packageconfig
Date: Fri, 31 May 2024 18:55:08 +0200
Message-Id: <20240531165508.755680-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 16:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110655

The ptests did pass and some extra tests where added when the async option is enabled.

PASS: tests/test_async.py:test_async_route[/]
PASS: tests/test_async.py:test_async_route[/home]
PASS: tests/test_async.py:test_async_route[/bp/]
PASS: tests/test_async.py:test_async_route[/view]
PASS: tests/test_async.py:test_async_route[/methodview]
PASS: tests/test_async.py:test_async_error_handler[/error]
PASS: tests/test_async.py:test_async_error_handler[/bp/error]
PASS: tests/test_async.py:test_async_before_after_request

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
index 99524b437..1de1a827d 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
@@ -19,6 +19,9 @@ inherit pypi python_setuptools_build_meta ptest
 
 CLEANBROKEN = "1"
 
+PACKAGECONFIG ??= "async"
+PACKAGECONFIG[async] = ",,,python3-asgiref"
+
 RDEPENDS:${PN} = " \
     python3-blinker \
     python3-click \
-- 
2.39.2


