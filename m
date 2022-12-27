Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F208BC3DA79
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.149947.1672105064859749098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UZvUD2zB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u7so11925613plq.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lURT3cZbjj9sjDJQZXitedFHLcuxP51cntEhjVAL33w=;
        b=UZvUD2zBh5tbLSe7ic56VMxgXzOCv7AA/iDYLq9AiU1eUxURyGg8wu02GrrCQcX25w
         b5dXb0XppDcNxNZMRBLow1N601cDe9Wdmu4B10ERylxl9d9hVin/AUoTmgZzG1oxCsV1
         BC7FfLHqpb5oIjWbrxamvgdXYLnzTCFlDUos1Vo4dZg/bmcJaDTlclWivXCjh/xQlvbO
         mTc15KovP34BgNapK50BRPLUzZTPnY1NHZkMpL1X96tKaDXDWQXmbaLZ2CUKIswItMW2
         E2oyx7uNd+wQt+Sop9yJvQcNuLMY2o15foAEUz/lId687jC3kRt6UZQt8DIG9NxE0naY
         wu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lURT3cZbjj9sjDJQZXitedFHLcuxP51cntEhjVAL33w=;
        b=GCl2nG/k9KCEiWHXVwd8RshjmhrXqDwqRWN0NxtLv6UrN2O40wBZmw10WDReAUnBJh
         Lu7bqgFW4VITjBDpDs3W0q13jXAMDGG+7lw2GRWGaq4xFJG7Hw7UIv3MTgcsQV/8/JhJ
         qws0z/BtUzpfCu7KoKN+VhEdfZjG6iRwTNJazDH0IXoHpDV1w+x1y0ZbcH8r7xzmAwyA
         aGb2fozXvDqr2tnFSK/N0UFZsY7x/WB+1Jy5KO/Kt6uRfi4Mh9hZGxMqA79wndhckDVC
         2wCTc6+7m1W3clH47GQbhNcOG/4uCgDG0kFd6yupxeyQflZU/1QtbMZHO+ZvDeU0Q2oc
         mnbw==
X-Gm-Message-State: AFqh2kolBG702mFOz7KmkAg3J9Efa1clyUZqH4Z3O/OsA7p/ixg8fttx
	NCMU1DnOxXVGMmLDdEU4eLziAcH+MDM=
X-Google-Smtp-Source: AMrXdXsHFvTmpaXCl0n36gTk44wL/FCSkBjFUpytosWo8UCfKEPLs1yHvTDiPdzSX/wfJuwntg+UfA==
X-Received: by 2002:a17:902:c244:b0:189:603d:ea71 with SMTP id 4-20020a170902c24400b00189603dea71mr22817314plg.58.1672105065955;
        Mon, 26 Dec 2022 17:37:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 6/6] trace-cmd: Pass ldflags to compiler
Date: Mon, 26 Dec 2022 17:37:38 -0800
Message-Id: <20221227013738.3840802-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227013738.3840802-1-raj.khem@gmail.com>
References: <20221227013738.3840802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100254

Fixes
File /usr/lib/traceevent/libtraceevent.so in package trace-cmd doesn't have GNU_HASH (didn't pass LDFLAGS?)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
index 66bc2932ab..e6afbfaa82 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -16,6 +16,8 @@ DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native"
 
 inherit pkgconfig
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile() {
         oe_runmake libdir_relative=${BASELIB} all libs
 }
-- 
2.39.0


