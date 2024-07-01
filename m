Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712FFC41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:58:56 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.22284.1719845934914534671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WNkj1c22;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d846837408so124558b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845934; x=1720450734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQD4QaTvbYIi2aKMXkbjL7fqoiNat2IJuaWbkrhL3Hk=;
        b=WNkj1c22qNieg713XQNo/exh/v8m/N7XeU+rNYFu+XSIb+8Mhr1GBlm0jPANuXe7lo
         ITKMnZ0GZwi9G2w/t0LpSJ3Qn8nda3zjycfkWoRfvu7W0XdCPa4bm0pmNVCnL9ggAZvL
         yqnfjzHjEb6r6TiphYNP6L2n2VbcDV6efyBoHEHPHCGehf3aKec22X4jiu9xcCoWdp4E
         K7Kxdhz2k8ZIN6zw64jdMb3iQezevoBvZ7X11Fh0u27IHf0yjgJOPE+h2GLcKi+mD6il
         fDHkEY0+DGysP7yPyX8r/rXhhI14yQu5+JHOI2vbGnnNZ/eUYvkk/Kc+RRWbvz+9PwlN
         1vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845934; x=1720450734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQD4QaTvbYIi2aKMXkbjL7fqoiNat2IJuaWbkrhL3Hk=;
        b=bmttUks47/oja39sMnWd8+C74wIczIsFsHhXOjAsrD3UWOBo5H6SGxKq7HLDEUMV5f
         hRasi/TrPUxtSvjVR9ueJLsOudFQKu3PXLbS1fckkUc2XcYoObUFTo6hncXSRxx3q4YV
         AS8Mv45jK/ovyKZ+SG2jU6Ryt5ofIEPiPsNryWP2TrX64XzGWJSiTcOhDp6QTnOBR6US
         DTr6MUV0pe0DZCZE4YHnJxGuEExKT/Q9CYjCg85/Qezg61o6piJrcmaEk+NgYmbImW1M
         f271Fz09OmVjDKWXwRIaZX8YqkLgWebiWlu++5mNddEPfTCqbzkEBTd6rweQgrRlFUiL
         FTqg==
X-Gm-Message-State: AOJu0YyS6ewwRvX5G+CUAg5nufL4wWGYlG720fq15VR7KYfrMcoLvMrl
	4idzG/dJpSPmd2XOzWc5PFscEW7ApDTOREAL55+JtuPHJ/HTP0VvDpVOaGI54/7CQLgr+d4xkP0
	Mru5MWD2ASDG+8Gyl4nsuHok8fqpXFg==
X-Google-Smtp-Source: AGHT+IFP45oEwB0VH3LVo5QKG46YESx8OD/bjIy49QiKEOJLnj+a9SxZSwk8s9gUcWa8x4bY+PGMwBJIYxzje4UVIQk=
X-Received: by 2002:a05:6871:5213:b0:254:c512:88de with SMTP id
 586e51a60fabf-25db361d901mr5591883fac.59.1719845934081; Mon, 01 Jul 2024
 07:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240630124721.64234-1-f_l_k@t-online.de> <CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
 <SJ0YFS.8BMPV3P7F4SC@t-online.de>
In-Reply-To: <SJ0YFS.8BMPV3P7F4SC@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2024 07:58:28 -0700
Message-ID: <CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 14:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111202

On Mon, Jul 1, 2024 at 4:42=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> On Sun, Jun 30 2024 at 04:34:47 PM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> perhaps we need to specify linking with -latomic on architectures missing=
 64bit atomics.
>
>
> Right. I verified that
> LDFLAGS +=3D "-latomic"
> fixes the issue for 32bit x86 clang
>
> Do you know what exact platforms need this fix or should it be included f=
or all?

riscv32/armv5/mips/ppc32 perhaps is all we care. Ideally it would be
good to have a global
architecture feature to indicate 64bit atomics and we could use that
test because this change
is sprinkled everywhere.

