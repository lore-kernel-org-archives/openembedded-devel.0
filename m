Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90A5C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 08:02:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.7657.1645689742105686162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 00:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mNtSdx2D;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id x18so1183188pfh.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 00:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tdm7DNnl4AG4Psd0ipZg2JwmxE7z01SwcUeTkHTXRCA=;
        b=mNtSdx2DSIipmgwhSFwllGwtmorK2ku/cg6uVRhTL8DN6dSY4mlB3LtpkuPh+sRMH9
         P3FCl4eeTdUSuwPeX2MEL6yrHGK6gZyaGZlbOYRY2hFOM5ZC6uWfz2ZMFs+E6BMqE0rz
         L3jVDxaqt32Wbfn14bh7ipXTISbXv9Ztt1al8XR7xhYM9Ucaxtq9v6/526AaKmKHmopU
         deKPojyR+AotOYnsmU34Cpk5Y92Eyhnsy8eFfeJDEeYn6SZUECKVIDP8DgLsJrvPMBH6
         rYNK55/apWrtDFv5cAYD8CwygSk8rV7tEV+X69WHENRzoOxWlMBqafk4IooKqFRmCuUG
         yl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tdm7DNnl4AG4Psd0ipZg2JwmxE7z01SwcUeTkHTXRCA=;
        b=vRj1PQtZTrVrUs8k8EVUI2IDRehcjqIMIzpX14w3lZ78rJ/QW0JmhNTfy62R2DOT7O
         0j9DXgSoiw2eE0h+nJ3e5Izy6RL/za2LuR9Gm+/7JztRiNEuJmeb3iC8vwRpVhqLE7xX
         /4MbuGh7qr+rkiLrKxjEEi4Ed9FZZjGSO6bgWlqluuoviA+kD6py4LCZAPEphBC2MiH0
         gZTl8JMX5T0HWmosNhzCofpYK8CFY5lhvvauCc394UOVrySFk6U/NqEFP/aAHTzafy1j
         boQhZAGEk7su8gQBDPQgsskaN3pI/a6KgdRZlxkn0JVJ8aHHZR1DvElLcXP3LIXD4kwt
         sxHg==
X-Gm-Message-State: AOAM533LE8IUcJQv02c9HLFR8z0ijML0V7iaXx8FvpTokHj6aHsKK4aa
	I6ANS+jhyr0+E6VXsAWLjB3w9iIAA5yI6g==
X-Google-Smtp-Source: 
 ABdhPJyZUUpQtOZk0vZm/NZK9221BwD7+EuVT4S60k+nrBdFMvGosWh58a8aToFmaX7QUCr7ndooXg==
X-Received: by 2002:a63:549:0:b0:372:cef4:1c63 with SMTP id
 70-20020a630549000000b00372cef41c63mr1357643pgf.404.1645689741227;
        Thu, 24 Feb 2022 00:02:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 ck20sm1879689pjb.27.2022.02.24.00.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 00:02:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-oauthlib: Drop redundant nose
 dependency
Date: Thu, 24 Feb 2022 00:02:18 -0800
Message-Id: <20220224080219.1354957-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 08:02:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95500

Add pytest module dependency for testing
nose has been dropped upstream too [1]

[1] https://github.com/oauthlib/oauthlib/commit/037453c6f92b502eaae2acafe11161e4bb2e38bb
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
index 3e5d957c4e..e7f7f0b47b 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
@@ -14,7 +14,7 @@ inherit pypi setuptools3
 #
 # Uncomment this line to enable all the optional features.
 #PACKAGECONFIG ?= "test signedtoken signals rsa"
-PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
+PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-pytest ${PYTHON_PN}-pyjwt"
 PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
 PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
 PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
-- 
2.35.1


