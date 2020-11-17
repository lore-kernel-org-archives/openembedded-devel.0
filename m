Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web08.14803.1605648121908578129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 13:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=rBCTwwxJ;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3-d60xwmkaes9nxt11tyr.p1z@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id a126so26716522ybb.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 13:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=WkAQIdw0l6ECQg4Jmq3iAkH025h4e3hFJDBEdnfWPCc=;
        b=rBCTwwxJDl88JvIk++xiH6i+W9kdeUHppgL0EzqaDEwkGAg38hT3JNFGBMqkACbjCK
         rNGDmVTN40IuPB2temhCF4VQL4wEXzvdGBAzD1k4msqz7r2IWoMkp2EimO8QGCqbQQO6
         XtzTlqaGYWAQ0ZAvu+dM4voro38M5MD8E0FYByo2+bS1zyYYYgIlyn6FhahdQIo1aAEe
         Y+MfSNmPjoWIvz7/50NtYpFN/EwMFPTQiIOXj75qDrDeX5aoUDqUE7gSM/tNwQG0Wyv7
         v6RJE+zQ8GLBPgT4mepnf2CkhvE2MTvjgPnXbKb8BON4Q4YNpHpARCF2jyd3PChcKXD9
         xrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=WkAQIdw0l6ECQg4Jmq3iAkH025h4e3hFJDBEdnfWPCc=;
        b=qP7c2vLqyNH7uYywzmjTECKmcsTrgSX7tLvlSAZhWk7c/B9VsHjOXozHhSmBNPMgX1
         zTAAY1UC7I24MVwEgbCVJlHEJuHugqTuKgfEhXnFUMsJ+UV091AOv8KGDMDIV+CcnhzZ
         73CfVHB/Ddxr2Ohv7jUVMpOF1dmhPRGZJZpb35cpFFAp+DVh3ki6LcQn9TIQV+dlSvFN
         t0/Fc9KH1E6WdUNryUOLbbfuFnj+tDQ0UFLc7DxbKh8o8aZnRPwulihEb7WkH6a35McM
         fDqK3ehg9EqiPuPwXUWbOruOjWHXkUnJebcavOhJU/WgXlJwoISzGJ4KJcgy8GFCIM+i
         8GOg==
X-Gm-Message-State: AOAM5304gBmOQcatrgY2qw4mDUoKhvP+Y8hCUPuLVkET2cME7TREZclH
	d0gcTwk+ZjCuwbfPxCbwTkwsDcOUFQLmoryJuunZnFqxpNaMzgkveteBF+bFaNuRF7Psf1NfJ5+
	DdINEgJavy4CiY7D0MaJ1x777WewrDgooyg6FTlQhbnkdnv5UynlWG5IDFeM5I0B1UcLlVzmGP8
	+q+go=
X-Google-Smtp-Source: ABdhPJyLS8AUcK665yvznNVWR1Hk0vS4V2Lj6UASai4RIKClbPe5QJWqx8ekBuzrROsTHdrbNOwroB8=
Sender: "wak via sendgmr" <wak@wak-linux.svl.corp.google.com>
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2c5:3:7220:84ff:fe09:3509])
 (user=wak job=sendgmr) by 2002:a25:cad7:: with SMTP id a206mr1738656ybg.418.1605648120904;
 Tue, 17 Nov 2020 13:22:00 -0800 (PST)
Date: Tue, 17 Nov 2020 13:21:54 -0800
Message-Id: <20201117212154.1523037-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [meta-oe][PATCH] span-lite: Bump e03d116..0.8.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../span-lite/{span-lite_git.bb => span-lite_0.8.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_git.bb => span-lite_0.8.1.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_git.bb b/meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_git.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb
index 96ec829b7..6956f5fe6 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_git.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "e03d1166ccc8481d993dc02aae703966301a5e6e"
+SRCREV = "937262f25fb702592cbc5c772111a73a5e3c1e07"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2.299.gdc1121823c-goog

