Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86FAC46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 10:35:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.15204.1706610905442314334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 02:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkAkwEaJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so2996124a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706610904; x=1707215704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQrzPIGRJZARqC/vgi0izqNynUxZoo0Q5wiO3Az/v1o=;
        b=mkAkwEaJ3+envqMgyT1exTXmF9sby2yvYbIHXyO6ENwcqR0H36VT0kaEocxegCKAv4
         SHdjVcudbqTpFavb84BR6eXL/Fk/Gvco5+LdReZzrLsYHjGIT98Cu60HohGHdL0uT2Xi
         48pGa4euErMp3kHkVWsrJFdO4Hol5mIlEABzrI7uJHLiYZ+NOIj+k+TGFej0tPg+QrKZ
         Rhz4z7p5tJ0MlmnfWAqf3iN9X5eLY25FmPQt5wDVTlyqTKtE79uOXgLIisLwD4vUmVft
         s8zwIpS5AzhVt/2zT08xK5tz0iIFN7j2ztnj8jTy/gbng5S4c6HF4gcqtjfJMiRSQmGm
         kTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610904; x=1707215704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQrzPIGRJZARqC/vgi0izqNynUxZoo0Q5wiO3Az/v1o=;
        b=aFVEhfyy0Wi5n98ZJ/2/eGNMXRaXjZFDI1A7GHJaqEbnPOgOyYSmZU8gE1RKCAt6VL
         1WpLEWJpZe71l1xIaR5ATgkolJ43YJHRSPHjSxwy+3bBFiio4CqNIlaocnA/8K5yZM2w
         1qbG1QR6eADEnyTjf+VqcTQmQwjTqmowIWfsaRKze/AleTf0At7zDGzYjU+j031shwW/
         mWERzYhN66t+KlJRfECpcnNQ0l/RPgs+yNi/hRDqtznt3Sy2W6nEBiLZf+6XLNZWmNBN
         mTmC4re4aBVdXv5fuzi+dVbOG0BQ+IXcf724WWPsCgi8WRiRlyh83tDC68V39gUJp4Gj
         JBog==
X-Gm-Message-State: AOJu0YzLnrzdH+CMgT/fu9gaQToo79NPCHqhBsAVk2o4eex8ssRBpJhr
	AtKnlma5c/XoWKX5XgcK+sDVq3n9I8FvO4obs7CjxxDKy8ikulR/vuDks+0B
X-Google-Smtp-Source: AGHT+IGlkPlEn7aN45c+IPU63eg8uATevE9QSIcVPjrLUr7C3HdHlHStiGMaPni63DP6zGl9Q176jg==
X-Received: by 2002:a17:906:e2cc:b0:a30:8c7e:5f7e with SMTP id gr12-20020a170906e2cc00b00a308c7e5f7emr6393003ejb.28.1706610903565;
        Tue, 30 Jan 2024 02:35:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWJnIbzIlWO+0BZU1LQtD0DSiOsdofXLjIzU31k6rQygTU4ek1DIRUvQhb9x2gcOU5zjugUq0HDg/jyjf7NhlKnM454cxmp
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b00a358f659989sm2738497ejb.113.2024.01.30.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:35:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] redis: restore Upstream-Status
Date: Tue, 30 Jan 2024 11:34:57 +0100
Message-ID: <20240130103458.819774-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108492

* accidentally dropped in:
  https://git.openembedded.org/meta-openembedded/commit/?id=e91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4
---
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
index b562e2522c..48a8bb5b4b 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -16,6 +16,8 @@ updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
-- 
2.43.0


