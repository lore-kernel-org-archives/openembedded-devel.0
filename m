Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68788C6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.11375.1662276880309196795
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kd5v1OaP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f24so5799677plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1LFNkXJpXUcbBIR83hV9RaMMd1qNRMPobR22ktiDQxA=;
        b=kd5v1OaPHjLsLCWmB3gbe1pPfVtXzinp5yfILPMGzyn+iC5wOtj6HyyhvW7ZsnZFDE
         00acEsDxPIANU4UXplOgysw0qnNGqICEINiTXH1/XPZqnVnn7BCfD4xBWqCdTh6Q4rIQ
         Tb3tvyzuH8Dgsgd+ZdvJ8C/iE10amMsClh3rKie2/zVCjpOiTGwdag/Cs1YUB0LtKm2L
         LMHgY6d+S10L8ffjfvisnPX+U4WbrkWlgjwcKfotrH/lTGF4qSzWiGuK032mADY37eB5
         rZ8hsRyRNuIswzNo46ilP1JpklDSmavJ1W4DKbHd5/uRm6paoR9+defUWbTmy5H0iUIm
         zLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1LFNkXJpXUcbBIR83hV9RaMMd1qNRMPobR22ktiDQxA=;
        b=Yla9xa18y1WBxgDGOx+HxhNTD7kBS43hI600lBBSGAMedc97uvbb4NXZGTSHwxTz3k
         q1kEW1AD/FpavbY8pE6I/15l/mtLIRvMmaEABFa7xeOAQHm3Oam5vi+QVQpjNI/49x5N
         7qSFiwG6SWA46F9Kg7sPVn/H5zOuIkj5ktmaTwfWNes/5RLCdxGRaeusrSe5pE6um2CI
         UEtvnxAUbUC2//FZSFxbLxfRGcn/7R5UIex8WcSFVUqafpnx1Z0oaimoFfg/ixkTrIl0
         0r2hyKIojG9ePfevq9sIMamGAm5UFeIHb2xgHtjFC4+ldgQeB+FftOW8Z8Gt/cCyaUHK
         yFfg==
X-Gm-Message-State: ACgBeo2EJJ9SDiw4zLl6c6DNngDoVX0fPen5ZHteyGC24R5slni29Lt5
	NuJ+nwP28u6vAfx51NcNyuMtgwact6ILFg==
X-Google-Smtp-Source: 
 AA6agR5aDV1HpI77PqZpOredE++S7CUP4NtPsLp5gU4BDsQEVApu2Doe6db8Ta4qBThQV0D2/siSuQ==
X-Received: by 2002:a17:90b:3ec1:b0:1f5:15a6:aaf5 with SMTP id
 rm1-20020a17090b3ec100b001f515a6aaf5mr13531706pjb.123.1662276879430;
        Sun, 04 Sep 2022 00:34:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/63] lxdm: Fix msghdr initialization on musl
Date: Sun,  4 Sep 2022 00:33:32 -0700
Message-Id: <20220904073417.3251865-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98612

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lize-msghdr-struct-in-a-portable-way.patch | 40 +++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-Initialize-msghdr-struct-in-a-portable-way.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-Initialize-msghdr-struct-in-a-portable-way.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-Initialize-msghdr-struct-in-a-portable-way.patch
new file mode 100644
index 0000000000..d4779505d8
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-Initialize-msghdr-struct-in-a-portable-way.patch
@@ -0,0 +1,40 @@
+From 7c370576b4fb7c7d3b6dbf33125136a4ae70a330 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 21:52:16 -0700
+Subject: [PATCH] Initialize msghdr struct in a portable way
+
+Initializing the structure assuming glibc layout results in
+compile errors on musl, therefore do partial intialization and then
+assigning the members individually.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/4/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lxcom.c       | 9 +++++++--
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/lxcom.c b/src/lxcom.c
+index 397d1b5..517c775 100644
+--- a/src/lxcom.c
++++ b/src/lxcom.c
+@@ -117,10 +117,15 @@ static gboolean lxcom_dispatch (GSource *source,GSourceFunc callback,gpointer us
+ 	char ctrl[/*CMSG_SPACE(sizeof(LXDM_CRED))*/1024];
+ 	struct sockaddr_un peer;
+ 	struct iovec v={buf,sizeof(buf)};
+-	struct msghdr h={&peer,sizeof(peer),&v,1,ctrl,sizeof(ctrl),0};
++	struct msghdr h={0};
+ 	struct cmsghdr *cmptr;
+ 	int ret;
+-
++	h.msg_name = &peer;
++	h.msg_namelen = sizeof(peer);
++	h.msg_iov = &v;
++	h.msg_iovlen = 1;
++	h.msg_control = ctrl;
++	h.msg_controllen = sizeof(ctrl);
+ 	while(1)
+ 	{
+ 		peer.sun_family=0;
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 83b15ce8e5..adf9cb597c 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0008-greeter.c-show-information-on-gtk-label-info.patch \
            file://0009-greeter.c-disallow-empty-new-password.patch \
            file://0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch \
+           file://0001-Initialize-msghdr-struct-in-a-portable-way.patch \
            "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
-- 
2.37.3


