Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0139BCD98DD
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73366.1781278464210838904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=At6TLuWL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso4330495e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278462; x=1781883262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caMAWsZgcbICMDbQIEOQwrckPEoq3ir41a3Ikr63i+0=;
        b=At6TLuWLUYihI9+IHWCn9Z10anaWsPaO95vPoklPWGQ7+HjCXxAFx3Lgi+iWTXpo7H
         f8jdRz91FAFwukpGQu8XlWT6F3Aa5dFPZfWuT12qX3yTsZIIFy0O5fzLo8ai+9YR4dK+
         vVkO+Fhh8gdICz8jkhf0wnS82XxDEhXbptor8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278462; x=1781883262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=caMAWsZgcbICMDbQIEOQwrckPEoq3ir41a3Ikr63i+0=;
        b=IyK/wAXQi6KC+Ix6bFMNWsxoxulrF9i+rx3QNWfCGz/nc5uP+a5BFqLykinETYHjg+
         Xx2suxj3vs1RQUq3o2Ec8pCpOK9Z1/g2RSmdEFShm8Wb+A9mQwuqv3ihfhNy7MPdZIc8
         dmd+0deqvGJPMO5aAOCee/zF38LdScx88S1gJr8nEdL9y6PX3wnMRNTP0malL/wsvOAk
         8JOtdf9gy6ngLYkNelMjhev8ipyQRmN2X+gsXpstOlwtivtgTYiINBNpGvhdBMYtJ0YJ
         40Dh0pwLx4T22z/juSXrfcRsXG9SrNOi5sUCkpUwHdXu9Uxm2lAO23T2YKmPCO3l8G0k
         /2eQ==
X-Gm-Message-State: AOJu0YwEt47C4zHAzNWgH2wCx+deACABsjiJlYeWnFNZtkMzZutGTB2B
	LrChBA5vuNBTY8l02rruh5G7DeV1ffg0SS1J+Jkkt56DnXm6+CiM/EWfRCETwBxj4qXSGoo9jKp
	G/Id3
X-Gm-Gg: Acq92OExOSOCpiS9jghX8GJv5anDCTomj9ahwdEtPitMgwY3E4J0NS/m7A3/cCqla5I
	dqtsnX72SN2U5/QHllA+c9ESxRm9Hu8XJhoCjq62uNe4N8O6QK03fJ0Cd5CxYkwsQCHdas8qs1o
	+jMY65N/Mw3JrT7673VmbLXddJgedlkkZCYJZe9HyJMNOUdHv1RQx8e4mCXV3sfbQluGZVS4/4O
	gkzNuu/qiKlakhTGB7+FFGmlAWyIgF7tdD2eout2EvEavTc4EABL/D4HhYOnK4g70M7rqpxszS1
	8OryckQij4e8yHRqNloJo9NjTAf0I/F59CX7V+tJoaDPjfv6untyjqI1jYql2cLJlc/HTvKfz2F
	oXa4gBggA6s5r6PjdtFXVI654PMNIoJDCV7QbTkzDyhfNPFUhzCiC7EfmyrcN5w9f8MdasKY9kk
	sxMZVsOys3iXCqEXpGzaLf9JcsZxM+cLYc9Ikg
X-Received: by 2002:a05:600c:a310:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-490ec5021c2mr39347655e9.30.1781278462472;
        Fri, 12 Jun 2026 08:34:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/8] python3-traitlets: Upgrade 5.15.0 -> 5.15.1
Date: Fri, 12 Jun 2026 18:34:00 +0300
Message-ID: <20260612153404.3213552-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127546

Upgrade to release 5.15.1:

- Fix CI (docs build, mypy tests, downstream)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.15.0.bb => python3-traitlets_5.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.15.0.bb => python3-traitlets_5.15.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb
index 9c04286030..2bb28a589c 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "4fead733f81cf1c4c938e06f8ca4633896833c9d89eff878159457f4d4392971"
+SRC_URI[sha256sum] = "7b1c07854fe25acb39e009bae49f11b79ff6cbb2f27999104e9110e7a6b53722"
 
 inherit pypi python_hatchling ptest
 
-- 
2.47.3


