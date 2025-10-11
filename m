Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BD7CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.5331.1760206427439401698
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3nefLGt;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so509454866b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206426; x=1760811226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IEzhjMXyB14wifDw3EXu+nsI5tCtfQ0MHqMr6yD1ZI=;
        b=d3nefLGtXeCblTCVGMRTaeKl8bJxTgr8Kd90Zu5x7PrG4V7U69roSjCZd27anF2AMP
         vWBrKQHVHCPobfJ5LfI5wdRbYij35s8D1C4FaS149tfRWYd8cGPpawTId+CRUwU9eOd1
         G3NcY8UkJ29l7UPq52NJ4o+Vc4HxBcqQm9MdOWycaM9leeOitOWkXJHlvlI81LCGmGIi
         Fi0iFTvIpAThUrraKn8/P3q1XQ8Tmqvx8SdBLpRmmjmiUy34An6fvgCOS0GOQte0M2W2
         3HXc6vOAZak9EaKKep6QdP6p/v/oXaMh5IB69XpnDPgXcI2kwWJXIvSDGhIaioMKfopM
         Rn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206426; x=1760811226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IEzhjMXyB14wifDw3EXu+nsI5tCtfQ0MHqMr6yD1ZI=;
        b=OY0ipSd2E9IJHHExomYhZA6iTR8AkaUz3uH9VfX2iPEJRQLWt9HP+hELf4lxQOrkAJ
         7kHQUfrPJUFRCDxXbMwMjrOTov+QNKNMkXsdY62/8jQunQuEGfb2vI6gTUQj4IKAHfaM
         UHdT8qatn6yWBAeDiv6v6k66IKvHEjrK9LnYAtIt0ij8MkfpJapyiVa62ZdCy11C+c3t
         XZRkvW+9bA+j7VmZcxyZAKIegsPzaWrQBwcJ0xU2szMaOxQQhTrrDKG6LV/AMHL1AgYq
         ldtXAtgyH1tqt2Pgg4+i2nTrg4Oi3aBIl01zX1iomE5IFvXJ73LFhiz+H5DcgW36QFMK
         Kciw==
X-Gm-Message-State: AOJu0YyLO4AHtaveCt2a5IGOMtrfCIAikP/RwOyhE084JLDy2fBx0p0Z
	xOrJr4HUaH3v+uDZQ7an1SIdl8I1AABFLlJJfULBD94HeZDZox9z6JqysOL+ig==
X-Gm-Gg: ASbGncslzlIjmVNbzUbXAkP6DDzamMAmoPVT7nJAtAoGHo07you+u3ccBvbNw4ItKcq
	sTOsZek+aoF4HNJfKd0oPOSnCxySxoMg28YSiwP16zHfXyBCjyTBJN9gKIdjPY0HRCZ15UsrUFt
	ijpHeXqJ3nVLapratfmZ6pYk2msCey0yD/Xfu/h/KgjDoxzmfY2Iq7Z8928f3FKmlrVmQ0ispms
	WNKkfqwtKqJ50Ik3ou4LJcny2wkHdNODqVDXBh0vzPn7KLwX8r2rSZpQ18oMBG43efoj4bF4XTY
	WBoxIXngJ5sr1XE4yju092NQiPGDCIAxBFKA8b+CtAbUi/Qy7m/1cG+gYLI7GzbMGqiPTmBclil
	FTlw+QHyzt4v0hojIVMf7V0Zqhe8uYZsw3sJANqM=
X-Google-Smtp-Source: AGHT+IG6yPWdCPSCryCF2v51WYmMct1YvwT5DRNeUJzRbTeZGxbaNbvxdwXqx5UXv5+7oIxTtQHiSQ==
X-Received: by 2002:a17:907:d1d:b0:b50:34b6:621e with SMTP id a640c23a62f3a-b50a70cb821mr1514420566b.0.1760206425694;
        Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 09/10] freerdp3: patch CVE-2024-32661
Date: Sat, 11 Oct 2025 20:13:38 +0200
Message-ID: <20251011181339.2127670-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120508

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32661

Pick the patch that is mentioned in the above vulnerability report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32661.patch     | 28 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32661.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32661.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32661.patch
new file mode 100644
index 0000000000..5b3fa07a3c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32661.patch
@@ -0,0 +1,28 @@
+From baf5543fe8f2db56edc26c8ad93e20696b905da8 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sun, 21 Apr 2024 13:56:13 +0200
+Subject: [PATCH] fix missing check in rdp_write_logon_info_v1
+
+CVE: CVE-2024-32661
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/core/info.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 7d6eec137..3395e4d2e 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1398,6 +1398,10 @@ static BOOL rdp_write_logon_info_v1(wStream* s, logon_info* info)
+ 		return FALSE;
+ 
+ 	/* domain */
++	WINPR_ASSERT(info);
++	if (!info->domain || !info->username)
++		return FALSE;
++
+ 	len = strnlen(info->domain, charLen + 1);
+ 	if (len > charLen)
+ 		return FALSE;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 80e8f5f93f..509bb80956 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32658.patch \
            file://CVE-2024-32659.patch \
            file://CVE-2024-32660.patch \
+           file://CVE-2024-32661.patch \
            "
 
 S = "${WORKDIR}/git"

