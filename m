Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F92CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:46:34 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.594.1758656785679171546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCjznmnO;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so880462166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656784; x=1759261584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4zgp4gWZQwXrlHsUAo2lKgyDX9lau0lCUVz9gl05Q=;
        b=jCjznmnOZKmFzNlaYh6TvD8wEvREGIl4ABYs4G5cr8qD2bN2eUGSSb9O8O01w3vy5Q
         B02A/r1i41xoBqS2046VSYDQAFMxJXW9Ne+vtSYcO6jOMESlsW2ocgWaaIucJtLAkqGe
         Lnq3t7F7YTPKGz6OOMmU+YFDfYInTCx4nY4KzC+McEPh+nQh7JaK5ljiTfb+cSqKtUf0
         UhYg0GI/vxxssvQqAj5oJ4uKgknA9jy6p0LXVBXI5JhcxZRrb0Wt2McmppXFcZ3RPrSw
         TvMAr2tMgBGwVCYwekfiMGcqa7bi37HwUQvWJpA4hLlRxLGzu6LtYZb75QCxfw/sj0X7
         pNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656784; x=1759261584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4zgp4gWZQwXrlHsUAo2lKgyDX9lau0lCUVz9gl05Q=;
        b=fe/Wda61RrxyZhcwpaPNvU6BpejEFeTn1D0fOEb+4bPsbkmKPGC178FGz9eqogGVWi
         4Jg4I+giJgr9nlrWvU0F4vhHfsCdvWRcL/lGjgCyBlK75cFnpHEnVIu/O9K1I0yxBvfX
         0kxORIJ7ksJ1DSRGvUt4ep9NRRiEsfv3GHn7V1hkCdhMEFSaHpwYfnEojz+/gXmi6QTO
         3O0muUG1dp5EOfSiMaqfp6DvGNJ74q0j1azrLf2BQaNSYYu+bE2bcLZ1Y86i+z8b/sCV
         nH5eeRjCz6jKk2KBRVqr1G/+YT+oLgzoRKB2kdsq6JEzjtXCeMCOhTmHafyoKjWoqEqC
         91TA==
X-Gm-Message-State: AOJu0Yyq8yvKpMuEEiJ6uDQNIGo3vMMP4Vuf49FIdnBoqS41ZgPykaCN
	CTtPLw+n2nl8JQtMrosVABSjpgNcBN/VuayehqfccJDIjjja32ZBbqR8DXk835m9
X-Gm-Gg: ASbGncsnN1/0iOLLDZ0KzrSxRh7coVe22zcEKiMjNIQLthV7ozHt4u5nsnDW6h0YRXQ
	SgmBZTonGkBwuSdQkR6DdZaqdtqHutNY+M681OAEgJvCnm37ekk40xYOYRFfNqAbNxPfYeUr4QC
	PeZVjCjmjJ7fP1qsXa3g8GDS1cw4P1p5qLjARrhpKwF8NZCONKfc6aPtpKtkbsI/+PRk+ANQFf5
	iARybKUGmOV5p2cR7+CRzN64qAZVsfgXafaOclqjNNVxAfUqtfasi7FdwNfW/yRYJETErb14pLY
	1WeqXX/89mdvyKX8cZ7x2RuJzXVe8UdAZ2IFsSGNxA5WPb04MMUfJJo5QZoo+0lEhuYjDktJ9Mg
	DY7yhiShhjjQxYW4YFasWt0UzdJ245fg=
X-Google-Smtp-Source: AGHT+IGXbrad7v7kbRvnG7XVDJp1S59lwkXpnuZt/e0qsGks/J7CtAwgRoRFqihYxWSoVn7hJN3jhg==
X-Received: by 2002:a17:907:971d:b0:b2c:15aa:ff5b with SMTP id a640c23a62f3a-b3026c84e2dmr371399866b.11.1758656783849;
        Tue, 23 Sep 2025 12:46:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm823915866b.31.2025.09.23.12.46.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:46:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] pm-qa: update git fetch protocol
Date: Tue, 23 Sep 2025 21:46:22 +0200
Message-ID: <20250923194622.3259574-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 19:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119734

Apparently the git repo in the SRC_URI stopped supporting git
protocol. Switch to https to be able to fetch the source successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index fc21e6192e..7266e9ae32 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -10,7 +10,7 @@ BRANCH ?= "master"
 
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
-SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 

