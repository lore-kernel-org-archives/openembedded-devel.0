Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B72C02184
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.48489.1736119448120022646
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OXrS2Fg7;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e4419a47887so17151256276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119447; x=1736724247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwn1Kq99CB9RmePvUtbdjDhbtanJt3t5FRxMNWSHTHk=;
        b=OXrS2Fg7UVcXG1oYvTS5peZq+cyoNnYT2TcrjVCDmVieSiYvRQQMlYlxJbBY6eErGs
         eUz/6AlV8Ff/uk2WkBHCaZ0fcePo+DkeGgJGwXSA6UTAtLZfgEZaJJVA/93+x0dzqPDf
         cI4Mb55ZAvdxAIodIUuzQxrnY4uOissKQaD6ig3op37tK417/vh24GjAlsTkYScEtX61
         bdaURTjHh0Nloh/1FpB4R5WZJ9byUCUT0Edvc8lHutYFKcMk+ZPoYILR1S88McJQEPbw
         QSK+ofpxR+z6ktdF6jn7ZCRf3opIQwfP2k5ebH8KakwLTWwqoheP3DA677iNHiZiMQQB
         2l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119447; x=1736724247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xwn1Kq99CB9RmePvUtbdjDhbtanJt3t5FRxMNWSHTHk=;
        b=LddAwUgL1csnWLSdQ/ySufOct7T32uICvRYPzfM+w8c3Dy8IDPLxgM2cP7WRd8IYvi
         p+9kOfu8VFZFDUQL1e8vJp777BNuwNeNe0l8Gkv6MPpgwmWvJbiBWoKddtpritdraP8o
         vG7U9DLBZJuACJP0w2NfyCvJIBKWnEz0+SpcOWeqq0NjkX7AevatWzchengySYghgM2R
         FP7pR03IZJVlNygvgdle5CWLP9krMxMNAdkBUO6/qWgrPL+GkIoI+CWH2cyt9N/f3+oC
         Xg5cvCM5xIkcbVPvgSVWeVcojm2EqmJk2kwO4kVHipjYiF41xjAo5DCbUKV48M37pAFr
         iAzw==
X-Gm-Message-State: AOJu0YwAmqkm8qe7yMq0lL7jUZVdeuz4gSVotdrQX3Na+hWlHifohcpn
	1EKp34Ch/jj7Y+Zj5m/dGGQMmTNH/J4yq9qI/eTCb9AC/HGUHAS6z61DOgL7
X-Gm-Gg: ASbGncutUhgw1jgZml8l2eWh4tzGlnIWc0TYSUH6opZlwJ9wCzIp7EZto2RCqpNONsP
	mEFk+t7IhYscr7SU2Z0k3qwyREZ3cOCTGdhDbXIzvP0DDBBahlE758UODVssqUQ38Fl7DhQWRUm
	Vj383wAaWraPj/sMRprDxAxeaGira3Gru26S7JMcdf88pmNeLPuCO+VxTZjpc3dMTk5EZOGcyzH
	SFLHpMlp0QaEYwyW3RpUyGLjOGj1RbQtgTS5iGWBpoPU1fyKh8Ara0EgxLJ6W+3u31OMQ==
X-Google-Smtp-Source: AGHT+IEviugOv44jVNvu/fNFo3xjCCndLw2KciTJNK8moRIlDc9U5iNuuY6UUY9ojPnSz4ZKno0EVg==
X-Received: by 2002:a05:690c:6a83:b0:6ee:66d2:e738 with SMTP id 00721157ae682-6f3f80cda17mr476351797b3.2.1736119447162;
        Sun, 05 Jan 2025 15:24:07 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 13/24] apache2: remove old version references from CVEs
Date: Sun,  5 Jan 2025 18:23:46 -0500
Message-ID: <20250105232358.1502946-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114643

From: Peter Marko <peter.marko@siemens.com>

These were not updated on recipe upgrade.
To make maintenance easier, remove exact versions.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0e7733f1b8f51949ec91d82267d5d864ac0be16a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/apache2_2.4.62.bb        | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 475f77d41b..3a988f2494 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -37,15 +37,15 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
-CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
 CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
 CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
-CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
-CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
-CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
-CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
+CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.43.0


