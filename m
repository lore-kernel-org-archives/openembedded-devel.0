Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CF4D2C10D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.19614.1730817417671703121
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BHt2/sFP;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e3cdbc25a0so60984467b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817417; x=1731422217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjX86YdVb1CErLxigVEEoZ2wn/C9nMkvLicGJhqSC1c=;
        b=BHt2/sFPMzKWu/r/UO22wdxpRoxY146Iy0S5IgRNSQkJSj7gIJ1MsiRVd3R9u+0WFZ
         jS3HtgC6uSGTG+cqD8p0bbj8mnKEhxVQJmDurR6MzgLw5EOXPKTXUSFNBlyZvFdBbhZl
         4cbXTZbRLivpObolkL48AEprybMrr2p5IptraoDI9eNtU7z8iuPbLMWPbBIcK+bI+MjE
         DTNw4l/j2IkUzfTcu0Y4QDV63maKBwySBwM/c/bamIXaTU+a+EYkCqkhWl4Qk1dzwizM
         A77r127dLVUeeQc097W+mrJElpt0bQ+MYgVgZFEXJKLo8mhLS0Yt0zLggZKEjDdWAbAb
         hwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817417; x=1731422217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjX86YdVb1CErLxigVEEoZ2wn/C9nMkvLicGJhqSC1c=;
        b=AGakuxMXXHQhzYAq7iKgwdcFZYOUA1Uf0mMHwPTgPAD7zYRQtLdcjaYhtWDjpuZYri
         MWVwK80kD4wRAdtjq7hC/36HJXjqCR3sUJWu4jJiMI3cs3ETg8ym4P+n60BwjFwxLNIO
         Xn4ufPnE/pOgfnmfscw+cr2DAG1spg49gVA+Quwx2e1JHRr6kitdTkl229rcpHvS790C
         TZ+Kx0DyDz61G2UJts7t6O14cReX7qPcC9Ne6dDAp6PH2O02TbBq/ApPfFh1I8O5G5XQ
         v4WlmTCza1+FsTnGMPzMTywhxZMJ2sm10IkwKdHLWS7b2DyNNxTpTxwlI1sZrqMfA0aH
         9EuQ==
X-Gm-Message-State: AOJu0YwQokOeGoMWt5gd3nWcGnR66+I89J2fhBps3I+2czfEn0XlBhni
	k0kP4ATDmJBA7psjTmegMeezmQ+F0q3K4GzswQFB1bnm4wG4LVEf7WYvjQ==
X-Google-Smtp-Source: AGHT+IHjcNhrP5cunhLeL29jDDRgwTXZuYYyOF4gtig4yGWCyP9eBaxLxCNqCi9Y5xbGRxpc9yhQZw==
X-Received: by 2002:a05:690c:4d49:b0:6ea:5da9:34cc with SMTP id 00721157ae682-6ea64aa6dd5mr175320527b3.7.1730817416655;
        Tue, 05 Nov 2024 06:36:56 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 38/90] tcpslice: upgrade 1.7 -> 1.8
Date: Tue,  5 Nov 2024 09:35:03 -0500
Message-ID: <20241105143638.2301245-39-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113456

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/the-tcpdump-group/tcpslice/blob/tcpslice-1.8/CHANGES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpslice_1.7.bb => tcpslice_1.8.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb => tcpslice_1.8.bb} (87%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
similarity index 87%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
index 93197dc3bc..3d61160bb0 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa6
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "e513f0710c4ab45ec627e5df6f7b80d12e488146e1bd500c92247e20ca608903"
+SRC_URI[sha256sum] = "082967d6bf793499d3d655cea2149e07c0da97287f1877a6eab88d17cb703d0d"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


