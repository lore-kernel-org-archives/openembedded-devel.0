Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47206C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:53:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.57812.1702626777405890972
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfiv1mNN;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1da1017a09so40891566b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626776; x=1703231576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJgL6KPR+MVKUSmbWPrVMPX/s60jKY6KDOMyvq4bi/U=;
        b=cfiv1mNNqaqgaLqJmlwHF/TVSuRoiLHWaLdCHPwZVAjnqUhxcWzR9bMznQfARG5dHp
         eHR4P/g0zumw5C1ety9kAqg5+BY4s3S22+mGpxvVhwchckOJTnmjOUNp5d//IFd/x3nv
         beA3Ev7hGg4KxW4dIhcW4xtIdyXbv9+HqrqHMzcrvPOV+LGP8uXw5EzO29JDJwMyCi+i
         BUyAijFzK3/ihlMy/2/hgq1gnWMkrfYBCv6A95R4zPvoPDOmZSR/56e386mEvaPnF5iK
         r6J8z1wzJYwGCl+uWG0pm3wLunHI+eQmqFK2Qw/N3GvD2fGpt4Jjrme4yy3PX882X0SI
         972w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626776; x=1703231576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJgL6KPR+MVKUSmbWPrVMPX/s60jKY6KDOMyvq4bi/U=;
        b=jVMZ/pqiGGSQKTH7yoDriS+pMTTPtWVYoY2k92R4F8rR9jd8pDgu3Chz2CbSUNbX82
         i1uBrDKARF9D5uw+zBUCydi1x6zilKleZQaoddNgCinnRqRgYUmb6P5RZpkzEan8LKUL
         HClnUOIuUzqRZYtlMnc0sDu5iJRMWuWuHOF14MGeeZOidEOWjFYE51LgACxU7ZCELk/U
         LcgKCqzipGsIsU1xoeI7S7SA7d3PNvldwoVRdgEFDIT4Ex6YNnk2ysIc6gvPqkm3znYl
         jETT0afJEeXKHbDUzAJxn7Sz8pCo7SWIZIKz+hG+0PF4vukYpITyznovghq6MmhnIMZa
         hP2w==
X-Gm-Message-State: AOJu0YxW+GflyAJ2PNI4ztQSGDh28D/trtBoF6SUwC+6kNzdtcztnrfK
	ol2oun6+N7dBbAFKC3M32eeWjjj5xwU=
X-Google-Smtp-Source: AGHT+IH0zvpyqacAh8qes38jz7zoge4klCPJpgLtLPQmPll4FOps7Wyt4avBnQWG4XZ6DRhlfPTvJQ==
X-Received: by 2002:a17:906:5199:b0:a22:e615:4a38 with SMTP id y25-20020a170906519900b00a22e6154a38mr3342507ejk.81.1702626775880;
        Thu, 14 Dec 2023 23:52:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/20] gstd: correctly delete files in do_install
Date: Fri, 15 Dec 2023 08:52:36 +0100
Message-Id: <20231215075239.3049865-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107510

gstd always installs these in /usr, so root_prefix would
work only if usrmerge is in DISTRO_FEATURES.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index cabbf2cc1..87792491a 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -20,9 +20,9 @@ GTKDOC_MESON_OPTION = "enable-gtk-doc"
 inherit meson pkgconfig gettext gtk-doc python3native python3-dir python3targetconfig
 
 do_install:append() {
-        rmdir ${D}${root_prefix}${localstatedir}/run/${BPN} ${D}${root_prefix}${localstatedir}/run \
-              ${D}${root_prefix}${localstatedir}/log/${BPN} ${D}${root_prefix}${localstatedir}/log \
-              ${D}${root_prefix}${localstatedir}
+        rmdir ${D}${exec_prefix}${localstatedir}/run/${BPN} ${D}${exec_prefix}${localstatedir}/run \
+              ${D}${exec_prefix}${localstatedir}/log/${BPN} ${D}${exec_prefix}${localstatedir}/log \
+              ${D}${exec_prefix}${localstatedir}
         rm -f ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
                 install -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.39.2


