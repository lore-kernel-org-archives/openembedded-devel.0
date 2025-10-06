Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DEACCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 04:04:45 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.web11.25744.1759723477817444293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 21:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSeTTPJu;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6353f2937f3so5032354d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 21:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759723477; x=1760328277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9I56X2eYSTS5yKH+r9TZ38kICBLOLG5CpP0Qc5cnEo=;
        b=WSeTTPJuRVs71DLW2QGa3EVhqnfUhOzNObfK1HSFOpl0HuvQ6yhyziqHvKDPpZBRLm
         Lms2Dmkizen5UpsRjfM9s30dg9XRuObVEjURLRHAtHoY0+5RLNasrm/SqepGHiuK3BwE
         MrsXqMSn9tNN1XHPPjhUYzS21VbaEKXe7XvKzVE4AeFh9q76wDkLZ8Z34qj+WGxWC0NI
         d0PuPRZjF3zlqodKOD6+YNb4TFqPG/7+9+l4bjIprdo1pOzz7d+PGxdsCQ765cWWfjp6
         LlbcxRsQBOpW+68h0dic06jH1c/AVZBhq4JmvpbJOiCMY4MR1NPUlb0YM1ZmJUgo3P6u
         Cozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759723477; x=1760328277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9I56X2eYSTS5yKH+r9TZ38kICBLOLG5CpP0Qc5cnEo=;
        b=Hu5dtzAAS9svXiNqn4j+cyJp4gWks9I6dSxFxIqBwgmbZfYRAVKPBDHRbruczCYxOa
         sB3mFFaUTYxiR5w99UFaetSw5UiMcYJ4cmAOvahig26xekr5/LvXqIBGIScs7vhMZkU2
         k3OLwWWunf2P5mw8verwucLvgIwqs+E0c7jxhlcAc1CQrOfhT1WMlyLGNpKqGax3RDNK
         LBkwNpVr6fwPZn5Y2BfdPj1fp3Yd+GTnGshLaMBf+D5CgjlZM/+c7v3gWYkB/LGyuCwM
         YKppA7BW8E080sAGErK8LmTs8yxEg0NgDN0bHZTz+zTZNrvO4lW6aLOgzQabiQwwdTDD
         V5BA==
X-Gm-Message-State: AOJu0Yy5djPxUMYh6+HR4DIYotxOv4yZzAsP1TXw2XzgTUo+QKcW8AKZ
	pJdIXBfAHl6+ym51J/NZK8AzB+3h1qVE6qCV+ajY2chO/uSg0ye7UqTST85Xt73t
X-Gm-Gg: ASbGncsOPyJasoG+cZnCgOPo53L1H5mvK1iQJd5SsLXpd0pOOWjmQw3sj32npagt265
	4FU1d1SAGDh93iP3E1th9QRuycgYePwxN/3Eund5oWHP/7IbEZULXG8RB34rxxgbn5K0Gd4oIuV
	V4wJCNszDiDiKt1zsgWn/zDjdd1f60kEli6cOMJB2IELqB23VxUPxozBF5x+grnUr5sz8WPmnVI
	kEqbujBSg6OcUfoNsu07V2zYzm5Q70Gt/6N720yKscV9QwUakjmPLhoV7h1mY6mvJw8zxkr40GK
	d/PeddSrFGua7u4GmRMVmo7ytrlQ1q41288uvf4CfVdJlVI9VS17pYRhxlTpYHCXbrvuo2Ar74x
	AG62ehKo6dLNYMvJGwkz/9obXIIZ+DPeJqgd8rFA98it+D8ScMZ/S
X-Google-Smtp-Source: AGHT+IGXVb8MncNYXmGZJJVpmJr3jKj9OjENR/1aY3+ir+OTE9l1qpfGHjauK5UzAOBlhk3cfjw5ow==
X-Received: by 2002:a53:c711:0:b0:630:8fd5:4cd9 with SMTP id 956f58d0204a3-63b9a0f1893mr8042942d50.36.1759723476349;
        Sun, 05 Oct 2025 21:04:36 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846a7b95sm4036889d50.24.2025.10.05.21.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 21:04:36 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v2 05/10] yxfce4-diskperf-plugin: upgrade 2.7.0 -> 2.8.0
Date: Mon,  6 Oct 2025 00:03:56 -0400
Message-ID: <20251006040401.83905-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 04:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120269

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


