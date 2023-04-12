Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46597C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 05:14:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.35871.1681276470746640517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 22:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=agcvLqOZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ud9so25600295ejc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 22:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681276469; x=1683868469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlLwTxKo+Xgu/pIc1B8jguLMmuPehyQO3J/lI1zEOs4=;
        b=agcvLqOZJmuNf6ma8RxbjhSmWKtmb+jIGDAoyptqhEw6k0NT2fyS5aw+ux1Y1QVm81
         JYQCrnzFAoLbmwX9Ps1Y/DZGRAQNrcHIkncOB8GbJRf6Zd+iiGEvORVxw9R0JUHBmTjd
         dfKlMoVZCKQXJl078w4liQzVoqThXaKByZlzSg04FwDApy8HwYoNHfUkxjjGDHpdIuSh
         gOM4FuRkEzXk0vMTAcKNH1ijHA10RR/vJoygR6W/lWAw7IV1MstWhpwzshKAdDajgpwy
         JYNXi4VoAqTezPb9UdS6yxhgS+N+6J4s7xWFUbsIUfxdCmrdgJ4qe3PLHaue5yFbvCMo
         ndrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681276469; x=1683868469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlLwTxKo+Xgu/pIc1B8jguLMmuPehyQO3J/lI1zEOs4=;
        b=adR/+NmESAKTvVDdYQnTV7qB33KbBKkxHm1evUMOcSkFA3l6ww6jILo87ThnIDXduQ
         xdwfTrdZNGJXR4n+4GRYObdhojVKE24RlFqiTzvIdOSvaSjVMNAGNWZGQaSrdqFnfyN8
         PrJIUAlDvsyk20Iz4t2uS9dvEzuWu1FBA+sz+P8uNtaDUyNanJksnuGIfUMg91vHE6aD
         XYi+yFTDcB/0dLG3eA7AjO7b9w4jKrDTazhgWehXy1hy6THPr22p0zocvDBfkcRarMKL
         5KKVk3k8Rw6NzWAJhE402hFPzwVcA9rr+nmPZ1/WYLbK3r78jDQlvXNocL8g9SUjEJIc
         cr+g==
X-Gm-Message-State: AAQBX9ea3YVC/YcQO+sHFr3XKsrg1DzvDGCeufamebOYhXEHcWJovlo3
	l2Zc0fIUa7S9wROBhVSvat3jzVFkW8s=
X-Google-Smtp-Source: AKy350Y/oKGSY8wCZgFlyFRnCyhi0tCSv5mua7TqPpGZh0EmjWg9I+VuKpxa+5E/s8ZR92aXJ5Y1Pw==
X-Received: by 2002:a17:907:96a9:b0:94a:9525:66d9 with SMTP id hd41-20020a17090796a900b0094a952566d9mr1012809ejc.43.1681276469096;
        Tue, 11 Apr 2023 22:14:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hd10-20020a170907968a00b008d606b1bbb1sm6802889ejc.9.2023.04.11.22.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:14:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] zsh: fix installed-vs-shipped with multilib
Date: Wed, 12 Apr 2023 07:14:20 +0200
Message-Id: <20230412051420.10545-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 05:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102060

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
lib32-zsh-5.8: lib32-zsh: Files/directories were installed but not shipped in any package:
  /usr/share/lib32-zsh
  /usr/share/lib32-zsh/5.8
  /usr/share/lib32-zsh/site-functions
  /usr/share/lib32-zsh/5.8/functions
  /usr/share/lib32-zsh/5.8/functions/_selinux_users
... 1000+ lines ...
  /usr/share/lib32-zsh/5.8/functions/VCS_INFO_bydir_detect
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-zsh: 1116 installed and not shipped files. [installed-vs-shipped]

* they will clash if someone is trying to install both zsh
  and lib32-zsh, but it's not very likely as nobody sane
  was building lib32-zsh with 1000+ line warning regularly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
index b023e8d297..7602ff9f64 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -22,8 +22,8 @@ inherit autotools-brokensep gettext update-alternatives manpages
 EXTRA_OECONF = " \
     --bindir=${base_bindir} \
     --enable-etcdir=${sysconfdir} \
-    --enable-fndir=${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --enable-fndir=${datadir}/${BPN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${BPN}/site-functions \
     --with-term-lib='ncursesw ncurses' \
     --with-tcsetpgrp \
     --enable-cap \
-- 
2.40.0


