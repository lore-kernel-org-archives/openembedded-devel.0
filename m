Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F098C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:14 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.2398.1646166853360288409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pJHh9Lq1;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id c1so15227621pgk.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dxGt14zSPuOpClCajqYKG+t29jIcwZQtP6nlwyX0LJE=;
        b=pJHh9Lq1bwpEjdaIE/V0jGYoSamGDQpnX0K+XV3fXrwTwkOSe1qlCj0sTLYqsbqCOr
         oqvgxSSl3Of4gVTQVVYL7S5pT6wQm725n9YEfa0jNjNj7suxKNqpJcCH1SuNIWI2Pgne
         MxUyqC2dbaZpItDCYnXGasYhE+z6eNbRVW8OcJD35sI66CeDBrLwcC3cn18BOYZjRSjA
         Ct6JojXlWJYFDZncjM0uvpDyK1v3yYLCrar94ij9wY/9kC6IzGQd/atEBQopq2Zf9wQX
         OJrfvwy6mEfM37vKq6JSMCnZNnLhmVKK2sVmWQNkVa+JePL1MRtObbnpj+1MafKv4PV3
         vizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dxGt14zSPuOpClCajqYKG+t29jIcwZQtP6nlwyX0LJE=;
        b=w1tGKmpJ3W8oFYCXFJrg7gu3iMq42UoppMjHX8GahGlgPgHOSoC90UMeMpnBZw8rqq
         euqZaQEdv27/l9LvyBQPAhnFswsJXoearn+t/4BXL3d7DfPxePiJeehwYFZrB9z+WohJ
         HN8sS7oxSZzgYpaarADkSWg9j+9YDmOx0Xu3nOZ2IU8uPxR+tSeQmohEa2WHytEhBzDt
         aXJusj8sWwvhvW3kCJC2FX6NmUDjtc0qV5NA8j6M70AnYbZxJAy3DfZgzPwiUACXYnPA
         Ooyd+7hmjUvKyvoKQ930lqGFpC3N0g/ypRPbNXTihIurzs21MtfGfC9BQbC06QnuCYuq
         vxaA==
X-Gm-Message-State: AOAM532l5gCjHzm/6aAhXZpR3SfNcVFW7Ils+ykp3j9mV1/e570bGgOv
	HKDHXSvUPT9DJpXEjnl3ZnVekUKiynI=
X-Google-Smtp-Source: 
 ABdhPJzuTB/DFH+8VFfQVaFoflx5pJRSLOaW7CUJdEj08le03rmz0RbOXuoJLxiyUdfDiLWCmlxNsQ==
X-Received: by 2002:a65:6390:0:b0:376:7f43:e9a1 with SMTP id
 h16-20020a656390000000b003767f43e9a1mr19937977pgv.480.1646166852414;
        Tue, 01 Mar 2022 12:34:12 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 8/9] python3-pymisp: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:53 -0800
Message-Id: <20220301203354.3839755-8-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95655

* Use PEP-517 build-backend instead of setuptools3.
* Also set PIP_INSTALL_PACKAGE = "pymisp"

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
index 254330bf5d..18f5f9cd90 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
@@ -7,7 +7,9 @@ SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
 SRCREV = "d991e53f9a9641f454e116e83d2913edf405a53f"
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+inherit poetry_core
+
+PIP_INSTALL_PACKAGE = "pymisp"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-dateutil \
-- 
2.30.2


