Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401ADC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 01:10:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.3014.1684717838312734193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 May 2023 18:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ie30X/Jq;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2553f2706bfso887729a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 May 2023 18:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684717837; x=1687309837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPAaXrEtW6amsiTx3eimcol0pFweDbry2X7acPUrVLA=;
        b=ie30X/JqZsIyRXeelnkJee4ckupl6UjfC19Ofmx4b/4V/pKYrXu4e20DQaI3Vs/M7E
         W7kx1f8GoVlqZMIqyxJPvsdvpzs7SW5KSkIl8pbrXzrMHdPQVTjSGXfpCpyC/QuWAkOF
         A7TgJ1Se0v4cgVXo3lFIBhJSvSu9eet7ePMDPZJrH0PA8NpeHWkPLQ6PJOiIbOvONxCk
         /ZpT7b0yH75GYkBelz5uKFecXjTe9JgU1tjosY3rW/9dvhd+70LNIWrGvozhmyUaKgCK
         prjV85sOj3cCe2H1P051sjfBhOQEFGcbdhoyWiytZlsVYRn3pqwxAKh1AZ2zwpua9wAG
         5CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684717837; x=1687309837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPAaXrEtW6amsiTx3eimcol0pFweDbry2X7acPUrVLA=;
        b=QUkt5HPdftOVEYc3vlNwrXRT2Ef4uDBf0nh2HlCs1ZlF4QV6tPvj12ZFCItJIrs3Fh
         OTgMIhJ/NLmhBLufo787JMJj+nE6vjGwrbSCjVr2iVgEncMt3s9ZHk2FjapNnwPXRHkC
         UeWMin2+bO8A5byvbtYlnV762EDxGtAsQZ60k8vzZib8Kk1n/O8/4uFLUKETMYvbXCfo
         VSn0HDqiY0GPCL5irfrA6YlKyxBTNGb9KZhKQlsMoUq2I3LyFR1gC2j+C0b+Z/mdc/EH
         pctxa84ckJvsqiDJ6Chkpcai2QbboCWCn3jMFz/ZRzPlQHl28/92A/W1NjCcqQiDWqEN
         xbvg==
X-Gm-Message-State: AC+VfDzc3nqH+zn7hoMhzNhH07+VR9woI8SpqgEiINdwufbwRlrg4df5
	dowfKwzUJK6rwvPnGKIzax7QRlW5Llc=
X-Google-Smtp-Source: ACHHUZ4T2DsArODESZsucL+Ahkkdgz6LhZWOMldS/y8PMgcKQbJgyMWSp2EcdiRI+Q3Fcp6qR1gWpg==
X-Received: by 2002:a17:90a:cb09:b0:250:78d0:f78c with SMTP id z9-20020a17090acb0900b0025078d0f78cmr10284088pjt.9.1684717837265;
        Sun, 21 May 2023 18:10:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id v23-20020a17090ae99700b002532d74fb59sm3037349pjy.22.2023.05.21.18.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 18:10:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] mce-test: Update to latest
Date: Sun, 21 May 2023 18:10:33 -0700
Message-Id: <20230522011034.1311197-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522011034.1311197-1-raj.khem@gmail.com>
References: <20230522011034.1311197-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 01:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102693

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mcelog/mce-test_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index f4f1b37d78..99487fd9b6 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -14,8 +14,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git;
            file://makefile-remove-ldflags.patch \
            file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
           "
-SRCREV = "7643baf6c3919b3d727e6ba6c2e545dc6a653307"
-PV = "20190917+git${SRCPV}"
+SRCREV = "025014dedca39d2b8a57a82e52286e72e157d73a"
+PV = "20222810+git${SRCPV}"
 
 RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
 
-- 
2.40.1


