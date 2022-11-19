Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A152C4167D
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.23272.1668873493447492594
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n/deuQgQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id d8so5392596qki.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qc6MaS5Z3Qd+M0xvi0o48s/w2dlcYjs9uM5uio7081U=;
        b=n/deuQgQ3iKwi4wGWisgiVLE1OHdj5F9VX96nmye5ItFUubO0ihDpDq9Xfntia7VJN
         5vnYO3LxdQYG9VdLfWMKQL3k9sWkkVlvk2AdV17CVKb305Hb/iDT7IJbSnYFRMbSsT+h
         ek0hOiOzjl14eL50/cw6kc7+5YI5Xt0oC9ZXLAjJYvaiiAhFiuSHThRTDDUZdsY9LB0f
         PCmm0fzypyNNz4u9oOkyrVrvPMXqPqq5Yn7tey03E51hCH0K0WrP36Yp0jDVlojfgEVi
         2Q6pmby3Q6jkw9oLAaPqiyStp8u9DmyBCgd7aYKhoMmNJl2X8tZZAlw80Vs3352RA1xe
         GZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qc6MaS5Z3Qd+M0xvi0o48s/w2dlcYjs9uM5uio7081U=;
        b=QhUSt9xkzP1aqLwx7UOQryNfzj6jc0Ti38lbzFxiVd1ZgmAsZ1ch2ZYo7hLXrRRqGg
         IAOBf0LRi81Fb//jWq13yOn/5n0fqCkCw+bkV+FL0lFfdxFcfMluy+0xLI8Iu8maHglw
         j67TAh5axyxFnFUlvOLdunvQGwI09LEfhEu/+j0g1+/6jvJ6Sk8wXRAKnMPhmLDvJDhF
         mfNy7nYbyCG7rL9q3g05n0URLt0DAjFMJ2plxLUwd2BeRqM7DvEF8/STfiKB2ZJkUMjX
         IvUtM+2CJNsjsYVeICJskj6qtlySBSQW/gYj6sY1aO2IpuXzJpfrRcLqU6bymDkqOsAk
         tUIw==
X-Gm-Message-State: ANoB5plxEaAhuq7eLAtuvzvQ/Bd2c5nm1R8m5rMkijcgOO/p5XcME5dJ
	8oEu4Fb0hLeZE6I4fI/V+x5i0FyNjTbm+Q==
X-Google-Smtp-Source: AA0mqf4wVc+1NKH/H0dwXpzpoQvNfR5zT49HhdZHuvsGPj10xeA/qXPD8Q/CD3XrFdhy5hJpHUSOew==
X-Received: by 2002:a37:de19:0:b0:6fa:8954:b767 with SMTP id h25-20020a37de19000000b006fa8954b767mr10188516qkj.50.1668873492074;
        Sat, 19 Nov 2022 07:58:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 07/35] fvwm: upgrade 2.6.9 -> 2.7.0
Date: Sat, 19 Nov 2022 10:57:31 -0500
Message-Id: <84dd7497cbf8dc82d3b811134296fe76ffa8784a.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Bug fixes:

  - Fix handling of configure's --enable-mandoc/--enable-htmldoc
  - Fix crash in FvwmPager when desk height or width is 0
  - Added DoubleClick time to man page.
  - Fix to FvwmIconMan to disable a SizeHint warning.
  - Allow for reproducible builds.
  - Increase the number of supported mouse buttons to 15.
  - Tweaks to configure.ac

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a0ea55c1aa00ad95513855c384d097412ac6143)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} (98%)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
similarity index 98%
rename from meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
rename to meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index 123af4d3aa..8daf38a0ba 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -36,7 +36,7 @@ SRC_URI = " \
     file://0001-Fix-compilation-for-disabled-gnome.patch \
 "
 
-SRCREV = "88eab6dc16da6e5dd25fe97fbb56b96ef0d58657"
+SRCREV = "7baf540e56fb1a3e91752acba872a88543529d46"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


