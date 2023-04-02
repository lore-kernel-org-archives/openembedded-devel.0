Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4A3C77B60
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.56506.1680474612126787595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ea9K+TlE;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so30676053pjt.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6tT9sx2DR8kLbEnmPz+Oh+jqW5wQhntvfAiXYI2HdQ=;
        b=ea9K+TlEXriTYQRMY5e2EfDMC287KRQitttOuqEorlNX6Y9zdhJbt4yQZaRBjtqSq8
         n7Oo9Hja7KDFLX9EPmAegI0VfQ4uTsr0Z5UhOXQfTX59GtVf76xJfZ4s/jb4oJuiJq1o
         9kwzcfCGfzUH/lTtsBMmtYFNK7pdEwGPHnP2GaTKae3U5JrLz9eY1eogTD/givHmd3f7
         oKimXGexmmjdQ9c9bnkKeHiy4cE2GKBFvh1H+jKyawwfi9UPn07tFSVWY5SdFnKeatoQ
         DzwlU7MSh8GeHjGcGOlYSj8MyhCp8CbeKU4RH4lBf1in0Ju1h04/Fcf+4YxoLp7R3CUf
         +1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6tT9sx2DR8kLbEnmPz+Oh+jqW5wQhntvfAiXYI2HdQ=;
        b=2IBbVml2I6ZB3XSIEpxDC60zpo2bhSFQOi+nl4Gn3CvBP4YIAkgbOMHge/dexOLHGq
         XyzkFZE9nQfWHSh/O6L9pVfNSvvTrfIr9c00IcT9MZW5Auiz2vElxVtJwIgauhRK+VM9
         IdxDS++zPOCc663sJs0LFjJ49qFEaWGJXcV5XxqTKUZtNEmgPr67FnvLSVnjEIWkQc9t
         J4EEASJhL6l4/ZnPPi+ZYMc1OUiUe9ZloziDu/SgVlWLUST30mcQo7eGKiIpOLuSMm+a
         QxH/rSJTNsSH49mBr3CvbHLAMolCQ1diuuJ/nqiJQIwJa+eR7Fi9B0nNmynX7lVKuLr/
         G8sA==
X-Gm-Message-State: AO0yUKUZB/HfWXr1f+u7F98N2F9GthprXL0BmRk4TN+y5EQGoeZolvRD
	nGN7b3D8nP9F9u578KVBbhTwzB3R3EY=
X-Google-Smtp-Source: AK7set/tL6ZTK4igp7/UMjWTv8BOhIGOXPAXb6wR/IyKJt/RwSnEkvRHCAZ/uC6u/veYr1GSE0AcEA==
X-Received: by 2002:a05:6a20:19a:b0:cb:f5ab:3bd0 with SMTP id 26-20020a056a20019a00b000cbf5ab3bd0mr26608137pzy.59.1680474611174;
        Sun, 02 Apr 2023 15:30:11 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 09/11] recipes-perl/packagegroups: move to recipes-core/
Date: Sun,  2 Apr 2023 15:29:41 -0700
Message-Id: <7497ebae5929bdc531ca76c5a0d6a29ecd60fe6f.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101887

Be consistent with other layers, like oe-core, meta-oe and meta-python

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../packagegroups/packagegroup-meta-perl.bb                       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-perl/{recipes-perl => recipes-core}/packagegroups/packagegroup-meta-perl.bb (100%)

diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
similarity index 100%
rename from meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
rename to meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
-- 
2.34.1


