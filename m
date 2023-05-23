Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93116C7EE37
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.13651.1684816022134472387
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NJrZCsv+;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d3578c25bso4675733b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816021; x=1687408021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSUlx0AUaFETThniXkJv+vFFTMdX54j+QHScIi4bM/4=;
        b=NJrZCsv+cKZ87kRq88YZVB8wrxUdylgoN9ZHSgEozxs5eU/jaosxARSX4wBDimv4Q+
         NTOth/+GmQvmJRz1g6LXp5uzpI/eOdqxQZCeG3479wQymFbws3mwCXYT2NzwMJqwgwUw
         he5w+bQdSoLHcjOwhafbdXhrvHK2ZnwbLitAvyQa9YAycs7WY5RA229u2kmDCthEce6P
         fcxhLCFP+9IALUZ7d/whOZP4XQkcEeR4GU8vR2oK6rhXuDOB51b2H0lrQzCb6uE6wq/I
         N/DDF3b5k5pQ2Fu838WCeVt1ihPhtfyYkbO/mpFJI+hLiHUwO0LdBjOUefCDzHUV1kSI
         1NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816021; x=1687408021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSUlx0AUaFETThniXkJv+vFFTMdX54j+QHScIi4bM/4=;
        b=WzA90BdcL7QfFhMcIVAyNo1oRQggxLStPffEkcS8UCDeU3EcQopZz2/UrrW3c+n13B
         LNTFy2gTDyGSRGpr6sdgZWlZJJ0z7WECZo2+gvvAVaNkaXCDld6jli1x8f0ANX9itJZe
         3sCjHY/Cyam5XPN/IovC63qLu/Okrdx0eUoJdeQSADNOcPCLHyenyLtwvgzXl+BKbA/u
         2GLYiYDseVz0tBv2SJAaUJ1G63LEvIKxx74Ij1IQFvGC59vriFpvelcL3quQwDIuc3dG
         xis3oIjkH6NDE2Sv1hiP2mdgmruf9LMTMac6U7d0zla76QqfeKUz0MnLeX9QP51OqYHa
         xyKA==
X-Gm-Message-State: AC+VfDwtNuWLq+KxP/jtpSQJGO7w7gn3ZAwoRXYTdW+DYOwAi3DfD9KZ
	ZqT/Ynm4NxPEVCUl4H/6tvrky8HKA74=
X-Google-Smtp-Source: ACHHUZ52nihQIjgbf9x9kZIYcIZ2iXhr/dKyg24CSD6awtClCEb27O+FGydmVygl1qkC9o0hm/n7Zg==
X-Received: by 2002:a05:6a20:1586:b0:101:73a9:1683 with SMTP id h6-20020a056a20158600b0010173a91683mr14579159pzj.33.1684816021035;
        Mon, 22 May 2023 21:27:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 02/11] tvheadend: Upgrade to latest master
Date: Mon, 22 May 2023 21:26:49 -0700
Message-Id: <20230523042658.4159559-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102717

Fix buildpath errors due to generate build.c file containing compiler
options

Fixes
WARNING: tvheadend-4.3+gitAUTOINC+cc60283368-r0 do_package_qa: QA Issue: File /usr/bin/tvheadend in package tvheadend contains reference to TMPDIR [buildpaths]
WARNING: tvheadend-4.3+gitAUTOINC+cc60283368-r0 do_package_qa: QA Issue: File /usr/src/debug/tvheadend/4.3+gitAUTOINC+cc60283368-r0/build.linux/build.c in package tvheadend-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index b3e5e78c7c..d64ee96f78 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -30,3 +30,7 @@ EXTRA_OECONF:append:libc-musl = " --disable-execinfo"
 
 EXTRA_OEMAKE = "CFLAGS_NO_WERROR=yes"
 CLEANBROKEN = "1"
+
+do_configure:append() {
+    sed -i -e "s|${WORKDIR}|<TOPDIR>|g" ${B}/build.linux/build.c
+}
-- 
2.40.1


