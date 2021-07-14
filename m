Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.7770.1626274495926212459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 07:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rT051DjT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id f9so3557617wrq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4in5BIkQstmiAZgwxke4V/0zDHxrFVCq1EUKU7S+9pw=;
        b=rT051DjTuyjfbqmp/aDGRnC8Sb7zc0cOCRDWvBvtR8D6NYK3DlfGcZ36F4GDe1Pp1C
         4XpvBgYl2sq3v10CKVmqjrlh8V1tqssPAsW2EC4qPxvVg4lQodPbS8vlnvLEFkKcJX7L
         K675ypblcvPLDrplDnVM1+VruMhoEua0efVY3SUWxgl/RcM3nIk7+PCml+MsApP0lz6t
         wI6gpMner/jgg8tWPXtgs0Fh+vsHt1GJMZAsvBo2+n5C/bGFlM6003fIg0uEJzFlyntS
         gij3ZzYd2qEHtr6XjKD+RXz/xcGRmdYLm8KgBTBuX5oRTsNkgmA562b9xfVyfxC4ChxP
         A0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4in5BIkQstmiAZgwxke4V/0zDHxrFVCq1EUKU7S+9pw=;
        b=o94A1UoyzgJvLbJdZMcNKf2rzOHsA+WYFQFDmWOXd2h1rVTUWGGg47B+6/oTTi03Hp
         Lyod6SMzjkaZ4+XfGcUlNHFxHuYhpPIqWPcG5uCVaml9G6z9R4yKpx7esKKqIyRLTfrk
         XGEnw/b70lH4hEk+36WSKAa2rlifR3R7m1aZKJC6TWFZYJPtkR52Dtb+/TDfbpjwVlD5
         5u6DRbCPTKu3HHUdZpc+ls8t3zJ0c62lgNPC/S0AbS+DIfeIPEkK2JYV6YP4EqUzDVxN
         dEnPRDoxjmtJc40oGBH7A5lbWOWoERZpSleOxy5pv9BgWZj+EQAfmRLBLNWYnDMeS92j
         9kxQ==
X-Gm-Message-State: AOAM5308PxTXAIDZtISG0zxyVSiXeItn9IkBusibm8aGEnJwpbBCAa9g
	KIKbXo3B4eJmTlSHLIdecZWShLrqWR8=
X-Google-Smtp-Source: ABdhPJxDQcreklu/nUgETQ6VQX0OBqDsQHC+BSsX3pF9vgYr4S1PqysMz1FlTbe0fseOw2bwmQhAWA==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr13937339wrr.302.1626274494280;
        Wed, 14 Jul 2021 07:54:54 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:d5ae:6a4a:fa0e:90ca])
        by smtp.gmail.com with ESMTPSA id p2sm2352453wma.27.2021.07.14.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 07:54:53 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] spitools: upgrade 0.8.7 -> 1.0.0
Date: Wed, 14 Jul 2021 16:54:44 +0200
Message-Id: <20210714145444.18527-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

This includes the following changes:

f5d8795 [RELEASE] 1.0.0.
eaa6f35 [RELEASE] 1.0.0.
fe6ffcb [DEV] Add license mention in `--version` display.
f9edc7d [DEV] Support all configuration options in `spi-pipe`.
18f6b23 [DEV] Support SPI mode option in `spi-pipe`
8c6e7f7 [DEV] support `--bits` config option in `spi-pipe`.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index cde26df498..bb41a33c14 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,9 +4,9 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-BPV = "0.8.7"
+BPV = "1.0.0"
 PV = "${BPV}"
-SRCREV = "67937230d70ad87c23c7116a72df83577e309f6f"
+SRCREV = "f5d87954bd9e13689481700105efe2f42199d364"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

