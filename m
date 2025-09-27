Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EED1CAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:06 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.6904.1758954776432167282
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pesdgj48;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-424d3c1256fso18349405ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954775; x=1759559575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0epjuqpmC3AfjkMD4RHPalMBSQwepqUUUAoucEsuoR0=;
        b=Pesdgj48wlfIevp4zLZ0Nql4KOz2xSdHhQNUEC5kDCH4eMupW9+2S7WuZjUqEqe9SE
         6oVO5V73EHraioplWXf407y+b/t3UoGDDB6Ap/jb7DBvPqdEd+PjPtjQoC5Ylyzlhk0T
         lIfly5AgpXpaLabmb5AzLrcWkmfscmh5v82IOIM+lXCc81k9ZPSecm2jcqfWsTSO3lyJ
         jtml2oU4Xm1vW6WQkaZKVy4UYEfMQPYzS8h9E9aA/d+6uPUflnLLHk8RkxxzhL4jvOeh
         kRr/QoNxSLvJST+JZ3sIQTRBvh1D1/wKOcynXVxe+zmGtI9bXVSIvE2r2X/pSuXwrr6q
         qeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954775; x=1759559575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0epjuqpmC3AfjkMD4RHPalMBSQwepqUUUAoucEsuoR0=;
        b=hT4Kd393XSarFFtU/VJnq3nILudIyPWU5tNphMLCBGyOxzIPODADgz85J+ss17+KXy
         HoTzyMbM1Ft9UNpt7RnEOJzhPT6bNTNClQgrFDG9EBYsVZaxbQil3IlGb9O5CWeu9Skk
         PkFtZ7ZmEW3kVHIyXlu39OP/GKl1v0dufI8/eCpiqwAhF3/Q/KeX0wml7449+TFwkzAq
         GkglnEYGkmQrep0LMZL41Se0Un1ZUt8CS9Wd1f1wfUaC0JRzBW4CkqjuTh0Xii62XWrL
         J9TTenlcW3/5D1Q6IrEuD4PdUu4td/l1wNKN4e8zjq0pDJa6/1RzkaPT+B/a0OgX5mZ9
         uvJQ==
X-Gm-Message-State: AOJu0YyBf4V2w6v1K8Ytmu8sk5j90XtY9CbxLC3YyjMC6PJepuefOA3Q
	Ecm8o+E4bl9H9xa7YMrjGoBnSDeOIQf79cSFMm7pgY8fgCsGaYHCJP07djJo4g==
X-Gm-Gg: ASbGnctdIsxiX9CsjRSDeORVw1EfmCmRM41APd2l8mVirVj1PydoUoJpjFajlOe6vgX
	5SHchyLXM2hvman+c7IzMVbZg5f7b0tSyZak9B9oqyvqg13xzMiMLtuT/la7Rjv/HHZSieJKnvW
	tdiqle4UV9h8H5MeFkuyQefoV5H6/L0x7So6VSR8wq0JCvGHJ0n/ahNb7DFDTChA/0pZmavN0WU
	x6iyBRYQtr2uhs/QKtYqjdMU+Rl8OQBZ9+9umXKKGlPkW+8weY0HryDzc1/N1YPPiSXj6kZuIg9
	5Tyry5d+7wUXZ6VLPWCILJRtUNk+S5Kg548thRsN9BztsmE6hgy5E6s7Wo7U8KIAylNwLb1kXhN
	+cI/d94cQIEC4qBD2PHfJl7sL0B3gCnZNZeu0VdeC7wkRdaADATdt0Od2Y/4UAw==
X-Google-Smtp-Source: AGHT+IE2Yf/50ULcoXN3FltZoAr8+NXJBbHm9uyCvK1FkNZOqv8kT+Qeizk0GiBHJlOJeIsJAj2YaQ==
X-Received: by 2002:a05:6e02:214c:b0:427:5ee7:2efb with SMTP id e9e14a558f8ab-4275ee73001mr66304695ab.8.1758954775459;
        Fri, 26 Sep 2025 23:32:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:55 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 12/21] ssd1306: Update to newer version
Date: Sat, 27 Sep 2025 18:32:07 +1200
Message-ID: <20250927063216.1865627-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119966

From: Leon Anavi <leon.anavi@konsulko.com>

Update to the latest version of the source code in GitHub:

- Use snprintf to replace strncpy without null string at last

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8ef8ccd8d8ea061cf95c56e441bd696750b3598)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index 2c01e126ff..0d99d2f35c 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b694e603a996c3bfdc6093ed1f70c8f"
 SRC_URI = " \
     git://github.com/armlabs/ssd1306_linux.git;protocol=https;branch=master \
 "
-SRCREV = "34b42992a43fda69c6ba2557b718601cafe16251"
+SRCREV = "19128ed4b6108408fea05b9d0551236b6d638dbc"
 
 S = "${WORKDIR}/git"
 

