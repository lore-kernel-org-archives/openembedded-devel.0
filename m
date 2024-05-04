Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB46CC25B4F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 14:02:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13840.1714831331881605870
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 May 2024 07:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRGgwKri;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41b21ed19f5so4221555e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 May 2024 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714831330; x=1715436130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UDWvh7hgI7Y721XiWh5nniT1K+kJI/gHSr5lRiQtcA=;
        b=cRGgwKriG15SIoJyzcnL175+muA9Bc0Ega9HrJ6OT+wteSQ8b1s7iRvS9oF6AXDvNR
         XLbO74F31Q0hza7t4m0kyjm6/313LOhDYwZIOfNJkHQyDWu/RBjJMRB4SaR2mto3aK+e
         zxyL5GBF9E9WwaADE+aCGgEUkLfeo3bIfKhH8jbjMC6ApInWyBxe1gjJa577DL9yMXXv
         /XtR+rS5dljNFZbKFdQNvsDWlncvjI0P+H3l5c7K5niALVjDDwojN7LN9Z80PhNVuYwD
         TqY+Sgyi3aowPl+Mk6hs43Iu/aR26+ekA8JVMnftnmPSwKFEZ0oCKdBxNeGq6GhqT1Kk
         VefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714831330; x=1715436130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UDWvh7hgI7Y721XiWh5nniT1K+kJI/gHSr5lRiQtcA=;
        b=lqe6/HBQCYPZI2dXp/BDcpbq2HgMdHLlArjuSllqUbEp42i8/QPJPHMQA5UjLYzgui
         +00SOCCocGv3ZkXYsDNPNI5OKOz0A1qbYcvY86dr6QEWRXpxahJ56D9GugLd+uUtF/px
         taDS9AXwJglW/gZ4pOor8mCxeOYhYVG4Drp9UEV7GoJv3UgeMeapJ81aAt6PE7nKERUw
         OknHlHEbHLokoJhENmSL2mBwxEJtJIjS34HKtKEahEr2yoXxPQrabKJDQwIoi6xW7FkG
         iCEhqR1DOqb1DosqaQnk18aruJwPdQzAj5XzjlZd6hMPGzkCp/Y6WHzaQr8kIa4sN2c+
         u5Tw==
X-Gm-Message-State: AOJu0YxcK52zjZczhgUocOnwi0EhoHk0zeHsjicL4IfF4Wwi7YWRYozs
	pIl8EPtIbaXmoxC5fwkABjtPtJr+9YhloxwdiE/vXYzg1GL1c5m6d9ANoA==
X-Google-Smtp-Source: AGHT+IFAw0eqfgKQSLZuxDn7r09p2istTvuDF8j2S8VRiTlgSZJ2EkHROEnXPHSrAYrfO7+fJMcO1Q==
X-Received: by 2002:adf:fa52:0:b0:343:dd56:b941 with SMTP id y18-20020adffa52000000b00343dd56b941mr3868085wrr.52.1714831330025;
        Sat, 04 May 2024 07:02:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m3-20020adffa03000000b0034db974d7a1sm6281971wrr.81.2024.05.04.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 07:02:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] spdlog=v1.14.1
Date: Sat,  4 May 2024 16:02:00 +0200
Message-ID: <20240504140200.966530-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 May 2024 14:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110252

Fixed compatibility issue between c++17 and c++11 (#3081).
Fixed creating folders under windows when full path with drive letter is given (#3079).
Added mdc sample. Note: mdc is not supported in async loggers.

* v1.14.0 introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=a40b1fa392d20ebb29e38374d0f7ce1494bb797f
  causes:
  undefined reference to `spdlog::get(char const*)'
  in various consumers, more details in:
  https://github.com/gabime/spdlog/issues/3081

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../spdlog/{spdlog_1.14.0.bb => spdlog_1.14.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.14.0.bb => spdlog_1.14.1.bb} (91%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb
similarity index 91%
rename from meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb
index aa55171f31..19bac0be89 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.14.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "238c9ffa5d1a14226eeabe10c9b63ffff3ed8b8e"
+SRCREV = "27cb4c76708608465c413f6d0e6b8d99a4d84302"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
 DEPENDS = "fmt"
-- 
2.45.0


