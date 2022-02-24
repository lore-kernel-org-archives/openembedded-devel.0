Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA55AC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:24:08 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.8251.1645694647692250902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=in7f/Gq9;
 spf=pass (domain: mvista.com, ip: 209.85.215.181,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 12so1285933pgd.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q/HDGQQWrhJ2NU/9/mhm7DevXXFJLoW3bbKuMunWikc=;
        b=in7f/Gq9TGY9j8ptrtykJDfbPQF6rL5PwIKT1eV+pdgk6FnF9ZWLvFq3s84v9+oWK8
         t2D4bJdcWxuQ3SYP6vnswF1mVIcM5QUeK32jk4aVojwT526+n7HYtkAX5w0Pxy263JeW
         dd3PWXss4Q+7ZdFKUNcVlq+akqTTakuluVy8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q/HDGQQWrhJ2NU/9/mhm7DevXXFJLoW3bbKuMunWikc=;
        b=A1kEY+T2vnsO9BA7eqeRr4xwrIjVBvnWrkLjIYRtDF2binzQ7jfwJGzz9koZ6Ct9k4
         QwX9e3mpPkeUxwOFjug66/OA9eP+pcbINHJuGba/h8s7jUPM90lmZbTvKvtwz9pAl7T+
         HZJl7E3LK4axBWk1RoPJ0IAKtDQotol2I3aYdBBXKxKK7/5etbn7DnOMQTMvUVVWcWKA
         fCRH8qVpJS9X+qohU65IPTKY33zbeJsvG12RvdlmBYE4aFqWPw2DXxO13qhMihI+tG+4
         /9cm0SBfse7oXHIJiq2WPdXRV7jj1i7FI6+V0aFzLhz6Dz+c6XQRkVZlQ4eMrA1et/sL
         Ew4Q==
X-Gm-Message-State: AOAM533QD4gUX0v72Ws3HHpc04XpagrlfravCQ+Uq4lI0JSq9LJD0z0d
	M60/bec/e8XUpx7hN5kXuf82jTO9aOcYAA==
X-Google-Smtp-Source: 
 ABdhPJzRthlXn2a+O7o7X3gXcUxGaNIhRgcnbJW53IZR+GNpl6Scwb4rQQXXKtZYyVmX6eHrjruipQ==
X-Received: by 2002:a63:105c:0:b0:36c:33aa:cb24 with SMTP id
 28-20020a63105c000000b0036c33aacb24mr1571708pgq.221.1645694647028;
        Thu, 24 Feb 2022 01:24:07 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id t9sm2044264pgp.5.2022.02.24.01.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:24:06 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:24:04 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 5/5] commons-jxpath: update variable names
Date: Thu, 24 Feb 2022 04:23:39 -0500
Message-Id: <20220224092339.2711524-6-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:24:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95508

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-core/jakarta-commons/commons-jxpath_1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
index 5f44315..94a4d45 100644
--- a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
@@ -6,7 +6,7 @@ SUMMARY = "JXPath interpreter for Java"
 
 SRC_URI = "http://archive.apache.org/dist/commons/jxpath/source/${BP}-src.tar.gz"
 
-PNBLACKLIST[commons-jxpath] ?= "BROKEN: indirectly depends on broken 'xom'"
+SKIP_RECIPE[commons-jxpath] ?= "BROKEN: indirectly depends on broken 'xom'"
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils servlet2.3 jdom"
 RDEPENDS:${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
-- 
2.33.0


