Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5868CC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 03:44:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.41892.1640317473667388207
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 19:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=flJhLydt;
 spf=pass (domain: mvista.com, ip: 209.85.214.177,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id w24so5754171ply.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 19:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09I3cbh1A8AF6queaLaCoF8hXynjYSQhKOdsRy7WlV4=;
        b=flJhLydtyJ3cuRNG1ysm1MyZ7SrvTHbgI8BzzT1H3h2cBIcDBct8CC+0DR5P6lrjbn
         rgZAYLhcH6JSP5LyGKse1v+25JPdluFdEDBNNj2pICl+mH38BGc742MquIwB8Id2vy1L
         S69c6rXltC5mqAXoRlICMfRJCoVbN7GRpjXoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09I3cbh1A8AF6queaLaCoF8hXynjYSQhKOdsRy7WlV4=;
        b=UtvhC4kjdDIYt5zMdnmaQhy1iQl2AgDXNmaUU7D4fVPXWaWb+wrgoeOZgFJYbzTO+i
         zcjVS6FX9rDan1NllEXaHtyWV5F0g22aSmzY0XjtJlObwYpj+nZTL1miE/gGtDY9WLVQ
         8s8r+g4/Ab61BWv9z0yYBhC2Ez1XRFwV98SDvsUYHMYEBU10/0ulesF3ZWBEs3IeDcmF
         l0yXGPSPvGXsE5FDYqVolCfkyKNiRG9KWK+my28Y7RdWp8GibjM4CpiCDbf948qxVanp
         vugx91J/QNGQPTmY58BhX2LCQO1EeO2nZxYgccUnr9MlInQ8FpolLtYiO/r+ksz5726H
         3reQ==
X-Gm-Message-State: AOAM530Ui4GK1cd61HHVlFTZr6YU6+cEXL92PHqE6meTSQeLZmDwxvkU
	0qBQPpyMQZgVW3Dz12yX69DdIIK5S3o1gQ==
X-Google-Smtp-Source: 
 ABdhPJw8XtR8avTSKjI9vPCTNw7c2/KWHXRbdu5f0vVCvOnKh25n1KhmKotG9a4bRPR0Jlg+pbh1Fg==
X-Received: by 2002:a17:902:bc82:b0:148:eb68:f6dd with SMTP id
 bb2-20020a170902bc8200b00148eb68f6ddmr4819693plb.98.1640317472548;
        Thu, 23 Dec 2021 19:44:32 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 oa9sm7133937pjb.31.2021.12.23.19.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 19:44:32 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Thu, 23 Dec 2021 19:44:29 -0800
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-multimedia][PATCH] cdrkit: Allow PN to be empty.
Date: Thu, 23 Dec 2021 19:44:25 -0800
Message-Id: <20211224034425.336596-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 03:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94489

If you add -dev packages to an image, as in an
sdk, ${PN}-dev is pulled in, which depends on ${PN}
which no longer exists in the new package layout.

Error:
 Problem: conflicting requests
  - nothing provides cdrkit = 1.1.11-r0.1 needed by cdrkit-dev-1.1.11-r0.1.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index c89204062..2e295388d 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -25,6 +25,8 @@ RDEPENDS:dirsplit = "perl"
 
 PACKAGES =+ "dirsplit genisoimage icedax wodim"
 
+ALLOW_EMPTY:${PN} = "1"
+
 FILES:dirsplit = " \
     ${bindir}/dirsplit \
 "
-- 
2.31.1


