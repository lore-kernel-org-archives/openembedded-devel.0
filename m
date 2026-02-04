Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B882CE8B388
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 18:14:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1608.1770228865222930692
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 10:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPNbdvUl;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso71180b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228864; x=1770833664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFUNpsLN+F0+zEoW2MUrXVhpmN6TJz+b2Qs0oFQbkCQ=;
        b=gPNbdvUl5UK8uwYjsCp41DVctaQp8iTgS/yVxtLIDQ/SKUdIj81jxXhNhMGQA0c6fF
         NL2k1dQPqPzoWzNktgOB7dxHpjEGf2jrN5A36ADLr606olGlrY7A7esCq9XHnHQZZn/h
         jGiJvVbHoD8+SwJYDoDVg+BiWqZbJnlVik1To+sBCFwcrBI+SxxLrS41HVRPeGwwjABd
         SmAbpSn5wV/anj4i4s5p8HgYsnwSRCOR5Utb2/QhuSRT1yGwaVZ/OxXeog/hSuSzXYi8
         vzQAZBKIzl5+6FOhSAosFpcvuAZeCJhk7bJvogrc9jPFOEHsLNGT9ZNSBPeWiuRhZK+M
         4HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228864; x=1770833664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFUNpsLN+F0+zEoW2MUrXVhpmN6TJz+b2Qs0oFQbkCQ=;
        b=ZneFf0ODSXwOd9wf60YKkRwowCfe6cYHKVf341iPhyU9fq3r7vNnD9hsFnynp+Erbw
         dvhutQ3jNqjbjV4rLuYpfTF9ghBYW9b0mwONQoPP9cX4DyLBCxBQvdZUUuM4sTAHItyZ
         fNRJC/vtTvt3pygjGUPQC5xbPfOLQzK/9MXjnzA1TdiPSe8q/9ZtPgvgNRvT6W9JWzJv
         2Zfw+AdIbRRjfXpwm1jzeNwON01N57a3fTlt4SqwTN9wUUuTDhNmslSi4D561oGvxW0T
         DZQhuTvPVJxpV6iIr+d079Mp34XoBI1HLTLgeAzSsfBYJ7kk92tiwiieVlEU6K9wecbg
         hQyA==
X-Gm-Message-State: AOJu0Yze+a/PS3CPuVxWEfR7QOjY6pQ1gNpGhubX5L9shg0rt1QW+V7P
	bOQIkCOvqQ6LN13JrMOFND+m+9HFX+009jYT6ki3VHQmdjKcrGkNgI4nBMw1XQ==
X-Gm-Gg: AZuq6aKGkK0ZpnC7EJ1uqimMYY66rPay7AtBDIrdGlg3OAbnGDZ1IfkSfIo6IQKL7ZA
	oM7XN7EW4E8n4rNcCVjdhbrMhDUGp//EslOg0lyGnEGN/edjD31jStqME6UCRlIJiTOWaWzWg26
	/B1lpYf6eh3yTOeMIi26WQIPxWhP0OWaVZldW2JlT0DTpH1T+7atncDESbpsy4Nip1EXBFj86b4
	9Wr49vwFHUtYbALVp8soWxFVAXNJxHgF/cTNG9vUcqJmNstXFGXjGrvd3jVjCeQYDEzsbmcnkdL
	ouJzMIVvLMcvVjL+d2joSZl3ABVqnkcx1kwiuVFcxSooxAIxxH/IryB7blGxTxQGslT2S0vaHLG
	+h1mQSKW/Fymv1aMjCNG5/uVTcTOA/pySF5tWV8JThdbY2A5mdUpxu+reZ1VFGnmSV+KtMCDNcX
	jqHoshqNNna3WnUW828R38pp8=
X-Received: by 2002:a05:6a21:114f:b0:38d:fa67:e87f with SMTP id adf61e73a8af0-39372090292mr4017748637.12.1770228864216;
        Wed, 04 Feb 2026 10:14:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c70b79sm3002988a12.18.2026.02.04.10.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:14:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] libcdio: upgrade 2.2.0 -> 2.3.0
Date: Thu,  5 Feb 2026 07:14:15 +1300
Message-ID: <20260204181415.199026-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124144

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream fixed LFS support on 32-bit systems, dropped CFLAGS recipe change.

Changelog:
https://github.com/libcdio/libcdio/releases/tag/2.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcdio/{libcdio_2.2.0.bb => libcdio_2.3.0.bb}           | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.2.0.bb => libcdio_2.3.0.bb} (82%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
similarity index 82%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
index c443d9b891..f8fd37eb07 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539"
+SRC_URI[sha256sum] = "53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed"
 
 inherit autotools pkgconfig github-releases
 
@@ -15,9 +15,6 @@ PACKAGECONFIG[cdda-player] = "--with-cdda-player,--without-cdda-player,ncurses"
 PACKAGECONFIG[cddb] = "--enable-cddb,--disable-cddb,libcddb"
 PACKAGECONFIG[vcd-info] = "--enable-vcd-info,--disable-vcd-info,vcdimager"
 
-# add -D_LARGEFILE64_SOURCE for 32bit targets
-CFLAGS += "${@['-D_LARGEFILE64_SOURCE',''][d.getVar('SITEINFO_BITS') != '32']}"
-
 PACKAGES += "${PN}-utils"
 
 FILES:${PN} = "${libdir}/${BPN}${SOLIB}"

