Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4AFEE49A4
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 17:23:29 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.41.1692552202511085437
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Aug 2023 10:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=md1Pyan4;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5607cdb0959so1435290eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Aug 2023 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692552202; x=1693157002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXhdNhFqXZBftZCVKx/9YkFxF1kPH+caotIdkEfYVfE=;
        b=md1Pyan4GbZBCVKsEOwWjDA+RJLzDI+UzJ3qHV3n+cm76o7wRiUqVOq7ta1R97jxvN
         iu/bYgaE1MPNJmJIsCf8Zw7dkBA3qHs2lqt6G5DwvNw9TZWeNzoJIfO0D7ZBvGmUiqoK
         xsIRhK0E8x++dM/iYc3XZ8r87dgT91zSUuuH2Ep8DOGsQKI3Z4pPpE3waQvU5z5WAbYx
         Sh/RDBG4WwQHQt0EV8ElDGOsblKk7k7cZoFcurzrir9ISGQrruc6JxZg4YjEO+NqIyjU
         1jdCpoqqB9ovNoba2Fh6VZUM3f+rqebUa3BvLWfLjpiSbVqHpGBrg5qWbUN+iPY5pkOo
         RT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692552202; x=1693157002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXhdNhFqXZBftZCVKx/9YkFxF1kPH+caotIdkEfYVfE=;
        b=gDHXkgtioy/CPNfi2FfJkcbslDU307fpw81VxQQ927CFf1xsppesP93k1izImYmU5d
         zkUsin8yqN4rhwtwcXYkHUpBDMNEyq3pH15t/qbxh5WrKwpzf+IhmC8HGHWbolTJNvlA
         nWc4Gb/V7UFce3IYvOcS5d9FqM/RkKFHfAkq35dbE1qutwPW1G4IyBpT6Pcy7/OkjTig
         Jjm7qw18iW4jYi/pz8knqKhLtXHPMXcJchUcWjlDyz/4mvvWj6jtpgepwj8pUDqtfpWn
         S9Gv1Y58QYXumrR/zkpX8woPCyYiKsvYU0a7IvSMX/gwsCT/dfhSz6QSevksG53FHt2U
         c8BQ==
X-Gm-Message-State: AOJu0YwEqWTtm1dqbvFIG8RhfJ6fqXbZHSeLHjKnrPgnwd8kmY/SAr+p
	XIUbGzo+15fMnvNqek3W+6eUrNOcZwpuK8lwrdQ=
X-Google-Smtp-Source: AGHT+IHbDNM73jGPSYuut2VG4tG8B4ggthkZaZ4CKqIkkqLmrJ4IxGiYqHmdDYpwjOP0KqBl869b+Mi2Wd1J2NZJIjc=
X-Received: by 2002:a05:6870:c192:b0:1b7:4521:31f with SMTP id
 h18-20020a056870c19200b001b74521031fmr5206147oad.18.1692552201671; Sun, 20
 Aug 2023 10:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <c7d7e163-2df0-1c1f-2b49-0d7aa89768e0@gmail.com>
In-Reply-To: <c7d7e163-2df0-1c1f-2b49-0d7aa89768e0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Aug 2023 10:22:55 -0700
Message-ID: <CAMKF1srzB+ciqH1toV5YdPB7WAd--69dsgRNbARLLmKOhVgbKQ@mail.gmail.com>
Subject: Re: Mickledore merge request : Aug 20th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Aug 2023 17:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104501

merged thanks Armin

On Sun, Aug 20, 2023 at 7:32=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 75cf318cef3b4ee81fad2782cf063ecd69ba88=
42:
>
>    lmsensors: do not pull in unneeded perl modules for run-time
> dependencies (2023-08-03 16:46:11 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to b0ba472191c2b7709ef04ae9c5a23bea040518f9:
>
>    mcelog: Drop unneeded autotools-brokensep (2023-08-16 08:33:38 -0400)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>        redis: upgrade 6.2.12 -> 6.2.13
>        redis: upgrade 7.0.11 -> 7.0.12
>
> Linus Jacobson (1):
>        khronos-cts: Replace wayland feature dependancy with vulkan
>
> Mingli Yu (4):
>        yajl: Fix CVE-2023-33460
>        iniparser: Fix CVE-2023-33461
>        php: Upgrade to 8.2.8
>        mcelog: Drop unneeded autotools-brokensep
>
>   meta-oe/recipes-devtools/php/{php_8.2.6.bb =3D> php_8.2.8.bb} |  2 +-
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch       | 43
> ++++++++++++++++++++++++
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch       | 31
> +++++++++++++++++
>   meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 5 ++-
>   .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/GNU_SOURCE-7.patch |  0
>   .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/init-redis-server |  0
>   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
>   .../{redis-7.0.11 =3D> redis-7.0.12}/oe-use-libc-malloc.patch |  0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/redis.conf |  0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/redis.service |  0
>   .../recipes-extended/redis/{redis_6.2.12.bb =3D> redis_6.2.13.bb} |  2 =
+-
>   .../recipes-extended/redis/{redis_7.0.11.bb =3D> redis_7.0.12.bb} |  2 =
+-
>   meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 2 +-
>   .../recipes-support/iniparser/iniparser/CVE-2023-33461.patch    | 52
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 3 +-
>   meta-oe/recipes-support/mcelog/mcelog_191.bb                    | 11
> ++++--
>   19 files changed, 145 insertions(+), 8 deletions(-)
>   rename meta-oe/recipes-devtools/php/{php_8.2.6.bb =3D> php_8.2.8.bb} (9=
9%)
>   create mode 100644
> meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
>   create mode 100644
> meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/GNU_SOURCE-7.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/oe-use-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb =3D>
> redis_6.2.13.bb} (96%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb =3D>
> redis_7.0.12.bb} (96%)
>   create mode 100644
> meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
>

