Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBDACCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 04:11:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.25711.1759723884029013551
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 21:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSz4+0aA;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d6051aeafso46467857b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 21:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759723883; x=1760328683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9I56X2eYSTS5yKH+r9TZ38kICBLOLG5CpP0Qc5cnEo=;
        b=nSz4+0aAnhMreSkDKvBvcpgvFVNG7uA478qXg5YjvOVjQmELEhXbQlicVkLIBEuZi6
         BNrhgRIEh7gJIwhOj1pQw0mbpojleS8h/ZRi8UAHlBxxF4X8Y/IVv60IsoI7gmBT1Kkk
         DyFc2aKBCuFbVhUOGh5+c8cvboTnwOFF3OXpcp39jW3nodgkQsVis9agFfToaTjOxjvi
         8u3H+CRGqx25Qps0slQv5GFYIeqDz17dNv22XgYbv7qCYNjvEvAZyFK4+s8SXpT0mPYA
         L0BacZ3qtC+Bad90jJgDDJq0nCjpAofAwOhIya9BXOZ9hrwb6YYta0HASeSxz833rWpV
         yrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759723883; x=1760328683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9I56X2eYSTS5yKH+r9TZ38kICBLOLG5CpP0Qc5cnEo=;
        b=fasZp77FK7IK9AuOTqkaoOa7QRMpWpnpC6EPcflfOE1ooxYoeDnz9WSbQHrjXaK/nd
         gH1Bzy7vrlvlhhpA5bbVzrZBpKnzS8ozttliy37iOwZ3LFg2QnE9uts6MXK3Y9ktX0MO
         3qE+Eek8hHuRPISyzdmABkyJCrWeie1REupd8gJpuLyFCyaUhLhCEz1kpNLOYv2nzc4C
         FYZlUxxdPf+UDEtHLTEieJ+odxlj42DDo/xlUds+f6015NVYAw0RYcJmXXUkCFn1OKuN
         lef4abn0SVicOJSRD2fQBgg7UqooMGwxCBl2qWw8z61COLbaktK6tiEUZ+g66SKMcx0B
         Y1tA==
X-Gm-Message-State: AOJu0YzRJKO6AUGsqc4kOHiumrH1K+3F7U1DSurh1DEKCT1NAe36AjTV
	kcJ31MdH8Ldx+m8f6gY6xFR+Vlrw5NJoy/5+wQrkl7CQ03XogO259P2Ea5lf1NCz
X-Gm-Gg: ASbGncvfy1KGCMCuA6K7vcc9bxbyNPL4wM2C8u5OYSZgFIzBt7kTdIfGw+lbFMoWQ40
	RAJumfIzTFrIpvPI+j+tLmSmNa/v4vTpMZMReUN0vT+Li3dLb+Q0dwu8afoPS5Xs96RRO5cOu2Q
	s8v5Zgem0dqq6sfrAMT+jj91b0Z7Z345DFFE/nGv1wlhJof+3+Hf4t6cUsqXuNhCWnYu2hNUMJz
	3PbGkhJ0oZjzsr53VLzYQnSVeGsNuHM+MCtetrZVE9xHcVBlIOU71hTTRDzHM6Y2Y3VlT2MA21K
	ZMpBHYlbC74Gic40zREhfQcj+eyGy+isTaLAMsThXD5k2S+MnayGS6ftjuNkwRkFLsCLBXpl40g
	S0/3rBgVuyOmtNaT46Dq9tKvPa6Vxz671CSCSZZjJx3X9vuCEz7sa
X-Google-Smtp-Source: AGHT+IE1NbQWb1ITlX3tf+2d91akcIVzAMr9v382iWD28F0E6z0hZxd/Cx/UCwRo3+VK/n73silRkA==
X-Received: by 2002:a05:690c:3505:b0:721:5b31:54c0 with SMTP id 00721157ae682-77f946d9a8fmr143968327b3.39.1759723882544;
        Sun, 05 Oct 2025 21:11:22 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77fa13b612asm24313037b3.65.2025.10.05.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 21:11:22 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v3 05/10] xfce4-diskperf-plugin: upgrade 2.7.0 -> 2.8.0
Date: Mon,  6 Oct 2025 00:10:41 -0400
Message-ID: <20251006041047.84430-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 04:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120270

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin/-/tags/xfce4-diskperf-plugin-2.8.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin/-/tags/xfce4-diskperf-plugin-2.7.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...kperf-plugin_2.7.0.bb => xfce4-diskperf-plugin_2.8.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.7.0.bb => xfce4-diskperf-plugin_2.8.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
index 583aa9a006..a6972727f2 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5909a65341a6af4d7ff3c7bb87aeac91c763f69b43ae9dc4a10668ac226fecc9"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI[sha256sum] = "3833920a3a4a81b3c676c4fab6dd178f4a222d66f316a0783a9149a0153b7fb6"
-- 
2.43.0


