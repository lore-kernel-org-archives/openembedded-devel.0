Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F05CAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:09 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.21061.1759223944908004580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IiIleaFA;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-4259247208aso27050685ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223944; x=1759828744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WJp/asq5kNjEK+KV4m1Nqd04sMDkBJBR0p9vCb6K98=;
        b=IiIleaFAclZJdjXqvx2OwN3Yc4/7QbbAgkPSSqmmjnn91efpjF46ukVZP+Sy66I3Va
         WgWYMiQrdAEQbhjEray6Y8ZubM4LW44hYu/ZR/uWV0XWH8b3K92pXCvNKbBgqv+OhZKM
         o/sFltEioPPKsoOGe5y9afxGyrfntwezIau6PntHORq7R6rttum2xWMYjYkATlWuQiBQ
         K9VabTgpaO298yw/aw0XTnE6DpVtpIC081NMv3FBY/uFbWp8sKKYJjdRcNgmU/NYFG4H
         Q75PqVWLeGrRLgSKjQ4lMq0F9iNYcgcWMH3QdPK817mq0WgdSIsKB8jR5bO/KvQMmprd
         E6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223944; x=1759828744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WJp/asq5kNjEK+KV4m1Nqd04sMDkBJBR0p9vCb6K98=;
        b=Nr4n7qCVAPpfzhsvm3kPwaC0k4EsbTb81LkK6JbZmqnXkB3yNimDd/wWj8CtO5RZjt
         YUutSUcFMpFrEanfm+o/AJeTihQYy02PC1VIdB9rasn/iCoP31NenkFze2RBwjpR9X4M
         QzxpzdC35fmWvuKbgi45IbTWZHIeV0Y5uG0//avSc+dwIOhydwOaIdVOyZx3gxI0vqmi
         GVPrnsLNYkkBaszFqNgykgWvfGDtgUJEB5vTw24SfRNi7BwrMrX4IKRQJ+9PGh0pzhK4
         aCzX4C49Ao4HEqWhDCaAJoDt3LoSQkia4qgYz0UCg4Jp70pqaWawGXF8jwP4wZcbyi0O
         68Xg==
X-Gm-Message-State: AOJu0YyRpE0hg6itR3LXwlcsCkuJDdZl3/h444ekP0HFWzRlrrhUuNc+
	E8MlKj6IvnlCjnFzLBE2dx0dJuwutLjxc0ST6ftdZ0M5UxddA+rFH0eEEqgQ7wiD
X-Gm-Gg: ASbGncvh8tsWQ/2p0ikg7RONdYdsMNKvZgIMPHh27uWOMVbrV1AvSRSMBxU+bfpOrvs
	VTOw2da4IvxPU9UM/EM63QtwsXs8RxlvIFEp5JSE1l0ch0LNLlZj4wilwnIWwGEjswtCKvupwtK
	QBYI81nZobUfPgf2T/M6a0nDxgS4s2SWwI+ppVZw7oD4CRZNRu+8SnrK4p1pbRgIaUuyh6iSzlP
	F4ZNK21tWNx0sVHnh5a4pcXzS79779SeVRA++xs68ImMyFcfFuRgQjkNmGaBWhzLDppiHIDxsDz
	kMclIn1FmFVzue+de2Ci3PFXsqgxdnU4Rchrpvx5J3N1kDM0Cn7R+IUySbpzximaxK5krffHguN
	mB+0K0+t1SkTysF35iBkF4TLtfeIjl62+txvZmxDkTS6F1fDEHfffmYNnCpi7a3yeffmmyVj3Wu
	8=
X-Google-Smtp-Source: AGHT+IGq5QIPqYsUmdi7F8FD2PYPVU3ehY6mhKBvSlLFiD8/49HwcviflczciTd4hH1Gk8v4HA0+jg==
X-Received: by 2002:a05:6e02:349d:b0:42d:7d0c:ed16 with SMTP id e9e14a558f8ab-42d7d0cef51mr13890615ab.29.1759223943965;
        Tue, 30 Sep 2025 02:19:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:03 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 06/22] parallel: upgrade 20250722 -> 20250822
Date: Tue, 30 Sep 2025 22:18:25 +1300
Message-ID: <20250930091841.1693131-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120058

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e52777c3ac8de882fc4ec3f080b400df17770fb1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20250722.bb => parallel_20250822.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250722.bb => parallel_20250822.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250722.bb b/meta-oe/recipes-extended/parallel/parallel_20250822.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250722.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250822.bb
index fc7376ce56..27a65ae1af 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250722.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250822.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "91a81ff4129cdf5ad3c3c45ec033e75f2bbea5447f4b6813a0d8cfe8e5c7843b"
+SRC_URI[sha256sum] = "019d328722867cffe918c449364308c0df048456c69299b91451a3e6fac9167a"
 
 inherit autotools bash-completion
 

