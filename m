Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A50CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3493.1760484805269848677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZ/lM53E;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5395309b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484804; x=1761089604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1H/ipdKeGjytMyN0hl/+I6wr3SIrllewKisFWn7BRs=;
        b=lZ/lM53EsueEdFFm3WULaCCEfy56hxiabnBBUDI3EaO86uj9YZMYliCNxm53hJHxaa
         CH8RN+lJcV4M24DbMoflLZ7iV8lGoFBai0XOGAaEmQsZm3m90FN0e2Vwx6MHVCEdz3b9
         wjFk7qjgMyWXByN5PATBMHTTzaZQwneRRtUM3s+dgbvLQlZNU83XsXvC8mtd8WOm1xUC
         bGttZcNWc3oL5acS7R4cQ+JN9rdBhqKaxalyMXHcBi5DQChzZPyYSNzzbVRhzxoRairu
         E3j71Fu/+SxR3m7G9mJ0GDkqTwfAkCBL58ljdzEeIW4KWekfEEoAqFjhqbhrNm5zfsOL
         trKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484804; x=1761089604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1H/ipdKeGjytMyN0hl/+I6wr3SIrllewKisFWn7BRs=;
        b=q41c7Iq8n9rqpO1dUsgh5cGUJ+fqp3gj7O21qQaxXxgBgSoDad5wd74mQziorSjO1C
         3r5wRoXx+L95eWNQExKf+5csxm0SN9RZ4qAhC8PsWXnQrOod3sMNQXgVEUItZJfIH24J
         ITL6uh8ZNTW5anQo6yq3ecCeO9ZyCbWFha0H7usARJUdkT6dKa7iPWC3+9t51WFNCqw/
         1V7hb+Jjh5ahaeLF5ETAnEjINlwRTVZZrTCQHitLTnUk6Qd0pTA79l7cxKhJlgBa7NTw
         iWAeFUmChoV43W9tfPkxlN9cuQVgVcj2dnr1iUZ2OO0Dvd3SWGdBbetkjyGE3F0OjSd3
         XoLQ==
X-Gm-Message-State: AOJu0YxdCFBRDXLdROmaGEGBUztnH8vHFfxeOH3DrdUInRJRWZ57Dk6D
	AY18sreYlGcDHsS+cmUAuUukacV236MGMJ/AtO4Yq2+B0uK/DhEuydOAzwZXzg==
X-Gm-Gg: ASbGncspzJ2lME1R9kYGSnL3PAhO35WVtPpxJHnfdOKpNxH2wMKVXp63cafE91azErM
	hUxPVujJrSV0X9pHYoiK9vy80LQrQywLCrqNJzSDzEW/YQ6pM/tziVqMgs6WBov7z0Um3zqdR3X
	QpfS99ygPPfPww99OFpU2GmcxeMwZQgOJfnaGxSihI5WKOKwWrEO14Rhue7RDKe21MolIiC+UOq
	l/0G3IkVOBV+Urof2S0/aRhnmvgp4KpKjm2bCSuUyHy5v6/jHvxM4vmonhZ6fuvsEaav9okTE+g
	jqXYcjRAHHpMM/GXaJks4T2MwC3ceg1GoJMgLowBBd6VdVS7SxBd6MIFC0gWUrK6ZRdxTaKcRuw
	t/juVg1cRGKwZcvha3jNTq1l2uHYnTORg0f8lgqwo798XDpPvlAR25LadoCG6xDOWKQ==
X-Google-Smtp-Source: AGHT+IFnTCPkuQcQUkpBzvdyRfvP7dQqswx+qIK4kfin6ZjpuIh2v2RjzHVHDq8H2RpVMX4YRss2aw==
X-Received: by 2002:a05:6a20:3947:b0:252:9bf:ad9c with SMTP id adf61e73a8af0-32da83e687emr39332217637.51.1760484804503;
        Tue, 14 Oct 2025 16:33:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:24 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 15/18] gattlib: mark CVE-2019-6498 as fixed
Date: Wed, 15 Oct 2025 12:32:26 +1300
Message-ID: <20251014233233.304125-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120674

From: Peter Marko <peter.marko@siemens.com>

Our hash does not point to exact tag and CVE patch is already in.

We use: 33a8a275928b186381bb0aea0f9778e330e57ec3
Fix: https://github.com/labapart/gattlib/commit/60b813a770e42fdb0e85c1d2da7a55327784b8d6

git describe --tags --match=v0.2 33a8a275928b186381bb0aea0f9778e330e57ec3 60b813a770e42fdb0e85c1d2da7a55327784b8d6
v0.2-262-g33a8a27
v0.2-85-g60b813a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e5a12d52522f10026570a5c48d6662a5359c4887)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 7ad28d594d..0841dc2596 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -17,6 +17,8 @@ SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
+
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42

