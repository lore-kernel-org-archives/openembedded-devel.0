Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.11750.1594608987151850912
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lr1eiX84;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id t15so5509997pjq.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DLT9WHU4BNxPh5T5dginVxWogcyKlrGfBqf/RtN0TUc=;
        b=Lr1eiX84gBS0eEprq0sCZIz3E4Lw7dZ2j3uPpWiwlB83gNYyHa+TiV+nlHoxcgrQyk
         Qztf18QrydjFseqcO94uIYtHQk8Z2hMAiVSTfGZxWLHHjfTW9yNFlwuPdZphvgvBz2Ta
         IlBUefkkHVhr6YAZSxw55rVtABCda5rbRyen7HONjQXmU14ebBt3Kxs46HJlaZUOvgX0
         wPbstKlTwF52hMKJQRkGWL2t3BHRotKb5s/8ROozxqeo/36nkWlK4XpP5AXtFgCz76LZ
         EgXoX59JDS+LxJTnM0mTtHiK9ORlnzdV5TZFpwD8lvSenbSDNciCj83Y961IH9Q3waSm
         mLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DLT9WHU4BNxPh5T5dginVxWogcyKlrGfBqf/RtN0TUc=;
        b=ZQhcEzeEXEwNtVfpqEUNiiIyeVJsklSCxHSddhkxQc9mjwAAo/WAzo0PPVXHWVZ6d8
         Gqm/YlmOXjBwWnegAJCvNKcjJBm+ZQnRtE7KY/vvKukXnSV6KUUnhOKyONPGtZrij73g
         E6EU1ekub9bMT/UX8snH1QNk3lWCfZhxyeswK0O4dxLGxLlLmhhi0LRbwQLlhnYOqQhM
         JQ7/QPUE2TtzxNONzPZcHAGFRakigTKuwJBVsHYiTOKwZ2NJy38y2YFQ/zHTqL0PRYhM
         LE2fmQX/OjHUaLh0WvNq0SVRU+CFEIrQzdMMbdZO60ChNYz0KSeKLUW5gF+9/+MIw1mM
         FbvQ==
X-Gm-Message-State: AOAM530o9sCMc+jEfoQSKhIkFnCLJr+1ab39pHM6gxRb9iVD7EgxKg3M
	rGGIbC7eUmaphpkHdu1z3IVbaK0u82c=
X-Google-Smtp-Source: ABdhPJwXQFev+8YJDn0nXBGR/gmJD8Ayd7l8v/TyDAcfOXf4Jz3/+NSCjMJ7+HDppg6Mv4bklcA5Xg==
X-Received: by 2002:a17:902:d710:: with SMTP id w16mr3556786ply.295.1594608986547;
        Sun, 12 Jul 2020 19:56:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/18] Fix build error when enable multilib.
Date: Sun, 12 Jul 2020 19:56:05 -0700
Message-Id: <b1b6f976aae12df18fb3aa5432b405e2c4431103.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

ERROR: tracker-miners-2.3.3-r0 do_package: QA Issue: tracker-miners:
Files/directories were installed but not shipped in any package:
  /usr/lib64/systemd
  /usr/lib64/systemd/user
  /usr/lib64/systemd/user/tracker-extract.service
  /usr/lib64/systemd/user/tracker-writeback.service
  /usr/lib64/systemd/user/tracker-miner-fs.service

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 02afb13f5dde533e97617635fdc1464fcade038c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index b40787f3c9..e2ced395c1 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -60,6 +60,10 @@ PACKAGECONFIG[libseccomp] = ",,libseccomp"
 # not yet in meta-gnome
 PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
 
+EXTRA_OEMESON += " \
+    -Dsystemd_user_services=${systemd_user_unitdir} \
+"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/tracker \
-- 
2.17.1

