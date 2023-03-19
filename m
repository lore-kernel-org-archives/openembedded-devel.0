Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611B3C7618A
	for <webhook@archiver.kernel.org>; Sun, 19 Mar 2023 12:09:01 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.15414.1679227731654780081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 05:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XbAd/wmJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id m6so6181826qvq.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679227730;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag+Rgogy8Lys7GzMb99d8GwiSab/s7VyAfft5pxQA1M=;
        b=XbAd/wmJc1bAAJH/vRiP2kscZzVtRw86ALtLN49gcaXq4XrL8nEVTJYGq5/Qx0zXUy
         Jv7+ewvkealZ4+7F/9Ctfk8ddSGPeNZ+mETxrWBMqvHi/N7G5/lz/mOTvbz6HISL7K80
         aC6t4fBfN2ZTAzfUlhDxLnJbR1UCKHyJVO+cjJAySqr5l1EsbqJM4YtDU70dpimC1CZ2
         qUlQ0s6StX07FCvdVAgU1tuFfZy+JSDlpg8gmAVES9G5IY7Jk4Ji1TjqZunQXrIxyX64
         ORvJemMdIolXX18Eun22Q0F0+Mf1YRmd2FYQQe5v62Lz2ffJLpjJ5xOqOTngMrGVfs/1
         99zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227730;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ag+Rgogy8Lys7GzMb99d8GwiSab/s7VyAfft5pxQA1M=;
        b=ym+fnUa5u2fneoqlc3JflcY6JtGhBrHy0WrKr9En7+ax2/F/H27LYarGmGQQwVDCz9
         9FHsTPbQyMOE40Q3Jt8l4rrL7i184Hxcec3Nop6aFVlYGcg04PN5HNbiFI+Ar1pyquwr
         Gt4DxJRl3eP+rlmxTiZKgiLcnhSOWyDkOE4Tyg3qIz3DJ7CC8IxOEmif2/DBiGL0YpuT
         150m0e97SOFHuzXXX1D8hoKlO6JN3BSLuM7FWCIfaFHbCtY4NKnuMN2VGrbiWQVvaEkv
         KYmAjIBOFobTkbmhDxJDWtDJGFf23qtBR8+16mmn1CToPLBczMSbBzOsxYo+EnZSP2Xk
         Hmpw==
X-Gm-Message-State: AO0yUKVARQrCZkhkg1bfHlPK1qrS+fX71gndnVxmJ9BkmwdsRBsAo+cx
	9cf7a6wMOai1wIlTq7hLOCg=
X-Google-Smtp-Source: AK7set99pThP2l7Y88LMa/Z9LMeN9YEqAfMWoFgBsucGLcenkyOifyUnIqxVamWViFla5FfmPYFXWA==
X-Received: by 2002:a05:6214:2681:b0:5ad:5698:848e with SMTP id gm1-20020a056214268100b005ad5698848emr31591440qvb.48.1679227730460;
        Sun, 19 Mar 2023 05:08:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:46a:12ba:e74a:14c9? ([2600:1700:9190:ba10:46a:12ba:e74a:14c9])
        by smtp.gmail.com with ESMTPSA id q16-20020a05620a025000b007429d1f6176sm5310113qkn.94.2023.03.19.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:08:50 -0700 (PDT)
Message-ID: <dcbbd8eb-4864-7514-563b-a79f722e820e@gmail.com>
Date: Sun, 19 Mar 2023 08:08:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: March 19th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 12:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101597

The following changes since commit 87571345059f82fb7599e3aa82e6fdcfbd361098:

   zeromq: 4.3.2 -> 4.3.4 (2023-02-22 11:24:23 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 7ae42df58f2bcc730153715c3339a6875b0b2497:

   xterm: Remove undeclared variables introduced by backport (2023-03-18 
16:16:42 -0400)

----------------------------------------------------------------
Chris Rogers (1):
       xterm: Remove undeclared variables introduced by backport

Poonam Jadhav (4):
       nodejs: Fix CVE-2022-32212
       nodejs: Fix CVE-2022-35255
       nodejs: Fix CVE-2022-43548
       nodejs: Fix CVEs for nodejs

Priyal Doshi (1):
       open-vm-tools: Security fix for CVE-2022-31676

  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch     | 133 +
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch     | 237 ++
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch     | 214 ++
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-llhttp.patch         | 4348 
+++++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb |    4 +
  meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 21 +-
  ...1-Properly-check-authorization-on-incoming-guestOps-re.patch | 39 +
  meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb |    1 +
  8 files changed, 4982 insertions(+), 15 deletions(-)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch
  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-llhttp.patch
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch


