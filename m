Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E50D0C60B
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:05:02 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4205.1729911898955455246
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qp2S+iWx;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso1860395a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729911898; x=1730516698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8zTnuKfwFNemvgMVXU4/6zactU5cGCuSRbCwFTNBv0=;
        b=Qp2S+iWxJ/y1Xsd++6KBxtr9yLg7fNZJSLUCMjeNa7qPESt992OiCaate6hDrz+wo6
         9YXTQxeggUtoF/t3sm4JgZWMfMDEB+6L9yG9sBq4AmmKQSBOq61lwdgT6BFoLeuWanH8
         FSzyV/C0hKmrw5ME/NFp7t4CgAeRWI8n91pAwfUOsvpyubEOesEQKk2cFKmz/fd39dQw
         DLLMY6we2+sqe9/vdkw/OH6mOSMulmPy26TxCq+5hZNR3RNYwTik2XLwzKalo0UgUfgR
         VVy689vdip3L1r0TerifFoRfaheJpiUc4VpwSZ0dkPPwVTZUVLRCYNkGt3Ax3D/+TLN8
         I4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729911898; x=1730516698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8zTnuKfwFNemvgMVXU4/6zactU5cGCuSRbCwFTNBv0=;
        b=BTZRtPTNbuct8KUCZV+Zqy1Aw72UHCs1RSbBEJh95esPflB0oKZ/opFTbQEPhODksq
         LHJKRqwMwoBZIZdQewpBxv+OPi1zTywCwDSuXza5UkXa0+3wf0l6Md1xXXfJkSQyDt/y
         Lrx8caUds37I301Gpw2SFE4nvc0P04KduDzMGTmDBAgDzzq8NtiZfsIYeAZhSQjWqfne
         R8B1gP2iu+BIGl2312q+pqtRWPgRf7fzgpUsz+CLNgIoy2zjVi393cSBDbewNfr4MEeO
         bdBarqYKE5RYvhlHuWob/iYpm4Ku43m0I3GEkuvJYyGM6gHPienSV4ooiBA4vUeaDJWj
         KkjA==
X-Gm-Message-State: AOJu0Yyt3m953IV+SGSFrZvIYxZsx0b0ARurDp5l9+M6cUP7KTIS7k0v
	lB/JMsITryh8QiQmxAo8ypcd5dEUGBTZtgoF7EKeSuCGKmyMjwNkv3Ut4s20
X-Google-Smtp-Source: AGHT+IGlEbjTGNRIdCfnTSWlRScAGoYzPkEU3WMA1s1BCbYLOeXLZkBBNoql0feV9F2c6Q7MsLSHcQ==
X-Received: by 2002:a17:90b:1c03:b0:2e2:c636:d205 with SMTP id 98e67ed59e1d1-2e8f11b96d4mr1874238a91.27.1729911898055;
        Fri, 25 Oct 2024 20:04:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7c83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771a1fsm2307317a91.57.2024.10.25.20.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 20:04:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-oauth2client: Remove recipe
Date: Fri, 25 Oct 2024 20:04:52 -0700
Message-ID: <20241026030453.2517894-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026030453.2517894-1-raj.khem@gmail.com>
References: <20241026030453.2517894-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 03:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113233

This module has been deprecated [1] since 2018 and it recommends to use
oauth2.googleapis.com variants

[1] https://github.com/googleapis/oauth2client/commit/50d20532a748f18e53f7d24ccbe6647132c979a9#diff-06572a96a58dc510037d5efa622f9bec8519bc1beab13c9f251e97e657a9d4edR9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python3-oauth2client_4.1.3.bb             | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb

diff --git a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
deleted file mode 100644
index d87e289c5f..0000000000
--- a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "OAuth 2.0 client library"
-
-HOMEPAGE = "http://github.com/google/oauth2client/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
-
-inherit pypi
-
-SRC_URI[sha256sum] = "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
-
-RDEPENDS:${PN} += " \
-        python3-httplib2 \
-        python3-pyasn1 \
-        python3-pyasn1-modules \
-        python3-rsa \
-        python3-six \
-        "
-
-inherit setuptools3

