Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.1607.1628011258110313803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 10:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kWZjjI2Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d17so2576703plr.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4IKQRAp2SPuyQr+QvCZsNHvVvvqcDQusDES3mBFIjQ=;
        b=kWZjjI2QDDULQkkcwzv7pxhAKzChhxO0M8V3RVkdeES/eAQWlm+6BZPD0lp7KFGI82
         Zdn5LiddJC6WSyQL2ufefkdjP3otx5AmaQc3GZB1/zQmxWTQYTZxYtnWRFos5udn9m0P
         5iUPVZ7hWkWAfAKG3etFZc8ukC5hWN2OIKzdvZULCM+y2HmeRyTIcMNBS1Kaw06MFbcU
         bFDJwaD+L9ID3MM80zUjQrmZHfCrL8ZKxrqK6UtfqLDG5DPOoWn6/le11DCZjBvNNRRJ
         uNiH+naHbhVlu4HV5NAbOPvE7eL/tfvY8Dwng9pGeG95bq/DixpwxQcImBB9LtT6aY1S
         sJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4IKQRAp2SPuyQr+QvCZsNHvVvvqcDQusDES3mBFIjQ=;
        b=A4Wvns4pmkqs0sLxNeGEd8HMCA7hxzGXOgQnfMxbl+qnSBFpKqI0SQtkqyyWgN9CXy
         4NbBhKfJrdTgZNgDG46yYcHK+lLNTwp/kJ4arnzF0ApD637UMcTG1eQnGiUNWrJIGm5p
         IJ8bipThHtCUn5na0CC3zeALLHguQaEyhaFDUHgZ56A/D0msMPCm/LfI2c/q99Bd6kzf
         XfRBErTpOXlXlBK/cz5ZjHlvFm9vAkJIt/8PiXA8iPtZ+ca1o2dLMis2ojso12S2C992
         I8MGqgD4gk+Q+fLqAffhbyg0CP1UQffTKZdk8HmpoIbndaEs6pK6iCKNpjSEhjRHliJI
         aYTQ==
X-Gm-Message-State: AOAM530CfhSzqbaYlaLRtfzBBAuyXB5ekkbSL8Mo74TLVu4kYeOHfU4z
	FO4eyRHDXcXqQbiroGjlZIlRjpdiTP2ghQ==
X-Google-Smtp-Source: ABdhPJwWGBWyOnVJVIssSL/qxk/sVAhTDsPlq7+yEGuUhRpiusVQVGJj61UWVbZ0vuTgMoXCxrW24A==
X-Received: by 2002:a17:90b:2286:: with SMTP id kx6mr5554542pjb.11.1628011257161;
        Tue, 03 Aug 2021 10:20:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id l6sm16187057pff.74.2021.08.03.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 10:20:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fvwm: Package extra files and man pages
Date: Tue,  3 Aug 2021 10:20:54 -0700
Message-Id: <20210803172054.2666636-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoids using installed-vs-shipped

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index 96877577e7..54e0a0ef4d 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -88,6 +88,8 @@ do_install:append() {
 # as well)
 PACKAGES = " \
     ${PN} \
+    ${PN}-extra \
+    ${PN}-doc \
     ${PN}-dbg \
 "

@@ -98,12 +100,15 @@ FILES:${PN} = " \
     ${datadir}/fvwm/ConfigFvwmDefaults \
 "

+FILES:${PN}-extra = " \
+    ${bindir} \
+    ${libexecdir} \
+    ${sysconfdir}/xdg/fvwm \
+"
+FILES:${PN}-doc = " \
+    ${mandir} \
+    ${datadir}/fvwm \
+"
 RDEPENDS:${PN} = " \
     xuser-account \
 "
-
-# by default a lot of stuff is installed and it's not easy to control what to
-# install, so install everything, but skip the check
-INSANE_SKIP:${PN} = " \
-    installed-vs-shipped \
-"
--
2.32.0
