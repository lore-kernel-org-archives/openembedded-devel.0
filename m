Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF1DC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 11:09:04 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.4239.1657192134416118770
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 04:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gnfOLu3/;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ez10so1634240ejc.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDuy/6+nZHHqAs5qfuciIvGFQeDEDYZ6WNRc3e/xAYs=;
        b=gnfOLu3/hr93aVlcDQU1TFkiBFiTtiN1RFm0b5+wgLaMvkG36s7ALu2CUN/jU6bNYl
         rZ37BBWjWubb1tkyD06l3ENlWPubiA847xxS5er+f7w2lnk6WtGdm7S/TiobFjE9ap3z
         Bpl1hBsHyUTiMK/6nt3WdwLOZtAARUwVT3xVnTmM4Bh1+jhlCVx2Ynp4H1iX9i4Qdtnm
         sTSY+UsJA0cHQb/6HLMmdllzeWZ3g2oFeRa4SJtXzQXzG6LSHl2tSkxsBLQmOMOCnmL4
         Vmvuz3w9/DIVe+b4mavoiQBbrGxOhOAZBiKwxu9VYh0e9gHfwFZqryTgfbdIJaOce9uE
         lKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDuy/6+nZHHqAs5qfuciIvGFQeDEDYZ6WNRc3e/xAYs=;
        b=tXJbydrUKqU+4mSP+9y99IbPFTZNoBrsZmj1bfJpYNwhwknFjWR8E2Qa54nWtdQRpn
         lVvpmC8QaLGRToYbSG7bBkzD6CGP8CtlY4Hx/9BbEXdhIckmYDWSxhjuoRe9qgBW1weF
         eQqC17uNGT0qsCNdm4Wag8nmgccUT7viGTFM4CpihLmHeLNjDZcabB34QUJi4hXP9ZJD
         JFXrnpRC7pMdrbzput+V8PPes/4YLDk9/oPVM8v+OMAvC/xDhJI7Ho0FG0gqBHRNjLet
         gy2ybZn9YMqbQKdvO6I+yobwh+zkPCLOX3Lq9bK+bwfpVEFIO8GCiAqgrsjbAaxg9GPM
         QfNA==
X-Gm-Message-State: AJIora8Ovl8vph4nHj1wyqJdbEccXYTJemQ3MdQQ9kYduGWE4UwTEn9n
	IU936ltRRZ7qi7AXS7dqcSfuHm4JpU2PuI8V
X-Google-Smtp-Source: 
 AGRyM1tjLwundmf5DQGTxINRcFJGyF/b+qmPNqItyYJVe6l20fks/S1hgUItEDoL4z/wB2meKJHnyg==
X-Received: by 2002:a17:906:5a4e:b0:72a:605a:57c3 with SMTP id
 my14-20020a1709065a4e00b0072a605a57c3mr38089151ejc.301.1657192132536;
        Thu, 07 Jul 2022 04:08:52 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm18521105ejt.212.2022.07.07.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 04:08:52 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][master][PATCHv2 0/1] firewalld: upgrade 1.1.1 ->
 1.2.0
Date: Thu,  7 Jul 2022 13:08:20 +0200
Message-Id: <20220707110821.2571332-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 11:09:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97778

In comparison to v1: Fix the typo in package summary.
@Jose Thanks!

Adrian Freihofer (1):
  firewalld: upgrade 1.1.1 -> 1.2.0

 .../{firewalld_1.1.1.bb => firewalld_1.2.0.bb}  | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_1.1.1.bb => firewalld_1.2.0.bb} (93%)

-- 
2.35.3


