Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0C8C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:52:55 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.21183.1646063575174606939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112
 header.b=r6o5G6QZ;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.46,
 mailfrom: troth@openavr.org)
Received: by mail-io1-f46.google.com with SMTP id c18so15135833ioc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti4Z4N5LZr5ksd3RjwjuHaH981Q2eDEXw3twuVYIOtM=;
        b=r6o5G6QZ2mgCG07CBEIWGQjkkzK1q86FtjhBjm62Vi+hkM46RYW6qKmy6qzjbeDZlp
         VjIkX5a0sXU7acLTq6ihPqe8Ly8tuqzZ8yzd512Prjr2dOuszv/NhM8QL0xBSBvcpvWb
         0eA3LJ7oy1uH30cKaELQculINKIHyp82hdSSLyWADoVGChjizChfiEq2qLP+fmrmVKDP
         ZgUsbVpnm5zklcc+SbBOMYb1aTuGXmnvns7mV4nsUdyUrysdzOMgWAlP5z+fTpxbX1b2
         mH98bxpvZ90Z+RCFXMry2Xvks42VJgJefx6PE/oVOSh9fcPu49g4SXFViwm6pRPxSVr3
         U3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti4Z4N5LZr5ksd3RjwjuHaH981Q2eDEXw3twuVYIOtM=;
        b=wnJLIIbEzAv/LaoQ9ZGEv9cPDlUExLSajNqNa2B91s8kw7gMj/hQCUnTxrz4ReA1LY
         N+/EjGIcjTuS95UBOLVPLHh0PFtshacrlBXbNBfTjr3tRLXuY9QdmLlyGM5L3xo32FCV
         iLvMJ+LshEdyPplyM6NY68eQ5swTTvLxdILkOVAS1quVeCJZSCAZ//lWJGmm+9WSifR0
         93Stj9GansFxnM/C7ltV4B5zky+kL6g+l7zJLDPOyWsXqodMYCPJLHDIRggAYy4uIqOa
         ALhCWiD34y1VXqSJZKRMwcWdJePBEggZG4VUV7p6cL8AkIqlSSzHCBCguHm5IDVPE1Eh
         UglQ==
X-Gm-Message-State: AOAM530VS0WEuxT3dyWOE0AcFXZmjOAG3hGqFupygjXwzTRbpGfqiEgl
	OlAhGXivrBca5uD6vdAlkZf7VEVdc37bHcLS
X-Google-Smtp-Source: 
 ABdhPJzxW0ab9ap+4BdQSjKgcNf3rfEfqZguQMFoEEiPLvZTCJBh6+kEq80IJgtNTIsIVkqqEqaq7Q==
X-Received: by 2002:a05:6638:2181:b0:311:ba5f:2d3f with SMTP id
 s1-20020a056638218100b00311ba5f2d3fmr18330580jaj.89.1646063574099;
        Mon, 28 Feb 2022 07:52:54 -0800 (PST)
Received: from beast.bozoland.org (c-24-8-35-226.hsd1.co.comcast.net.
 [24.8.35.226])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a056e021b8600b002bf45d43938sm6389747ili.86.2022.02.28.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 07:52:53 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-devel@lists.openembedded.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH] python3-marshmallow: fix wheel build
Date: Mon, 28 Feb 2022 08:52:34 -0700
Message-Id: <20220228155234.1053650-1-troth@openavr.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:52:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95584

Recipe does not inherit pypi nor would PN be a good guess at the name of
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 .../recipes-devtools/python/python3-marshmallow_3.14.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
index ddfe4b99c..dc5f17388 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
@@ -15,4 +15,6 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "marshmallow"
+
 RDEPENDS:${PN} += "python3-core"
-- 
2.25.1


