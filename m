Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404CFC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:45:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.26257.1683618329522266094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iFVgSCju;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f139de8cefso32201452e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618327; x=1686210327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4iBk+2Fvy1AvVnJjXrwFSJ7NMHtr1a5k/ishVQmTA4=;
        b=iFVgSCjucjPnhQG0x0h3bBxHwnRQgED2FaTlokaIl+VLm4NmYvgHfdueBLep9CFGlI
         g38vSE6lKd+R2iElotOuM4nk2O8md5EOUEllSIBfUp8NOLr+CNm4oSQ5eO9rJKoFxSAK
         m/R6RbPm6J+1U6vD7S+F3D2n9X/e0E3eeY/EAbwJ8d4frETcpt+VFx5wsJu8bgHN0Ms0
         ExwVFD8deiKrXaqZB+BeKJc+5mQl3eX1AsfSAeYtFvij5EXSpVAyXMjR/N0MsbRwxIE+
         imL3zPd9X5jlkCL8nzZWqOjh++fOPBBfrEAmnKHgGg+8x7jP5LLM0OjCBT71eGdNvGGu
         C9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618327; x=1686210327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4iBk+2Fvy1AvVnJjXrwFSJ7NMHtr1a5k/ishVQmTA4=;
        b=dFz9EWzqUYxpUvh7vqJ4hefwDDZ9gQR0S5L8sxOIdc0Cru6kLC6sdVZmbxfGUgwopf
         NxBpJolJqYWkkgZIXqS1q4ZErYRp6JqHuBD9w9BHiayOsaXQJa6f2Qeah3iZY2anTlEx
         hor4DTpb3zNi8UziphTglD3Xlo25aRCmONdP1fa1G56IB0T6SHZsF+HFM8lVI6r7ZtO6
         9/963lgpKVI/phF4cRww3ex6N9VODYE7U0wSoJMueHs26f6x4kk6S83uj1SJtzurOjBc
         +Pek1SmOpzqPck223UjeiuDLAqwUnHnSGm+uQnYkyQ78LngCI1EKInguYzlptPXnaOrG
         JICw==
X-Gm-Message-State: AC+VfDyukV7petJtBeN8xK00akmt/HCQf14X+J+q5bTeI9T8upuddPKE
	wQ+M0IJDV20dcq3TTu2wvQ4OzKkVqFc=
X-Google-Smtp-Source: ACHHUZ5vXeuyxStWm+w/LogJmQFAOWI77M1D57gjZL/uPEtkGlu2U0Yakmyn3K2lTDHcRHVHH2lBNA==
X-Received: by 2002:a2e:a4b3:0:b0:2a9:45fb:6331 with SMTP id g19-20020a2ea4b3000000b002a945fb6331mr586217ljm.6.1683618327357;
        Tue, 09 May 2023 00:45:27 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id x13-20020a2e9c8d000000b002ac833114besm1458623lji.47.2023.05.09.00.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:45:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH 0/2] libusbgx: fix hotplug
Date: Tue,  9 May 2023 09:45:06 +0200
Message-Id: <20230509074509.7362-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102485

From: Ming Liu <liu.ming50@gmail.com>

- Uprev to the latest commit.
- Fix hotplug.

Marcel Ziswiler (1):
  libusbgx: fix device hot-plug use case

Ming Liu (1):
  libusbgx: uprev to the latest commit

 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 796 ++++++++++++++++++
 ...erface-name-for-NCM-Feature-Descript.patch |  52 ++
 .../libusbgx/libusbgx/usbgx.service           |   2 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |   4 +-
 4 files changed, 852 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch

-- 
2.25.1


