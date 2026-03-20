Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CA1108B902
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 11:39:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10573.1774006770228915969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 04:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZt5BX4q;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4915161fso517513f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774006768; x=1774611568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdDSYIxPs0gmM/tXFqadStWNIAt9igTH04HjDXgrOA0=;
        b=IZt5BX4qpoUogFi0aQSKF8xbqXYuy8AsW7XcMkcFMD80YuzItROZPIeqa98auQ6s+H
         0T2EbswysQC3JGjBXmOPmA/N0IqmvML3LxcjSfVK9QmM2LthZ80Je/zowtmLiOiIMLwV
         7Isp6LlIHsMUo7ZUEgc5Fi4qvzK5RLUhaYewdiJmKBYoMJPIipty3FjtynsK70vRQTZt
         cQcX1A7H3Q/BftTduCuIjtTdV3P+IMDDpO5nvZcT92uOVCj0L58oQ1cbjoTHT6tFz9SU
         UQDfUaEY056dxIUFf+xLLvqKdwW0Q8Fq602hxCVSeITqelEqCxISv1JA39s4/6uO4Tov
         LEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006768; x=1774611568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdDSYIxPs0gmM/tXFqadStWNIAt9igTH04HjDXgrOA0=;
        b=SCh8Wkk+Wx/nezdAZ1UKwab3CYHQiXflhutbTGJ5vwTWOURZctovnywCV84szGXp40
         TtiK1ZmUl1mIAHIQLmPRrdsyfnxQ4p/uPOg2KlFmKYghWz2/TB+qB927eFXWckPBRSpH
         sKLtU5wNNtAuk4pXIOffuwoOBwLKSykxi+duIk+qRDE4Sq6VuAf/LcWZteAgf5f77CaJ
         tTWXdGeb0KhzKg1J4MBGtZ8DA9V/qmC/If/1XBzkKMXh5/DxsmPVVemO8SsrFjzUvfjq
         XjW97aLalLmP0VA9BvoDlAlRoKsvqoxS30JUrQ/43B1hlu6/8mYUGqXgBSdneLQHzE4N
         KX4Q==
X-Gm-Message-State: AOJu0YxXhPff8BIVyQQmF0E5CINFk0B2RcFlUp1F5UHRvGkUICs5umnC
	uthOz+8Gm2AT15RrLx4v5Zefs036Il9kCl4PmC1hDlU27w7NwyNY2UYQtaJmZQ==
X-Gm-Gg: ATEYQzzsyWQF4X+NanbReg/2RGL4CmuzMjwGfbsrMIAMU7cwcdbxImyay/mV7gVVltW
	NRxXMG4G/7A43jVHJ5GdpPwPWCZ95pYbiRJgLdQ5bGV6ZOMrff7NdImWPxqdMNcOijjqidompyN
	DFbtZ4SAqu/Dsp2vqCihNFyt05mpzJZapJBCJkN+XrzcRPWV6nFx0R6hRoT15AbL+gaqhCP0Ihr
	IKItSQFLfrFmNx7bUoSrt3SVDa/2cArIMZ0GER3qKPT59U3w4EXLv3fRruPbeiPxfBcrVqznO87
	tGP5JdNOT0DkxtL0HAitBF9mtdDwI5/6b3GdOf3xQlTEBI0fH1Rk5/7n/zs66lWfbLJXBvOBBDb
	nNY+GyTmoX6M75tOwkG47bJPiLBE6Ann/rNAm6646pn0i7XAtxCa33zbKnURRcdwZFhmSNGjADC
	BOOlTzNdRRpVZf+FuS8MKq+nEI1vbYBlQ=
X-Received: by 2002:a05:6000:4381:b0:439:ba75:7dab with SMTP id ffacd0b85a97d-43b64233d6cmr4843031f8f.9.1774006768015;
        Fri, 20 Mar 2026 04:39:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm6288248f8f.13.2026.03.20.04.39.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:39:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: drop obsolete CVE_STATUS variables
Date: Fri, 20 Mar 2026 12:39:26 +0100
Message-ID: <20260320113926.2960934-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 11:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125435

Since adding these statuses NVD corrected their DB, and now both CVEs are
tracked with the correct version.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
index fb131c3490..292b8f797e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
@@ -47,6 +47,3 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-CVE_STATUS[CVE-2025-5987] = "fixed-version: The vulnerability was fixed in 0.11.2"
-CVE_STATUS[CVE-2025-5318] = "fixed-version: The vulnerability was fixed in 0.11.2"

