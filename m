Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B83E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:20:10 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.19504.1736518807157903624
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJeq1fiu;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e46ac799015so2800439276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 06:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518806; x=1737123606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWThxt+GguTE24BuZNKGbBtyXmmQUQjxDBVHJlg6mC4=;
        b=KJeq1fiu6gzdX0NO82Hi1lWIyPyjnY93nAmLztZszoGTo5lDvazhR9os8Yp/Tad4BC
         21ENeNnOXYnTMpsqdZFnU8Xxp7950Q0ZePS1XsFjA/4JtrUN6I+5spK83+P+OyRHm8c3
         uw6sWpwlELlNZjFcg3srE7npgFMmUBV70nktihmg0jlBBhPxcbkSlB9Sdc7PIWrLaaHX
         n/i+FXIoEAuc1aECxcmC2PELam3+NtBRlzDogfL2H1h1Ad6Dz5ktKSw6RiPhhfYtWL0g
         vha151htmwOqn0Hu8pNU1xEf+zWip3DjJijJFkDnX7vx7GIrZknZMU2OFK9cF42XxkYx
         x5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518806; x=1737123606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWThxt+GguTE24BuZNKGbBtyXmmQUQjxDBVHJlg6mC4=;
        b=vUvlsqmhKwemrsxLinY7GlG0zgRnRyMAk5Yn/nYscnMjoczu3P2mt2StL9upyAef08
         Xm7yiCqGjWHY4UvyMiv4yp/Hd0HbQiBE2LPBoULl5Ny1bzDHID6e3ZuK2wknHOSdaOP+
         yja8xWz+8B5mFDz4hrhP8C0Ok6wZCcqC4BFnOPwZmGvOh2eY7peM4A0ZyCb5DAFoGP1c
         ACoZaSkNaTQxegu7fYClNtc9Bty7o+99wi/98HDdIot0HrjFAISwKRYhRCNc/O2OJnLi
         5XP8jgWyKvPHL8sFT6jHkYJyST4VNPPOCsBLrz1uU5dqOduslhhlcBZNJ7tjtwyUS2Oe
         yYhA==
X-Gm-Message-State: AOJu0YyosgaUM6+CebVsLVU3Kn/kz/fpVqXqo9/YeeUtTLIlGwN9XERe
	lNbojlH2cStuQPb7EMjtDU+SBYKdI6zJK1v7KW/oNJOJ82KqL+wqtUa9WX2O
X-Gm-Gg: ASbGncvrT/ljIqYKUywErpnSWsXAYokCSxa3MgturhUHJdlOUXhuHLSIStTBnW9E0gZ
	VMGz2we7Dy8HyOf7w+8j/Ip4QiEbeiwXreRwE5T3dFvsDyPdBv9h9M+5B86Pu//dO+lze5AsPBw
	Gfrp+vrt7PZ3eExYBdu1k6S4nrzE/fivCeWdXwLUkMXyyK4klkjV68+kplvRXzcxlh/3Dsr9G+T
	JyfIeDAHwYupfMSBky2jJeR41GcbjlGeEEQeLM8gFT0GgoDXe5EdkGMzF3pE3qG5/EuTr8=
X-Google-Smtp-Source: AGHT+IHc5FrtTRrczBJWW4qw0eeN13QocAYAZY0nSGubLZTdhp/V8tDF6faQ6eCz/PvEgEHMAE7LsQ==
X-Received: by 2002:a05:690c:6912:b0:6ef:aae1:ac5d with SMTP id 00721157ae682-6f5312ae9b9mr82349777b3.27.1736518806204;
        Fri, 10 Jan 2025 06:20:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:152e:c23f:add0:82a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c47200sm6373247b3.53.2025.01.10.06.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:20:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 5/5] libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Fri, 10 Jan 2025 09:20:02 -0500
Message-ID: <20250110142002.370956-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110142002.370956-1-akuster808@gmail.com>
References: <20250110142002.370956-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114781

From: "J. S." <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f471132db6df673bbc2c9d7e03f3a049401cfa8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index f070196606..7bdebcd37c 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -25,6 +25,13 @@ export PERL_USE_UNSAFE_INC = "1"
 DEPENDS += "libmodule-build-perl-native \
 "
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/share/doc/perl/html/site/lib/HTML/ -type f` \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
 RPROVIDES:${PN} = " libhtml-element-perl \
     libhtml-tree-assubs-perl \
     libhtml-tree-perl \
-- 
2.43.0


