Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BADDCD37B2
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 22:18:04 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38458.1778451477733756048
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2026 15:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pChrPSct;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bf14e33f5bso29181777b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778451477; x=1779056277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFLYCHreaJwhmbo+xbU6jTTWbxjxhTZ4Xgy/cLelhOU=;
        b=pChrPSctTcdpdduS/Tqpun3DbF63nDrjokJWtYSJC0u0u3ZWOH2ZRCb7+AO1HqkSWW
         qKcaCUPkw+nWOQ8iat8xBgDjxJZ5A3GrL5/OX96XLXLfAUxY7pkOANwdUo0ug3UjXdsz
         KB5BKLCVwumLJSmHRXxErWyaJo+tVCk0kp9dsjCJVN/wpFIeTeK3/6Msn+msjC6VdinI
         o2o+vBuCUC7FlBRW3/ox1KrQdU4lc5XxqgY0m9mBFDRkbEFOFkna+7LQzZSQYtQQlqgz
         A8FHcKIl/34j/rdtgfadot414djGxk6/emOb2G63qhlW31PIXhfeWcYehTbOextbPGiD
         ac8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778451477; x=1779056277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFLYCHreaJwhmbo+xbU6jTTWbxjxhTZ4Xgy/cLelhOU=;
        b=iKC2e2Wrxg7JG98M99LQXX7A8guKJoU+XpFAyB7H5VYck8CU1YJusyb6CpRrhYFAHU
         491r5TFJZvPJtiW4EGzxducUjWDYKvAy84+iHL8DCjQ5jw3t1MAxd1zEKwJkEHUkIbFe
         fJyNEvgjhE0/UYukmwsADF6MC2xAQQ76gbg6iO1L2/2WiETgf2k/zX9jtPIYH7yJIL0P
         SqK8bM6x7DLdsG2fXM4JKZYUUVNqMeoX/ecRoNX4k9arIMTDzUFkYcsyr+9BS58BQRq5
         ABApcWSmqMYduxjircyoyDx7vtjQ/Clk+m26Q8isgE0tCg1bcaEzRxv6o2TzgmiwHtBU
         766g==
X-Gm-Message-State: AOJu0YyBHHlrmLUQ2siNJJbto4uMALgxHtuki8vCOQfqqdoaYJ1BZzyB
	Y48OfZ/NNfcPZp5n30WwcqaOvDA1wm2zvusp7+cGTCAPevYWG+1QB8+WmHOqFPUf
X-Gm-Gg: Acq92OGn8Ie9CTCEbx/Vh6szCXWmfAWOTxGC1d7laB+qDFpbOqWQfYDlfG+Ja6NVGJL
	vJE90QybqiUA7+Y26JmbiHQiPZ8Qr5hL2A9ooxc6bxQoQe2e1ryc3mlldFIaj16ViRy5UQcIQqs
	gpIVI2V+RPVzcxWlMgr1anW8jkDqU8rH8vtLG41bnDq2Gh3T+RZ8iqmK4OzjQnvS4BHNs31ynhs
	+2w8+8DlxJC90mAcorRZ9yU7vtMx3Db9nmWstUjqFJR8+bDVHz7Yq/IZb4UmqFHKCk0gWhDINh5
	AxWxN8dZusNwSpkW8g3tFa9lTLZ6w5jGTEF7x9rXjTkxlYSZ6adS4hMgN4+TzkrVAi+dhoLs5Wq
	I5v/f7Wh3I20IRW2VyRO9McuF7R1TByjX8gbR6WBsRY9FqIOpzFodLbJDCYtSVfb3y1yU4kRX/r
	boXOYt4tj8EvHU9fpgoni+N1mChZWMd5/39IFvauRRf2UtTNhTwGRgGAOEHjfgMk+qXsxwYi8Ys
	XuIACxJNpjtJkbSI+hsCa/pr9h9/3NBEDLZHM41PF3WLkcwE+Y=
X-Received: by 2002:a05:690c:e0c1:20b0:7ba:fdc5:17a3 with SMTP id 00721157ae682-7bfba196111mr83491957b3.43.1778451476375;
        Sun, 10 May 2026 15:17:56 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654cc7csm141718517b3.13.2026.05.10.15.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:17:56 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xarchiver: upgrade 0.5.4.21 -> 0.5.4.26
Date: Sun, 10 May 2026 18:17:49 -0400
Message-ID: <20260510221750.1126496-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 22:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126833

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xarchiver/{xarchiver_0.5.4.21.bb => xarchiver_0.5.4.26.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.4.21.bb => xarchiver_0.5.4.26.bb} (94%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
similarity index 94%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
index 61a94f7bf4..a33f404f3c 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 
 SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https"
-SRCREV = "55f923ebc623bcc8f53368543847350a23688189"
+SRCREV = "e14d54e1c85f4dbc78b89042017ebdc0fe5e2f4c"
 
 
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
-- 
2.43.0


