Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80F4CED24E
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9415.1763461892280778547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJp/xX3C;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47755de027eso36716005e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461891; x=1764066691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUViEkyBYse2/CSpeN0PgB24SSZZQq99g0pigssvdqM=;
        b=kJp/xX3CQJxb0Y9Y1zUr6YEd3RdW8RT9HnG+5E5736PKbFzSt+NQtNzqDzi4TuaK42
         nZ7fe7HXESZC61hhlb61NmC11UofxOi1T5y1YtWA60HTqeEhg3eb/99KmF7O1m2i2SeJ
         OwFQ+wZILj/KVe+JADiKPNMFfKGqQQzaw9mE0sbC0LqNOmRdkGvyUP9XPp03RQ2A9N0l
         5E09sj9ic0YhMlQDu7NU0Fz6mK58juDZjtfpJIEUXnR+YmldcrmOWRXgo4OocnqxirJY
         OyEP+mofmVgfxq3Aeg8qkanrF7aT4Nc8ml8KvdIDjYlFhEt746o6sW6TYEzI68oXfB4B
         SKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461891; x=1764066691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUViEkyBYse2/CSpeN0PgB24SSZZQq99g0pigssvdqM=;
        b=MWILoFVefBt7TLtuXC6DeUw91dC7S/NRomCnboUYveYALgKihPkJL9oKYcpnaAg/9n
         3XAaO2vuyXIjJpE1HJYjMW5ckIP8LM0ebW1pjNtijye4NKvKk7MgJni3tm73mUUcdqQt
         YKID14v+D/68D45kLeiiEz5S6iVdYHuihUy/FAjuoUOC37Qr5p6fn40rdkwFT9EgYOYO
         1LgSVU15FIMrpc/X5xE+Kz40yQZZuj5mbpz/91wmcP2SVXoJaNKd8gTy0BzFttb/6ji2
         RXkd6f7EWWwfThLJUav/pytT+5K7Nkxi11v5Ib8vvAWCpYKBDQkjlFt+Ah82EYNEG+1E
         DoZg==
X-Gm-Message-State: AOJu0Yzd3zt7xF+0Ofcfv9klgojXMhHo1taZmaTiXfDhh6uyxJrCUwJw
	iJ7xA89oUl+lWG4CQh8ahUxoA+97Yoqv6AmhIaAUVLiHr/J5ARqqS77WIwkztJhp
X-Gm-Gg: ASbGnctlz1VELHggnJwhqzkTBpyG+1CaDQCLYyf/FSxMb2E9p9eQU2eJ3fg1qWTKqGG
	xxIw7MCuzU1rZkNm4FDHb3ayR1lXKjPdgNDPtdFCyYMSWqc91XWIj5yJsjE5A+wKclmx1dS3q8c
	kWScuXXmwDBJWyKwWeaj+LSIV8/1JlWnyuW45dLVDnVGXEtN/pudZqJFrI6YuyJ5vEbdBdlgTyB
	X/hqHmJGfrZMt6avW4LRnRBzvkYa2LbjoK2ozuBzTuNRM45pY/eQRzTWUKhwSxwvJ3MLdbeBT5m
	LItqkaq567UGRi55ScvTPSb7sXLoK7rAOB8WVLlICnYlndq9DTpSK+yvHtNfIR7cOViQG1HzZWI
	L/9AXR3wEksp14DjcmMIx1pR00x1nF1bYt3i3IVjW5rwZBd9xliU38nyJkSp00+P5xmgq/IhzQk
	K69GuaSWzH4hbqCbsSjSPh8YYlzNR2zA==
X-Google-Smtp-Source: AGHT+IEArXZdU62qShHWV9RevlLRPHgx/i5mhKkg6s70Mu8jRsdGDM370Y6+NwC7LZ2/KKMbpC+AuQ==
X-Received: by 2002:a05:600c:6385:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-477981470c2mr117663575e9.5.1763461890327;
        Tue, 18 Nov 2025 02:31:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/6] libwmf: add proper CVE tag to patch
Date: Tue, 18 Nov 2025 11:31:23 +0100
Message-ID: <20251118103128.1471091-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121843

CVE-2009-1364 is already patched, but the patch didn't contain
the necessary tag so the cve-checker didn't pick it up.

This change adds the required tag.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
index 9a8cbcb508..3e6ad6a49b 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
@@ -4,6 +4,8 @@ Upstream-Status: Pending
 http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-useafterfree.patch?view=log
 Resolves: CVE-2009-1364
 
+CVE: CVE-2009-1364
+
 --- libwmf-0.2.8.4/src/extra/gd/gd_clip.c.CVE-2009-1364-im-clip-list	2009-04-24 04:06:44.000000000 -0400
 +++ libwmf-0.2.8.4/src/extra/gd/gd_clip.c	2009-04-24 04:08:30.000000000 -0400
 @@ -70,6 +70,7 @@ void gdClipSetAdd(gdImagePtr im,gdClipRe

