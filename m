Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094F2FB3D0F
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48206.1774867170220147609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ihYK+PX5;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso758720a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867169; x=1775471969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQ9I5pkZxN5cRSXKPHsn1rWSMI45/iulmERRQHBk5PM=;
        b=ihYK+PX5Pj3wPpuxTqtjOAdOEGJAbYFr5u9juhmgibY4A7EZh5aLSCdjYNtBC0nPbz
         Z5piw0E+O1bQiFdeBM5sli7OXSICmTOlHhUl+GDssRfzYEZv0iVuBSzK+xvW3PXkzmMK
         K4Vki+WPmlEud6Rw5uael/ihX7GuEn8C5urWuLQ3WeW5tZDJM06USWn1pQJ6ezJXS6g9
         cuYzQGW0hTQ9GK0tjBpLNsLSOTgimxQWm3ImyG+fLD4Z2vb7XpSfFH5isamjGlvkT8RY
         fdMdYXGF52b2EaOI+RBC7e24vUf9OggMxlyQ4lowgpwr2+fXAb1F/VbVOlOuwRU+wQvA
         DnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867169; x=1775471969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kQ9I5pkZxN5cRSXKPHsn1rWSMI45/iulmERRQHBk5PM=;
        b=GnAPhu/Qu8pwlGwuGe8KlpE+2crsPy8nrun28wq/fvQl7qnSYUQ7hn2nzXZ2cT+RSR
         00daLOA2H0JcK9/crvY3Tre+DULQLZMZ8Vfwfsr5Hv02e2sG+PQ/xZp6YfAgEXZQOOtt
         d2c1LsW10730y//WhzIVVM7iA1dV6aDAiOeZEgo5YBEse3kDeCSDbGfIHn/CwuizK6Nc
         DtYyOrpOhdzcCg64vBZORNMcjQt30TsH8GnAAu3jWY+UJKNcLMK9xGtSF2rumEPZnXYe
         NUOITlFsILZL3FE4qs4ndnMtwOtuL+ieigsLDkOey+Gx4ucrhi8JSc928wuxFB1y+FoG
         EP9g==
X-Gm-Message-State: AOJu0Yz8vrhRLDSb1y4VpCRHFOi5EHUa6XdLX3NDlHWs3ePMkF4BWSfD
	W8Fmo+7swV1trevhVasUOjwFawCcVvE/LkNUtjEIs8537v6FS+ov+dGRPHWU0Q==
X-Gm-Gg: ATEYQzzc0FZPpNZe8vMWyh/LVKlbb3drPzN73UYnsFjvKpB6JYRW4aZvqvrNqxYVRUJ
	illKerGQuQUAcLsovXy5oQHKM0TcfW6EeFyRsdXC+harU25Pc5DYFnkIOqBtPr/lR44yXkQ9gXJ
	NHs+JrzIi4jy0d08TAAAnp6wDyU9+59kndRgwsK7BYG8Qf9sEjbiiNFKTaIuMOLecs+lwj+qEMQ
	XhVU9k26pkjHEKldFTxM6GtWd1jg/8Zkfc0RYnIjVIe2suoFyvAvvw5d5khbdXbLc946kJpbD/4
	CJcZXQgWArSbPJRO/jjUAIvl2Er8kNM54lzzj5ytOAbH7En2hfNuNDPr6uWbxB41zaA2+ix+Dlh
	mW6SU+Tkwi7jJpeBU2N0uF4kpTEMlhn5uRqicdiMdB8ZhyMIOMi/DCMM2dUVxBhPeIcQ0bMTQBK
	fC62RVswDphTD14hnEWt0Z3Fcvc55YGU/1op4=
X-Received: by 2002:a17:90b:3141:b0:35c:936:d4cc with SMTP id 98e67ed59e1d1-35c3002fd1fmr11588989a91.14.1774867169452;
        Mon, 30 Mar 2026 03:39:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 10/19] python3-aiofiles: fix HOMEPAGE
Date: Mon, 30 Mar 2026 23:38:37 +1300
Message-ID: <20260330103846.3381644-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125853

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
index 1e9ebdf97d..726b876701 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "File support for asyncio"
 DESCRIPTION = "Asynchronous local file IO library for asyncio and Python"
-HOMEPAGE = "https://github.com/aio-libs/aiohttp"
+HOMEPAGE = "https://github.com/Tinche/aiofiles"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 

