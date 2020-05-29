Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.27203.1590718694139145493
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 19:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YRsy/xdl;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id z26so430495pfk.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2020 19:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iVGF1EJ12yPgtyPGzD8xiUKWPBRiq0+koKdNiP9x24=;
        b=YRsy/xdl7wteJRfBhb1+DNmQfQQusNc67efMYDdFNEp1NvkBhh0qFI+JtDqkqfrNko
         q5/JFntr0RHoT1IwhkbTLPtJy3x2R5JlJMH7aYvZ1yAqdRcV4HCQcbGz1EJHYiwgHywF
         Pnfzs93EiXpQW/VoE/LGfLBMyvXLG7B5p/Z+uaCwTNxeLkTZvCGZ1tEy2fsHXaILx3uv
         X7Q4szNI6uR/tvVscoU7i31pdgSuugSOOnjttDvghD1wLR89Dz2aGYodtJnI7PCiF5hl
         vsukrLjCmWn+jsOBlko+0qfD19f3V+dNRMfqSEkellBC1OO2S0OzCzGqAkwoFOtGUGqy
         P9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iVGF1EJ12yPgtyPGzD8xiUKWPBRiq0+koKdNiP9x24=;
        b=Qe6OLSCiqGHg2XN3ZvK7LlG1vAkKFuuHHKTWKyrRoEYsaLXvYGZbQRMfKzN76X9fFU
         Oc3wbkC+0w3HzuKW8FHwxXtGR/JM1SgAzGhulDQ2PVEA0Z2b8KRA7idLJjzbHu8hcJ4N
         IT/ZbuN3ZaW57mtS+tk9w+urEX03aEyis39u8kf03cLhJOSk0i1hFOc8ku1mPNCunveu
         9SHZEFclk4YBsxdEOOUG1flFBovkzVsZ+78xoJi55ZFJztqXwzUZ9VrosflunNjsIT2M
         UfWrLUIDcC3BsIVqTwFNaMzeNiDVcgk8/mCAPZ6id+/WLyxXLLbH4QmbHa3Y+4+ANipd
         SQgw==
X-Gm-Message-State: AOAM533KoHXWz14ZLAoEQ9kGamseV7nj5ESquE6hLnr+0hPyxfkuLfQc
	VTttoB0m7qBB5mwBxCj11iYOBobf74U=
X-Google-Smtp-Source: ABdhPJyxcSzmXQHGfvKIgpp/0rRnpExua95o5N06N9TFN6VsiNDh5tsmA6oa/wcbRDbWdP9NlzMi4Q==
X-Received: by 2002:a63:a060:: with SMTP id u32mr6102971pgn.290.1590718693162;
        Thu, 28 May 2020 19:18:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
        by smtp.gmail.com with ESMTPSA id s123sm5951829pfs.170.2020.05.28.19.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:18:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>,
	Jacob Kroon <jacob.kroon@gmail.com>
Subject: [meta-oe][PATCH] dfu-util-native: Switch from DEPLOY_DIR_TOOLS to DEPLOYDIR for sstate-outputdirs
Date: Thu, 28 May 2020 19:18:10 -0700
Message-Id: <20200529021810.3819010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 1ef92d2423d6d6546e4f0585478540212b26f3a0 deploying the native
tool was changed to use DEPLOYDIR, so setting DEPLOY_DIR_TOOLS for sstate-outputdir
dependency should have been changed as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index feb16fa730..2c31fe3ed4 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -16,7 +16,7 @@ do_deploy() {
 
 addtask deploy before do_package after do_install
 
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
+do_deploy[sstate-outputdirs] = "${DEPLOYDIR}"
 # cleandirs should possibly be in deploy.bbclass but we need it
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 # clear stamp-extra-info since MACHINE_ARCH is normally put there by
-- 
2.26.2

