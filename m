Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.1100.1597442013414696535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2020 14:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id d14so9685276qke.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2020 14:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Zl+Do+EQCBK2qkJRj2eyXPpTJ3XnheAox06xrG1iZRA=;
        b=JY6YJoOA4kxtVLO1JZ5bAVivD9QztEH8NWPww6/B5UpWSIEbVGFdYkBMg60ycrm+/r
         0QrMK98lEZ3z1pOOF1+jzYV2wrANU4R8HzAk8DoGb/o3qStNzaVj474AGOMFCtdTd/i9
         MyBpVQTRG4eM5nkjXnWbaiEa0hQmunYm+p4ivs08RR7mXv4HZg+bBSkJIw8q5j6PE6/a
         VTYtbDEh1GPuIoIAt/A5PMSIAs8Iia5XpE+DH+QqcwqTgUjBOzgK8v5l/sZVbQSwWLUF
         oBlVyAZ0p4ZZKFEt3v7aGSVjyYd4a773tPOPrUbQnXonbaf7pqQf8E0GRJOP5W7ofFqs
         oZCw==
X-Gm-Message-State: AOAM533F00DcKL6koXXzl3Mt9E0GE4+nv30gIe7am9asdfcWBkPpmNdI
	wujBvUXVq1JILgGgOFxvL9Nwm8w49I9/Cg==
X-Google-Smtp-Source: ABdhPJwEpK7xkvu0l9d01A2krByi71YDq4LXFez5I5031p404Yg4oy7slPOqRlPq5GZdBErRqJESkg==
X-Received: by 2002:a37:9f97:: with SMTP id i145mr3657093qke.136.1597442012371;
        Fri, 14 Aug 2020 14:53:32 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id 139sm9863555qkl.13.2020.08.14.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 14:53:31 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell meta-oe PATCH] haveged: upgrade 1.9.9 -> 1.9.13
Date: Fri, 14 Aug 2020 18:53:28 -0300
Message-Id: <20200814215328.200355-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This includes the following changes:

1.9.10:
 - fix ordering cycle with private tmp

1.9.11:
 - Fixed wrong version string in v1.9.10

1.9.12:
 - Fix a memory leak in havege_destroy

1.9.13:
 - Added support for --version
 - Updated systemd SystemCallFilter settings

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e82d252fa558ebb6fe0d07b50a4be6abe40a725)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
similarity index 97%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
index c1839b37a..50326ea2f 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.9.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # v1.9.9
-SRCREV = "6da706c8026b629d9bb7ebebc32239305a03da8e"
+SRCREV = "1283a65c541c4a83e152024a63faf7b267b9b1cd"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.28.0

