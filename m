Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2269CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 18:38:14 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.31567.1758134291008132484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 11:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDuezLTm;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-35e9f3095ebso530771fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 11:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758134289; x=1758739089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hQDM3VPR6Fc/bohzIm4KttiarS898rKO1t3yUjP/on0=;
        b=RDuezLTmPT6BJjqR6A/KJBNqX3vQ0SSinZOG2E2wKFcIZ5PNuOZbBaoDSrNLmbjqiA
         o4AK4GxK46uqeKVdwholvkyyFArhZo9614hij9mq3s8J1fZy9IDCo0/+1F7lMzgnLpfn
         KYoRW8usjVsuMbbJCNJFV9kYX1eBjyqdgyTBbLpEJW+Q+usGhInpZAPWQR+1Xs4uQF7i
         9lTGR+PxS02ztYtNw//9SRqRnGYvcp5X3atfMOKK11650/BYLXQkL9zcYUmZuR/M5RqY
         bV04/7+/Vnqx1JbgIM4rJj99RR44sDpuIPPePriKyeI1k/wh9epHgpDsGtmBNZ4doCnu
         dBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134289; x=1758739089;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQDM3VPR6Fc/bohzIm4KttiarS898rKO1t3yUjP/on0=;
        b=ouhvoxOszSjgRvShi7maBKzi2Tx7PFY6Rm/Ysg868JcJGX5OxeVkUuTOtijX+xLVMS
         V53nreLNwrsxHjyOYaRdZ4xYeRLnR/F7DGO/E3qfDatjUp2Aykni+M90b5/r5HXmhzBY
         STQ9aW742giTh0tehRN1xqLhJXpI3nwQLP2mPjnNgnssrTN0XGOQttEKvr+f4L7B4fpz
         CcDq1m6Xzwd1SbqrFlgirC88Wl6lWjGPntTaxnjAsWnbjCdcN2N+JW1q+dZcIpNR7VFc
         0NyG4M1McpDiepxgcgcGev5a4iGaEskBmNl2r0j78XiLmKDXTMtpRDJiwKRxmoAkrKVx
         EeyQ==
X-Gm-Message-State: AOJu0YxYc72MDts9zQmJmHtj6jd5eYVaxX2Hxf8i9RPerrfFuBOrityT
	roF70EhnZHYUBj6zmxhra+ZAHykgA/Zq8Mv7LwCFIW+zRUyg6yk/KqVMRVrUl1leGvyH8gYXzMG
	gxlhz+qStcgJMNwKAZGz+4GrzAYgN1V8=
X-Gm-Gg: ASbGnctAvn1FCz27rHdyNJEC+93H1UVtT9YAcEcAtqqpBJEv5vwQQ/uHpGjO6sYU0s0
	nUa2EFjn7smRIuNTz45Csg7D8BF2ew2cDPEUYCH0E6dWUTYAak4PnDEcIAQAHHWxAU2RNsEOKc+
	/MYLkiclBWUq4ee5Jp1zgStw6fYXfvUyeOS9bS1NUyszCi2xhT5Qa9/p7Hg8mErDGhMm9CmN9ku
	JY18YcF6MmR8ZyPy6dC/HWHRvcg+N2msBURufU=
X-Google-Smtp-Source: AGHT+IFlHMrFaIJk6mDeCBHdkQTplEpuUwzesnFdtowxKTZWrHADhEKCfPFxNqS6u7PixPcMtbi7fswMZxNVwL85hBk=
X-Received: by 2002:a05:651c:b0f:b0:336:cb18:dada with SMTP id
 38308e7fff4ca-35f5fe9d7camr9437911fa.2.1758134288773; Wed, 17 Sep 2025
 11:38:08 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Sep 2025 15:37:56 -0300
X-Gm-Features: AS18NWBCCusXHrOIcE086_BHJZCyh_Q-ppLYkDvpXpixZjJJgTp18uprHF27p18
Message-ID: <CAOMZO5CSQZG5=+urHZb9yPK5cV8S=c1EmqecPNQgPjA5qWNwpw@mail.gmail.com>
Subject: crucible: Recipe update with go module fecher
To: Khem Raj <raj.khem@gmail.com>, christian.lindeberg@axis.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119486

Hi,

I'm trying to update the crucible recipe from 2023.11.02 to
2025.05.28, but I'm unsure how to generate crucible-go-mods.inc and
crucible-licenses.inc.

'devtool upgrade crucible' did not work:

  File "/opt/work/festevam/oe/poky/scripts/devtool", line 352, in <module>
    ret = main()
  File "/opt/work/festevam/oe/poky/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/opt/work/festevam/oe/poky/scripts/lib/devtool/upgrade.py",
line 605, in upgrade
    old_licenses = _extract_licenses(srctree_s,
(rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/opt/work/festevam/oe/poky/scripts/lib/devtool/upgrade.py",
line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
FileNotFoundError: [Errno 2] No such file or directory:
'/opt/work/festevam/oe/poky/build/workspace/sources/crucible/pkg/mod/cloud.google.com/go/compute/metadata@v0.2.3/LICENSE'


Does anyone have any suggestions?

Thanks,

Fabio Estevam

