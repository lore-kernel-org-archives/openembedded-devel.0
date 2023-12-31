Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD523C4707C
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.218947.1704025428514878529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7J2dfdf;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26f73732c5so492477766b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025427; x=1704630227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHHlU/9KO5+DXV84m+4wlJHg6WrUBsreXccGoYViFt4=;
        b=F7J2dfdfTj305lPg2T2IqSGWHxfwKRBCX3tbBCk2gbIyqtAT4L7GdkC6rSI1hLiims
         wAVKvUb77h/o5oqCn8TrR5JHAsbHRaF+D1YlBwt6TTLS84Ebx+8eTH2NzeUhie+/ahEV
         U/ZD6uql7IddX9XzQGdkP+IKEAEuQ/epMKTd7V+rDUgHTwMARWoR2ioluVu8nk4s52ZM
         AUaa0XIr1sBCj7XwF/3sPReZthpXaMo0w0z74mCwWmW/C+Ha7ST4TqMBSr15UlgivIN9
         SQyhb8+3bFMRwCNfCzfisG+RungduyPtS7wxD5gREj0lGT7SRCkmxNVaoD0Tr3zyuj0R
         JU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025427; x=1704630227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHHlU/9KO5+DXV84m+4wlJHg6WrUBsreXccGoYViFt4=;
        b=BcFhX0piAlVkQ1IHTuq5x88x6crsGC2lgZSZGzE57oquymJXr7G0h5ecpmMEMwjylf
         AKYqn+LMH+vd7BT/XHwRx454eEVH5azkSn/xvbyPRBVLt+XkkUl9td5JxP4c4Vla4NBf
         dHY6u/5mAKycOG1/R/rRC6fF5aCxczYM/2x6j8FsUES1wtn4pwJIlRV4wvnoj2fuHNCv
         S6FpLDCi9ql+gnFh4CkEX4ygeyDymyYlrFSI8r2tumuHiXr1njXWBFGYykQ6MfhDSbyH
         aCTLWptGLHpZ8KJLTrVWL1grrspf/mFP8Z/wjiXGnUSUMASv7wb3kS8wrc98uqWCdtmI
         s0HA==
X-Gm-Message-State: AOJu0Yz2bqiFGkKBrrAx2LbE9rA/VOHyIRfApRwDjg60IHdfcRl0QcZD
	UXaOOLVLp/wTFXU8vLE7koyIXV6FvLA=
X-Google-Smtp-Source: AGHT+IHMIYBftyN60dVS9wc15vwrXce4RP3slNyNGkwRQhin85iCMExuVnt5FY0MJ7WQTXiN502eOw==
X-Received: by 2002:a17:906:38d6:b0:a23:57f3:95a9 with SMTP id r22-20020a17090638d600b00a2357f395a9mr6732770ejd.2.1704025426725;
        Sun, 31 Dec 2023 04:23:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/23] mercurial: ensure setuptools is present as distutils is no longer (mercurial tries both)
Date: Sun, 31 Dec 2023 13:23:25 +0100
Message-Id: <20231231122329.405225-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107970

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
index 112df8c1e..2451a36be 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "python3 python3-native"
+DEPENDS = "python3 python3-native python3-setuptools-native"
 RDEPENDS:${PN} = "python3 python3-modules"
 
 inherit python3native python3targetconfig
-- 
2.39.2


