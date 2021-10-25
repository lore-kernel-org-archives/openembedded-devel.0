Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC51C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:37:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.33825.1635176264812422960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YIl3yL3A;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so11761788pjl.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVu3WydH5M82YHiNt8prNvg8JjIK9ijBnz2RAhVRRMA=;
        b=YIl3yL3A4sS98dM93J+0jFn18CukXxAAKQyFRIWuWMKNq8etF9ihISlLTaqO+Dt5LN
         tM0TFVyli3lBW42RCp+BehKlWRn6GQvR51pQK23qilXGzmkEx37GU2O1bS5pT3wRUoNu
         kJiUNnPXyhjT8c1rfPWt8hxXd60I7A6lXjrSR2ZHZDxFED/dKRs4PoCpm+z95qwEQD7a
         eveTKzOp75rp9G4kj7cE9YjrbctQSTbzQxXuOFiBLjkQ0jjbaZET6m/xdQJ4PjJRxNbB
         lFEvNDcIVT3FJuv4itwsWBW7x1t/PH8Hi+EscdaTe7D4HYlNTBMeC5/0Cb+/WEmB8F3i
         4/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVu3WydH5M82YHiNt8prNvg8JjIK9ijBnz2RAhVRRMA=;
        b=cQ6WhXNFOWYKrXyzUm35lP0TsQa2nUOMzLqUAUh7QsXsuezrbeALOAeS838TrM7V6C
         rtMnB+Z6Iqs+LhlOr/NDIcSVt6bmn5kccStjhJQPOtqoBF+UV2A9HuK40A0oHrR9SWAJ
         3gNdmtH0Sij8r4WkTnUcado5Y8xtI7aGGJAb8hnyD3ti9UuesTqgtC0IUwbTTiN/r0Wp
         Rq25uWuJcuJwyqwjRqIzddhPRuOr2c1MdOm/YhmU1QNi8VVx129+zqcZD+YLlejLZgO/
         nk0YRmnsibs7CzebVucmiEisLDKe7cNGZgBSds/MbPKE6vyOD6X5s879iRSebHyGN2yT
         J1IA==
X-Gm-Message-State: AOAM530WLH+MTz21Vb6ZNg15Wgc/wgnEgvAOoMo3GFHA/qMdvIGcT7Vi
	nySuG3Eco8WD2w4pSFZGbZnQgfq7t30=
X-Google-Smtp-Source: 
 ABdhPJzu68uwJskX/QbMmoUQaHIIU6WsloESSO4ShzOxSirwZ3W8zdajNZ/tvXxaSprLIPalMBTKbw==
X-Received: by 2002:a17:902:e812:b0:13f:3be8:b15a with SMTP id
 u18-20020a170902e81200b0013f3be8b15amr16260427plg.49.1635176263739;
        Mon, 25 Oct 2021 08:37:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 s12sm4452809pfg.70.2021.10.25.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:37:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] driverctl: Rename to have PV in recipe name
Date: Mon, 25 Oct 2021 08:37:40 -0700
Message-Id: <20211025153740.858221-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 15:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93567

This commit is at same release as 0.111

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../driverctl/{driverctl_git.bb => driverctl_0.111.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/driverctl/{driverctl_git.bb => driverctl_0.111.bb} (100%)

diff --git a/meta-oe/recipes-support/driverctl/driverctl_git.bb b/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
similarity index 100%
rename from meta-oe/recipes-support/driverctl/driverctl_git.bb
rename to meta-oe/recipes-support/driverctl/driverctl_0.111.bb
-- 
2.33.1


