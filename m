Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284B3C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69149.1782634346019243265
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jBby57X6;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30e9eefa268so1602409eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634345; x=1783239145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpE2IUE5s+wTp+fTra+gbXsKv/g0hImC2KnjNwMx5TE=;
        b=jBby57X6VfuTXptpl8n1HVXremUaEOsoDfT3HVZ9Aih53UX+EmSrevQkgYSFHDPkgA
         3gToN/jJhPh5/F7HvU84z2AHuGu5P/tLyIjEhlBpk0H8LkhUFE8N8MfMj3MdpoySFYwh
         qUNEXEYpAqJoimfXqVsorKXKZTDuhYHTN0kx+g/8E1Qlt+U86cy3O0a4yiBGeUP5SQ2l
         i9yTAt8Qy2JAF/86nuAouejOLTaY7L1JJRBUvUCtV69bstYE3UjCCUJrB5Xo+gtM/ksk
         BjnOVtOSGQshG5I+8KZFmGr1EhTwwcM4bDeTx8x6JJsnAuzUDNxI2YTjaZywmfSQPIx3
         +dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634345; x=1783239145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hpE2IUE5s+wTp+fTra+gbXsKv/g0hImC2KnjNwMx5TE=;
        b=dzXlws9iJ+kzua+9y+dr+MROCRYLk8cl8HXla9APZb1T+3DBt3wI1FrsomLjeAVuSe
         5/02G8nvOQrENwnTra83/aWDa+9l27okgqPhhGJRk7o0RtX0AXkA6sdNDn6VIT3s4WoY
         II5I799OENzCen0/ia9lnuO6PEhxaNmJ/Jh8T8cW/l08OGn5CJvr2NQdbVHh7GBKvyu9
         eH3Q6HJ8Rw59bFHqRr0qZstM0U+SCBNNa+3YI50KeA9/FSmP0lGFeXE7fEGl1lS/knJt
         NUwTcIIsuOZO3PCDbon8kEDgMIXEcAeJCcUpzWRYmkGHvvbpbpivpBJsB12AfPSuRJ4K
         T/5A==
X-Gm-Message-State: AOJu0Yw81bAQrzLfw6huvPqYj/XN5QjzpzPPyRfesiww5rj0FdDzvd29
	mlf5gk5kh5gEHp+XouyF9mUW/X419MOl+QaL8sGZflJjq8NvBaK6GDj2UNhKJGASOQy0qg==
X-Gm-Gg: AfdE7cno7U2yNmW7RmQ/Q0X30SHQjukGJ/uDcMJFNIEt4+KsDlS6nH4bqugW3QYz9Zc
	34HXzXyigKHVtuGoZrtaRjSEg8Ff3haDdQJMFo6QFQFolNBYe55HqdCh3uPbaeaVyJJpYR/vZZN
	gykIpp4hUPoKMAiE5y3Gb9P0mlcCP50yYIa9k4A/gdCxJt5xmo2d3kweZoZShycHCUGQl14uKG8
	GbBJvET0MwFnM9Oi/Ey9S38USZLcrX+MPZKnWysWpf5D7awOyKYXNpnVeiaTMYlsROFodwK77qL
	MwHe8ugOWH25T6QHrsaFWWYkhmWT5b70MWo61JX9L8nRGgBkVtxr+pYLPbLZ/WIpWXzeUi8p39j
	cm40qajh1WXy8yQlcYcVcAlSSz378y63MrFkpa2qlygKnRYO393crwudKIGt8wrtNSVeDBqFAJj
	jBLUtX/jss1CuQ/LVroXGhuEMB2UYh/G2CHRfAr3wDp/cxROD29maM1Z3EIwQn7yPOYkRW0rvhn
	hzKK1Jhn79KGbnmioda2B/nsv1mm+uUkyp0yqDM9idH1K2ZvtwPyZvTOg6xdwfJoEEr3YSE5DE2
	IryAJ1kCuE8kNav2WM7aKWY14wOL3kNHZRaNOGVB
X-Received: by 2002:a05:693c:2297:b0:30c:4832:1ac4 with SMTP id 5a478bee46e88-30c84d0f0c7mr13002665eec.22.1782634345317;
        Sun, 28 Jun 2026 01:12:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 065/128] bvi: upgrade 1.4.2 -> 1.5.0
Date: Sun, 28 Jun 2026 01:10:16 -0700
Message-ID: <20260628081122.178348-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127875

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/bvi/{bvi_1.4.2.bb => bvi_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bvi/{bvi_1.4.2.bb => bvi_1.5.0.bb} (86%)

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.5.0.bb
similarity index 86%
rename from meta-oe/recipes-support/bvi/bvi_1.4.2.bb
rename to meta-oe/recipes-support/bvi/bvi_1.5.0.bb
index fb136e16a6..b60702139a 100644
--- a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
+++ b/meta-oe/recipes-support/bvi/bvi_1.5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz"
-SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
+SRC_URI[sha256sum] = "6540716a1a3b2b9711635108da14b26baea488881d4a682121c0bddbba6b74cb"
 
 DEPENDS += "ncurses"
 

