Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA7C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:49:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.3660.1657187351382919314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjzSu9mY;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g26so31461733ejb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0yu68qhkN70eIa/b+W1dFADJeQyL0/eV2Two2ve6c4=;
        b=fjzSu9mY+4sW4Ox3fHB5N3SdRiLWmthsqHMZ8o0hbs3gaOLY5LB9cdmh0pJDzralf8
         CkOOfWpMjAEeSrdPGhTleT8uMZRMnyYC+y8RMd9nWEU7CdHuvjyk9VhdL8eqceF0yW0f
         ZPuTg4Ws5wlTtmfWsWkfYtZz023bMWJemymqE6EUMdiUZ7VunterWUIV5N8G67d267pE
         3DIDpkTjsP3HX9xhlyPTv+dpvZ9FCkYbBGv+kffeRwKBiGCRWzhJsD+j9OPoo5t7Tu4P
         WGAYwRMTSDpZoAcSbSpBf745DZaqcswQKdqpLuZr0OWthrmCqajNO7qp6CU/bvGSIM+2
         KXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0yu68qhkN70eIa/b+W1dFADJeQyL0/eV2Two2ve6c4=;
        b=AtaCMOpll4bq5oaKCeMdg27nZU7vheZf5w5z76LDBXBaWKYnSMYbCE7wkBBNhi/Heu
         z9o/NxONdwCI5ejACKRRMvSPIXHTn2mYUzj5yTq0GtzwhI8SgzHQLmn/ILDeMsTO5Hh2
         CY0gbwHzqvU6v1fkfNtznXRWh3c6+dHmvHYd6e69ExDj1UBzreAtW1cIwQN+iYnDtC79
         XItBXEZ74uypJj+fBVb0Vd1nRD7iOX7rQfpqIF5G9uCseaabhMFVcXHhML2/15zZL2ES
         DFxDrq9lOMuEP3myXjAX+dZiuHiNF1VUSPRgA8tMt7YYC3HEFyJdDr7XcESfcWadxO9v
         x92w==
X-Gm-Message-State: AJIora+9Xvs50g87S3hXwBlMyidnGcyiO9Japg/KxsMH1LxOJDFPpNde
	d0PfV3tCsxcWbREb/P2C2D2T6JChzx0neLCR
X-Google-Smtp-Source: 
 AGRyM1uvQ2PFuj2H1BGHuy25EFQEBiSLSWWWBx+sH+TPcM3DurILcrRfiBWYNy9LzMaCaipybyhk+Q==
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id
 u5-20020a170906654500b007227c991ad7mr43562079ejn.325.1657187349533;
        Thu, 07 Jul 2022 02:49:09 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a1709063d2a00b0072ae8fb13e6sm1375835ejf.126.2022.07.07.02.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:49:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 0/1] modemmanager update
Date: Thu,  7 Jul 2022 11:48:47 +0200
Message-Id: <20220707094848.2519733-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:49:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97774

The update of modemmanager from 1.18.6 to 1.18.8 is a bugfix update.
Normally it is very advantageous to stay with one version of a package
on LTS branches. But in this case, updating to the next stable version
is probably better. This update fixes several build-time issues (that
we see in our CI) and also provides important runtime fixes.

Adrian Freihofer (1):
  modemmanager: update to 1.18.8

 ...-shell-scripts-to-use-bin-sh-for-use.patch |  42 ++++----
 ...-Make-scripts-POSIX-shell-compatible.patch | 100 ------------------
 ...nager_1.18.6.bb => modemmanager_1.18.8.bb} |   5 +-
 3 files changed, 24 insertions(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.6.bb => modemmanager_1.18.8.bb} (92%)

-- 
2.35.3


