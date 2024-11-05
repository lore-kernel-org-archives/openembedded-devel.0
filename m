Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B4D2C11B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.19570.1730817441109656726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RN+AUKXd;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ba45d67fso50974457b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817440; x=1731422240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJV7dsVv4kw6X88Af7TskZpS0WsdoocoCllob6DFfxc=;
        b=RN+AUKXdRrOwe5leOQHPX0lShAw9QSbPzQgTUK6HDNc0p3F5j+y2VJa9V0fEiGTIKN
         COKldBNvDcL/PGUCy4qG7DqlAE4HDoDhSI783VCRb8wQaRFyxZXvkAOsg1bgwfuv9ipM
         G6PAGoD9iiYzYuAJgzyfFYhOBiII122tkXH6ZMtfcyl+dzrhSTvH+M6YmAIkaYj4IGSk
         13GeJMz0HX1/fI4evaJ2RcT8Wm7TvwocoI9sag8phV4lqGM6WBNkvVpZVWfgvoRb1pqH
         /pB2z5ATgcFiTiX7WbhXPOR2rxmKWDOOTgbEaGJ+fjvvdNaXVaXSJ5LveCzMEHPb7jg1
         V+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817440; x=1731422240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJV7dsVv4kw6X88Af7TskZpS0WsdoocoCllob6DFfxc=;
        b=fLJcCskS3ulC87SDWW/iJte473Sk0ZFq8BuRPNuHvrNqgqM/WECifgqo0EZX00Xmct
         5iOH+CZBGSNPRAZlRrIDJTXSl98CThRLz3V2BxA8LwwuR45noywr3Sw6xTRfhfKMkz2E
         XcJLgK9OQKpzyoH3tEBUcHc6U0FmpuFASjZxXqGNhedClJUycrBb4OoI1bvyvXw4VpR8
         bHMpH0PIH4mY6xuU/2kv0N7xo+8JlY2RZbbZ3YAuApUJPpHHdHu8+9hkkoD0q8LNOAZc
         1LsxRJTLdr5EuRcR9XkoU3IMgOP8xOmobXMHL0ZcLGgkZSUyWNKzmabqjSvaIiEwiB2r
         bxYQ==
X-Gm-Message-State: AOJu0YzruFelXM5gHL7wL/XaiG/C+VKZB2UBDefEESua47uTEbkDTt8j
	BpPGsmhaW9FNuM3vz7DsiYRuUwKOeQkJLUzyOq+/194srgUUbfn93u/jqg==
X-Google-Smtp-Source: AGHT+IFk/pCHPZBb3q3i6HyUJVjv6Bmv7dVAI06Hdzo/HEiutGb2Hp+5YWWKysamkmpw5Jj0hUzB7g==
X-Received: by 2002:a05:690c:660c:b0:6b0:70fc:f6e4 with SMTP id 00721157ae682-6ea3b897484mr215235377b3.15.1730817440207;
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaying Song <jiaying.song.cn@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 88/90] vlock: fix do_fetch error
Date: Tue,  5 Nov 2024 09:35:53 -0500
Message-ID: <20241105143638.2301245-89-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113505

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: vlock-2.2.3-r0.vr2401 do_fetch: Failed to fetch URL http://distfiles.gentoo.org/distfiles/vlock-2.2.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 784942b68ef0a9533defee6c6f3d695e1c02cd3f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index 1a75922277..948d8a2818 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -9,7 +9,7 @@ SECTION = "utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-SRC_URI = "${GENTOO_MIRROR}/${BP}.tar.gz \
+SRC_URI = "${GENTOO_MIRROR}/37/${BP}.tar.gz \
        file://disable_vlockrc.patch \
        file://vlock_pam_tally2_reset.patch \
        file://vlock-no_tally.patch \
-- 
2.43.0


