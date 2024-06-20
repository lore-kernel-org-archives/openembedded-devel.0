Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A2FC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 15:05:21 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.49945.1718895913326030217
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 08:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qny1jyYg;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-24c9f630e51so515877fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718895912; x=1719500712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EufsKf44o4OLiiHHLfvbiIuTQ0MWl2AybPHADiPQfJo=;
        b=Qny1jyYgCT/FmFHjF5DGfmXMa4i/LRyhcA07NlA7Z90d2y83X/pZtF0XmrZ7WWfQR/
         xLqJWIoLkPafGw+Y20gO27lAzLh4Gim66AFioF7rMOAerP7auRzlHfz/asJmYHSWFr3U
         TSE6QOW6KVkr9LU6XBRqLL69rPw1BoxMFQevK9+z/PNXMNQnlcTey5Uk9A3uNx1MZq2V
         Guj5OUwkKN7iEA7tjNNhDh6HcIcy2u9Lma3t87m6HSYgqW/5yqOr77QJ7iLH+EznmgDo
         2mvjmqolC+njb/NiLK7VQ+zTFodr2kBN6KQ61KQYL+sngREk/ZJ7ulawDHqmoiy1O4hZ
         sLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718895912; x=1719500712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EufsKf44o4OLiiHHLfvbiIuTQ0MWl2AybPHADiPQfJo=;
        b=WlTHV45s5pMMnoHHsAsdKJw/8eTEnOctDZCCimWSqXTxznQGaw0cUY7eP/n/D8OV1V
         IRCvBi0ZD6f718fifBWnmKZAxkGPST62KSgPWRq2EwA8wcmF6548QmJfzN5YE3F4EHRH
         tob+dbuhFJtBRzCwepYAigACzlJU8DZqNRfM1NatspBzLU23fRWiPUXIS0f6zKbCjzXE
         5H2L1dj1B0WJcit0/omX2b4IOhlbVCvi8Hjkt05l3P8Zwt9SoLEIS51M+zFCFnl09C8y
         RDMEk7NrkOmbD59QfJxMn0pLLZgKKgyDqAh57U8gi2Vc8JBGP66SqXtOnumsxC2pmpAJ
         Xutg==
X-Gm-Message-State: AOJu0YzR8h2u0PYtlx8TTOzN7coG3HZ4gXjgLSeBJT3V5hd6H4sRVqD6
	Lxua82BLA/q2V95xMhHSp0Pk1zQ+k1z7nMkxSoJ/hEv6pSlgtAM05ebDM73KG4kBqN7OoMC2mHv
	dRyGxj9rYAtRvUnv0GYUzQs3tGanGSNwf
X-Google-Smtp-Source: AGHT+IEES/EtVf9PTrTAHhuFrsIJup1G3DBmiGJit1U1mHsFQk9LT5juXjvTCAGiLhVet+USTFgVuO2DQqULyURWmOk=
X-Received: by 2002:a05:6870:2008:b0:25a:eca3:6b56 with SMTP id
 586e51a60fabf-25c94d5ab2cmr5466314fac.48.1718895912351; Thu, 20 Jun 2024
 08:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com> <1718161096-29710-26-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1718161096-29710-26-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2024 08:04:46 -0700
Message-ID: <CAMKF1spFVUxQXfois20QrVjWLBfheSc9EgqFfrY3-eGXc+vrng@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/43] python3-pyyaml-include: upgrade
 1.3.2 -> 2.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 15:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110978

This seems to be failing ptests.

bitbake meta-python-image-ptest-python3-pyyaml-include
should show the problem.

On Tue, Jun 11, 2024 at 7:59=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Remove custom PyYAML types definition module, use that from types-PyYAM=
L instead.
> - Add mypy hook in pre-commit
> - Better type hints/annotations
> - Better type hints
> - Some optimizations and bugfix
> - Add py.typed file, make the package PEP-561 friendly
> - data-class attribute order changed in yaml_include.Constructor
> - namespace changed to yaml_include
> - Data class for include statement.
> - autoload attribute for Constructor class, controlling if open and parse=
 including files, or return a Data object.
> - Representer class for YAML dumping.
> - load and lazy_load function - recursive open and parse for Data object.
> - Custom loader
> - Introduce fsspec to open including files. Now we can include files from=
 local filesystem, s3, http, sftp ...
> - New parameters for the tag in YAML
> - Drop python support blow 3.8
> - The tag constructor class YamlIncludeConstructor renamed to Constructor
> - Readers for JSON, TOML, INI ... YAML only now
> - The argument relative and encoding was removed from the tag class's loa=
d method.
> - Anchor (Maybe recovered in future)
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...n3-pyyaml-include_1.3.2.bb =3D> python3-pyyaml-include_2.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyyaml-include_1.3.2=
.bb =3D> python3-pyyaml-include_2.1.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1=
.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-pyyaml-include_1.=
3.2.bb
> rename to meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.=
bb
> index 3a5bd99a7..f989f4c25 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/tanbro/pyyaml-include"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>  DEPENDS +=3D "python3-setuptools-scm-native"
> -SRCREV =3D "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
> +SRCREV =3D "dc16153b28f5cab997814c0ce9b43dc4c58507e7"
>
>  SRC_URI =3D " \
>              git://github.com/tanbro/pyyaml-include;protocol=3Dhttps;bran=
ch=3Dmain \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110865): https://lists.openembedded.org/g/openembedde=
d-devel/message/110865
> Mute This Topic: https://lists.openembedded.org/mt/106626292/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

