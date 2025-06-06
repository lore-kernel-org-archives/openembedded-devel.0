Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76628C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:06:56 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.26327.1749182814655805137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FqjLGrX4;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7db5c13088so1497479276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182814; x=1749787614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJyZK6FwkSpL/ZRDs/zQapXeCkF+j7XMf9YUMAVf0bA=;
        b=FqjLGrX4/HW5/5TS605C/lkMu0u30JKtaejTDuWS19ujrPtDufxp0vIRobOO9kdjlp
         EEjh5TPj6tNWUtzuQ0LvDTTwrGZcdva145XP47HOR92jh445T0nY16WH9Gk10dOSDNp9
         oE1sUEYnomr/0tqLeM+WAS4q6VEA6yMBQbYTOZPhmliIW4rbZxNw1wEMjtVJvYEUZQOT
         94DsjtzxAdH7zqOLvLPuBYNBy6ZdkIf5UD9VEO8PtM+mBl0NOeEVb90oKpLu0elTeQTz
         W1wZZR9yI0ZKtrlPeQjwKg4ENi4XOpZPjDbMkxHnd7kPc/yGCAr24D3CybfxdCZWalwa
         3ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182814; x=1749787614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJyZK6FwkSpL/ZRDs/zQapXeCkF+j7XMf9YUMAVf0bA=;
        b=muJiUFmjkuEsM6xt7Xd0shClrfwnuG7/i/MMgzxEaqw8VpvtON2YYVE4BS5hrjOj3x
         0KR+ACpQ5rexwXep+Qfnhxmi4EPb0QhNc6M+D964Nudss6gVFgkiV21rx7KMRx0wredQ
         D81tytDVrp6hqCb5jkFEnGfRIk5K61MvX9IfaXsaOOlE9yho5sSoFQNW6V385adTAldj
         pP/AQT9s0dLWC60Y3wyHdFgFZJkD99sAKyxitaMwzfbpuq6k6dVK1fjfU2rUb7zL2e4N
         Bm7PpdiY1T4nOIHy4WLXHs04ymM6Zy1dzDzO5CQjRJ8i+dpwctCQF43kaeyguqYCa5ag
         lTiQ==
X-Gm-Message-State: AOJu0YyWqvjj+cNK4IaAXFAO5pzxrSG1gX79QwENSh7N0QnFi0pi82hJ
	CzqglqUlK9vkaYOU8UeZZAIyqBdzb831ZWGADI16gvoweBwY/XRIXzIILOUqlu6J
X-Gm-Gg: ASbGncsXRX0jo3+TttQYE78Mbc8bUqJA9za4TF1rdW1RWawzWzkxPQwsr/hPz+9mQHK
	9mSKUxVR+38k8aDHsles6ZyU57Tb90+ZN4pw+nskljtmR/uCXeZi1OfYsKzUqtw0dr5yghh8UP1
	pBmkuY5gT6E+I5tm05IPdHJ8dUWRFbP0GtP7WLveINAs0pQIK3qLDnYpHaFT69Ci20EyQHjV9Rl
	cN1QI1ESYmU8zmQMyaQoY8s5js7FSgK8CbhqO6GPwcomc7KOY7/BEzESCBc3ATCVd+0bbaJFLSv
	AKtvbwj6UuM0K54p+NPA/l7EoRaZVzxRyDp3xRiJ0QrVtY7V5WZvMyvKIw2ksQDVZfsc1CU9Ohz
	RCh7VhPhbpQ==
X-Google-Smtp-Source: AGHT+IGb5uUY7T+gOpQTHc/2sIuQz6pgumlBoRmtSKGvfdpaWFQQJ916UyQDr4yLiywHJt3gYqpcMQ==
X-Received: by 2002:a05:6902:c04:b0:e81:8760:15a1 with SMTP id 3f1490d57ef6-e81a3810281mr2096156276.11.1749182813316;
        Thu, 05 Jun 2025 21:06:53 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:06:53 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/6] xfce4-eyes-plugin: upgrade 4.6.0 -> 4.6.1
Date: Fri,  6 Jun 2025 00:06:01 -0400
Message-ID: <20250606040603.2410505-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606040603.2410505-1-schonm@gmail.com>
References: <20250606040603.2410505-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117757

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-eyes-plugin/-/tags/xfce4-eyes-plugin-4.6.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-eyes-plugin_4.6.0.bb => xfce4-eyes-plugin_4.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.6.0.bb => xfce4-eyes-plugin_4.6.1.bb} (78%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb
similarity index 78%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb
index 6eaac70a09..61de603756 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "ad0ff05d88ba393b7c8922f8233edd33fc0a4e8b000b61de1f8f3a10c5ae5324"
+SRC_URI[sha256sum] = "5219b2ec0f203ab65990671a95b1607f539201e09e8910b854aea848d478cb53"
 
 FILES:${PN} += "${datadir}/xfce4/eyes"
-- 
2.43.0


