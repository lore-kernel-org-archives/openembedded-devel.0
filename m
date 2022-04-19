Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF4CC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.743.1650381740738162046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ex10mZW+;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id s17so5233471plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+vb9KTtMUJGrSHZHdT0E4DjbazaOkpjdEU1GF78Nqw=;
        b=ex10mZW+dyIsCq1oJmOpWmeIKHrFm1NP7FQHwT6jwZ/0WhNQPElJPr++yagkUF9x1N
         N+pPAjQuzB1vt3rKwNM8jRZeU6ii61KiyXZ2mGALW39Ek++y3zCNSTEmHjVaBH+YeQZK
         4yvPZcyNJr3nKghSbjbiTs6U+56luOS+BvsD+jNH4gHmjKJG1B305AB4/KPVhMVJi0c9
         CDRYFCkkEwiYqvVE4go5APnYqUT1Kl9Knim7cEoM+zWNyJHXbwbege33ivQEHm/2GVZr
         0Bq+Ie2MBOPM7eCECpId62TmaqvpJhX9VghgL7jkRGKYwdJpBFpIA9Z2Zgrs0TIA+nXF
         bgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+vb9KTtMUJGrSHZHdT0E4DjbazaOkpjdEU1GF78Nqw=;
        b=e/7Elm+XqlyHRDDsSlY15sWWL7pY1uy5ZLIh/I0zeb7HcWKSptBzQvx3e7Lj/z+9X2
         QNA+u2cO2GUUquFrM29u3Cwfx4rf/5GSsxXG10yaLZZjla0MGGeu6ASBKpsr2VlmnzcP
         Lv8b7dPuOj5yFoEcHYS7shJ3YgTEut86UjsC9RnFbPU6aJUkRV2BjHqF5BOgaGA90YZp
         fQ/B2XCKb4EV3FygnOf56CeF7j0bZnBsjkPlsAzpljFFEdFHloaiaEY1OiDtDROPN/X9
         yanU+yAN3qa5KIykH+hwR1hgeYRKUP889HxpzNXQcS4sZAL/NlFBM+3A0Ck60Bc6Vlzz
         xGyg==
X-Gm-Message-State: AOAM532x4dF088yImd8r5ZQ3J58rNiQBXc8L7EIeM/h7i+oFvAX5bkdd
	S7KvDIlmZAl9ZNN6PdjUUlFnxaVIhBnf8w==
X-Google-Smtp-Source: 
 ABdhPJwJJXtcunvJYh+P1jMyci6zGfVoK9LpsTYCzuoJ2kQjJ3RfOJXPWxBe4tUbnG0RoO2Pl81hSg==
X-Received: by 2002:a17:90b:1e0e:b0:1d2:8906:cffe with SMTP id
 pg14-20020a17090b1e0e00b001d28906cffemr13197695pjb.220.1650381739818;
        Tue, 19 Apr 2022 08:22:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm16294537pjj.20.2022.04.19.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:22:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] wpantund: Add missing dependency on
 boost
Date: Tue, 19 Apr 2022 08:22:16 -0700
Message-Id: <20220419152216.3810783-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419152216.3810783-1-raj.khem@gmail.com>
References: <20220419152216.3810783-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96695

Fixes
checking for boost/signals2/signal.hpp... no
configure: error: Unable to find a usable implementation of boost::signals2 (not even our internal copy)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index bb444d04f5..a7fcc202a4 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7820bc7f7d1638a6b54fc2e8d7fb103 \
                     file://third_party/openthread/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     file://third_party/pt/LICENSE;md5=dcd598b69cad786beea33da7b1ae14b7 \
                     "
-DEPENDS = "autoconf-archive dbus readline"
+DEPENDS = "autoconf-archive dbus readline boost"
 SRCREV = "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
 PV = "0.07.01+git${SRCPV}"
 
-- 
2.35.3


