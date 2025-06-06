Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7410FC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:07:06 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.26231.1749182821475113897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEAa/VjB;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eb00so1426428276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182820; x=1749787620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKVeg75VelhRl8aN9m1Lm4goH1Uto7GIj5G1gkyuLFw=;
        b=CEAa/VjBN5CECw3csKx/QGRUCK0A3STAUgWuy+zl6QOBDRWJsp3RayUyqQqVabalqG
         Hzl+SVxp2ImNmv6xv2l0wJ8byJKH65cPsM+sFz2ORI+Q4SxwZlHNzSOU3rFtViZS+6XV
         s8BHvDKmDfg1p4eWx/Hbn9fO3bsqmTdcdpSUGJGsZscJXPmdgg8DK4CiyDDBnVPJcB6n
         mhoVjba5gfWwndU1A2GMaC1+3TDlHjNYqBDofmKVoIeWZ1LQ4JQJv7zEVzptQ7TTB+1E
         G2AGxJc3JJx9Tw90rkozUCO+1HbClHpI8MDPbyHY7rrhn5rbo+ySiQZeEBNtb7tbk+dq
         rUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182820; x=1749787620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKVeg75VelhRl8aN9m1Lm4goH1Uto7GIj5G1gkyuLFw=;
        b=K4VK3Bbdxj+6y4ZaEu/8SiQ82P1ZA2hEDbgivtxejSk+XebBpZdsmpm2NpIjUzigjv
         zoVeYcdVLygFENRLU5xRiIF3mvg2T4Z0s+IZBtNA+DLfuluNl9GUyIQ9KAu4mlqbrPVI
         5z1+xu+6/R/RWAe1VKF741vBTQeIlpBTp5eM6nS/E+mNkFgQZAwsbWuJgvUObw2/tuC4
         2Ybp0wonzHITxakMewYACqdrO01YvXPuwAvKLbuDTqyMKC4zamYUEj9lQXtLTFJQCptq
         wv68KWPZ2BcYDm/oTYLP12HTFTEsyAKp+HiOUJzUNzlGthsfnoMcccshPcnlI2JOdkvP
         jF5g==
X-Gm-Message-State: AOJu0Yw9DRqJoqHgo0m3QJqLV0rnllGB740me8C4EZp84MTzWkJzmELX
	2mSA5lpv27kJL9ahEw2Pdn9dIXcIF1RhG3S9cwfJ5N+q7EsrRrtUXJHpvDNXrdX6
X-Gm-Gg: ASbGncuInkOyOFOi8qORMluMtdGtvps9fMtEe6ICHQd9+ssdJWEgifomhRAOnXpd6gL
	Q+SYurXjWWMBnLHBHoX499+FC/QD0Fit5jmSi4YvYjXq0ghsaX+KKG0WN+8RPO8utiQUqMAyglQ
	alxjtC6GDLD0yTZ4GKmsJo8SLH1K07+cOUcSh8vO5mfEb4/gwH63szWYND5oH7tcDuc8lvNk5lp
	KeBJKOdczo+hXNRz3zpaVjVe7R1jjvqtkSJfnFlxC9h09DHwVPkSlDKSxkeVXcVLx+Qo3y2UK0j
	EG67YhiQEwEtcJsSY/m/bivldd4xH/l9xzHWj2EUI7agB4JnZZ7X6QIN2vGbsa6EehTy4uYJQH8
	A2jo0GTargQ==
X-Google-Smtp-Source: AGHT+IFg2EXvqwjz+yX9sSHPLwhkl4eepOSpUo580Zn+xZ/6tYpRLzoAAqMwZfKSew/p1AG+/HFemg==
X-Received: by 2002:a05:6902:228d:b0:e81:9ebf:f5ed with SMTP id 3f1490d57ef6-e81a226a62dmr3146482276.1.1749182819991;
        Thu, 05 Jun 2025 21:06:59 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:06:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/6] xfce4-fsguard-plugin: upgrade 1.1.3 -> 1.1.4
Date: Fri,  6 Jun 2025 00:06:02 -0400
Message-ID: <20250606040603.2410505-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606040603.2410505-1-schonm@gmail.com>
References: <20250606040603.2410505-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117758

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-fsguard-plugin/-/tags/xfce4-fsguard-plugin-1.1.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-fsguard-plugin_1.1.3.bb => xfce4-fsguard-plugin_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.3.bb => xfce4-fsguard-plugin_1.1.4.bb} (79%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb
similarity index 79%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb
index de8d6786c2..d94ccadb5f 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "84ef8bb4752292d64c0ef101badf7b14448790bfa0a85de644dbfa22986ec258"
+SRC_URI[sha256sum] = "24b3789be6de92678e7036678530c4da4b3838aa3cda428439aa8d140704a4a6"
-- 
2.43.0


