Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FB1C7EE23
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 15:00:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.19757.1683730841207317556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 08:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pEO5HaNu;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1aaf706768cso56430345ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683730840; x=1686322840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDeS5fHmHxUZHSyMahTDZ7MUbzM/mcjE6MzNQidptq4=;
        b=pEO5HaNuu9ovLGaMwlkn7Jb3PbnTiP2E7SzschYSr1CGP48ywJAG13RFvdQjBEhK3O
         LeoZKMPIYv210+wMUXpAyUJlbG1K8zdNsU5A8oHzVpalD23yBtpk8F07INEifjBIQuxv
         3QnCvd6k8IOr1DspN3k9BcxvHNngakW1PeMIOrlHMPtNua8FXh4eZ2l4lGbWFZrY9TVz
         xGjbVobo7U2tIVJj2PlbldhoqGDrAQZNPt7co/4XvkEt+QJjuFwvq48NUYt0rSFsCR1P
         rmDDPq5GNbPuykgJNH0kp9v9ualYXbBZXITJlXCMz9/nmjr3VMSYf25MgJldHfYAKUX5
         u6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730840; x=1686322840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDeS5fHmHxUZHSyMahTDZ7MUbzM/mcjE6MzNQidptq4=;
        b=JQK7byy3QueiuwwCGE09qSzt6vUA2dKlykw2fXw5A8tiqBl3cPm0U7vWqoDkqNiVe0
         SGWesc4vV0Nj6fobzmuRFLpFYPvUS10gF8JXY5fnc0WAeoYsiTOpP5UP5uqtCeSupzFz
         8r+w6DybWVwpc1k+lp9DRPJ7iTbIC9Tua9K1pmeLPjnL34dJf7cY2BXNjC9IKDXgujrp
         QgTSQShp8o2SsAFtGqicM+zbWHW43QJ85mog6WtnCoASfKVp0voh2pUZNTNrf7/Nkdi8
         TGDF6Ks10GhAV5xyhEAnhI5Q+w2CVMJyyI76lyelqmz/AQV6C7Jm8vx/4A5YDDVrXaRf
         kTeA==
X-Gm-Message-State: AC+VfDxeqTQfbLbkAWEMep4hUaI4LjM6ium8CnYQiqx1/NJJW5GLiyWu
	kpX/qzOx658LbSJxNezzsmeWRplrcsUFWQ==
X-Google-Smtp-Source: ACHHUZ4nj/ZHDmQBjICofnFw1DGgKGxTf1n9hAg91yXlF5vDZ1LvgND5ZzDePk5a0YpULUmu8yUvkw==
X-Received: by 2002:a17:903:1110:b0:1ab:74c:bdf2 with SMTP id n16-20020a170903111000b001ab074cbdf2mr24852867plh.28.1683730840323;
        Wed, 10 May 2023 08:00:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090322d200b001a1a82fc6d3sm3860238plg.268.2023.05.10.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:00:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] psutils: Add recipe
Date: Wed, 10 May 2023 08:00:37 -0700
Message-Id: <20230510150037.3036472-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510150037.3036472-1-raj.khem@gmail.com>
References: <20230510150037.3036472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 15:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102535

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/psutils/psutils_2.10.bb   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/psutils/psutils_2.10.bb

diff --git a/meta-oe/recipes-support/psutils/psutils_2.10.bb b/meta-oe/recipes-support/psutils/psutils_2.10.bb
new file mode 100644
index 0000000000..1f1894a5f2
--- /dev/null
+++ b/meta-oe/recipes-support/psutils/psutils_2.10.bb
@@ -0,0 +1,24 @@
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=87212b5f1ae096371049a12f80034f32"
+
+SRC_URI = "https://github.com/rrthomas/psutils/releases/download/v${PV}/psutils-${PV}.tar.gz"
+SRC_URI[sha256sum] = "6f8339fd5322df5c782bfb355d9f89e513353220fca0700a5a28775404d7e98b"
+
+inherit perlnative autotools
+
+export PERL="/usr/bin/env perl"
+
+DEPENDS += "libpaper-native"
+
+do_install:append() {
+    sed -i -e 's|${STAGING_BINDIR_NATIVE}/perl-native/|/usr/bin/env |g' ${D}${bindir}/pstops
+    for f in psbook psresize psnup psselect; do
+        grep -v '${B}' ${D}${bindir}/$f > ${D}${bindir}/$f.temp
+        install -m 0755 ${D}${bindir}/$f.temp ${D}${bindir}/$f
+        rm -f ${D}${bindir}/$f.temp
+    done
+}
+
+BBCLASSEXTEND += "native"
+# /usr/bin/pstops contained in package psutils requires perl
+RDEPENDS:${PN} += "perl"
-- 
2.40.1


