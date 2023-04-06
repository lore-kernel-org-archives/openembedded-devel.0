Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4F7C77B72
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 06:54:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.152383.1680764066775648476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 23:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtcEmcEp;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id z19so36704696plo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680764066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UpnV4f+Q+XOQwFHNzyQQKXZRl8XhF24SQjJIeLIcuM=;
        b=GtcEmcEp8w4FVNn8YPClor20dW6WyOhI/hmnnMAWtnH/zOJpp0VR2b4JQjnEpJiGpf
         8HfqYgXxqeU2fq7B9J65eNvABPJt47mS2Q/ZoqBkXtn+ZCpbstuv+6YuPn7RKcLOpd99
         +xlwWaWNszA5bxR2Gk/nTNhPWgINsLd7s0vvyGxaN7JYafpZCzoZ/u0lFlcYJIyhRBNT
         jH2ikPpNeE+IEWqd1zqHv3liOV45TaIDHNFrUWp7hkaRYx+0aZMVY4sSlmmvSpGdhdxk
         6eZTEZzYy+NuCXUSVYllE97zUbO9ckEyL4xai6y81CWQ9OH3O9xqzX3utD6PSnZ1FP7C
         FO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UpnV4f+Q+XOQwFHNzyQQKXZRl8XhF24SQjJIeLIcuM=;
        b=VicO7Ozb8apeYFNwwAk4jVhoBIr1+s+fDDfxiFnGDS/G8z/CQnF5mjGusbrEdvq1Ri
         2HMBIujlTr8AmWKgo7mkNY/i8g6mcwxxnQpp6QO6hdYdyRS+ZCFQ7WcvJFsfA931veLU
         zwaUmgrvqpDj9AL5OLxFHqNc4z23RBBZ8DeNgFJYAQpEJwr0BaLOc7VYpxXgHYjMZ5Lq
         lr/EPEZTx5sRCphtPx+f+VfcqHK+4hin5HMAldAzrlESz2nXRbAOADWXj97myResepaZ
         4yOtIWp9HWNs9vOAoy5FdyokVro675qwxKNHMfNoRbOVKPRAKm9l2BzbI20MQXkeTL2h
         7leQ==
X-Gm-Message-State: AAQBX9eQ+hPLS6yCnwC/2Aeh3DAZuS/5x1cPRIRLnTToewDeXd0YbHym
	nuX52jDpCcH+lmLROJBXlvTaAbOm50VVfA==
X-Google-Smtp-Source: AKy350aexxE8aVD7uedM83qxnIBeeZ0e/FxRJaWKhgC9dVkRtuqvA1TSIkzEnkGs8k9d7LyfYj9wKg==
X-Received: by 2002:a17:902:db0c:b0:1a1:ca4d:120a with SMTP id m12-20020a170902db0c00b001a1ca4d120amr6177114plx.7.1680764065858;
        Wed, 05 Apr 2023 23:54:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm648703pll.86.2023.04.05.23.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:54:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/5] babl: Package /usr/lib/babl-0.1/ directory
Date: Wed,  5 Apr 2023 23:54:18 -0700
Message-Id: <20230406065421.767010-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406065421.767010-1-raj.khem@gmail.com>
References: <20230406065421.767010-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 06:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101967

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.102.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
index 9954ac9c94..68b3f933d6 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
@@ -13,4 +13,6 @@ DEPENDS += "lcms"
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
 SRC_URI[sha256sum] = "a88bb28506575f95158c8c89df6e23686e50c8b9fea412bf49fe8b80002d84f0"
 
+FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
+
 BBCLASSEXTEND = "native"
-- 
2.40.0


