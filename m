Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.5132.1587597506477995780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 16:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pQS7x2BS;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id q18so1881877pgm.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uvh5wnnqp2rcxWbJfN7HKd+63h+jnWTxAoSYFfZyROQ=;
        b=pQS7x2BScgbKF3ZIrt7WU6v6aMv4R1lfugO+VEG92fd+OZvv/iMTQOXwyI8v9O2sxk
         NN0IjB1Eo7tgJw5bn3yE4qyL8W8pMm3Y+HmjVMSRwju2aesQ4OP76MIuuFj47OqNtJ9r
         97qm0/JdKZTcYmDr+f0Kap1e02JWov0nH/xaO++mFiAcplclNo7/85+4/XjJek4RlLXh
         7t20FbqTqqTO1A6UOxds0XwSoPsKFqV8QCZXSmg6xTQJkd9nAm9qINPq6qQe7Fhk8pBY
         is0FOa7dltdqGp7susS24UYLxTclsQvgEbjmWe6WVvYmSymvVmec1fU9kRv2JrbpoF8r
         Et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uvh5wnnqp2rcxWbJfN7HKd+63h+jnWTxAoSYFfZyROQ=;
        b=udMGXYASHT+vB/JX5yyPGyQg/oiMbWguX+vN5X7vy5zgiWKA+2FSceTk+zzS9i/ENN
         /akkTK0drxOYLi+dKDDp+HjKO6WYUztKpkPtnakUvqgfPaTei6C8RIADO65dksyiw+4V
         nmMl1pn0+97Wi6bHP9zyAHDhVnnXjx2yAetNwC8RLHsnV8CxEHm7hnqRWQ3Z6kR//rrq
         X6r1NBda+GzVDuHlg0cTnT4ZZe/++TzQw3gZBT1sLFLs3U7jrFc0SZwanDs4k9FraUFW
         tXZ3d+J3n1rsb95hIJtTwj0IuItqoX+EMk4v8wBNGbqAF4E9vY5acvYqCDP9sQu39Eq7
         if7A==
X-Gm-Message-State: AGi0PuZPSGUPDMf2m9hR8FF0QogSj0FA5lWTxyfzvKWzO65n1nEJhPPm
	HCbuc/RIlbeJRQGe7ezUsp9Q+ejariE=
X-Google-Smtp-Source: APiQypIpyUB8C8BO4isIOIt20zPr0W8WFuSXPihUl/u3Uj5eybYMxuQNuMUI5fMRgFfSHxx1KLirng==
X-Received: by 2002:a65:6887:: with SMTP id e7mr1340379pgt.318.1587597505660;
        Wed, 22 Apr 2020 16:18:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g1sm311213pjt.25.2020.04.22.16.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:18:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] oprofile: Disable build on riscv
Date: Wed, 22 Apr 2020 16:18:19 -0700
Message-Id: <20200422231819.1029522-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422231819.1029522-1-raj.khem@gmail.com>
References: <20200422231819.1029522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not supported arch yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index bab38e2509..8242a835f4 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -1,5 +1,8 @@
 require oprofile.inc
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 DEPENDS_append_powerpc64 = " libpfm4"
 DEPENDS_append_powerpc64le = " libpfm4"
 
-- 
2.26.2

