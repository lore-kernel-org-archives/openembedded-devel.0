Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17B9C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:45:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.7322.1742389328898333561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 06:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGyvo0xt;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so7739625e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742389327; x=1742994127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7DZtK0Bh8UP4mzDPXPGZgJTty+QWwy7MeycgUujNmc=;
        b=XGyvo0xtBCOm8iqje8j2HMrKteBQHXTFeRNbqW/WVmIGeFtGYL4pyZkFbY3QN8tajp
         Wbu5woLxcsbtfadmPBEW8njbGcEtrOmGzGYorFtEsMZOZyB9Bc5fr6Rzrjcvycj+9Uqd
         wv0y6oE5JbY1VkFMF/9A4drhX9DGw/sIh87OhGJxtdG+vJeDCszQTeGWEa3jXq8KcatE
         QXeYyvT25cFA/NllMNOkv+4lr9xOb3C2D9Jn+cULvaFFOxhFXsGY21nyZ3Nd/Zi7H+qo
         g07i91QbhFNPtoST/N9DcHFz0ECjKMCA+1b+tiVtjD47HHZr4/NvcxsiHYPHCQ2VZtDq
         mHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742389327; x=1742994127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7DZtK0Bh8UP4mzDPXPGZgJTty+QWwy7MeycgUujNmc=;
        b=pgYh8MSaqnuYvVDA4lfVCTZhq9j34ZdSf0O4SRLWchGoQ1E+ms69d31dHZyorT7kFK
         l52/q5+wcTeJ9CFndqjPlYpQpRBPCOMNQe+twQmnM4CyHsoOoptSpYC+L3kwaXFM91P3
         YFgKZh/uig8AD9W5ElYFby8gAg++hHC272ypNszcmOHAoCpno/bS6Ne34wNLeS7KG0RZ
         M//1FEuFuJHEg78R+CBFUVEhX7kraMYJWLGCSmIz5NqoeL8Sgthx0776YZVOs3KDMS9P
         UZo1cx4vwLeHbImDLSwOhoLmWSjfczNbMa3lwC5ytVO1L9f8ka6I3Ljz4en5pfW/5Y28
         CV9Q==
X-Gm-Message-State: AOJu0YzJqPsige6j2NyfmsA4YAFc2mNQoYsbp7rJEY+CReS/icPc+RGs
	JJkfz7ys325yEczESQJ052dSPOTguWexlJcDH2RZR9ysFSyWaaIpDykg0399
X-Gm-Gg: ASbGncswUBNA95RzVyPRhvyNL6f+r9bqD773Q1t5LVtdGSCC3e2LRXLWr3/YCVAm0xx
	fC1FGCbLbWBinsfWu2YnVlXoQPOWXab1eT+fNXpLhGVxy0Rh5sXmOxDb7mDkdcso7i3cVDc4JR8
	vynCL9R4/oRwdQQGM9+sFda8RNRBBFFEe72gKCQiRnRrQ3bHGrDDGjPJexD6b2WtqzImUAJaljY
	EjvZX0gPD1XNs1zgkttOPLdoUd1oMUyrtwt74Rhv99ThmODcdhBM+ASB8LxhcvQxrXgSRoHXGeK
	WjRFYi58Kj+DI9oHPXTg/CNT1oDsyAS+Qwxjggv9DVse1tLGhZCOEY1dpJ5l8/nL897ors/Cqs3
	wy5c7fxSjksORkp1Xw2pPAo7qWsX9Kg3O/HaAAQ==
X-Google-Smtp-Source: AGHT+IEIY1qj5vUqPdlfw3MFs2J2pFBzufmRPYkCoJAsbDi3uscVG33rU9O3q9kLRhtrt8teaP3xnw==
X-Received: by 2002:a05:6512:1048:b0:545:2f0d:8836 with SMTP id 2adb3069b0e04-54acb1fc8bcmr642403e87.40.1742389326432;
        Wed, 19 Mar 2025 06:02:06 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8804b4sm1917178e87.171.2025.03.19.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 06:02:05 -0700 (PDT)
From: "Omri Sarig" <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [meta-networking][PATCH] chrony: Add nts support through PACKAGECONFIG
Date: Wed, 19 Mar 2025 14:00:47 +0100
Message-ID: <20250319130047.606729-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 14:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116078

Chronyd is supporting NTS (network time security) protocol, however, to
build the application with this support, it require having gnutls at
build time.
This commit adds a PACKAGECONFIG line, allowing users to control whether
the supporting application will have nts or not.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_4.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
index e45d5c6ba0..83dee9143b 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
+PACKAGECONFIG[nts] = ",--disable-nts,gnutls"
 
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""

