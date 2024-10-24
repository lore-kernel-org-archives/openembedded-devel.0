Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4447D10376
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.6197.1729801150992578736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWwx8cu3;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e39bf12830so10167507b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801150; x=1730405950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QD4ViCaY+PlqFJPCQORiB+LzOtmP2rH0PYXMgvDwew=;
        b=BWwx8cu3Wr53fsDUd0ylEgmaTCs4pN/tV7Kspp0+JTO4S9IO2IMgvpNKUj4fTPu0Cq
         DaEIRenFQdzjjvg546ABMHvnEmDLsBgmG08gMpbW46QwtAIEd5BUhWBKjx9G1PjjjnmP
         CEBQjHPUD+Itz4dmsjqrHgmXD0wc3pNRFtbtnDXM4fwwVS5zDLQwrC9mcgmyj6idKv1X
         t62tZ+oMUTBUnakEszGvTjj5E7lGrRMgrq6SOGPtQSqeLtxebIpB57bATBvDjDyZVuqc
         BmkHc2jCkEES4FqS44wllqnPAkOaizC3N1DAII+oPywE1XESH9ZfaxCrN7DHhb0TF0MP
         ARkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801150; x=1730405950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QD4ViCaY+PlqFJPCQORiB+LzOtmP2rH0PYXMgvDwew=;
        b=gPhFp+yMdZxcJ1FjygBzM66QGoyfAbryjL26VejZ1xxiqWZmuYK8aHZVCaJiK38mqt
         nVrfZ5lRiSjipJFrGbSlyxx34CUmY+uyQEeVuetRfpMhNH1fUZbsy4WdSJBVqGDyfuNd
         EBJ1WJgRfrmCoJM1pxDS0VGDs0BHkzJdIhLjr9uGp8lXeqAbIrEm/SnabRreRMcjXEFM
         +WzeP5H/aoLbQqcFh+oc6LgLLdNYUS8rneOUNXWo+EceBmjPk1rz5lgQYFFqaxz8IDSL
         CtMcOvTApB4yuTBawkzmdKn+1S65P8IyVsUlN/gFehNsssv062S6sc7zASnn1cS+zPQ3
         WVtA==
X-Gm-Message-State: AOJu0Yz82ssJZpYFa8aq4zO3BBGAy1+bh96yoEgLZyak8X4KYct0smbp
	ulV40HVsceyBsU1jU8OovESnvj/NHmrhYxvxPPWJqq1otR+OiHtl7V7pqg==
X-Google-Smtp-Source: AGHT+IHzPUXzRqGqqLxNb422hmZj7cTEc5HnuKHLH0qpB/91mb3rKHjj0EvoslI7zHCX0BMqCQMggg==
X-Received: by 2002:a05:690c:6f06:b0:6e3:ceb:9e5c with SMTP id 00721157ae682-6e85811788fmr33095667b3.17.1729801149730;
        Thu, 24 Oct 2024 13:19:09 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:09 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 26/42] libmodule-build-tiny-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:45 -0400
Message-ID: <20241024201806.440273-27-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113204

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index 860185007..a662b4540 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -7,7 +7,7 @@ Whereas Module::Build has over 6,700 lines of code; this module has less than \
 120, yet supports the features needed by most distributions."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
+HOMEPAGE = "https://metacpan.org/release/LEONT/Module-Build-Tiny-0.048"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b9e8b5e2bd19fcc97ac84b78a271a64"
-- 
2.43.0


