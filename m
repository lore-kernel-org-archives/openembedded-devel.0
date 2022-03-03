Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F076CC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 13:06:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10262.1646312812212683932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EsMT77Tg;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id n14so7763872wrq.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ywl5V5Eud78fbSzqKDijfuKZHPahI0XaLH65RRITWso=;
        b=EsMT77TgLRqlH1D3t7UKDe93RwElkwiJ9cmxufYA7Z2BoghHtgK7eZ+NV1pOKjoT9K
         2afhKiZfdVNJaYuHO4oByVEJcv7rXLgXQiAty9Ot13OH5xddMIFWIkBxtXIcSyOCRL0f
         d7pIQik2KM/MP/MTarQtIUOD3nXGv+jCoyrVoMjgRJdwRHs0snUFB5ygxmcO6QU+CEIU
         wobQ4juW8GjiR1kQi6E6tUmhvrBytH4bpPPhEMggs0MhG3vtF1mzRnifOPsgRwzyr+Zw
         EmxdWGQtU3ZRDqQpod3vZJ5m/zDAQIQYlAmGma/rkc77x42o8ZnpecFHopDKINDWdoQH
         gp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ywl5V5Eud78fbSzqKDijfuKZHPahI0XaLH65RRITWso=;
        b=1ngt1KWnE3p52owU/YFz1Cd+d3KQFu2QBbqD4MVtbKKymRbMH7pZa4U2T9pt1De445
         KP6zbFkR/CgLWjkv61zZJ7hiw/RT3FlQ5EhA+mUJsNf6Ax1vcJSTiViV31yA4pC+Zg/p
         QlYqhBDgkNXSIhfcCZueQj2xIwlX7AojElvScA3Mv55c6rXacIHjuZOIsSLSPcCjTf7E
         FAOvlWqWz5PzP/5o3DLomg5C05K9lE8quatQUOP4bt0js0Ux9hw+Xv8g79orT/2PU0Ft
         EJ+9Fx4mdcIAGoFJxra/HmMles2dbL/kK4fP7PP8Gxm2dGNRynSUG8nnqRMOZPA8L5v9
         tf3w==
X-Gm-Message-State: AOAM532A4Q6xrdNDrQ8HCNKhlF3qH6tyRSSaHKLOXfF/ZgJE9u7CwTml
	UBp35Ii7DW/WyKY5BxXPtpZrD8vlnK8=
X-Google-Smtp-Source: 
 ABdhPJwC2FLRu+rnCs4hRQU1n6Dt05E2yuD9UZZDYYPqvHAhTkOX5YaBvMDNeN9172zaKp6gMO12NQ==
X-Received: by 2002:adf:d08a:0:b0:1ef:5a1c:d50c with SMTP id
 y10-20020adfd08a000000b001ef5a1cd50cmr23954796wrh.582.1646312810313;
        Thu, 03 Mar 2022 05:06:50 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm9612380wmr.47.2022.03.03.05.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:06:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 0/4] update modemmanager
Date: Thu,  3 Mar 2022 14:06:14 +0100
Message-Id: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 13:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95739

Update modem manager and related libraries to latest stable vresions.

Adrian Freihofer (4):
  libqrtr-glib: add new recipe
  libqmi: switch to meson and git
  modemmanager: update 1.16.8 -> 1.18.6
  networkmanager: replace deprecated licenses

 .../networkmanager/networkmanager_1.36.0.bb   |   2 +-
 .../0001-build-use-python3-everywhere.patch   |  33 ++++++
 .../libqmi/libqmi_1.30.4.bb                   |  23 ++--
 .../libqrtr-glib/libqrtr-glib_git.bb          |  21 ++++
 ...-shell-scripts-to-use-bin-sh-for-use.patch |  68 ++++++++++++
 ...-Make-scripts-POSIX-shell-compatible.patch | 100 ++++++++++++++++++
 .../modemmanager/modemmanager_1.16.8.bb       |  53 ----------
 .../modemmanager/modemmanager_1.18.6.bb       |  62 +++++++++++
 8 files changed, 302 insertions(+), 60 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
 create mode 100644 meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb

-- 
2.34.1


