Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07A5D5B861
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.107.1730140092662036807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WX4xRIHJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2e444e355fso4179695276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140091; x=1730744891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6awifHAYwppAJwMSmwvSUXIobTj4/2Az3aZX349jj0k=;
        b=WX4xRIHJzoCwWxMqhp87lF/el+X4pskNrt3CfNgkDIPE35eo2t6+rHkcIa+6lPhFO5
         kvi4v6BIy2sK5B+zbZWA9LBvb0ISmKF+2O+S6Ads6hFLnpURZOGWEoy97/qEv1wTrjAf
         pHHhV6m5B00FHmiCAvSMEHCLhGeaSh8I9CrXSl0m70/fp4BgKLP+4jDUVELJQQ4NPRUk
         qrgx1VyKnqjlAZI2/bLJn3Llu2YIkhwlN06bT4cJkeYd4PbNZOHfOB0YAb5IY0Bcb/jN
         Fr/SI02nKNElfD9rCzKsewvHRTP0TjyuugZdPftQ6nnS5JM4zOjx/MYegP7BZOF18rmF
         gJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140091; x=1730744891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6awifHAYwppAJwMSmwvSUXIobTj4/2Az3aZX349jj0k=;
        b=lu0Mgtf0DVmERilPS5nGcwgkcuyaJXOm3jlwMXLJUVmYOFu1mbvuFTS9AeEvtAV0b0
         QSxrq0/VO2f9kiCbd02fM8UilgjqatWAWi0x7iAJWKQv8Ca8NaLWl8ehQYpSvpHZYiIC
         cEOXOZ7G3+ycghqApJRUAvGrxp5/J6R9sJV84HNfBytqPZXtDrk+gQFhUAjXAmezq4DR
         482JmvRpYWBXEAhleNfEyuMFLywVVe1MPJL7MoAlwF8iMpxoHwGY51dG9+TciXDKLE+k
         e7s/5rAwf8uTI6Qo5hcOwNOX5HhSJqemtDijRnocFqwMRHwyLe29Y8IZ6A+MKydY1B66
         zFBA==
X-Gm-Message-State: AOJu0Ywk0KUBBVpE3fCDo/hNpJCXgvnPGlqEFTah1CW2bzNeftK5Ql6z
	57AbDZDLT4Q9Pbb/BXPZVwNBxLAjsbwu7M98/6bMHUvZI228zBHzWLxpnQ==
X-Google-Smtp-Source: AGHT+IFsCDJf4AiigL2//VfyALgzNpEYa/AMzcSt2Q+3svEKgSEKUtsFTOsht2IsMv079iR1+bz7gw==
X-Received: by 2002:a05:690c:fd2:b0:6e2:b262:bebc with SMTP id 00721157ae682-6ea22adfd8emr7051237b3.0.1730140091228;
        Mon, 28 Oct 2024 11:28:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 01/22] libauthen-radius-perl: Use
Date: Mon, 28 Oct 2024 14:20:17 -0400
Message-ID: <20241028182749.5058-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113269

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index 79a371d2c..835fd2f6c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78ab6ea0cba1f1ec1680ebb149e3bc11"
 
 DEPENDS = "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
            file://test.pl-adjust-for-ptest.patch \
            file://run-ptest \
 "
-- 
2.43.0


