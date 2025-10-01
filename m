Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4A7CCD189
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:58 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.18451.1759326768399768848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJGVQ/zj;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6366d48d8ccso2099301a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326767; x=1759931567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKleQCRrbh+dO+KDCOpIDUhK3kREWzlNoh5YQMXj6mc=;
        b=HJGVQ/zj95Y0O2sa4RcRWvj+n4U0q26jC6T5mbRqZVR7LMibq5a/cYyiGLxsz+kzRq
         GxHJxirqh5EVCq5C1xCo6+KFEBusChU5QsQh8U0Mirlrbf+RSMNWxev6z8p7TvDHEZhj
         DIkVnV03OjeDe+Fah6n5BNx3OhNkJbXVqGV5npeV/gZjK9Lv6MGv7yR0ElvVvvJh65SF
         af4KI22b8DUzYVKlDWHlESSaeXeDIIhNciKwGkynt4FQ94FwGzI9bnc3M5S5tDCLMybm
         r7X888KO/u5YVQTCt5TRGtrzCz+RHBOqOwyoD97t2ndUqWcowjrDqnTTRRlFaisqvSRb
         g2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326767; x=1759931567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKleQCRrbh+dO+KDCOpIDUhK3kREWzlNoh5YQMXj6mc=;
        b=Rh2LWE3aD5dMJNXCA+jrAPcr1ag9OdcfRHKqH7U0s6yqAKIvSsEFsUUtq0KG9NPCCE
         C4Rrv67ibHEkrVK01aZ8xfq3JgWBKtDAJtXqSvB2QMVeycmWFdvg+9tFkacSapEmksmt
         yqb5lDA4bYem1FwnqNV5EKNJPZxdekZKkRDiiLDI7H7EfxlsbHyc8ZTPKxbzTjy7O/OH
         XOKAKNSr0JZa7JpkuOmN1c9KCUE7cyJt1bQ6gyyqHcCM9T8D/Selz9ZGYgySS4KHDZQ+
         pmyvh5dKP1Q/ws3ahdyQl2OXCseUdipjj6lnzMcGLTgYL/rm6nJLB5L2rHYdwgHzC1f1
         kXLg==
X-Gm-Message-State: AOJu0Yw0Z9Zv/LnDP9l69M0I/8iD8F5qatlr/qvfFvkUtiJpQNDyemoz
	oEoQQQ8T0O6QPB45+QtpaIDYkERSUBCGfUOKSVy2WkU2dR8JvGBvV5B7fLF4XQ==
X-Gm-Gg: ASbGncvtc5WhKd57dI6G7tBX9q5bGW74/bR/3xuq8qlOM8gMb5Cyt/RLz//B1UeDIr0
	6Xo2oBhIpLMSLRpMaz1k6q4+NR8kWj/ByW6LlXTvlB+RLzqBgdnvzaB/XdoiZ3aLTmuKKYK6VVN
	6Y6MdgzAWWjUuM0FImE4m/7WmzdC/B1caMNKqgOndz5gyJb1knXAgbbuXnq1K9duLBvlbacUiUI
	lSHNxQezH9vhQASRzlkDmQQwjud3eW2i1BOZndCXdyZtJgc4rNvbYkWnt/8MPBgR6ironSeuME/
	wYRRrOoXw6sc8iuTZabLe84T5bu+hlSBmRhkMdS1xzXJyNWpLjL2JNQ8y3ZOVtX15XnuEIVuqX7
	+kgm84bU0ouErZ1e35q/V07jnOP3gpmy/dRClPQnlbrM9
X-Google-Smtp-Source: AGHT+IFMe+qfQJJ4cbNamncGBLRc1/St6RkVtxdum9S2Nrj5uUGVy9IuUcF4tvUxZ4ysbBaxKvr35Q==
X-Received: by 2002:a05:6402:27c7:b0:634:d008:7917 with SMTP id 4fb4d7f45d1cf-63678bb89d8mr4152928a12.9.1759326766684;
        Wed, 01 Oct 2025 06:52:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/25] tk: inherit pkgconfig
Date: Wed,  1 Oct 2025 15:52:21 +0200
Message-ID: <20251001135243.1490753-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120118

From: Justin Bronder <jsbronder@cold-front.org>

I noticed that xft was not getting enabled as expected because the
recipe was using pkg-config from the host.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 95c14a92544e4f0e2dc94ef6a1f26d35beb82d7e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
index efab9618ec..f3cab4e610 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
@@ -34,7 +34,7 @@ PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
-inherit autotools features_check
+inherit autotools features_check pkgconfig
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 

