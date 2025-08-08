Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E03C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:59:40 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.27700.1754672369006270297
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Aug 2025 09:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so11462055ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Aug 2025 09:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754672368; x=1755277168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opK21niSPgFB2oPDIJYPRBr1YL3YS5c6PCfVwpwBf1A=;
        b=iD0WRhR3aDeRYRLiUBvvByh6mY85KPJ23MgULBNAZLYcdrcgJnpQVPX1bMgjM/AlJk
         HRoKMhj8JLret3VhXY9ofFA/kDFPxStxqJBS/7YU1k92m1QX7LeOyGzx6pr0pOGOioC0
         gzsUiAk70OrNIiiTDSjftUA+FFseFAXMJr0IlGNSVHZfHWoM3kgpdZ8NNtqb5bRFfyvn
         ihygVnZgMmMjhWyPby6GINqnVLPJilrzSGEwl9dN2AtY5mvuJHyJezzSbxzg9edj4z9K
         itd3/0ZAlm/I3XdgZyoCLk1JqZxQQr2XLAnk7BgQLD1EbKUys+hwt+dMBauuKKpO0WnJ
         KVMg==
X-Gm-Message-State: AOJu0YwZYwQwSmxSlL+wR8m5NAywXvDz+aiZP20xYuX14bDWdnlKmJSb
	kEJaC9rYMZK/lx91VFoBjQIxQu02sLM6ZKD8NSSnNKCeVlhPgs+1zqU24wS+pQ==
X-Gm-Gg: ASbGncukdyMQ2trl0Kwu7ZUZFKGL5+YFtOLi/V63uCWW7YLy8JUCZJOwoeJi8AMnPY1
	vC48r6yumvGSAFd/R96WitjejGGBDguvbN7cKoGy3Hk3GPaHQ/VgvWMfMnGBuYrJLWdKDwlSScX
	Yu6NwBacFuwg7+qFZK2RmDKX2NOMqL1R+FNRVv9PX7vlcDsU95qSavEdCd5R/LsJHdzL73XMD5r
	yhZ/4Q1hT6HqYYJGaoKfoIumnApeRp3/c0tyzTVZnkGk59ZiIjyTh1qS1kWU5Y+zBbSP8673SSk
	pJSdOLTNKVT7ouchXCkl3sZd9N+Epws96gAO7WIcLnjisRwmOrk/5jfd24yt/l+njlkgkIiv4jz
	ZjA+HF0Q+FSdgA/SA5KvLtIUCnGOAaqdrN4cHnGNvxixXXd/M
X-Google-Smtp-Source: AGHT+IGI68/3vT46Z80agdYnnhr264gO0Egn02k4vnEeP5BX7VAnb5IWTGBb8lSPTwqJ5ew4G6zoxg==
X-Received: by 2002:a05:6e02:164e:b0:3e2:c5de:5ff with SMTP id e9e14a558f8ab-3e5330891afmr70219505ab.3.1754672367863;
        Fri, 08 Aug 2025 09:59:27 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfef6sm575996173.58.2025.08.08.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 09:59:27 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] systemd-repart: Fix build after S moved into UNPACKDIR
Date: Fri,  8 Aug 2025 10:59:14 -0600
Message-ID: <20250808165914.3435546-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Aug 2025 16:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118905

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
index 15b60af02ed..0ac695769c9 100644
--- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
@@ -16,8 +16,6 @@ SRCREV = "00a12c234e2506f5cab683460199575f13c454db"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
-S = "${WORKDIR}/git"
-
 DEPENDS = " \
     cryptsetup-native \
     gperf-native \

