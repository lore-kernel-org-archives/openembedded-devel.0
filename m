Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D5D1A427
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 01:43:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2550.1728697381204281997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 18:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJ1THoUN;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-207115e3056so21609405ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 18:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728697380; x=1729302180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGeViWCrOIwOZaUHVnyq64QNux+zB/tc8yHl2Z4nvOs=;
        b=hJ1THoUN0/QbPQK9DZn0m7PYxHIJzwIA/fOS0K5kxg5v39Fah8uT7HW+AVWzD3WQDN
         qm88kyMywQApn9487kLXAOEXflK2KqEaQnAsWgc3KCAuaFPdFh1mHy+FKzGyuXyMqtgF
         6DFMUPtJf2PggHunaQpxPW1km2KEStXRhebsvVt71milj1NT5jRlVjBlVLeTdM+Csi6G
         Mez0ItB/tNxvgKRuPFrNMrsvmu3Pdv9U7zGxbtTeYdY+OKK4J75WmPr7BzA6lyoSs6Wi
         ZWcVI3MFYaMFVoQAa+x6pvnIY7c2KKVGos35Qp4aye61GzRlQSpGTFVonaQaHe4R2cvV
         y1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728697380; x=1729302180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGeViWCrOIwOZaUHVnyq64QNux+zB/tc8yHl2Z4nvOs=;
        b=KIjxTdEaVI8tSbb9mW25zgcQNnumHBtiumdAy3C1wyrCVDJnJh4mhrQmSR8tY+wU6a
         IF3SuGQq2iZQ++2YVxS4egdF7KA1jTHVCvoe4Rss+Dm+CHr6F/oGCT76K+IkWTmVNtQJ
         HdDNM6BDnF7RRojZr8PzkSgSXCxxO6bTthAE20bpeubormYmVd9rc307MRSHAlLAv1Eb
         ZPSAR8bG4kr2DZpEjWrkH6m8X08kHrEDEp+AnBVczMO6DmmGpu68YVbNKXh+66S5bSoe
         D8V+cCtp+ygkqaYmHsh52rLwErP8Nst++kh1h9oQG1Ktfzm2A14leWw8zZ5voTn8/jRp
         ooCg==
X-Gm-Message-State: AOJu0Yziv/0DULbPnLNMz0nXfZV4Pp9td/BeutmtbuaRkUuFs3SBP2MY
	jaAgfKCHZ5YlSeb+nBG6jKV3gbIsb5YDJpSrhI2+VmZtgYDlUI5YM1dAfnOE
X-Google-Smtp-Source: AGHT+IGwWpOIP+/ugL7n88bRRyfXSuF0kYQxNr5Rx6W6wqkPycCVofgaaPaongnYmItdHbsY8w/bmw==
X-Received: by 2002:a17:90b:3cf:b0:2d6:1981:bbf7 with SMTP id 98e67ed59e1d1-2e2f0d80719mr5795862a91.32.1728697380190;
        Fri, 11 Oct 2024 18:43:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ca87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2b9483328sm5464366a91.44.2024.10.11.18.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 18:42:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] xdotool: Remove useless rpaths
Date: Fri, 11 Oct 2024 18:42:56 -0700
Message-ID: <20241012014257.1775463-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241012014257.1775463-1-raj.khem@gmail.com>
References: <20241012014257.1775463-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 01:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112817

They are pointing to standard libdir on target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
index 33e4e0998f..ba1fbdbe0b 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
@@ -12,7 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir}"
+EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHOUT_RPATH_FIX=1"
 
 UPSTREAM_CHECK_URI="https://github.com/jordansissel/xdotool/tags"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+\.\d{8}\.\d+)"

