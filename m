Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A445BC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 13:23:01 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7422.1635945781190042844
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IMvGREgg;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id g11so2306225pfv.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yM/yhfOECz8wuvQMlUhQ2+aPMQHa+vBxkqb2fPpPQTk=;
        b=IMvGREggjIlBztkgsALcdFUp/pLPMO4lyYbRlkMJ81/T67mfqtlIirGo3FQnIEWmLw
         MMOiDGNxf20s4ofXRPE/DgTn1eTgoDDvD1Of7DqGMVxu/68P4psl+DKgE6RVGUYbeHcb
         +ihQ2sjyHArrcLQz6w7nhYFl89zs9IHOLq1DBzjynMXmO+cum+lSLBl7hCvE6ujblQl+
         0nSFk9zt+zGBfDMPWCyZVmutwd4ypF/Xg1a+GNxiJwu0WFDtFTK36AcZWNzNOx/eFbb+
         2jXvxfMVOPrbfdjqG27Ii0TwzTJWd1n28MNnW5osilxAgpCCEnzrWQ2JwfvT7qkAtPOf
         2Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yM/yhfOECz8wuvQMlUhQ2+aPMQHa+vBxkqb2fPpPQTk=;
        b=mevAOFwC4+E3pWv12gEb3L14NT7fEEoLHGjF77tagnDaccFRXlDrM24JFhmM6/g07Y
         mFmktqU/vX3GEEC6pW+eoBDI9TDY0B/3BTcVezevCKy1QyAvPtNSsB37Y4gfvkm7YucV
         yCULcHxnzx++Hwf9d2Kc+JoZLeRsYBNRYtfNF090k/cxjlPHFENl+L8+xIQmaY7xufLO
         mB5dUUboEm3yHE82lQlLWdOIgO4rJSA/+ou0jO+aX33W708FwcllJLVY3hF6XzF8y5YO
         Lgy9Nw8Lu4H+psqOFewCqMqYMKq8o2MF1GoN2yYZ11azJbTHgh4mZOz+llWRdTiAEObE
         VFag==
X-Gm-Message-State: AOAM531M/Pzs0RSpZdun5Qq8jlbaqb3O+UqatspOBWnT3YIGFeaDpxy3
	/CS4qtJJThm9fb1degb0SvXC8U+Vj/M=
X-Google-Smtp-Source: 
 ABdhPJxQjIl04uIacC6VxsreicYCLhgnyL9FtyATOPqVNAHM/Ny7fKt0sQgou8wBOEcDbbKf2eWxLg==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr33317405pgt.56.1635945780340;
        Wed, 03 Nov 2021 06:23:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 s3sm2064539pjk.41.2021.11.03.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 06:22:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-prctl: Use https protocol for git
 fetcher
Date: Wed,  3 Nov 2021 06:22:57 -0700
Message-Id: <20211103132257.2215319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 13:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93807

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index b87a470b40..8426e48113 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -13,7 +13,7 @@ B = "${S}"
 SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
 PV = "1.8.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
+SRC_URI = "git://github.com/seveas/python-prctl;protocol=https;branch=main \
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
-- 
2.33.1


