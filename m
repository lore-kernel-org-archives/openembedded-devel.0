Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4602C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 11:34:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9788.1737718482402259420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 03:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKcnhkjj;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd730so13892345e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 03:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737718481; x=1738323281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMKGDq9HrJEP+sBUHAa0pWcWtnPCv/a4mnuvyWzStrc=;
        b=GKcnhkjjW8Gn3kcMLjTQgDhxyGT0shRK4cOLFLUfHnmJaJ77OEitl6c6O074vIsksU
         n/KCXBjM28BJQcpqBciJMqKWygViDKNoMIQiJmdOyKbOcPRBJNKpUX/O2rNv/D7WC2mp
         czrgAD9Qbef7zjnT51rXHzJHnMdUsp37jJEqx2mRdXrBHlxc8RwcjXGFqRVS7YYezmGo
         LuqXJqrEQi0NRcqs4Zdkz+lZinPlgvFJ6GhBQszN0X3fAz1ujhh0rF9JRm7+ImhfI+b1
         14Ld5vHEhdTT5LOKPc1Ovmqoi8V+TiM4Us9E/Ea7mPiatWNh7/jmXfEfub78uOF75/vf
         w8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737718481; x=1738323281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMKGDq9HrJEP+sBUHAa0pWcWtnPCv/a4mnuvyWzStrc=;
        b=sB8D3hEMfQHTWVYpkGzEQf4tHLepWR4M4tMuohkJXOJG48//0PG67hVyw1QhFONO6Q
         F71kjl/LvEJza8XWhtMllrouwgzYTjfn3dgecGACGAxAdojkctKlhkL99tUcRHur7p5O
         BoCQPMqQxcBoxFdVBV29PBdfnSDkoHx8EBGMg0kz2JUZ1bFfn63bwT26FuAjXqZACQbc
         RFips9QsioK+3DJtJO6PZE6y+aCVtKS5YD6qPvKVxDwcfEePVGH+lm2HhICVlaFyygyc
         CYGYOLXjSJ8a0I1KYB+FUPLc1kAEBL3m/U1PDajwvxuAB24FyGpZvNniumY3yLLmm6vr
         BFLg==
X-Gm-Message-State: AOJu0YyEreRXWqxhxOs1i7FiYTkb+d8JHvVBtkC3gqWivexmGm/0TfWF
	fY59eKqXQwxPxtHl3RRU/aKTmlJrVshzEHaoZM8n7esHHdNqiih3pLL+6Q==
X-Gm-Gg: ASbGnctbNrbzm7Is4zbtdYOy1g226cd9ZgmcSFGxdq7jQrZlVffqJyigQUjS7OrS5Ql
	1AmChqnsD1o24GJJfHA5dAKmD2221XvvN6qmLZSkaSCRuPb3d6Z2stJCVrDvWI8kNW0srtt8MBJ
	hHJ63O02feUJMXkfuCEJCDxRM7nYC7hxJ2jwdhReTd1j3P++5UsecpFE3BDrYvz6+NyeNgHDGbF
	yisPYtN1snopxkZkgzx/n2Dx9OSz7O/Ss+tg509fib4s2Xtkx5nDswRtCCFLeUf/OzqaexEuYlK
	1trHM1CNskg4aTTC2IHJGhXaMyXEBtQ=
X-Google-Smtp-Source: AGHT+IExFmaKXOEJUojxcWcXEY1DGfuTVODdri2JOkCVS5kFoR7KhQPhbR4YHgv0GYjde15JxsFLjw==
X-Received: by 2002:a05:600c:6a93:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-438a9130aa4mr205532265e9.31.1737718480375;
        Fri, 24 Jan 2025 03:34:40 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6besm2424491f8f.27.2025.01.24.03.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:34:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH] python3-zeroconf: correct license file and checksum
Date: Fri, 24 Jan 2025 12:34:37 +0100
Message-ID: <20250124113437.3919690-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115057

The PKG-INFO file's content can shift around, and the different
details can change position - e.g. line 6 currently points to
the "Author" field, and not to the "License" field.

Instead use the COPYING file to verify the license, which seems
to be a more stable indicator.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
index f545f2b55..a968a6518 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.141.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=93e84222c4bfa3e70c20bb48ae9893b1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
 SRC_URI[sha256sum] = "c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b"
 
-- 
2.48.1


