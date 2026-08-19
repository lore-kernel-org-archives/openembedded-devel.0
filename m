Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE726C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:36:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.907.1787117798533392063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B/1tbIVH;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383cb94f742so806266a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117798; x=1787722598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A12g06989Eeyhaw+CW5DL6SnGrlDZLCHHWfx2FPO02E=;
        b=B/1tbIVH6kQeqyZ09bcygpsYbEbXW4Bna63NXOKzq80uHS703RuQiGyO1AMk1IT6xf
         /Z/6LuVjlOsTBGQX/8bMkLVofIZHjXL12px4DIGkvn/7HrrBF5g2GFXzglXLcfze4pcU
         +6EPADJNOzidpsT1ovIl+HI3EMXutjKVDsR0nvfre678l8J1zdhvgjrPgd9Ce7t2PJPq
         TVOCuSSBHr5tXTtsTJ1tBzh8STzY3ibtUN5IYP53sKyGZZ1LjvsU4iFglE0oJtdeZcyt
         kNXY4Ypf02ydl9tJ6Pz820VnyiNo/FLFn6llq/+9lUYBP5ASEHVFjHJspwZ+FGIORzeI
         Oczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117798; x=1787722598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A12g06989Eeyhaw+CW5DL6SnGrlDZLCHHWfx2FPO02E=;
        b=ZXcuaEWy8JxEJiOXycYQkciMDD+T0hsYicPNaJF544hIGJ0z2Db4ju9xpmccepYQ0T
         DaCqCmFeMyqaziODsz0N8DZviW6Kzb7sq9eZXJFzqwd18HYXCd++kVvTRwvmBdGxJaeg
         wBFLbo97kVgViOt/82kF0dqJBNOat2vzyixfigp5clYZyf4UAGXBK7f/k7FN3X+jdbCI
         vyTfdOoyqvmQS++3vq3YkSY/5GNC4zzyyoYPJWuoBDqsX/yyEa8sX+SPqo2EOOJiYata
         LGRPDjomxN7LzOh9azuQqqp4BGXenCCM1OMJvYRtpYxw7m1XZfdmRSL29IuM7xlq6S6K
         95ug==
X-Gm-Message-State: AOJu0Yy7oxLgKCEHn5ArKB51rAsUxpQsAtFOmMnVp3ofgte/3b07gdj8
	cKGbH2N0AK+0vbrpSJGmYRmPjTmDZTr8f2tNgtcT5N9IqKJPTkthkyqAt1vApg==
X-Gm-Gg: AR+sD120QhGk2RcTZ0yCsXEadr/SzdaL4+lkIWsaK2HG4LfGHIMMBVbIlxjUVc8MzDa
	W7i3ikRmEgMTJEtmFpq9WzBsMU67EWyWXWk7pbjhiGNtFQ5Wicrp322Ft/haHKE4ig+YVYm26Xn
	weP1684fvNRyamHHR2qu7RIaEN3ccrFRd+wnIpJ22S/6TlEdIuDRockC9EB4X4AHtBFPATNJ7fL
	xTJiNb079WwOcsIm/6atMgkePpevbjoeeSJN3iAmWedVjDNnUF9v3WKjDdlpKmu9J24dtPRWgcz
	qQyWrda10L8MxvzqYIPkFSGgSqmXR4v5SuxQb1e/Ur8r2UC/My0F7g5pXfWTv5RWYJzoxWn/PuS
	0WPNVSuqzDPqb/seAXxkPJufYxM+BsLM24zANeO3pGmqvz9T0B/Abnq+gDb7j5ogkUv0lucR1VU
	olf5pa8O2/ns/Z0o3igTW2Fx6HHQfExRkbbG+gPc3C6nH9nzQkhkZNKAPMTncwA65Y0eTw4wadu
	w==
X-Received: by 2002:a17:90b:584b:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3958110c322mr4074384a91.11.1787117797735;
        Tue, 18 Aug 2026 22:36:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/25] igmpproxy: add UPSTREAM_CHECK_REGEX variable
Date: Wed, 19 Aug 2026 17:36:05 +1200
Message-ID: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129245

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version igmpproxy
...
INFO: Current version: 0.4
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
index df1e8f27e1..fbb4e1f1f6 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
@@ -8,5 +8,6 @@ SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.g
 SRC_URI[sha256sum] = "afa4b75a823b82f71ce99f33eae4e8136b906ae8a5ede5caaad93bac38cdae24"
 
 UPSTREAM_CHECK_URI = "https://github.com/pali/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig

