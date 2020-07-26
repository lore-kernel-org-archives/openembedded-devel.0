Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.24741.1595746731067857421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 23:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=C5yKwXoK;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3qskdxwmkahakoyuccuzs.qca@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id k127so16413899ybk.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/a2IbJnR7XJ7EyQBVzFASeRtxMDawHUYETdo12n0AKg=;
        b=C5yKwXoKwozszAwDkGb3WalYifq5yCpq0AHC/uLfsfzX3DVs5F5yPsK8WHH14MgBw7
         xwTYpmi0NxlZKTPY4FcmE+prYOBg5LJ8xHcmCuoskX2PnAnvZOfipjjlAMc/VSUgcSl+
         wLvjSmjesxUs/m+8kx/tMpwsrlSwwZ4bA1bw6lMvR6wAZL5k+gKizgr40yfDsgaZovf3
         GXUEPXzHRQfL52d0I0+2T1gC910hk3MMudkwKDCYkAnNWjXht3qm0Jv8sCfScJavUKci
         ES1kE98PAW98yn5r9IN/Sfo4kOwQ6PBpQ6UYpKy8isXkWt/IwHZdaXmBNkf+49qu1K28
         QOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/a2IbJnR7XJ7EyQBVzFASeRtxMDawHUYETdo12n0AKg=;
        b=N32FGGXbXBA8BTTSi4Fzp0d5HiA2LQ4umAZZSO6RinvJKwoVDFObYLsdgw8hPBacHl
         kmYYYi5I+f0K26DrJ484tvjybOV5iZWbrHp4V6OwqL2JeLpgUvfzPzp5LVVDifcaqaev
         OA0oHdvCGy/4OGH+YWMJdxeqRs43Hk1Sl4F53b2VmvN+WM1zGlT277vBVuPrldGcLAnf
         RwyC5Gip0/ZChe0YDTtMXhq8s9i5a+WhTDpEO23HyFaLr8Zz3Jhhu3JfVCBLhUnkVAET
         o6Ho/n2uK5HlL2rUHMtnQgnsssW6ZfjSQ3wsKl1bGLyFLyodAiIJ0JJQlA7zB1VJexwB
         OxPw==
X-Gm-Message-State: AOAM531kvWVexUNNtlszcUCpBXVGwoxqzEcVamOyrPb0VfyNL2VfF9+m
	/HVj+kfLMXOAid93Ipb/WgAoyI95p/IrsQsfJZUoCFMJQQvNBDg70WWCXZoAb7ClxOxCFDRjRs5
	nQjJweydqTsE/pbo8q4LXdZLkXWiOJZSQpKi2FJesqROozUEP4dmC3AZyLkreHXBcVclHnfl828
	opVgw=
X-Google-Smtp-Source: ABdhPJwySvzmsEVN0EhSUgumeWeYwYsBN3qa3112teu4x0ZS9n5VfLOYPgnFWgg6+kYM7wZ4xvqBME4=
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr24369098ybg.488.1595746729953;
 Sat, 25 Jul 2020 23:58:49 -0700 (PDT)
Date: Sat, 25 Jul 2020 23:58:44 -0700
Message-Id: <20200726065844.588792-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [meta-oe][PATCH] fmt: 6.2.0 -> 7.0.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} (89%)

diff --git a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
similarity index 89%
rename from meta-oe/recipes-support/fmt/fmt_6.2.0.bb
rename to meta-oe/recipes-support/fmt/fmt_7.0.1.bb
index 05dc94a99..55db63286 100644
--- a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "9bdd1596cef1b57b9556f8bef32dc4a32322ef3e"
+SRCREV = "f19b1a521ee8b606dedcadfda69fd10ddf882753"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

