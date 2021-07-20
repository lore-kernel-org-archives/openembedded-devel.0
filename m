Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.4164.1626761655537798792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 23:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W6pMr2bp;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id t5so24662267wrw.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ug+LAP2FfllFn3iHe/wmt8xAVwvEfLZ0w7IPMk/SlQk=;
        b=W6pMr2bpY9ElfHw+Re9sewjj7vmv31jlC2UqSY9c6+AJM7sAbzvSZTY2irhHfW9ZHP
         AUqp/eXBVlFWiM2V54nZyUsnhbZpJY4vAk36JsJCibPettKBSZuZqqhxaLrnTBNNZ3lO
         YZ8PYsn3xBTrtHJUuBFxLClpmh86/GHzhJogQUfdoYysav+hYR4Lrv0PB1Y2Ya0i4WNO
         DWOYriABfiQCnVHNcCi+HOugr5YRu9vOmL2+s64CL9EmANcaKVISKtG79QLlYnZlSU17
         4NTZqfNsn7KQ46G3+JxHDQ/eKLYpUDbTmfMgbMke0WjT5s5+lck6vBDUsaB6rJjgstgb
         wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ug+LAP2FfllFn3iHe/wmt8xAVwvEfLZ0w7IPMk/SlQk=;
        b=g1DR/J46Sz/9Y+or6la5XQVSpJYbKAHz93qV4egP3d7UxETfj77cvIlqDtA969JAyy
         UGAW4pF3Ch0TR+/dKAo6sc5pNK3ySAEEbi4TvbanVagi6pYwOoQwrmIxEsQW5F7pgPiQ
         JH/y+oz0QHyUG6iMJtNMQ48OY7tykqLR0nDOx3WjL5TxBbQSGqmA83rh9LQ1YUY+HQkw
         9nVTfk5QJOp43ROzSCj18z0ONTMJ74yoMpvHIxP38tUMOf2qMpkOfbvdMgACkhKVlXMg
         dw8Qf5YwHB0wBgwl0y2bxEcGPYRrB74h8tL6aazVA2nv1XkEmRNUUiwnAnerZVn38X7a
         pjvQ==
X-Gm-Message-State: AOAM532icvyyVMMLbIC6eFGCsMU8SddEIK4RDjOA5RnyY/5KIQRX2ogO
	gmLG5CopjBGOaNniqzFMFC6WuHIRRIw=
X-Google-Smtp-Source: ABdhPJyH4FL6S34jXWrxilP8EGTYdic7fgK2yFvLXMh0n0Mnhb+UU1aP/X+fZDf+C+oHRwwbN+/JHw==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr33310878wrn.329.1626761653664;
        Mon, 19 Jul 2021 23:14:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f02a430b7203cd4bde6d1df.dip0.t-ipconnect.de. [2003:f0:7f02:a430:b720:3cd4:bde6:d1df])
        by smtp.gmail.com with ESMTPSA id u2sm18205922wmc.42.2021.07.19.23.14.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 23:14:13 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] mozjs/0001-Port-build-to-python3.patch: Fix typos in description
Date: Tue, 20 Jul 2021 08:14:03 +0200
Message-Id: <20210720061405.2255027-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mozjs/mozjs/0001-Port-build-to-python3.patch            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
index e525047df..5cdad93e9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
@@ -17,15 +17,15 @@ Content-Transfer-Encoding: 8bit
   python/mozbuild/mozbuild/configure/__init__.py / Line 310 onwards
 * major changes upstream on build are not to expect so upgrading should cause
   little trouble and changes can be tracked by [3]
-* some solutions are workarounds/hacks so this patch will not be accepeted
-  upstream. This should not be a probelme for us: once mozjs >= 68 will arrive
+* some solutions are workarounds/hacks so this patch will not be accepted
+  upstream. This should not be a problem for us: once mozjs >= 68 will arrive
   we have to go to rust/cargo based build anyway.
 
 [1] https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32dacc383cfe4cd77/user/mozjs/python3.patch
 [2] https://github.com/mozilla/gecko-dev
 [3] https://github.com/mozilla/gecko-dev/tree/esr60
 
-Upstream-Status: Inaproppriate [Some Hacks]
+Upstream-Status: Inappropriate [Some Hacks]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
-- 
2.31.1

