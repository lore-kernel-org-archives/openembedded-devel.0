Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229FCD35E3E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.27811.1730831879376216410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDgRVXdj;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2e444e355fso69984276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831878; x=1731436678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SYDm0YSQPnHsHcGqX+RUWXoxNejT4I02JKCy2K1jQM=;
        b=aDgRVXdj5uU5TOhfvGYQ/PD9fnWsAb10tkynQWaiUDAZ7wPYKNHHraU8ZvW9FmswzW
         TMb6e5S7OILT/ohW9xY85Nn3r+SmDCDpwPVHBEFDpgH77VBjHzzp+fvXvuDR8oAPZeAk
         pRXrihxjfsWhp3kCDPGumJ7sFvcjDqkqV4d1PO31pSqU3yTKEmQI7dDmFsDqgl5Z5MbK
         rgYk6nE5KiK6r+0aL/jPpRhu0trN8nbcVL1mSGHdqP91K0iwwxcfoDUwEwe8PT9XvQNz
         T/p65md037sAoQtcRI72tj2aDL2JgfVg+ws1Byt4A1y5+Lrhz1M2AK1dN4d9TjFKT86w
         ggXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831878; x=1731436678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SYDm0YSQPnHsHcGqX+RUWXoxNejT4I02JKCy2K1jQM=;
        b=dUXUPtS27zwzbtT3t9p2zDxkIyo8wTbDeyOBrpHc6fvHR2AGSHq9ClIzL0VGZhE78Q
         hKQyFUe7iU36H0EEzqV0x92H4+u7a/oKslcEWS4Gsn70HYQMOwbs17KVd5WzGu38Y0Qt
         YDrQGIog58ADgyt04LhqgyuAzlOjSNLjqkgna4X6wx9dg7Sd9/CYlAeO2oeJ8n60TfVX
         amzxOlxLfd/J/lHma8T7LIGXPPwgE8gRSD7hkuOcLyIfcQji1iRa0IE1SWkJUJcgAuT3
         uia+HAZ+QiAH1wJnS7ppX6tfxWFCt259uQpjwpzCdNj9EhzHZFP+nq57ncvWeRjcoxZU
         c8tg==
X-Gm-Message-State: AOJu0YwD+jKbXYSji6M9WNET0cp1tRoYd8/aXMdrXDXLv7ZBvMnEi1l1
	7IZPP28gbGylkqEQN5MGn2nz53BOn3xl3jwvqK3ihkrUmo3rOdCKiUmLttJa
X-Google-Smtp-Source: AGHT+IEBZIHiU0J6qrfUCg5K09uuhytTdlMZss6zfuMDtQGNdSAl1L7aj5i6ZckpbAsydvsSlJjJgQ==
X-Received: by 2002:a05:690c:740a:b0:6db:da0e:d166 with SMTP id 00721157ae682-6ea55893852mr168661087b3.12.1730831877862;
        Tue, 05 Nov 2024 10:37:57 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:37:57 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 001/161] smem: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:37 -0500
Message-ID: <20241105183658.34982-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113516

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
index 9f8553206..4e0afefde 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 HG_CHANGESET = "98273ce331bb"
 SRC_URI = "https://selenic.com/repo/${BPN}/archive/${HG_CHANGESET}.tar.bz2;downloadfilename=${BP}.tar.bz2 \
            file://0001-smem-fix-support-for-source-option-python3.patch"
-SRC_URI[md5sum] = "51c3989779360f42b42ef46b2831be3a"
 SRC_URI[sha256sum] = "161131c686a6d9962a0e96912526dd46308e022d62e3f8acaed5a56fda8e08ce"
 
 UPSTREAM_CHECK_URI = "https://selenic.com/repo/smem/tags"
-- 
2.43.0


