Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.9792.1603276417369363870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 03:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=fm2byrva;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.43, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f43.google.com with SMTP id t25so2405972ejd.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hb41qhrK8jShJv/X0woyuiP8lMtkB64tpML/sLY6dxM=;
        b=fm2byrvaPjO/H7CFMnmLiF01d200PymEJUmKB0+jeDaBnIqdn6Bw56/vf13mQlQzQH
         TZHAfbLVr7Av81PjeZNzty+ohgi3VVw5e1Ao0UJGq7ihVvUb+PUlEDHqgpY5lJViVQwN
         b2SI44jxsLFnObgpUa45rZb/kjc4pwpdc/aO4Xv3LBD5EvmVSHFFJCDi5k3ag9XOyN7X
         r2Fn38ji43cDZUdFK3gk8Bbtal4/olEkllfWI4NtFN/j9WvNtuwjw/gqfYMLGc+I6cwO
         dFj8PIkGz5kziFZ6VHgqrfZXR9p8Mm8zC9VMQMrE9+UIVjx678wdxnSc1M/CFi0Lmm4O
         yNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hb41qhrK8jShJv/X0woyuiP8lMtkB64tpML/sLY6dxM=;
        b=ehSWqfnvJPGAx0sKxjJbO2JxdfOsWQv6H4lr72Flz325TT2+b7FA8gYxBmkAnwnzuw
         FNd7N+Zf1JWC8ME55QZXxOIQTkSqmYhr9huXgbLfYz21n7/1RK7PjLoFvgrzc60fX7xr
         8aHA1hkzxMDCgjInTWZoa6lM0clEq/osLeWB+UAbstb6RLO3cHFxObCeWGdUsRhr0Fsg
         Tl/mGydCDwXLolblWq/JffLRZgEVHggSniq7uYyhHJZZk4Kb7kwFz0DSetYIftnaeDyQ
         CUWJTiU91IKpbxY5xl3JtzEQ+l22HnKTuvIEbuCaNC6qNn2Rk+LGD6I5BYxGI5mSkqJY
         iDlA==
X-Gm-Message-State: AOAM530nTNUH3Zy3kxqd40pVhqPv7gD75mpQgfOrJ39Pnd+pBz1ag/4D
	3roIU62tWv8XhamsQ7xgseQM6HDtXi8siyjF
X-Google-Smtp-Source: ABdhPJyUQWl60cC7O7EgYW7/xEJ/UpvIEsaPS6jnUETUFCTexh4uqov6rHQCJSARp3WONJDRwFv8kA==
X-Received: by 2002:a17:906:c094:: with SMTP id f20mr2881239ejz.550.1603276415646;
        Wed, 21 Oct 2020 03:33:35 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id k10sm2086348ejh.32.2020.10.21.03.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 03:33:35 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] pcsc-tools: add new package
Date: Wed, 21 Oct 2020 12:33:14 +0200
Message-Id: <20201021103315.23613-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 .../pcsc-tools/pcsc-tools_1.5.7.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
new file mode 100644
index 000000000..875c97ef0
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test a PC/SC driver, card or reader or send commands"
+HOMEPAGE = "http://ludovic.rousseau.free.fr/softwares/pcsc-tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https"
+
+SRCREV = "34ac207adbba0d1a951b314c1676610a1d0bba01"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "pcsc-lite"
+
+FILES_${PN} += "/usr/share/pcsc/smartcard_list.txt"
-- 
2.20.1

