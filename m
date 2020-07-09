Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.4325.1594267661563884467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 21:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=phUG6kZ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w2so379502pgg.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2020 21:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=R1z6A3M9TFr/4eWBjg8CdO8QD4sYf/uXZE4hhHvxGwE=;
        b=phUG6kZ7KAbSeX4SVG/fk4mpfe6Wb6QbtnHHEA4Vync78hKxcIckCRS+Qjt4M7sM23
         or59PPo88rXwnPEk1mbyt1ElPgx70yaRH/rnEMueBGD2qe2YwsqBk2A7yOHDLGCEM8w0
         Yqy0S0XVQqy3+VhlFX/iE87Avg8qJS2GKf9nhwHAteRdNu1mPAc/szHrwmVksEbqOMhw
         UTP8VWMLYUbjlpky+WMW+T8sb2vNaOxWhNsc5mzB4nebiPffwRAAn8iZqynEH3zfdFcH
         4PO9A1tuVZrPyYIekPJk+O2WMSNz03O/6Xaq4qJXuO6Q0L/Iv/jz+ubgMLqszPKHNVUW
         MZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R1z6A3M9TFr/4eWBjg8CdO8QD4sYf/uXZE4hhHvxGwE=;
        b=dRf3qqEmjV7iblPQnWCX5ax2tpaQh+BFrtOXOQQh+BPofnWPxkd0uM9lir3ItjqdoV
         NCMSCzTpkilySAFi9zKFE7YlT2D0LdsfKV6VRp+vZ0PGwXd9QUf1HWbyw2R952wMXvpz
         GRKSB/VbM1x6F/0/Qy+BY66eaTcQNXAmk1+jHvBZ1uSTOZ/8CrmexJWEaBl0xq72r4Eg
         F3ekW+/H5gx5rQBM7SNqZ50fRBNtxfamSzIkh+E5AXETGjG/2txDu+3Ik2bHfRo29BzE
         1I/HYZs3bdnZFftRBENp6IK+LQ1GPEewIMEd6JF+zA3w0EUppL2jhiq/iwTmPxtjoUcl
         0edg==
X-Gm-Message-State: AOAM531MXpHXIP0iCqOC6Ixxmbzimsf0e3gOaQky4J/YIcPIu4PJYxR1
	6xiEePauiN79tZ5GlRJOl7cKcVKNl2w=
X-Google-Smtp-Source: ABdhPJwNHM1lRhmB2klFhcat2qnM0BPVC6AIjYwlWuvfkWA0UcTe89LaHVfZf9+JnmXWwVwACc5M2w==
X-Received: by 2002:a62:dd91:: with SMTP id w139mr34334631pff.40.1594267660793;
        Wed, 08 Jul 2020 21:07:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id c188sm1120924pfc.143.2020.07.08.21.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 21:07:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][PATCH] wireshark: Update to 3.2.5
Date: Wed,  8 Jul 2020 21:07:38 -0700
Message-Id: <20200709040738.9690-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: wireshark.org
MR: 104620
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 64e3701e4d6bd53972c22c49d655556e6f37e461
Description:

Affects: 3.2.0 to 3.2.4

Includes:
CVE-2020-15466

For more info see: https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
index c3caaefde9..a6c09d47ba 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
@@ -12,8 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
-SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
+SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
 
 PE = "1"
 
-- 
2.17.1

