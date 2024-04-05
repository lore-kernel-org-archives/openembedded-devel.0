Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9FBCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:13:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14939.1712330033790319470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 08:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ktyaj87F;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-416317f5346so3480645e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712330032; x=1712934832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgXd8JSGa5x+/M8ZLgYiGpirJ34jiA2nwsYbKix1wNQ=;
        b=ktyaj87F5enraCSt5KsTuuf91s6pkcOCNvCYbOf1Z3pdJAP31T6MKgIWem4Q18bf1k
         D+EJpB6O92l9PtAHpegot6fz8NckhMj5ustKpmGAcXUjb18We2xD9wdf3qVgDy9DEAAO
         sfgRrMnbp2LEPd+l+VLoU6PWXihQ8TNJdknV+mBJIKkdamP7RGBOLWV6e+x6WZHSTdfi
         /R0jxo0f0A9TvO0eGrSoV+k3uYdZiC7bjJ3+qz+Z6cFUs2bUwdvpuuTlxr65QOm0m8zJ
         SBgA/Lxi7PwihmkiHcSz1GAe/IX6c+ZgvgKZEkOtEKDH+RY5gHD2CxGYBuW/PTfIYX+G
         9C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330032; x=1712934832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgXd8JSGa5x+/M8ZLgYiGpirJ34jiA2nwsYbKix1wNQ=;
        b=IRGs9lV3HBbEYWhc/GCWxV2AI4M0AYhGC+SLWdgIuJ7NXYT1+wR/HHhYHMwhXi0Vyk
         RfNSSucNuAIuVjZcVdG3Wt1+V3XfkGrwgYb/CB7JbgXxEsVd7vUxaG6d8xlU9UUUA9/E
         tKQ3Wphsw6SVj4IkJxy5dQkRycQlEjaQcvGkZ1iF0T3uffem4Ka3Rs1trwm3ezPf6Sgz
         9SlgvzhjJDx9nzMPQRRcFtPrOeOa4FNcIolN/Q4N2w6WsJWq0Nu6r202MjENd+ikB2G3
         pH8V5rcHhfJ2LuaQyetM7E1zHG3NJ91GggVQPEEhxVhnGp/UuVwRmqSce+1w+pI+Pne3
         2ekQ==
X-Gm-Message-State: AOJu0YzT2IkCf1+MiEQMi7b7klm2/swwXOBCFfrVcla4Liqh+4+c2ecM
	mKwFl04Lonhe5+6ZyeJPce4Jn/yIIEdjuYI6bim8GIpA6YDsvookTHUVKjPgyp4=
X-Google-Smtp-Source: AGHT+IE3x7BQ49alIQeuW84dz6HwsDJJV/ccJ5a2BVMhfrA/w4R/WarM9rYIxGLUzjpwD8DS3m7tyQ==
X-Received: by 2002:a05:600c:1987:b0:416:3219:176e with SMTP id t7-20020a05600c198700b004163219176emr1055234wmq.33.1712330032089;
        Fri, 05 Apr 2024 08:13:52 -0700 (PDT)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:3850:5dad:f4cb:5934])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b004146e58cc35sm6832756wmo.46.2024.04.05.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:13:51 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libtorrent: remove CVE mention
Date: Fri,  5 Apr 2024 16:13:35 +0100
Message-Id: <20240405151335.55698-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 15:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109822

The CVE mentioned in the recipe applies to a different libtorrent
library, from:
https://github.com/arvidn/libtorrent

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index c235547fe..38f5f63fc 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -13,8 +13,6 @@ SRCREV = "e60f222241319aaae482789517ad00ae9344bd13"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-CVE_STATUS[CVE-2009-1760] = "backported-patch: patched in our product"
-
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "instrumentation aligned"
-- 
2.34.1


