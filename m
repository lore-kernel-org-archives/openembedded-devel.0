Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CBED2B93E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19497.1730817402031802111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PjUTYkMF;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e9f8dec3daso42861597b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817401; x=1731422201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+JQLhAv8ZVy95KdzJrfUFDQHAU1m9kvkiZuhdUFzEc=;
        b=PjUTYkMF6trm2mSYAdZKsi+NpkPWYE46IcFFvegnQyC0P3lP+e6RViYnVLFfB5a45r
         EFXQYXGDOodyXf3tGHk646neLsBl8FW0e4zVGvgDi/jVOqsz9tEtK6YxmxVDIxdZ4Oz+
         1OOdlL2IYgRVlEn5ITBOQv56XruQIKZsCljrqOReoL03aF6jTEeUUllfGD5coxsKZLh5
         zyMb7+5IX0lUuynhnchshLbd9aPOCQWBd4kfAxfgs0JYgdaEPQSygnyyrKYMLMPQT3mI
         eqiejxEhqr1OdpU4uXDekT6wOOCxcHE6HAXpb909X8SlX9UvCw1l+7LkGCbDhGHZR8sA
         jQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817401; x=1731422201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+JQLhAv8ZVy95KdzJrfUFDQHAU1m9kvkiZuhdUFzEc=;
        b=PQefdp21mp8sYf3pdfDxr5ocv46WU1vvFuN3JzwBJgVHIapDQGSZEU/GtT5b6gkYHs
         jwl7ltYlzdqzJcBwefzIBfj4nR1m08eYOI21Nf0E2nuIpkjCmgERfB1oZsVjbFBdb2Io
         e7deJUhLrnihDKozVWxHv5cZU6sDElwjJPaJVQ/PKAS4tqtMViFmWc20K7nR7nnkdCWO
         irkK2INaLyXTThcQybgfr+OSFKF07KNoLOcXrMtAXc3oqrVu9Gcuy1MEayJS6Ii5MVmP
         ZEq/98EuViy1EqPdkQrjgp89OMYQJbiv0pLdGyHAnNQtJNPmp79lRLReuoiuRuuVVugE
         wwag==
X-Gm-Message-State: AOJu0YxRXORo9h1hDeqP1v1MObZpscmuA5Z58puu07X+yeG7HkewwE3T
	Ifwu/zoUexAQHnbnvF5fkbLcX/NNP8lWHrxh/Zq/7u7ryJ/DQO8tOUHIlw==
X-Google-Smtp-Source: AGHT+IEs+CrLRjuRl5W51gUvrng9kCIduyyOLrcUkMTu6jiJE6PE7hSxk5BIPuVqef8JSaXmASGfdg==
X-Received: by 2002:a05:690c:4b09:b0:6e3:b6c:d114 with SMTP id 00721157ae682-6e9d8ad309bmr376511717b3.38.1730817401120;
        Tue, 05 Nov 2024 06:36:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 03/90] gnome-backgrounds: upgrade 46.0 -> 47.0
Date: Tue,  5 Nov 2024 09:34:28 -0500
Message-ID: <20241105143638.2301245-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113421

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- default: adjusted optics
- lcd,lcd-rainbow: nostalgia pixels
- map: geometric vectors
- pills: shading improvements
- sheet: curvy curtain
- swoosh: classic gradients
- symbolic-soup: noisier than usual

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gnome-backgrounds_46.0.bb => gnome-backgrounds_47.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_46.0.bb => gnome-backgrounds_47.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
index d938ae94cb..8774750e95 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "4ddd3ac439a4a067876805921bb75f4d3c8b85a218d47c276dddde8928443c2e"
+SRC_URI[archive.sha256sum] = "874a4a39c4261736f6a854722833400b612441c4681aa5982d90b15abc9c91fd"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.43.0


