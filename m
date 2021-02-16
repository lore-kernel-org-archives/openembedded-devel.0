Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.2370.1613440708886841671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqR3VvVf;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id a24so4658955plm.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bZ03gWI1c6PI+x6rNmmPikHiLPCJG5hnjNldY1FZmwE=;
        b=iqR3VvVf3+THDtNMsBckqS3iNYqMXSggqt+VX5J6nXbk9y4i1oGoflfJtmAdUtG/64
         Fj1c8XgJZ1w3qbWr0PylE/RzYMsEDOnOh9vHBbiAE5jg4SSfCZ7eU1Z/6NQH1Y+7WZHF
         mPVyVIQNRbUyEVigsQZoXnLKNJXhevYu9WdWywTpBUSAw1V4lL8HsGu41RC/VXwN0Ebq
         8cYYOZCpjuz5hTHUa+KbYb/2ul+zS/tqkpwqm6RGqRDWIM/D+9tfAg1g7GKfxsnRbvcR
         Jt8UCakQAC4Gy8c6v54gAfEXlGa2O/F/0qcSsXTmw+6Zl1KU6IcFQq1mzVqTseCOb5WN
         dEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bZ03gWI1c6PI+x6rNmmPikHiLPCJG5hnjNldY1FZmwE=;
        b=pGsYQZhClx4kNTPuN1QdcnwGjrfU6QprU3adhfhKObT/VxIZ8MJ8C6RSmso8hLjzf6
         spCidE74o2EbcfWBYBJJdPI4a4oN/LLOkCMW5qzIbuP+5EAbWsSCYmuks9lobnUjJCPs
         Wzxuj3lWD/B2KfkPVqJsiwVxL/0h4scfA14XIkKRgzgvFAzQSdEeJfZN5CDkDT4mlwqe
         dofwL1jzWL1XawgJA1vFyBOoxLJAZdtut9626kqlPjVgROI/5XiiQwnwj8RPxu7PQpgB
         J3zDM9oxg6hZSxRjphPwcqmlb4mGmUOTpFA7vzx+u0JAL0baBwGx78bsind8fdKfoXzL
         vFfA==
X-Gm-Message-State: AOAM531tKhI/HG61iW/e6CRUwT22LqauLcq6HJLDSDEXF56ba7Fc8sq4
	VuK2nM2LrWJ55Z5h11LNk0fKemeqc64lSw==
X-Google-Smtp-Source: ABdhPJxbBXyjs4aMy0YmcL7QtO9R8zCSZco9Zx5dHctUhYZsGaI3xyCyTfsGDP1Ma/lR6dlw7eUJiw==
X-Received: by 2002:a17:90a:a08a:: with SMTP id r10mr1699713pjp.133.1613440708380;
        Mon, 15 Feb 2021 17:58:28 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:28 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/11] wireguard-module: remove PKG assignment
Date: Mon, 15 Feb 2021 17:58:14 -0800
Message-Id: <38836bb67436336b9e504769c30f8cf84082da6f.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* it's not clear why it was added in first place and it's causing issues since:
  "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
  commit in oe-core as discussed in:
  https://lists.openembedded.org/g/openembedded-core/message/143672
  https://github.com/openembedded/meta-openembedded/issues/285

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 304f660f880bdf7dd5c51695875ab0a73aaed8b2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f9502868169715ee4945f5d8bef7c845dbb7b9e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireguard/wireguard-module_1.0.20200401.bb             | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
index 45324c02a1..e8891c4428 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
@@ -22,13 +22,6 @@ MAKE_TARGETS = "module"
 RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
 MODULE_NAME = "wireguard"
 
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-PKG_${PN} = "kernel-module-${MODULE_NAME}"
-
 module_do_install() {
     install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
     install -m 0644 ${MODULE_NAME}.ko \
-- 
2.17.1

