Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA98C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.23542.1668873497663820556
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtcW5lf2;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id k4so5411490qkj.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7f/gzCBvpcFJCHA13rPMgbUjuSnSNm6gqVVgCkP/zM4=;
        b=GtcW5lf2YX1wDVGndtXHDW15OjGc/DH+G37ctaUp1qyWX+sIl6k3zCsC24vYIiSxWb
         SADpA62TWStEafAcPc734fZKf9F3gk1HT6aPUWU9x5eXLfCDJ9E+mlQ6a2NDVe4i2Del
         QWk35ISrgfDRr9q0g+jlJKeSrdmZ5isSyvWc5qAMtn7B/mn8LfAXBS3kDeht6nObhljS
         ZtsL9uY+JX2uhFs2VfeMJ4PpQnXOlUdy8PdpdyaCkHHBHhGd2eW5FoTGlpmJd6u2QTX5
         lldbmAf0K+P9om6kJVo2m//GlvMPJ2njn5t7iWIHGhyhuThNitSqY2yxVA/Dxplkrsjw
         MyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7f/gzCBvpcFJCHA13rPMgbUjuSnSNm6gqVVgCkP/zM4=;
        b=lVnHjJPFpHZmmKYbwk2JWRocMJxuHl1IvjxI4l2ayJXY7VloSY9xt17NHurl7R9ttt
         3SVP4GzjNx6CUv77Y0ghqppVr/Hli7/2ofBjecmkxasAZh8WBsx0vtT3EW+p3byKOJBN
         ExlLGHElBCRMLP//1T1qhNlhT8D/FtqkfSTF1Ebdz9S2W86cux0IFZxLI6jugVTzsp4X
         orwQRTYiy38RaifCdbdaNEAp3GyMnAPSxDNtF4jKDmihCNZY617K0Zb6L6ahPHnpkW6O
         7myKm+Q2DUNnVzBKYtgGQhbxE1p3/ruzYT0wKRLDRtuk5QuwvzY/fwblt1riokQEzcj8
         Kt9Q==
X-Gm-Message-State: ANoB5pkEtTThvlUMDfr5tEhB6TF5raP7vtN7tzC7hBcJIzAdPMOdp6PD
	eHzxX5kAXnf3fA1y89+si/nkvsrvIeIh1w==
X-Google-Smtp-Source: AA0mqf7/xVJoFkqXGmlWGSL5EPWjWxjdBajj6em2hFkobxgWYHTLB5C+XkPjytiNXzHnjiaBmDzV0A==
X-Received: by 2002:a37:4ca:0:b0:6fa:312d:96a8 with SMTP id 193-20020a3704ca000000b006fa312d96a8mr10396848qke.350.1668873496136;
        Sat, 19 Nov 2022 07:58:16 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 10/35] tio: upgrade 2.1 -> 2.2
Date: Sat, 19 Nov 2022 10:57:34 -0500
Message-Id: <07ba4aff8a2fd23592c94b1b9582ab53133d25ab.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99649

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Changelog:
===========
 * Add shell completion of sub-configuration names
   Does not work with sub configuration names that contains one or more
   white spaces.
 * Beautify help
 * Fix error message
 * Simplify configfile implementation

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bebe7f7963d862294a05fe41e90d0485788866c2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.1.bb b/meta-oe/recipes-support/tio/tio_2.2.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.1.bb
rename to meta-oe/recipes-support/tio/tio_2.2.bb
index 1c36bd522c..8bfebc7776 100644
--- a/meta-oe/recipes-support/tio/tio_2.1.bb
+++ b/meta-oe/recipes-support/tio/tio_2.2.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "14fc77ffc13a4c60a98f0bb7e0f431e9ed7cf1fd"
+SRCREV = "eaab692d4d6be1ef41c0f6950977cf9054520cb7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


