Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A44CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:24 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.23898.1759715299904253126
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VespmHw4;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d6051afbfso47562257b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715299; x=1760320099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s43EPQJS647/t9SdTM5lAsQwt/1T6PzhHLHMXB2pYY=;
        b=VespmHw4m5lEaWFVO15pdVyCaSdYJASWbqnQ8EErB4dOvgoNjG/5rTaP2Tb/7bF8A1
         pcjHp9B4jQ/+9P3e74NFujnl0J0lvzFNpr4G3AqS965xis093bCzSmD3TH+yp6I3s5zg
         3PWvO7/s/GVeRAA+pnumTxNDffxLuyrBS6+Beljaty2kvPJsWFfngHB0vyhp9VEdHCy6
         px6qq7lWg95ICo03W/iuuv/9qODftuflrvAmacmpcywx5tHCTWDTyMukunCUS+awd/73
         vE5eMx3cfEAqqkfYXoNoj70BvpGTeiVbQv2qfRo14MaJCm3yWIuzkpzjldiKmwvHggUX
         TcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715299; x=1760320099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s43EPQJS647/t9SdTM5lAsQwt/1T6PzhHLHMXB2pYY=;
        b=Mrwt/PV34fbd7USSol4lKbxSnkbU2OhkjpWfk1MvPuKpXqcODTopg6pwveEgXx3Vlc
         caKm0JJR72mM1i0vzqpII1kAP2bfao6m8g+IBLyyvtzAolKJDt1ezY3pJHGaOag05ry2
         b3Ct6HL18Iyh7RnyRjGhbevpMgk4gkUv5TLvlpFh8X+72wH1VKMM5DTdtE/6qZ8ecYlW
         7iJ2UgS0565dJF/ZScHX/b4x6kszxNhg0kn7ycTbIih5jHb6iAhhl//zuFpjyjyOndT3
         8jAPFj76CfbZSFTmFDTqZqRnm9qTjr4YLUVfAxkKxSRoPPHGLtJ5EjbMxg0zJnkRgstZ
         Q5og==
X-Gm-Message-State: AOJu0YwLJYEiuRvWln/va3SNPa0lvwTmLLkmeenouWXvADbGoNelhniL
	jMAgezdudZ3ZFRU4nGeauOBmTVOA5T4z7ITgMg1Mklb92cUNvjTRu04bAZ50Rn6b
X-Gm-Gg: ASbGncu+GJ1m6AqXvHljlHXNNw12SwsMnYaGa94Sp5rds6sPSrtdqsvIGfC/6IQztyu
	KRBjwRT2vlIDclWkkXaxAjGJT2Hp7h7SsiLb06m5gyaWK+w8yL05fPR96ppJ0nsAai4098Mteee
	0yAWjRVGZQ5JJhOrNJQ5Q3k7A6LJED/JsPcsWGKQCld8WQIlr0U4CZq5I8/zqLRBOSJnQ/E0N/5
	8FtOaHAP51z/c2oabUPf6ObhBYdb2VfpWIXqDp74dW/zfbalEYuw2cMD/TPtZPs749ivqA0XVIT
	h2u72roh8UMmrSWAPyqO07SDIKVW3u1CZ1kggN0PT03aHnTqf3A3nzInSPwfx4ydqYHzXyUTeUP
	vA29yRe9K7tKBnhsUz92+ZX95f6KsotuoV9Fq7MyXxQFiz/CBQkqF57mKD+uJ+UU=
X-Google-Smtp-Source: AGHT+IFInz1ABjbtw3A8ihGK7K+pHcLn4hEuv80/z5Bf28+zJdT/K8GaRjAUJzb76Ah8KqSPfTLd8A==
X-Received: by 2002:a53:c906:0:b0:635:4ed0:5728 with SMTP id 956f58d0204a3-63b9a1076b6mr9264233d50.44.1759715298499;
        Sun, 05 Oct 2025 18:48:18 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 04/10] xfce4-cpugraph-plugin: upgrade 1.2.11 -> 1.3.0
Date: Sun,  5 Oct 2025 21:47:21 -0400
Message-ID: <20251006014727.58960-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120261

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin/-/tags/xfce4-cpugraph-plugin-1.3.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ugraph-plugin_1.2.11.bb => xfce4-cpugraph-plugin_1.3.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.11.bb => xfce4-cpugraph-plugin_1.3.0.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.3.0.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.3.0.bb
index 052046b0c5..b4d4653225 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.3.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "58aa31df1934afc2a352744754a730a3d796b1246e12c7a5e86f7b6a403ca20d"
+SRC_URI[sha256sum] = "c3305edea13ae785ea8b7ce8efbb40b5d5cac69a6f8bf790e4f2efaa780ca097"
-- 
2.43.0


