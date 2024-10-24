Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7218D10380
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.6188.1729801144766206373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIZCShJh;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e38fa1f82fso12627597b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801144; x=1730405944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZHRmrfnYc2WHJpxCow3o37M2IgiFfG/G6Bq0lhEGCU=;
        b=fIZCShJhp0wQxT0a8fQtPw+PK1egC9+HtP0cdGeJjgrw7Nr9DL3r4PkJJNtugUD+8T
         ooXyTxhhL00IsHYhSMboGHtyamVmuszD0PIZsdwc36kapOkKNr4WeiCjOJB/L85l9BLg
         pIB+akUb3/bz8+wZ5GF+E01qg/rIkk4WfitTZ8/DuQsEFowokNxKa6rGqnnj2259pPDk
         WaN8HXNrM8L89K2g0gURVEl65fe+L21dqhU3rMxfB2nCLMKWUGs3Q8dHWCepG3huQK19
         avkTolClw7r9F+gvciNq4GDFTQiKHshGpc5eO+4Roimni1No2xjFdDJ801Di6+d3U5Mu
         B2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801144; x=1730405944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZHRmrfnYc2WHJpxCow3o37M2IgiFfG/G6Bq0lhEGCU=;
        b=nakAC6nNxsSGw3MBuY7185AgMmEIgJHeem5J1/7fSM/M+5rVvOGPHLMMT+uPUpfsjf
         xxgMMWdccj1mqgYnqVyFC7veu6G70WusiA2JyIlUpBNV2Y1n5W+4A9FudyL6bWhiPD9B
         2RFMwyabsCmhu2fpqOqBczijlWKnxpgr0pRHGVSU/uVRTUClI7yEol+dhrLfDsPwDQcs
         6Tka+tRUmzToqmm8vwg7XZVj+WZb4kEGO2sSxV7Ejz0EAlelGahVh6DRFkHU9UVFgxgf
         bBBpXedLdxnuXxdhVKhmVWYKE1HLJtWA1d8INwtv2oYo6Ng/b32N9KaMBm2sC87fGQRe
         O5pg==
X-Gm-Message-State: AOJu0YxagPwoMB2RRr7rH8mIpue5FPdFETxSWTsk6osR5/M3gO2pK/f6
	DnS7nGpq6XBS4KV4YABMICtULCXmpJydOu5N0h/T18krjn/n48HEMySsMQ==
X-Google-Smtp-Source: AGHT+IF4omzXZVlj88qI/4G+41m1E4r5fEeA1WqwtSO6zZbDVHx6sO5cHP42zPloO7R0WNltt7wQpA==
X-Received: by 2002:a05:690c:74c9:b0:6dd:c679:f108 with SMTP id 00721157ae682-6e85815202emr40597307b3.5.1729801143417;
        Thu, 24 Oct 2024 13:19:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 16/42] libextutils-parsexs-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:35 -0400
Message-ID: <20241024201806.440273-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113194

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index 56617fcda..c3a85f6f4 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -7,7 +7,7 @@ and variables to Perl values."
 
 SECTION = "libs"
 
-HOMEPAGE = "http://metapan.org/release/ExtUtils-ParseXS/"
+HOMEPAGE = "https://metacpan.org/release/SMUELLER/ExtUtils-ParseXS-3.35"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee0c05b86a474ae2b6"
-- 
2.43.0


