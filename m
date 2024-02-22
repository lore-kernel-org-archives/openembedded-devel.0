Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011CEC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 04:26:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6267.1708576001375816827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 20:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lHZ8iNIj;
 spf=pass (domain: konsulko.com, ip: 209.85.214.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d7431e702dso73487425ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708576000; x=1709180800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMRsprGIbL5bUTgnPjRe//A2WEw302Ne8WkuG+LnMBY=;
        b=lHZ8iNIjn38Ayp2UVS2UBSAbQE41fAxBv988Xq9W+pGQBtv3gmUN/DunGZKcEkwC4R
         wCLoOXuN/JYgYNfA97NTo62ht6I/flZLSpdjEo7pEN4MoRxcHiQk48WFd8yukgYD+hbS
         8i1nCw/I5dMsnS+upVNOTvirsh9njGNcnTTJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708576000; x=1709180800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMRsprGIbL5bUTgnPjRe//A2WEw302Ne8WkuG+LnMBY=;
        b=EEUPBj8cZ2wOfjPzT3vfHrao5wp/+qp6oPXA4VSpU84BPYL5P5D3ocss+BCEZOex1F
         AvDTAJ2NR8hlVvMaAiQ71FyKOMyUIG5vNs1y8xNVCFBOSlFsEBtQ7XVqgyVuX3P/iCms
         Yor5tZcKh4em9222kA0ucLAkvoTRkQbhsOU5PSI6ieCMWiDtGhNrGe8fAESg/RGCY2Up
         IiElmJBB6fnZb490Z74GRMn2wymaARjZJ6qbcbbG2vyBnUGZgslt2y+22zBeRGOtU0OT
         tpTH8zReFlHEskqnpBByc+vjDNbYQJNkwpdfBuzNXo+KLKBMpfbh6DhL3XHitEFWnYKZ
         j56w==
X-Gm-Message-State: AOJu0YxndG1guIWJSsHWJWps3oagWk9qDQa6zqdIc3M8lKAJCmAyitHk
	+C7I2l0MZHmYtK90uG35nZBLo14HpISR+IM4IjlkX2w8Jo2HcnBUCHQSTc2uChKCDnBuzL5b9de
	/zic=
X-Google-Smtp-Source: AGHT+IH50DvZIP7CTGK01oGvjrrBUUYaMr9ol9MzE4tAI+Xw18ZybbX3nF9AP0NCWPQKTTFQVPSL1A==
X-Received: by 2002:a17:902:76cc:b0:1d9:11dd:2e1b with SMTP id j12-20020a17090276cc00b001d911dd2e1bmr16348597plt.37.1708575999978;
        Wed, 21 Feb 2024 20:26:39 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id lf5-20020a170902fb4500b001db43f3629dsm8911600plb.140.2024.02.21.20.26.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 20:26:39 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/3] meta-perl-image-ptest: add PTESTS_PROBLEMS_META_PERL
Date: Wed, 21 Feb 2024 20:26:30 -0800
Message-Id: <61b3add8a0c6454ad3b0eb3636fae0ab5a6183d9.1708573650.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708573650.git.tim.orling@konsulko.com>
References: <cover.1708573650.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 04:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108980

In oe-core, PTESTS_PROBLEMS are also enabled, so even though
the recipe might have failures or the ptests do not run cleanly,
the BBCLASSEXTEND still works.

Enable the same behavior for meta-perl.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb | 2 +-
 meta-perl/recipes-core/images/meta-perl-image-ptest.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
index e2cafa98a5..9efe5087f0 100644
--- a/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-perl.inc
 
 # Include the full set of ptests
-PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL}"
+PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL} ${PTESTS_PROBLEMS_META_PERL}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-perl-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PERL').split()])}"
diff --git a/meta-perl/recipes-core/images/meta-perl-image-ptest.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest.bb
index 7905977828..94d77b97f0 100644
--- a/meta-perl/recipes-core/images/meta-perl-image-ptest.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image-ptest.bb
@@ -9,7 +9,7 @@ require conf/include/ptest-packagelists-meta-perl.inc
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
 HOMEPAGE = "https://www.openembedded.org/"
 
-PTESTS_META_PERL = "${PTESTS_SLOW_META_PERL} ${PTESTS_FAST_META_PERL}"
+PTESTS_META_PERL = "${PTESTS_SLOW_META_PERL} ${PTESTS_FAST_META_PERL} ${PTESTS_PROBLEMS_META_PERL}"
 
 IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
 
-- 
2.34.1


