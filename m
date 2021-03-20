Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.9366.1616275427145126039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=1DJzEmui;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so7070977wmj.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 14:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIYUsGT8AO1jro8CYNNdTgTYO290SA5Ij1qMrut0+Ko=;
        b=1DJzEmuiSFu3okmHvkExXC7NIs5IpfTxyMSgPCBu3xeZv9aX6XpYfN5blffHt+8ZEm
         wPyU5Qv06cgDSJH8udlGcrR2AzE6TsUQz4ORl1ZizqOgCNUdctUQQSkqdAEpSz0YjimB
         tnM4rBBC9jhRppAVzuCfZeExe1R2V2DVVOfr/EJf1/W65xVGo6VilEMTUepbXugkCaLs
         npalffAtSswOTvp6hILjOAlVMQUVpBenv22wRJCFJJKJvbb6prxaTuglwmEIf3yq9UkX
         iuBSWyDxWMU61l9ilbz6vgcwBQOxppBv9ZrtBujS/iFL90Lw7oSHtucMtlxb6GV7Sb6t
         FJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIYUsGT8AO1jro8CYNNdTgTYO290SA5Ij1qMrut0+Ko=;
        b=B7Fek7b37CUGYq3cQJlyUCMIGFxTMcwCTGwtHeRH7YDSg2KNw2SFt+TvHudcUez809
         sPlMFuEiDW0236qOZkaoQ5sXl0YWvhYfwaIn8w99kC9AGjD4DL1t7w+tWiLbTYWm+SQU
         pVzn+HEPjhDnLONNBz+2E4+n44LGVGUFmmardPHn66QjbFUA4nZf/CS4xu+bIwc4H2nX
         3Fvi+Noj9Aaus48oM+wD3iy/vh3hnpHGyLKK1fnMGc1LWhGVcpimDW00IuChSOU/pZjJ
         duJBRzsoGqPUH6DEUnWo4mtPJ8WpixJoXftjCjwzu1Mv6xPc11gKRLdjpEACxZyyrqSD
         Hxug==
X-Gm-Message-State: AOAM530FmFVrkrjjtTUqP/JDoFZaypuBo27G7faFr7fZ0aciDv6OOTGK
	w4uZhPtrP4AudPYq2X6rq5bfPw==
X-Google-Smtp-Source: ABdhPJyvh00MtdP1hZK8nzwh1RNuX+8uXVS0eHkhniPMW6HhQikmtPEz4U7RmnPHp1AaQn0eVvUfFA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr9101002wmq.60.1616275425258;
        Sat, 20 Mar 2021 14:23:45 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm11308962wmq.47.2021.03.20.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:23:44 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-python][PATCH 0/4] python3-wpa-supplicant: fix a problem with importing the cli submodule
Date: Sat, 20 Mar 2021 22:23:05 +0100
Message-Id: <20210320212309.11310-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's currently impossible to import the cli submodule from wpa-supplicant.
This series addresses the issue by:
  - adding a recipe for a missing dependency
  - adding runtime dependencies to the recipe
  - fixing a problem with an outdated API used in the module

The last patch is just cosmetic.

Bartosz Golaszewski (4):
  python3-txdbus: new package
  python3-wpa-supplicant: add runtime dependencies
  python3-wpa-supplicant: fix importing the cli submodule
  python3-wpa-supplicant: replace DESCRIPTION with SUMMARY

 .../packagegroups/packagegroup-meta-python.bb |   1 +
 .../python/python3-txdbus_1.1.2.bb            |  11 ++
 ...ond-argument-from-click.argument-dec.patch | 127 ++++++++++++++++++
 .../python/python3-wpa-supplicant_0.2.bb      |   6 +-
 4 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wpa-supplicant/0001-cli-drop-the-second-argument-from-click.argument-dec.patch

-- 
2.30.1

