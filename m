Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B626C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 16:26:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.806.1741796764748261802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tso/utHL;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3914a5def6bso23918f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741796763; x=1742401563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mO1mWjSegynmNAoJk0qrtBecOWJzPAf/d9gexxwb84w=;
        b=tso/utHL6Ew4EcAZ3FlVOCaYlGyWs8lbBwXDKexdaqXipkdx3PfH45WS3ONPU4j1sw
         ZGiROGivERBRSjw3BfZUzuo2A7qb3EooTF2SQIFxEY3tajy2z57VKj0p/PH7+Nlcc2jj
         kFsuwRuRz0mtUPf4mIGk62l2vVsT9Z47fga9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741796763; x=1742401563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO1mWjSegynmNAoJk0qrtBecOWJzPAf/d9gexxwb84w=;
        b=ZL7pMtLsNV332K0lgA4n9hckgdpFPdrq9s7HVGdPjmblmiaiR1ayNaH0/YhGpoJJyv
         JhuhCgjVklz3z26iNhBC1wY85exuK6MJzTxLH+6fqyVVGZ5+pzGaSbmz28+T1Y7UW0cm
         b6pWW+8Ac9zF4a/wGEZe/01L3ATWB8B3pBVU5pmLbUlaECWvsA5RrQZTfOB1O+2stLJ1
         ER6/Gr15VsURLzIQgV8HuP9tZZxEV6wRThj7yQdQeqsrUOZLD/X0/ZUs+76rPTXeOCI3
         /z84aJozHPzI4PCDsfDFqCcNg5nlOMsfSXEde1qnUafD43+GJiQDhK1n4k5CsA74rUAs
         t9Qw==
X-Gm-Message-State: AOJu0YzekkqdxFPmae3G2cK2U95DjjEPxigfF4xPuyv4Lys6eE/3B3Pz
	UhqNWJhPzet8T0tiLRNgM7EfsgvokFuIZK9XcQdJJi9jWT3bwSLDEJMwGqiGJb3qOHr9JzcgyGv
	x
X-Gm-Gg: ASbGncuaMkNR4DTqtJeHBRs8BGw5wvpIjXRWoIbkYF38SgC+aCsV7P/VIizS0iHWSFp
	TuVNSi9k437W341LbRdaQ89YcnDPZqHowMQf4TUMnGM80VdWKJtkp7SXhJ/LWnbvoo1hW2uhgIn
	u50jlxNYwVRTHG218DNFfTOYgShiNi6Hs/MoAimFV8YSussMTUmHLIoVtc3cjtfasFghNQGHoyh
	cDzKQRZrn0l5yWAlWMbCaL81dDM2UCfd4qn9c1U2JxMyuSnyS5saBZhTLyeQxowh0pknz259p8N
	DgPJ2BEl3r52c4YaIU1QzLy64gew62UU9M1KsGiiZxYV6ViQMJPmyT5Ing4VpOicYZIHiK1BUeo
	kP87nhqdlbkETEVGbDOqFQuJW+4FRAEfE3SPG55Qk2kEpyX1eRPphM1SPN9so
X-Google-Smtp-Source: AGHT+IHUJdsyzxsqE9WHROPtW5nVTVG/OsUodJf2s9RiWfrn0z1aceTi8BFWp6CRyMZx9dgzmEFwmQ==
X-Received: by 2002:a5d:5f93:0:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39132da07d0mr18768810f8f.39.1741796762801;
        Wed, 12 Mar 2025 09:26:02 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-3340-7b2b-cb9c-b08a-0091-a0a9.rev.sfr.net. [2a02:8440:3340:7b2b:cb9c:b08a:91:a0a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01d2cdsm21840047f8f.57.2025.03.12.09.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:26:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2] packagegroup-meta-oe: move thin-provisioning-tools inclusion to clang dynamic layer
Date: Wed, 12 Mar 2025 17:25:51 +0100
Message-Id: <20250312162551.3257541-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 16:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115929

From: Yoann Congal <yoann.congal@smile.fr>

Since commit e19b4c9755fd ("thin-provisioning-tools: 1.0.13 -> 1.0.14"),
thin-provisioning-tools is in the clang dynamic layer.

This triggers warnings on AB:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/213/steps/12/logs/warnings

So, move the thin-provisioning-tools packagegroup inclusion to the clang
dynamic layer.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2:
* Move to the dynamic layer instead of plainly remove it.
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend   | 3 +++
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb     | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
new file mode 100755
index 0000000000..d3fc8d3254
--- /dev/null
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -0,0 +1,3 @@
+RDEPENDS:packagegroup-meta-oe-support += " \
+    thin-provisioning-tools \
+"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 449f671f7a..70d05c44bc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -878,7 +878,6 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     syslog-ng \
     system-config-keyboard \
     tbb \
-    thin-provisioning-tools \
     tokyocabinet \
     tree \
     uchardet \

