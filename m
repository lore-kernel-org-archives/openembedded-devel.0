Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB471C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 17:11:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.41787.1679937074886860361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 10:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dqF+50h3;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id iw3so9062230plb.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsVV8YwWoAIO/pQM/18Oqj7lFbvP7u9pwPNlzeSy29s=;
        b=dqF+50h3DWbo65fbKEzuZUpm92otry3KkHa5HpYw+cHb0DesNgCvk8mstUDiXgUVKH
         s2bts/cHQ1nEOJJsY9KvVHUwnqBq+hGPe+JzfOnNj32S+AbXqPuOsiXf0IMyK1d8fLGK
         OFQxfWb4CzkYvI1HSsSEijyMzA04g9LhC7IYhuflEEv6/WS6fA6qeslmITlUy2IHogzt
         iU446aWMDF/kiZ5idnbkkW8zIg1cgny/+qcWMxxvZc/gameSAUpzEiflompPMpmAhfZH
         kRlZ+OGUVWpjl88+X2PrQFvHhUxa7aZwocXrxNChhyt480BNsoIZNoZ0AoDIjWPwKTLX
         IL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsVV8YwWoAIO/pQM/18Oqj7lFbvP7u9pwPNlzeSy29s=;
        b=6jwyaa44mkktVgy9mZt+fPfqz3ESSPQpZZ8Fz1s1i5sGs2KEDwxhMbn0hAXzuPNPG9
         5wVe/2QmZHwmLoni2irJTkwHPRTwi7iD+fb/2UWDxveZf0pJWNYGus/2CkXaLgFOdXo6
         DtMoVz4bUD7oeaOWLi7bSemx/jU5ZZ5DyI3A3AHsD9lvG/8OChElkrLo5TzhztTTHCMX
         ZIOxX4B9eHxkmCJyo46PFaNnWSLtlYgpJH85GlDULDvfdj77QQHqGoo+vIxqpgtw/N5V
         ua1R7knEFspTntnIMZaUMPsaV+5T2afIeYYI1AT820ZlZaW+g9NDfIMfzoW3KfE87wt1
         vDEA==
X-Gm-Message-State: AAQBX9fYaKAvqPO+At6JC7rpEdLBMFOWC58UjZr2eJ6XxkekzhptoV5O
	VK8fmCLCLa78JHit5mX8BeA3YzJvhAcZ6Q==
X-Google-Smtp-Source: AKy350Z0Rr15QlGqJwJH+lK1S0HK4CqFbzlJ7lToKyIyj3STvvItsbLDmUplMwAkC5JRzchy8ntzEA==
X-Received: by 2002:a17:90b:390d:b0:240:75de:12d7 with SMTP id ob13-20020a17090b390d00b0024075de12d7mr6892834pjb.13.1679937073459;
        Mon, 27 Mar 2023 10:11:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090a2d8e00b0023af4eb597csm4543362pjd.52.2023.03.27.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:11:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Update to 2.10.34
Date: Mon, 27 Mar 2023 10:11:10 -0700
Message-Id: <20230327171110.1765739-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 17:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101790

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gimp/gimp/{gimp_2.10.30.bb => gimp_2.10.34.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.30.bb => gimp_2.10.34.bb} (95%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
similarity index 95%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
index a73de1e3ff..76825d96c5 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
@@ -44,7 +44,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
+SRC_URI[sha256sum] = "84004642d351b398a4293cd7fd3592044a944f05bb52850ee6068f247c657aa3"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.40.0


