Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E86FC87FC8
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.32330.1753070435925105386
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zm6It4Hz;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso4010179a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070435; x=1753675235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYKKdAgUIP5A3YuNpBlQYPBclxcmBdnnCqz6rstrfD0=;
        b=Zm6It4HzMbQJ78NBZFXg2IaMQ3TYm0mXWwmUKcz8VXTtkcQI/5mVNXQVQpYWWzO6Q8
         iC9K2TH/QYMLl8D+7h6mPaLDLO/3LsyD2UGXsFN7XrWC7fNT5T8qwq/De4NjQXcEv8XZ
         /71BBDAPPZxrgdccQ4TR5X9knkGUiUFr6HQgXrBrPz3/f4TcAhyAgvBd3Cc4mc+KF7NN
         eTEtbyf9fHWRcM6UeMcFUJUAVn30ihxouVo2l1L2SlgLLFpxVMuKkuq9sHA3MZrL2BEY
         GYXHUeMnmQ5kBIjf51LbJrHZW5xvp92lhstxjhNVKlfWHrjkShnvvMDuhBhlcl2wVCmO
         Ciew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070435; x=1753675235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYKKdAgUIP5A3YuNpBlQYPBclxcmBdnnCqz6rstrfD0=;
        b=Pvv4CmBXp4JJq6/wwzSn+dHhGc7uS9KoW3uouzHxaXexVkKa3VTbamm+SBhsDGCI8D
         r7KT/18yi2XbgJISuGa/jeat2xYFdXO55alESruHftPwdNAOhb+vBlWODS4C5D/E41Rj
         t/R6kkBIKMHHLtUq85cQ7LwjEVZpn2aTone5GDzx50+TuYh8WM80NBm1FNhDilc+7S33
         zJ5VQ8q7FLOtYoa6Xqg8WFYhDHHSHzLNFXVoggt153GPaZptt08SdDCOW5GWMc6f/LMv
         uXwGie388viHwjdgsCboIf22mfAuMWfEma0dDogPbf8ErPo+YtzVQO5V+FoTLdBJsmcn
         n3Qg==
X-Gm-Message-State: AOJu0YzFG9We660WKfaiP6QJa1a74V+mI9OGMt7LImQmvzgeAM00+aPv
	oVjqwzgUFGHtuZt6V36qDCsgwxYVi/ISLE3DAGbpPe8ZYyzOi869AvBUg4jYVnh8b/s=
X-Gm-Gg: ASbGncu8zjMjXrAu7xTTqbh22ysvhbjX2BJ0S+Dl4caPnerauB4a7gc7oskwW6szLcG
	liMkYlVL8KLhvUIO1QRB+zqEnY5l40+hhUjk5UlOUFb3NovKYFrG/73tXxJg9J4KQsZzAxn8qbt
	7oT/iuuRFe6VblOdF9foHnz0EfbfFrBpi44vktQJNUQNZrjtmOQ+u3tv4k0WjzSTj5So2wYYTwv
	GRkeCPgNahExCoofQYONK+wrlWJhDrJc9bJolBjOTJNxWJN1GhdYPA1XinH+qRf5Pngs2K5wBrC
	L/NdBWdo1YnqWEp0hZVhISouc31S41EcvuiGkU/QtSE9B0bnA6kXG2OnobDhVQ6XGeQhKehjWKk
	Odh7Ubkzs//2p+g==
X-Google-Smtp-Source: AGHT+IFP/My8zr2J/9AsgDu2ZVipH/Js9g0+G0p21m4gXqInbEt/JeQ7O0auw+vXEvgkg+rBFt1v9w==
X-Received: by 2002:a05:6a20:9392:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-23810d55d86mr30949517637.7.1753070434844;
        Sun, 20 Jul 2025 21:00:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] libhugetlbfs: Always use ligcc for compiler runtime with clang on x86
Date: Sun, 20 Jul 2025 21:00:26 -0700
Message-ID: <20250721040030.641212-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118646

glibc objects here expect libgcc to be linked in sadly compiler-rt does
not provide all the needed function implementations e.g. __unordtf2
__letf2, __multf3, __addtf3 needed for 128 bit data types

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index a43ddf0d53..0546d4b0b5 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -44,6 +44,9 @@ CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0
 export HUGETLB_LDSCRIPT_PATH = "${S}/ldscripts"
 
 LDFLAGS += "-B${S}"
+# glibc objects have missing symbols from libgcc that compiler-rt does not provide
+# /usr/src/debug/glibc/2.41+git/stdio-common/../stdio-common/printf_fphex.c:123:(.text+0x77): undefined reference to `__unordtf2'
+LDFLAGS:append:libc-glibc:toolchain-clang:x86 = " --rtlib=libgcc --unwindlib=libgcc"
 
 inherit autotools-brokensep
 

