Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77D4C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:54 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.44487.1746426105661457299
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtuZsDM/;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3515057b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426105; x=1747030905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tL5aT6wTUs2DTfh4rbuiFxocQBZ+lHFfYfPgBo0I3tE=;
        b=ZtuZsDM/BV/eakF2r2IzDYcBjy+LPi+n3iHymC5kaiyuDhhUDV7jvtYlj+G7s1R4Tm
         Zd90qjA6NspKw5GyAIbPZ2sBUvrINmwSTuQUp8qdNvLosPxftIdyxLhI4lkFJPiklwDq
         JmSb3z/qKQHFJzASfR9MQpxIGCIJw5kz6Grrg1DRvo6CyctD2oiCYDYiS908cGnKEk0M
         ipoNorwx0WJWwRN56hzJnXX74yJmfVlOF7LAOTATiuHQkEGL55yHSK7hVqlwtT/OQ6kw
         9h0cvp4kqPjmd6vIAPxF7j2rmfuXokBLI6u5KKTdq+PqDC2gDmmBOL1tgUxiV3GFd/j1
         Z4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426105; x=1747030905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tL5aT6wTUs2DTfh4rbuiFxocQBZ+lHFfYfPgBo0I3tE=;
        b=le53zptCkjvxVTRSTV5C5RrPh+/6gA70C+lFEQdgguK4YoCK7UBiAhApO+hIwJZU0v
         0AdJ+nU/D4F7+XpQe3fUFb//615gB9Q2424fjEaLMT5z+r+RcROV77zjIA1RsPqs8/hT
         XgJeDGwnIuchLWdVe5tou+6MSI7EXWp3pdJXCXqB0uTCp/fOJnPACpfPKxguWOfeKAPm
         hujbsootz5HNSdua+rUi8yTxOJ1vLVVQ51attfpv4PnIIcl/lXwG98Ca/V6nApgrRU6W
         LFdJYTPbfipLlaAAfFHcrAfmVshJOHn4Lb/4ntnagiYGgR4/ekFd2x2kqgOq+jZcb4CG
         Yw2w==
X-Gm-Message-State: AOJu0YxrSLVsOz8nkQ7vJL/vSybrIdExyD/HL8huVDOnCWjROwTK2Hm/
	BE9WEhff8tJOaC+TYvt4U0qirEW1YFaD8y6lq6S2Fe3VqP24DTvsormJIC50
X-Gm-Gg: ASbGncuIwaQVbBsSl4mDZmzLsuM49ZT8uNgRHpNW243h8kfWj6JadC+kleqprAS7LYq
	bI2T8beukLh9qnKWByZkzT49jv27CI3GjZmQNljzEUsPP4E1ddgSmUragJcwZ7no7lnZOWAH1i8
	hhSoAUZVnqTg7QZ1e8flEPCS2YaTluvb7itJ1XqaCiif+yG2pejQhzpsKBjIfd//cmzLY6M8YbA
	UC2pxn5ReVd0I6s7N396nYTfTynum6kZ3EZxzcVsYUVzvC+C5br6T3vPvbBmueu7QpAsFnqC17L
	jdIOKbDl11ezmj6z9sN0xFxhMw2/+EAU
X-Google-Smtp-Source: AGHT+IEW7oSe/1lAcP7F/MpYBCoTRgv87e4RQYzD966AD/zq+ChTxFGvA9j4V/nAce0OqO9H5pDERg==
X-Received: by 2002:a05:6a00:410d:b0:740:854:160 with SMTP id d2e1a72fcca58-7406729ec90mr11231385b3a.4.1746426104644;
        Sun, 04 May 2025 23:21:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] uim: Stick to C17
Date: Sun,  4 May 2025 23:21:36 -0700
Message-ID: <20250505062142.3478500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117290

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/uim/uim_1.9.0.bb b/meta-oe/recipes-support/uim/uim_1.9.0.bb
index 4c16ab327a..a7857b2487 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.0.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.0.bb
@@ -31,6 +31,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OECONF += "--disable-emacs \
     --with-libedit=${STAGING_EXECPREFIXDIR} \
     --without-scim \

