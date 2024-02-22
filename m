Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B6EC48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 04:26:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6186.1708576003715742377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 20:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WgLicx5p;
 spf=pass (domain: konsulko.com, ip: 209.85.210.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso6271992b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708576003; x=1709180803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxAy10MS+3fKH1ODQPSgVtCA6YuPYy19XdY4t+x1/u8=;
        b=WgLicx5p/WYI+s5EgCJgNbcN6BvmnUKDkN+Q8OLKO6WvltSC1n/j/HXidyd4EQQ83F
         XLkuxqw7MJkLFvFDL2KqWeq9OnVSElMbFOqlPFgAaErt3QPInzu6aHZ5+Wt65bCSVD+z
         B4wi0ZHumTQm46F/MleJQIWZVMhGRph7Ozaao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708576003; x=1709180803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxAy10MS+3fKH1ODQPSgVtCA6YuPYy19XdY4t+x1/u8=;
        b=LX7UkS1OsMVKt7vFoP3fgXsteZ95l84B/4ZC1/qF/nrx9c2RTshtUkVIaXrF9mzKkB
         f8olyvYRre0ZqWyO8cdvaamlCQqPSK/6ehKQ/rwcWAkUpkPOOe5phE1RySTj+duBSd3c
         3B1CBJVzGIbQGc3p4zvIjIbLKK0RLZOajoYek2Lfip/5Wztg8i79+YTkZxSehxiiJnTX
         TnxtCi0pqFje06je1mwX4iOBtkDQu8KFGStp3p/bijSCuePifQisvbZYz48gHpDNrm05
         mQ6s7sdwfwJInNRe9+D5EZkPvK29ChVoFCgWrLMRulwmGZkxhOHH18T7VFIVpzM2S6EY
         fLrg==
X-Gm-Message-State: AOJu0Yz65YiRc3ZhwwbzeY++dXigz+Dq2NhRm3KLhYi5Q4yjLA3IM3Jg
	kbNh76kFNFH1SmUNAWMI6cASkrzLyc50bTKdXShFgHBPJ4KIa7jhGx8m2XWOOYlG3Z8bd77jvfl
	OkNg=
X-Google-Smtp-Source: AGHT+IHSpcVaQpkq7OhcmnAg6lOkJbA+pyuWu20efa4RKKPm5CNNvB5JGVKuqetX1KF8C/01a7Qh+A==
X-Received: by 2002:a05:6a21:3184:b0:19e:cc0c:dc44 with SMTP id za4-20020a056a21318400b0019ecc0cdc44mr18827924pzb.58.1708576002795;
        Wed, 21 Feb 2024 20:26:42 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090aeb0e00b00297138f0496sm2738024pjz.31.2024.02.21.20.26.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 20:26:42 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] meta-python-image-ptest: add PTESTS_PROBLEMS_META_PYTHON
Date: Wed, 21 Feb 2024 20:26:31 -0800
Message-Id: <0993d7cb0c8c9f5882f1d2e1d9e134be9ba72f32.1708573650.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708573650.git.tim.orling@konsulko.com>
References: <cover.1708573650.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 04:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108981

In oe-core, PTESTS_PROBLEMS are also enabled, so even though
the recipe might have failures or the ptests do not run cleanly,
the BBCLASSEXTEND still works.

Enable the same behavior for meta-python.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-core/images/meta-python-image-ptest-all.bb | 2 +-
 meta-python/recipes-core/images/meta-python-image-ptest.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-core/images/meta-python-image-ptest-all.bb b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
index 56c392f036..d6708c5fd0 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-python.inc
 
 # Include the full set of ptests
-PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON}"
+PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON} ${PTESTS_PROBLEMS_META_PYTHON}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-python-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
index fed676c42e..9c542855a2 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
@@ -9,7 +9,7 @@ SUMMARY = "meta-python ptest test image"
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
 HOMEPAGE = "https://www.openembedded.org/"
 
-PTESTS_META_PYTHON = "${PTESTS_SLOW_META_PYTHON} ${PTESTS_FAST_META_PYTHON}"
+PTESTS_META_PYTHON = "${PTESTS_SLOW_META_PYTHON} ${PTESTS_FAST_META_PYTHON} ${PTESTS_PROBLEMS_META_PYTHON}"
 
 IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
 
-- 
2.34.1


