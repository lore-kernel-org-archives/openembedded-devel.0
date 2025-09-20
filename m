Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F28CAC5A5
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 20:04:45 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.16667.1758398683894643285
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 13:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDpqIxfa;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ea5c1e394a8so2270324276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758398683; x=1759003483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8CwIG2I6Y+R1AZx6VVgNx8non0dAl3IDvvgywGA3iE=;
        b=kDpqIxfaE1RhgJrFER9gImFcO/VkbfW+B4Li2P2Yk10O5Z1Mue2OVlkG4sCzYJvWNS
         Ruub17WV5enUvAlagNZ7U8HoukA0E8YnMDzRb9HMq2keqTZbB47K6xoSIzYUYrBSVcVS
         qc3MJbsHo5U/rtIKoLm/BXsZybr0RynJ2jIbgPvIRe6DJuJaYSDKM8YA+Yz5OJxEQ7xo
         ajb/XTYgQKF3k1aB9ihPYgQo2qVebTgK7q4z4TZTcLPQd2e1jl8Qgcm9DxzJpE4HoRPB
         wogu2/lsR2biC2+Y6LqLXra3/Ls2PJP1kftRtm9k8Zi2ooBpgAL/TSetKxQpZNExakbr
         hdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758398683; x=1759003483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8CwIG2I6Y+R1AZx6VVgNx8non0dAl3IDvvgywGA3iE=;
        b=HJVFVfEISR1D9u0HRJ5eFX5ZuQNj89U3MIhHH/Z+4+3MKfMhn6wn8PYvovrAA3MzZK
         6jmUx7cEUbXOCyyYkriwAbBDCzXEbHRFYf+aXYiEcJuTLPdrccpnVL48Ere8YzsHjdZ9
         496sMxBUepbeKG1EbWULPkjqli7pB91TgTeB/3RQIYCzhfKv6k7S8rO9SPcJSFawaN4V
         ISFIMxTjHt5cEMooLOXntcGkdy+tUDs5/gIswasKump7HFLOEqAR17l0efMmePW9JU66
         6tei/+tPUxmAlYnO++fSJouPj0rUab4QjbLtXQObrqm6ox4VQ5CAtHb/gyxeydZ95DTV
         gVxA==
X-Gm-Message-State: AOJu0YwiMfSgvgTAmOY/2RYn3hgdoq0pH7ll9XmzrUA/0XgQCQqZpSqM
	tjB8bEMq2dOKPxCDWOjgzKDiGvCR1seJZX1JYGWJR67I122auIzg79pfuorD78qI
X-Gm-Gg: ASbGncv9bqzF8QpbCvEK9Jl53t0WSWn7LmqJgBqmUuaOS2MGZ8viIGTndx0fag1dQXA
	OkeehkIkjL/k1tn3AQ2aewRoDeIeoaR7/3A1O6hD/Jg9srWxYbXvNYZ9fGB3fWprSq3lCqSNvon
	6RTPPH6evUMtC2WorRO99DGPNMc3VGQJlMz78NJvgGcBckTp22FCNd97RffkoJPTirS+J+rT+H6
	j5mqziVDAvDxchX5ed0xe//SpFt/BJ8hjYixWGRV7VMG/81zqsDba5egxLgFzRavOY4B4Vlu6VF
	jpkXDEUCftS1tHVKcLeZEPNaJW0ZPcpt6FDOQGit0473UfUXznTMJbxxnrkx1TXt8H7hY+j3Hfm
	UpEyDcvaEfyM/x+Oq0+i+sLXB5kWn
X-Google-Smtp-Source: AGHT+IH9eow0w2FQbH6zQgvm+iSeX8QbqmZZuJhPp0WxaSCiprCkHnC7M3RUkSozgXtes34FkueP1Q==
X-Received: by 2002:a05:690c:2603:b0:734:f858:b1e7 with SMTP id 00721157ae682-73d3ce7a14emr75343577b3.27.1758398682339;
        Sat, 20 Sep 2025 13:04:42 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7468da56970sm5713487b3.17.2025.09.20.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:04:41 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/2] libconfig-autoconf-perl: upgrade 0.319 -> 0.320
Date: Sat, 20 Sep 2025 16:04:34 -0400
Message-ID: <20250920200435.14135-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 20:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119623

 Changes for version 0.320 - 2021-06-25
    fix check_prog to not find directories (RT#132993), thanks RJBS for reporting it again!

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...utoconf-perl_0.319.bb => libconfig-autoconf-perl_0.320.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libconfig/{libconfig-autoconf-perl_0.319.bb => libconfig-autoconf-perl_0.320.bb} (89%)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
similarity index 89%
rename from meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
rename to meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
index 086b2ff32e..d8ca2ae247 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
@@ -14,9 +14,9 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AM/AMBS/Config-AutoConf-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f5131beec31a0a33e"
+SRC_URI[sha256sum] = "bb57a958ef49d3f7162276dae14a7bd5af43fd1d8513231af35d665459454023"
 RDEPENDS:${PN} += "libcapture-tiny-perl"
 RDEPENDS:${PN} += "perl-module-base"
 RDEPENDS:${PN} += "perl-module-carp"
-- 
2.43.0


