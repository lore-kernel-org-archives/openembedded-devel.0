Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web09.1500.1603175943621240406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 23:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@miraclelinux-com.20150623.gappssmtp.com header.s=20150623 header.b=WU6L1LsW;
 spf=pass (domain: miraclelinux.com, ip: 209.85.215.194, mailfrom: taisei.nakano@miraclelinux.com)
Received: by mail-pg1-f194.google.com with SMTP id b23so498055pgb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=mBHc7lN8u5NY/94UuJTp0PvMirc4pOqdsS69cXoWLDk=;
        b=WU6L1LsWB59djwQiFBhYKdrg6NZWqlHxwoii/kePJLbMgEKyro6bE3vJcTyu6zUV9n
         SlqzOKg35IYVj8bXnx07ohuj9J3aR5Y3fzEw051PQnVaxGZs25VcqySJtn0MfPctOwXt
         OtpmoUuw56tDl6Kj3VdU/ot3UjWi6Cc3ynisvlhnMLq0vH5ge2Kezyt0aGYHp/Q2AGge
         bf3JzJjfpjrqz8hs1HDgn9hVcNhZ+Un1EULSL6cF32mYi8PbrjCY/H0heXOZGXXkibc9
         Gq+r/SARp4KCAN43br+pL8WjtfhsEm/u0T/exwi1R8Zhui4OK8NMw1/3QaPJDOzeyqt7
         WDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mBHc7lN8u5NY/94UuJTp0PvMirc4pOqdsS69cXoWLDk=;
        b=t+twvYSmg7ZQo376Lqz8cXL8Y7aFmIl8dQc5iTzLSMqYAbD3MnEfm8nDde3kcwqtN5
         fCB0L54Bdi88l3pgEqhoTGz8HVGDE6xs9ziAwwrRdCLTQTx6dEWA0ne2I5V/wpTqR9Wq
         JG23JdCgxN6XLOhjPTanH4RAbVDLe1os2oygOMFUA3O6ZaKWyc84vzRD1b8IG9gqLyAh
         /l8jotcgclXyIbMHf3ULmYQSWQjoktXC6iPJcGGZI9BITh8z3//B2cyd04oE4Gr1Fd2k
         IXIpis6rV1u0USaqnuK155g1Nf4lwIDVN0Ee3gbrvPvWAv9FV8BWQBLcvZzLsejrnlqB
         Zu8w==
X-Gm-Message-State: AOAM5304RCOimbuzIh/tk3tqqfGxydERzNfrqR0RuPvzsY1wPqx9zffU
	UO7OJegVfq9PVe5ZSS+1p+NI2h2WlFzVbQ==
X-Google-Smtp-Source: ABdhPJzNzbdjuo1NkAJI3LAFBxSOpePSyXCkBBN0dbqvIQ3osromeYPqrmde6OM+gHH9BoLYnDRJwQ==
X-Received: by 2002:a63:d315:: with SMTP id b21mr1408916pgg.331.1603175942769;
        Mon, 19 Oct 2020 23:39:02 -0700 (PDT)
Return-Path: <taisei.nakano@miraclelinux.com>
Received: from localhost.localdomain (h175-177-044-207.catv02.itscom.jp. [175.177.44.207])
        by smtp.gmail.com with ESMTPSA id f21sm982998pfn.173.2020.10.19.23.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 23:39:02 -0700 (PDT)
From: taisei.nakano@miraclelinux.com
To: openembedded-devel@lists.openembedded.org
Cc: yocto@lists.yoctoproject.org,
	Taisei Nakano <taisei.nakano@miraclelinux.com>
Subject: [meta-oe][PATCH 0/1] add GPLv2 to anthy's license
Date: Tue, 20 Oct 2020 15:38:36 +0900
Message-Id: <20201020063837.21217-1-taisei.nakano@miraclelinux.com>
X-Mailer: git-send-email 2.17.1

Hello all,
I have checked the license of Anthy package. I found the LGPLv2.1 in
COPYING and GPLv2 in alt-cannadic/COPYING.
However the recipe LICENSE description is LGPLv2.1.
I would like to correct the description as follow. Could you help me how
to commit?

Taisei Nakano (1):
  anthy: add GPLv2 to LICENSE and add LIC_FILES_CHKSUM

 meta-oe/recipes-support/anthy/anthy_9100h.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.17.1

