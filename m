Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C33DC54E49
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 20:46:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.6264.1709239596941916328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 12:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNOkzZdz;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5dc20645871so970912a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709239596; x=1709844396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WmuKhW89TT1jZwxYSygxyNhnVQRkF3mPcs3LC2HCkM=;
        b=TNOkzZdzNJTpXOWa/NUGdM/Jn2q5j1tGsNjrSAow4SXlwDqMNdKVQhUfE4I3tA/moV
         cDsnZQkffQfylTi5oTrgEzA3LSuIJ4p8cfzR3sNukbcCOBk4AdniM00Gyng1XPBRO8Zz
         EbEjK/a34WhS2cm2DreVPiG3DE89mb64RY0x/MMSkUJwqlx4AvqipdgV9vZf0ch83aNQ
         I9jFtdVgMy08848sYWsL12VXgXHOYUUDcXF5uZMQKByM+lxxgKTsKpK4mZD6Zxclah38
         hHEhbtY0/d88MtfMJovZSgkQcuMLuWrEVitNwfA85Jse9xmWd/LZJ5DzyPdQ3zG4qlBY
         DbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709239596; x=1709844396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WmuKhW89TT1jZwxYSygxyNhnVQRkF3mPcs3LC2HCkM=;
        b=WEoy5Fo8ZoZRnwrhvcAs2lpXtGVMEoUz4xlmbvD8OQediFzMpY/j2477Sm78DagsR6
         niic69fNAPER6DDFxI5+S141UBcaiPfuBzVdSGRDI6TQP824sl6HznFEBf+J6EBmIZlV
         s9rLr9SsHdf6mURrQEa6rkhyVTNepMiOJ9sGAwCvKvKlBRpvH+KCBqaG9hMfwGn7rHSW
         8tHVVXl/kqBfqub3YSQJQwBdXRK0qdOU63BvGqS3XYI81UfZS9bZ6ci//RvoHy+cWYWD
         ctNtIKUDJTh6sx4pOHHpHiulvefeqvVyk3kfIamzeAzKpy88+8tbzdIMt3tKwKyMZIzU
         wH4Q==
X-Gm-Message-State: AOJu0YwkNQyB2tVwJqgyiRhHtnMo4QqKjXJCHPWnph+SAT3cwpv/h/XF
	xDDEBHNy5G7kIo7Y2tql9VdX/LphE4ZzQBh9hGNON3GeBYPKtaR2wJRDB5JP
X-Google-Smtp-Source: AGHT+IHPONzHqZNMLLjppWVtw/bX+aRL4BBhxulvpLU9BG49YRDkOurOMMvlmT2Y3p/f4pqY7FsFcg==
X-Received: by 2002:a17:90a:2f42:b0:29a:ef31:7982 with SMTP id s60-20020a17090a2f4200b0029aef317982mr34247pjd.16.1709239595931;
        Thu, 29 Feb 2024 12:46:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ade])
        by smtp.gmail.com with ESMTPSA id nd16-20020a17090b4cd000b0029b035682d7sm2451480pjb.9.2024.02.29.12.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:46:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-pyzmq: Add missing dep on python3-unixadmin for ptests
Date: Thu, 29 Feb 2024 12:46:32 -0800
Message-ID: <20240229204633.1320488-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229204633.1320488-1-raj.khem@gmail.com>
References: <20240229204633.1320488-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 20:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109061

Fixes
ImportError while importing test module '/usr/lib/python3-pyzmq/ptest/tests/test_ssh.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
../../python3.12/importlib/__init__.py:90: in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
tests/test_ssh.py:1: in <module>
    from zmq.ssh.tunnel import select_random_ports
../../python3.12/site-packages/zmq/ssh/__init__.py:1: in <module>
    from zmq.ssh.tunnel import *
../../python3.12/site-packages/zmq/ssh/tunnel.py:18: in <module>
    from getpass import getpass, getuser
E   ModuleNotFoundError: No module named 'getpass'
ERROR: tests/test_ssh.py:tests/test_ssh.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 5793db55f6..ca602d2507 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN}-ptest += "\
     ${PN}-test \
     python3-pytest \
     python3-unittest-automake-output \
+    python3-unixadmin \
 "
 
 do_compile:prepend() {
-- 
2.44.0


