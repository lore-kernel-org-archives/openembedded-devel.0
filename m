Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27798C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:07:35 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.6004.1704719250085273713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Rb44Clem;
 spf=pass (domain: mvista.com, ip: 209.85.166.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3606f57e08aso9394655ab.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704719248; x=1705324048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shyTaD5VKOcq/B0gQIpzHnWenp9WhxN4fqsSe07mEGw=;
        b=Rb44Clem1AQw4dhF4q+kdjnr8v4LTFHykMph26hNy4+oqOFn1p4jXC0cwx/50oDP51
         LrwOnX+YCYy5ZhKfgTxVk4nyPXYkCj+ZDkZQd69Hj3ZByzC1a/Wj6Q6wwF+lAkxJB8MY
         kb4oT4ghknAJkPXQzy49tMkSNUs2QTTeyOjjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704719248; x=1705324048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shyTaD5VKOcq/B0gQIpzHnWenp9WhxN4fqsSe07mEGw=;
        b=rgl5+8ihtv9xIY0RfKg8hHDYMZwS6+riYzzy3aMfKNUkOULCyMoxhBZEqgOQlDoZ/Z
         crWYhRTQCn/qZLTROu+hTO/Fjo+jFIkAGXIumbh4UVpdgcoyqZ/lSTyIaR8GKpltUpHb
         bqow9Af+948R7MyUJ+PfEcQCKE7TZgRrTJWGLHRLPNng9FcO825lEBRbjVPM+Nb7yEyJ
         9zeirviiZAgVsdJ6plHNj7GE+JClfRlPehx20JLUTNFVZejRcZyX6niUFjKyB4QIPy0c
         GgkQf+QQl+a4NlxctwIRMDnGkhFhScx5f4DGrzu4mkx5CSGLW3Y73tZAPvD7GEN2XDmI
         /1tQ==
X-Gm-Message-State: AOJu0YxsUW1EA7XDg+w9w3GeIYDDmsPZoqJWfz/G99FTJLnd9gHQNCbW
	l4t4FvDYulKWcGWWh0xAsuKiw/1mlY9CU51FwW8Pr/Wf2yU=
X-Google-Smtp-Source: AGHT+IGCouA231EvnlanucJoCx2EpqULpDz8EABwTvyGGAtWP+qej+gq7ujSJcFJvzbtUOSX2xhFUQ==
X-Received: by 2002:a05:6e02:19c5:b0:35f:d1ed:d189 with SMTP id r5-20020a056e0219c500b0035fd1edd189mr4952444ill.58.1704719248301;
        Mon, 08 Jan 2024 05:07:28 -0800 (PST)
Received: from localhost.localdomain ([116.75.166.129])
        by smtp.gmail.com with ESMTPSA id m2-20020a632602000000b005cd86cd9055sm6039766pgm.1.2024.01.08.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:07:27 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] squid: Backport fix for CVE-2023-49285
Date: Mon,  8 Jan 2024 18:37:13 +0530
Message-Id: <20240108130713.1551982-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108129

Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/77b3fb4df0f126784d5fd4967c28ed40eb8d521b]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../squid/files/CVE-2023-49285.patch          | 37 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
new file mode 100644
index 0000000000..6909f754f3
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
@@ -0,0 +1,37 @@
+From 77b3fb4df0f126784d5fd4967c28ed40eb8d521b Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Wed, 25 Oct 2023 19:41:45 +0000
+Subject: [PATCH] RFC 1123: Fix date parsing (#1538)
+
+The bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/datetime-overflow.html
+where it was filed as "1-Byte Buffer OverRead in RFC 1123 date/time
+Handling".
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/77b3fb4df0f126784d5fd4967c28ed40eb8d521b]
+CVE: CVE-2023-49285
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/rfc1123.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/rfc1123.c b/lib/rfc1123.c
+index 2d889cc..add63f0 100644
+--- a/lib/rfc1123.c
++++ b/lib/rfc1123.c
+@@ -50,7 +50,13 @@ make_month(const char *s)
+     char month[3];
+
+     month[0] = xtoupper(*s);
++    if (!month[0])
++        return -1; // protects *(s + 1) below
++
+     month[1] = xtolower(*(s + 1));
++    if (!month[1])
++        return -1; // protects *(s + 2) below
++
+     month[2] = xtolower(*(s + 2));
+
+     for (i = 0; i < 12; i++)
+--
+2.39.3
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 3027806742..fb293453f1 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
            file://0001-Fix-build-on-Fedora-Rawhide-772.patch \
            file://CVE-2023-46847.patch \
+           file://CVE-2023-49285.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.39.3


