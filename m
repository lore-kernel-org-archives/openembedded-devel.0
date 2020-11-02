Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.69.1604348953081167478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 12:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fovbr8t4;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w4so1541834pgg.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 12:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQLucs9L5mebMsx20vHcxqKmsQ1qkGztaWSd8G59wiY=;
        b=Fovbr8t4toEshi4XeMH2DII/OhouTEbVlBOB/FwPG0YqyJDVmC2lMw11RacwSf7ygp
         Ktp30KNjsYerNtfFYfPdRTPv60poppbEcnvd8o1d8cOBeYXaCcSiB31XI/ASrajBzp5S
         qi3LXcP3CiI1UFOOIp9Sgb5y4vxxrTxD4WnVmYU7aGLlALt37uyqNuucalZZ2TDOdnyu
         pbLa91u/Yob04cCtLVVd0tJiD8neoVHPQOspm/d4ll0F0cUJbE84bRn5GtvGj1h6jfQp
         GjNItWRmSpDK1vqmHF/PJAWt9jRobHnKmXuoRcsywUsjSrNdMTzuqfCD5ZbwtMUgImu2
         QOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQLucs9L5mebMsx20vHcxqKmsQ1qkGztaWSd8G59wiY=;
        b=oopV9TIWk+3MnnnVLUkb8vd7UwT7zZSzs5GzWGecQmzzcSqwyHgG6QaRJoPkukSVKP
         cawZqTcqXJz1GhokqvhheCJ5qxqSUCpZLp1ZlyQTLxU+2pX10ZANNjAi+V0Ec75N4JE1
         fuqclIDoj0HTEQ/X9nzLzwU4CMoItPm3LHqXfFo2HPmh4q95MeAYe3Jiis2iF8WdlwFv
         1NBoDVWIB3jtByRcS9ZGmSVy5GVPFo9LtQxg6rt8pH5U/XQ2qGvcLhKO6BnD/W0VClxd
         mV0bTrZriDYmWZR1U9deM/w6z+vBm0csBRd4FtJB8nofYa4C7kWtGvYY7n2ub07PdveE
         jqmQ==
X-Gm-Message-State: AOAM532pfaQe+1c2RMFeZqSDnyN7uohuLKQg5SJ8qLGNaY5fZp87Bsmt
	Y8VonMRKIWfDRBAqA7eOuoOMzaHDRvl+uA==
X-Google-Smtp-Source: ABdhPJw/iZ9Hu0f4+e+cwXPwEK2v49l4PJjUXNGaCkzXyGGJtFh5PQ+0tcYq+TRejZFrCG9f5HjM9A==
X-Received: by 2002:a17:90a:6309:: with SMTP id e9mr18360534pjj.115.1604348952297;
        Mon, 02 Nov 2020 12:29:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id 126sm3102268pfw.10.2020.11.02.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:29:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] musl-nscd: Update to latest
Date: Mon,  2 Nov 2020 12:29:08 -0800
Message-Id: <20201102202908.2318984-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get fix
https://github.com/pikhq/musl-nscd/commit/ce81a80e30c2041d8260115fac86831ff64c354a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/musl/musl-nscd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index 374f944096..b03cc868fd 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -11,7 +11,7 @@ PV = "1.0.2"
 
 CFLAGS += "-fcommon"
 
-SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
+SRCREV = "af581482a3e1059458f3c8b20a56f82807ca3bd4"
 SRC_URI = "git://github.com/pikhq/musl-nscd"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.29.2

