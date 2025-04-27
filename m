Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723E5C369D9
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:33:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.23056.1745742660467833075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEDx0Ujb;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2391576f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742658; x=1746347458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzKc520fh+QG0cypVDvCQz6E22fC43Dj9IwZrjnQTc=;
        b=HEDx0Ujbw4jCyoHiUEGhiewY11Q6gLt0vQvUXxmknuT9E4EUEMW/93roo1x1jvAwqk
         CFDP5nTBqO2Eu6FI02LQuNIalTtIs//3c2Mcvt/Uc/KnLtuG5gCLy/dS37CuxG6BDB8g
         iSeWv5FOLKjTW01b8zPzWW4DAILJFn6GI8bTzgvcDJdLg6brUDDHjF3KuR/TpnU2M+Op
         3keYgjPJYdZrjBlFf+ukFX2i+t8qxFePjcJg0kO3+16mLbdHjqpekv85VEyoAFMxJ4JL
         tzKiP+ftWq6UlHSZpBhgrGNOUR9eNrQo5Zy3NYEde4Pbuvo1kxIUoY7qDWQZkG7BWrZI
         Xs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742658; x=1746347458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkzKc520fh+QG0cypVDvCQz6E22fC43Dj9IwZrjnQTc=;
        b=RiiyWFIMv7F3AnF9xsFmf5znO8QBtRnGmRA2TbqnTZL/4LC+1XsaNn6uKIGlWd87nS
         TO34iVeYc3qyWKUK55mpCLqiWBBuUtG+W61z+FBuo3MCXp/dlYtONFFCfgraV46jy+oj
         uEBfyvlWtTHQNVJULzD5BxMgfJKWr4vpaa2hjHqa3U6PovW4KyKV3qhE2HGW0CELgd0U
         iEVVtZnK3kAhVfzIiEdboEwMfzIYg9V52mp7jCn6g7sAsxLWKEfMlMqKE8SRsEJZ6+A2
         wEHwT2kVolLlu4yKX+X/JYCNmXRe5lnDLVjWfICIfL2Ek7AFueCE/mUQ2PhQRgeohnbA
         3eeg==
X-Gm-Message-State: AOJu0YyU5FW5tk+Ui4pmJTgWnddpyFwh2kpNYIK/7LMqUjEZ7wf6mg+U
	QOj+Pd/u3YLy3B+6E+YAH3ssSPvB4rs9ENvX0OR/5Tfq38541O4te8jrsXj0
X-Gm-Gg: ASbGncsi6YDo63lixhokXpR4wl4YxxlIpCtNi899F6H7rh6kng/KQ1jn59GY+A5XeRJ
	e8nXbU7rRTq5siXB4zEm1cAamfb7assKZEjUxEAWP48Mman0f0wM+GkNuaN6TUj0/p2nsFx5RiJ
	ss3eMzabK8rfg7HPpHM0+2u33ZbgiAjdM+wnjLjpiCQTrc33IRcTBo+9P917juXxcoTaJAE7Zdo
	A9aE0PtKnqopH7otqxBtfKK7KTJF1RpypFE5tfnsZqkrLEm5QBFsu16D6i3/y1JEQgL0HWl4KtF
	9M8yDTEzAXsbxPPHt4Fuw6E1QXCIMPpRz8JJog0HKDZtF23tKkTl2ZVKDvIJncSTaw==
X-Google-Smtp-Source: AGHT+IHwBhPALGpsc+J2kntTXTwJBLR/SH+RhqIfct5eWnl+fU8a4rWb12lcfKz6SJidT1cpaL35Mw==
X-Received: by 2002:a05:6000:1150:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-3a07aba149emr3222530f8f.47.1745742658160;
        Sun, 27 Apr 2025 01:30:58 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c973sm7801104f8f.5.2025.04.27.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:30:57 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][scarthgap][PATCH 2/2] python3-posix-ipc: switch to PEP-517 build backend
Date: Sun, 27 Apr 2025 08:30:45 +0000
Message-ID: <20250427083045.3757-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427083045.3757-1-gudni.m.g@gmail.com>
References: <20250427083045.3757-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117160

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index cf9e494b20..e314bb8e3b 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -8,4 +8,4 @@ PYPI_PACKAGE = "posix_ipc"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
-- 
2.43.0


