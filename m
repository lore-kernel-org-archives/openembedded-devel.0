Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B138CC6FD1F
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 03:10:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.22748.1711249812021335598
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 20:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iqy9MxZo;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so2459050b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 20:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711249811; x=1711854611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHgqhsRX0/XlQ71J+/chj+iXiuoC6S/94ZhX1L7SZhc=;
        b=Iqy9MxZoQdH2JWw4AqLwNxKROC18ExrKcA0Y3u4ghKwPa1FTyGluvqS8G7qJs0dGaO
         KLPfYXOrQwjw1BapW8Gkc6eP7tYGJsctJiM5tccIpvsCG8uUMTDx79qI3/gQYt1PLd0b
         9o505/PBUUk179XFncrrIWI/TnYYi9ZVEOuMnsBdp882nrbPW0+l8dGH1S4w4toI3MNV
         e0eZ0EnTnvMt93JsfrVz2oxOt/OUP6kDCe8qcaKlD2kp/06xNNDrC9kKZQdxZncrxcwo
         lYtwGdhvbDPyFD11S1F9G/7VElVL6X1nkOW9R1xFyiMrDvMZe9ayVb3s3XmV+S2c17Uz
         7SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711249811; x=1711854611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHgqhsRX0/XlQ71J+/chj+iXiuoC6S/94ZhX1L7SZhc=;
        b=fL6PEphoHfMR+Sz3LP7NN0w/jrP3jXQgnPjcqX5lP0oiLDWZ5KNWnKGAad8wd6hfZM
         B/fQ1TNkab0fTLP+PawsctXPSw1BQ0JpfKwFaswjmv0IymPBFdMtu8qOILRWT9ynxT8T
         KSWGcFmyoRr4g0Yu8oqvKfxFW4m6V4vN6PsLOJnoptreBz+Gg+co1mRakO/3iJsIR5wb
         EW/eNxaP9lBd9tJnwdsIS+e8IBL87dIyPCo1Ff1k4SF2aJJKspr6Lxh0g5oY7tyw5Uxg
         uJlBvHot/aZ6Zimpc3Lm7BqXTHtoag6Zc8cMdTlg9ZxD+ETU5uZm7Tp2HtUyMCQlTqi/
         n7kQ==
X-Gm-Message-State: AOJu0Yz8I6bDRHz4zK/S3z4G+DXE1uZx4APEXjwxENoOtB5llyxnF7pJ
	ZjXjZljmktCuDMEpYmCBEJQUFsByZOCJxzvjTE17e9Q+H/qTCw5BggF7C2A0
X-Google-Smtp-Source: AGHT+IHMzaptrCoFG8zohQiMKJwMvugkM0WBAhtXJU5vtSfdPRhcmElqyhzffL17Oyq3pkex8kvtzA==
X-Received: by 2002:aa7:88c6:0:b0:6e3:84cb:3d51 with SMTP id k6-20020aa788c6000000b006e384cb3d51mr4996077pff.33.1711249811151;
        Sat, 23 Mar 2024 20:10:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id a19-20020a056a0011d300b006e740d23674sm2075521pfu.140.2024.03.23.20.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 20:10:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] openflow: Fix build with musl
Date: Sat, 23 Mar 2024 20:10:05 -0700
Message-ID: <20240324031006.3072120-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324031006.3072120-1-raj.khem@gmail.com>
References: <20240324031006.3072120-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 03:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109562

Link in external library to provide backtrace functions
since they are not part of C library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openflow/openflow_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index eadfc25461..41bedcd0cf 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -35,6 +35,9 @@ EXTRA_OECONF += " \
                  ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
                 "
 
+DEPENDS:append:libc-musl = " libexecinfo"
+LDFLAGS:append:libc-musl = " -lexecinfo"
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
-- 
2.44.0


