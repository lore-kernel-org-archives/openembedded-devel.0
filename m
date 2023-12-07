Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44295C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 15:53:19 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.87821.1701964394732502649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 07:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIUfThox;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9fe0b5b28so12012491fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701964393; x=1702569193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+qEth149O/F1YWt0rdcHBPO3zUGILhA4PtNadjRYJUk=;
        b=NIUfThoxtPhqN8nW9QtdM+AuVRnIMcO8mczvZ+gRursRz53n5oUBJN6Q+WO4PIH5K9
         QhXn7mPJwyzzwiLXEO8H7W6+/6XgRI8AlVX0mVOu3MJPzUpFkLgCLKqj2jsmvAEqkB5u
         KTxTrOQRpzBB6GSuiRQKecGSS+iFJxUerEsCs0qigvhHvsFjY7ct/RezIlcoOZGH0c4r
         EHg7ot08zb3eS23VUAilrG1+1M6zz1qDurjJEM/gCX1BL3SlT7bJWvbRBhlBVd2/yjvg
         zCPTAKLcv21VkUFB4DtSpIJsSeBfQeLWISlh4vambwWPE3nPJ3pGpbNrcwD5w7Kpw68U
         lCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701964393; x=1702569193;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qEth149O/F1YWt0rdcHBPO3zUGILhA4PtNadjRYJUk=;
        b=mc4xsqywVQPdXG73UnTAb8fj+NTTsb2UzJNaZ5qdR27TGlJiX5TUkQ3i169cGb3uDg
         bqZLpdY+/J3U66uqo6QY0XHTmy5GZ3hs8Mqn28eD+qFA+Dx2NBxLhGJD+TESWhIZEwAy
         bjKRzTFXKpIvw1kBkwIKNecho+jO0q/fScd/1B92k+2K9JmLvO+nsnv6/ZShfao8QUbQ
         HornACWh55SIZmmAC5kIt1QdRF5dth/uZL1hmmg8mDbfIUVp/HQTphIkq12oh4YoXMWm
         sk6V0yhJwVGaLqGYw8ZqRvAl3pZMNSX0AZb2FiWrMlRuQ0vEdCtN+Zt2rRIFFHj9Jdy6
         xgag==
X-Gm-Message-State: AOJu0Yz3/tP0sI5Er+u2AEz+maPYBqT+IWDKoAoI7JMjSGBfpyDjKfNy
	7ZgOX3fHjWJ/fckuB1dc1+8b4aiOzsy4DuP8ZATifWOCC2Q=
X-Google-Smtp-Source: AGHT+IH1nqZ5Nuc/ggChdwyrrRw8FUg9jlOAczN+TJomddifFBkpY/hFWsvYPi7QSxIen1FlUpmzbruKyI0sQaBTF/E=
X-Received: by 2002:a2e:6a19:0:b0:2c9:fee0:5743 with SMTP id
 f25-20020a2e6a19000000b002c9fee05743mr1726844ljc.99.1701964392682; Thu, 07
 Dec 2023 07:53:12 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Dec 2023 16:53:01 +0100
Message-ID: <CANNYZj_RSUUieQcKPkmrVft7fGmVHzR4yjL0wFGDBLx_wBghig@mail.gmail.com>
Subject: python 3.12 - help needed in fixing meta-oe failures
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107283

Hello all,

I've been working on updating python to 3.12.0 in oe-core, and here's
the current situation:

1. oe-core patchset is ready and tested against a-full on the AB. Get it here:

https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/py3.12

2. meta-oe patchset is half-done. I've fixed quite a few items, and
the collected patches are here:

https://github.com/kanavin/meta-openembedded/commits/akanavin/py3.12

There are still some 27 recipes failing, here's the list:

  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb:do_configure
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb:do_install
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-security/nmap/nmap_7.80.bb:do_compile
  virtual:native:/srv/work/alex/meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_4.0.10.bb:do_configure
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb:do_configure
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb:do_configure
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-security/audit/audit_3.1.2.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb:do_install
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb:do_package
  /srv/work/alex/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb:do_package

So if you could take these two branches of mine, and fix some of the
remaining issues, I'd appreciate. The branches contain some typical
examples of what becomes broken, and several possibilities of how to
fix that.

Thanks,
Alex

