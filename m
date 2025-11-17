Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE1BCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:34 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11266.1763391149838839772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8X8v46C;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d6014810fso34450747b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391149; x=1763995949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4vk1BqE7l08SbayzURGZNIWtfNJTlvRE2TrLu3+Ldw=;
        b=L8X8v46CTNupgQ0izEEsJ1umc2ITDVP35dNuSy3+gJ7zfkQjUfWzgVQ7qfYqrf8tE6
         +bC5DnGrAAb6PQ+DWMrF88Wp0PLGm1sVY9uu/JBDvfy0AL6pIjzvw5R8/yY7CxtkAfdj
         XyghymCyg/Rxih4K+Hw0YkNhTi7hENZXUqg2hXT0fr6ZSZd3jMzyjATkvDV+TfJ8EdyT
         wXdWfx+pCCRVH0OD6CYtfRlJQrIUT6NZqqVgSPAVnjjwJhdFrHFnDyS+2x2O+yWcjn5b
         T/YRWCIcqC5q+HRbtiBSQTCQPp3C3rezvrFP+IDZdUzi66v8xbu+E6Dkj2ymTyU4KzDh
         0A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391149; x=1763995949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4vk1BqE7l08SbayzURGZNIWtfNJTlvRE2TrLu3+Ldw=;
        b=DC6qyLnaya2OSHDNU8wPXaB4CRtBjtJeFG/x00Q0qv5414BiZB9UKjJ2REcAIokdEN
         9I4JzkST4laS7ykyHLZDkzqEDlCBT3P3rdavoyy1Tqt9OFehXRkr+BWDP/4T+aPNp7pV
         86onAyJrqvNTi3g8NfVPFWjl5ozzNO4yKYk+Nz4L/LvtUr9BDGn9IrV7GPuKzTROjMwd
         JHsEfJEODRU+ONvFH/MHQyh7j9/q8+TqxSAgJzPW+aGEPScN9DIDV1oVpVzWwBC5Ob1O
         X6BAwvFp7fAPJem91UuklbCUmxEr4Hop4ygIK/uiCCs+u1Iw2U1cXSAEBYQ5b01wKO3o
         nq9Q==
X-Gm-Message-State: AOJu0YwLgMoF2aIhXyfuSJwdhX8L6KvknFNKwQ21kL8DkFrWgHxZUr0a
	T3fpX8/C2IsT/Ci2Sfk/rPlkyu9utHo9ZugP5sgwM6U4GGPwt3A/P/iXu9k+JvRw
X-Gm-Gg: ASbGnctb3mzF8yDRqYT3jIifI1JiJ2zm+MVKbNVZBEHlBHmDx/s6eEk06AGeCh40d1h
	bG2vX43tAaAfj+YqIlUqQIS3vcuZPKVNmqQHDwVRon4CnrKj+Q6McFqg+D90w5ui8H8KsEJRQ5Y
	97Ad1QnhK8EZz41rVGM0T2xSud/SviMPGUaUwr2MOGhMCWntWkZ1wWRnkB39oG31R4f8PIxB+Ag
	D3Ou5KbXM52fkeg5JwovAOc0ijpk+QW+Aiqwx2G8rHf3KBOz5bV7BcsTLaRTQxQrLnZnMZmv1/0
	NRqPDxiNqJG0M9kG2hygSuQ1ZobIMceRGNUr6oQda1RKc2H/FF/++kaVmcqnoIyAERGFSxaAVIj
	qzMdsKts3fZjHYS8hf+qPhkM6E5+sHdOmY8BqO7UXTVWpK8mSxt2APdkw8dbnuFdMXvIOd5RwLF
	H7bdpXi38OH5ggf4qMhjXV/dVdd2GYhJj+TQ==
X-Google-Smtp-Source: AGHT+IHjRMNcjPyWKRtyT5JIQyc1WsoaPYjIDcSVdKXqcALvLXcWD5d+L6U+gVtF3lfx27e3uq+YFw==
X-Received: by 2002:a05:690c:7084:b0:784:f14d:6946 with SMTP id 00721157ae682-78929f0ce4dmr103524667b3.55.1763391148447;
        Mon, 17 Nov 2025 06:52:28 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de2bcesm42904227b3.6.2025.11.17.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:52:28 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/5] xfce4-taskmanager: upgrade 1.5.6 -> 1.5.8
Date: Mon, 17 Nov 2025 09:51:34 -0500
Message-ID: <20251117145136.132886-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117145136.132886-1-schonm@gmail.com>
References: <20251117145136.132886-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 14:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121782

Add a HOMEPAGE while we are here.

Changelog: https://gitlab.xfce.org/apps/xfce4-taskmanager/-/tags/xfce4-taskmanager-1.5.8
Changelog: https://gitlab.xfce.org/apps/xfce4-taskmanager/-/tags/xfce4-taskmanager-1.5.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-taskmanager_1.5.6.bb => xfce4-taskmanager_1.5.8.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.5.6.bb => xfce4-taskmanager_1.5.8.bb} (60%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb
similarity index 60%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb
index 4eddc9fcfc..6490e087fb 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.8.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Easy to use task manager"
+HOMEPAGE = "https://docs.xfce.org/apps/xfce4-taskmanager/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
@@ -6,4 +7,4 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
 
-SRC_URI[sha256sum] = "20979000761a41faed4f7f63f27bd18bb36fb27db4f7ecc8784a460701fb4abb"
+SRC_URI[sha256sum] = "14b9d68b8feb88a642a9885b8549efe7fc9e6c155f638003f2a4a58d9eb2baab"
-- 
2.43.0


