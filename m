Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF07DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 21:54:22 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.533.1743198861295400101
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 14:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dkauBOxQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e60aef2711fso1878220276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743198860; x=1743803660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UNX2wnGtnYxtDkoZsW2gPRBawvX8oUOCUCOkvYUVsM=;
        b=dkauBOxQBnlaFyLUon06YEdzDtwJCzv3jX461pK9EO3cH8avUNa/YXzvSplveLZi9H
         bg7P/Fl+fKH1t1OyGIp3R9AvuqFCrwCWlP077JSO7icVTQBdjEFBmivvyZMdwThWDgyw
         BQBnniBBNaRdWZ6rgfJLzO9PknFIIzQhkAtuhs3iyB/O4BGnyxGI1jt7Q7waAfZjB7/7
         HIUMDKlRevwtXwUriUl2tvoQs/98ANfLDLUMQ9USGyYVzi+PdtwT0FJeWY4slxBXChsb
         U1jIxzMCfFtZECh/BJg/uXUe/YD/FwxOh1/6+DL7wZ06kNL4RQQTxDhmp5jFgPFlqPU/
         /XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743198860; x=1743803660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UNX2wnGtnYxtDkoZsW2gPRBawvX8oUOCUCOkvYUVsM=;
        b=eyXHfLYW+6jue8OJRrmKsZsEksEquUKk0+4acyiOQDh3/TL3wkMZ0hn7YB9jTccisd
         GIoU0C2KBO6Ds5t5/lzL2myOpWnBH7PtKfPQpFbeEnmbxdR4/k3HptR76rb3dxgN6jT7
         BpwdIi5NHCJectbD/XgecEUsvRK9//cwbVsJoL3CH52l31jKevIJ4v3lbQxFZMf0BN5h
         qOLYWlCSZ+yIM9W4N2Q7AIsUohpN+RqwgoMiOTMzYM0LUp0PAjgpUnnp66u5wmzCk5Am
         vRriQ3Nua/ew7hFimTH72c9NpNe2ztSR1YP+7NZ2cFtTKP/mRwDvyBM9/IbS6EusdBpp
         zzKg==
X-Gm-Message-State: AOJu0YyKT6mK5LP3/p8YlS4kErZW1NdM++/t02/rLrh2vBL3+BFrGwK8
	ZmZh2YYktm4/gvNpgKlYBH6W/TRk28PzyiuEJZ91Sa/7J8MW557LSxhi7Jy2
X-Gm-Gg: ASbGncuTiXN1lQozxmhG33tE/z8FusAFJhaFbgafJIHkbkc8yrjZba0jFEACLpRzhKw
	oY7aRLEzNhVFtPo75oY3l0eTYFbh3fTbJwJtBlL8RWQU5ZtdXB6vG4vyrU42iUZDzKXNUQQC4h5
	Wdx/lETcAgGZbbalzJp3fCpxN42CF/jqBrdEh2POMmcVzvVAFXPTZZOnmQTi7ik4lYJNC6BX0QE
	/tECc8qtgiSA8jpJrwUZ7WBqZbrY8yA78EvIk8yKXkgpj9YaOuN0DFnkRq/5J46ZV/L4TSzbuWh
	bdQL4crui2q+Y41dDQ3OUZZS8OTrF1XDk/giMVdRzZ0KiUVqCA==
X-Google-Smtp-Source: AGHT+IHEGV9q/eNABJMInmotWosOqytvQPjPsXh3cbNdePEj6mV4B7L1UkiIQicHuPXqe61mmPux4g==
X-Received: by 2002:a05:6902:2748:b0:e63:d36f:96c1 with SMTP id 3f1490d57ef6-e6b838f34c2mr1067040276.10.1743198859794;
        Fri, 28 Mar 2025 14:54:19 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6b7131d2b5sm737324276.38.2025.03.28.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:54:19 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.33.0 -> 1.33.1
Date: Fri, 28 Mar 2025 17:54:04 -0400
Message-ID: <20250328215404.240252-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 21:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116358

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.33.1

Bugfixes:

    Work around systemd-resolved quirk that returns unexpected codes for single
    label names. Also adds test cases to validate the work around works and
    will continue to work in future releases. PR #863, See Also systemd/systemd#34101
    Fix sysconfig ndots default value, also adds containerized test case to
    prevent future regressions. PR #862
    Fix blank DNS name returning error code rather than valid record for
    commands like: adig -t SOA .. Also adds test case to prevent future
    regressions. 9e574af
    Fix calculation of query times > 1s. 2b2eae7
    Fix building on old Linux releases that don't have TCP_FASTOPEN_CONNECT. b7a89b9
    Fix minor Android build warnings. PR #848

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.33.0.bb => c-ares_1.33.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.33.0.bb => c-ares_1.33.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb
index 44c5834695..51b73a978b 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.33.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.33.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "3e41df2f172041eb4ecb754a464c11ccc5046b2a1c8b1d6a40dac45d3a3b2346"
+SRC_URI[sha256sum] = "06869824094745872fa26efd4c48e622b9bd82a89ef0ce693dc682a23604f415"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


