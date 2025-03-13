Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298CDC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 16:16:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.17829.1741879910259833545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 08:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h/Ffhpx6;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc148so762335f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741879908; x=1742484708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72hqLRnD+8DwAFsMN4o9kEz/5hvdyVRbMNZiZXWwSn0=;
        b=h/Ffhpx6+yWr4tjxW6WT46WR0wb5g+6d1qIkzz/B+hZdg+t0UuXEabu62MnKyz8LR6
         0KGw84QWn9OFfexDIx+P7aDtxb4M52XZAdf1qfBtkE0GyHNKkIXk+vyuidQmydiG8ZD8
         hFDx/5Dz3LZeqXVDabOINTPimYtcEF93clPxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879908; x=1742484708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72hqLRnD+8DwAFsMN4o9kEz/5hvdyVRbMNZiZXWwSn0=;
        b=t1rdDJmSBLg49sPXzP5+YpFHhf3FSG4E06Lj0mpglTxfb6dyWbLjKITS03WHrKXrvN
         txHPN6gpOgedfv8Sylq045X/E8D1q97frOjJU/NzOxyC68PhcGNr21/sI16KCtZ3GuTS
         nxWezW4aLXsnXx+kYQ2O6X96CxBNL4B5AichGsv6ZYGwZKLR6Ff6NR0jStT3yDJuNADE
         LPv5mw7tIpAuZkB2OxcUY+kYzIDveyG1E564sBZMjvnjK/QnsLXuB6rAxy/+37OSoPwo
         wbWVCWV3WX5zZ0aAjcp3MaXoHMkYzpRBC+kuWILi+rJ7bB+UfY2aFlAhWHarZd/KjPF3
         FGqQ==
X-Gm-Message-State: AOJu0YyvRUk2f6qdxjadD/mY35lFQOX7RJYErt9MyWVBq+rzqGdIGDbo
	PcwIJm818TwJkVbRJNNtChUxfzRCbgchkHqVUNgEsZM2TZ8T3YelMx88RFAJgm9Yrd1nGxw2WUa
	u
X-Gm-Gg: ASbGncuqkJ/8UCpf94ddOncgbMOgZFo9haaVkaQFvUfKw9C3Ss5DP9YRSlPmTQvs4i/
	hvsEm+epAGBRa12+bGgtbdgVvpIAFHoLRF8Hml1oPeqx3bRuwy0P51Gd6JLgqGfGaActcjEx5mP
	IgmY4pYBdEvs28CKdTRdcun4tssrpu7UQobFv9h6F5kQObnEnkzRPLTnt8UMVqx/i7qqYMDnI2j
	9hwN1Z/v2W++8slYGo+GUotP9xSO+0+l8dEFEhcTkxHukOjFZNc+v9kFJLN3AjW3olGkE/CBzTi
	VTs0sYU5Mp/+RYAeBREGYzO1XOZs8jnqW7q9xjqgvachdxIEmLNnbsO3mtpb7F7O/Nb+DA4FsKI
	nn4rUW1Xjcg==
X-Google-Smtp-Source: AGHT+IEahpOZxcwUEdOLU4SrJR91m++WsHNdqa+dnol0GTNnBsG9/6pWdkhobXfsxlWVbidj/lzezQ==
X-Received: by 2002:a05:6000:1faa:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-392641bd0f0mr13319565f8f.16.1741879908030;
        Thu, 13 Mar 2025 08:31:48 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. (205.226.7.93.rev.sfr.net. [93.7.226.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df34eesm2498231f8f.18.2025.03.13.08.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:31:47 -0700 (PDT)
From: "Sofiane HAMAM" <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [meta-oe][PATCH] neon: fix broken SRC_URI
Date: Thu, 13 Mar 2025 16:30:57 +0100
Message-ID: <20250313153057.3925895-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 16:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115977

Update neon v0.33.0 SRC_URI, old one is not found in DEBIAN_MIRROR
at the time of commiting.

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 meta-oe/recipes-support/neon/neon_0.33.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/neon/neon_0.33.0.bb b/meta-oe/recipes-support/neon/neon_0.33.0.bb
index 66398c6de..0ab6d25f5 100644
--- a/meta-oe/recipes-support/neon/neon_0.33.0.bb
+++ b/meta-oe/recipes-support/neon/neon_0.33.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
                     file://src/ne_utils.h;beginline=1;endline=20;md5=34c8e338bfa0237561e68d30c3c71133"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
+SRC_URI = "https://notroj.github.io/neon/neon-${PV}.tar.gz \
            file://pkgconfig.patch \
            file://0001-Disable-installing-documentation.patch \
            file://run-ptest \

