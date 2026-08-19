Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9A6C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.832.1787117823780365169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BLQGrRhA;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso842396b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117823; x=1787722623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gttpmeiKQzXTt9vwWjv66mY5v+xFVRCuhC4TvS50+5Q=;
        b=BLQGrRhAYsft8ZXSz6SrQYD1J2+O+p/ytyu2pwZUXSNglnT6H1lnlx+aA75Z1bAsML
         LRYIrmOTP+G8hQIswRheeYGo2MV7YcTSpNmfCo+x7wAOBEhXIfA0qLP9p8MhLq1dcIGx
         /DO4Oso3MoCaG0xewSc95eyH5d1oddMXpLjM4FdkxS9nackaGB8Bx97/jcRwdJDDrVOi
         2QCLY4bG8Wu1Puqg0zD+1XekFpu06/QWqb7ET30Fye4vPLQyvqhjvmrm3OrZVlv6U0IW
         9FwEJpYOkoDOAzLFktY+OkvFrbbpzOm7AcBy3CtyecJKNXhWO8J4bhH1q3oZi1Q97Z/Z
         lrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117823; x=1787722623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gttpmeiKQzXTt9vwWjv66mY5v+xFVRCuhC4TvS50+5Q=;
        b=JZMRhMWPjnVKFO4J2nEUUzYtIGgzqpzTb7LMCTN3JAuVN/1414z08EUZZbwH+62oru
         jUBV9WhhhWgBeVvgyqFICSD9j7YMwZQZw0VDED1fsHFF65peVMsEOqrLk7sq//246u6N
         391P13TL4OHgoStOuCtfmi7fx5eEHHCAK4zG877GI3eHfLl0R089+YY3nCQPqAufBvE8
         zEDgTcl/McbYldhP2EM8E2e4Yc7mEC275YSMtDF7wHJum6gX2xO3+3ehIyS4CxRtlhyA
         27W6yWjDRKgtMzx20JDrY99ArYHAlwBuwbDGIQ9zQ6jq/ewi39E4JQx9cwF1RFY2gbK6
         0IWg==
X-Gm-Message-State: AOJu0YzbLorOTDyJzWExiYEyxGZNaPYY8baJ9RaNUi77pH1fjbXIZF9F
	/bah9B4+0kUPCWKJ4aNmKoo7ZYw9d9rv1T48GK1GBYm4+KqFSl7t5P3BzDjF9M6M
X-Gm-Gg: AR+sD13zvjYCxc1R2teIrYR/Wlkx+ydcdesngCT22ync/lz0O9PKKmzN7R5yg6ReDIU
	OWd9DeMDCEK2a9hi2RW104qo94+A4a4tATa+Qg6dl5Hc/+0GXDLOpiCclToSgM3OeJE3O4fo97J
	6Prz1mUNlMwzOo9r+MjKLvzKGJM5xAF/fPKSvWCf0Drsq8YEXvXaiE7uv4LLC4SlVOnltdreMG0
	TDOXqzFaFiEBDaZjmfS1riTvCwWztlHLYCWrhoYqN3cpbLzj8lnrXR3kvwIkVwxWnkqyKQ/+lx0
	rSghGfQl14fZovVDybUaca7a7wLOnbqWPj/PH5fnxHYrov4g79wsWCxQ+iJnFrnneF8faK+hL0g
	MS2CQTuEdsjvr9Nhqah3IZ7monjgm+i5qqSCywr9+47DmYWdvzif2JQ1SnU2MjB9yHaqfiaUrXr
	Xa3yLRBD3tJRoD27O9ifE/sFRzeB0xn+zpe4fGbw39N6GxLAQ3kjBBEgy458JLIHepVy76O6xal
	A==
X-Received: by 2002:a05:6a20:a11d:b0:3cb:82de:b952 with SMTP id adf61e73a8af0-3cd00e0522cmr4359661637.2.1787117822930;
        Tue, 18 Aug 2026 22:37:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/25] sockperf: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:15 +1200
Message-ID: <20260819053629.391864-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129255

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version sockperf
...
INFO: Current version: git
INFO: Latest version: 3.10
INFO: Latest version's commit: 5ebd327da983225321818c0355db922515e026bd

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/sockperf/sockperf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
index 42327f5426..ab0e35667e 100644
--- a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
+++ b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
@@ -8,4 +8,6 @@ LIC_FILES_CHKSUM = "file://copying;md5=b4563b57c98bc23c8cecbc0b6d9546e9"
 SRC_URI = "git://github.com/Mellanox/sockperf;branch=sockperf_v2;protocol=https"
 SRCREV = "3c65ad99cd385e18f8a2a655c19826e81a4d17e8"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit autotools
\ No newline at end of file

