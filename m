Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED33ACD5BD1
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 10:34:44 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7902.1779964476193679568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 03:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W8IziIZX;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43b53f048beso5236436fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 03:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779964475; cv=none;
        d=google.com; s=arc-20240605;
        b=RQMkq+AimQIKSI+TlT7OFEAhRsSH8Z67wDCR0Ps+G2z+0i+MNTBNFTuhsb4HWDMHQB
         kOB+kJbSjb7LPbwLEXgtRaTlEh1fkx5+Q2BsbQI0lTNglyMSsCJYhNZnKS21NAyVaQka
         Z+GTECPFP1ItA03Vfob8/Wv78ccyy/+qdyhVCafeC8WWn6uwnM80Zy2MjVd+PnIHibgs
         LT/Gdmbs3pGPXTn9gYI77TUl2jbTHGTZRnzvndP1pCnJGEHtK3SnuTSUJ047IOYhbB2u
         UOS3mhvQGEv3/AKmFdU1b/1eiM8Gi3SWuORGX1tLCUycOSJbZFZiiaRABXuXhQhP061N
         +FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwyK2iKBaG83H9dCys2/f5Kyd4VqFe+uWfRFoUE7Dfs=;
        fh=u2BsUXMdwExM2e5F2AuZaMo7gDnkE6P/vIMA7Z6Pms0=;
        b=UW9Re8RfJF8JHL7i1xU4eIQ2UcGKjRs3kmjHWPRBQUrycVDqnhaoIW+ywGN9fP7zrB
         bR6MQzazD97jPF9ch27gjjZ/it2Ou1Amm7h1TnIrel7LncJl0Lzav9Pz3u0SfV3Liz4B
         /aGFTp6MuuYoGH5nLn0uRQCgCNLDdrlM7NQRoKuznVoQfuo66Ua0Un+ssMBeG7+9NYIB
         O+7FJsh/KwE8jswlDnE/iThqKnS64rzjQDjSEV9yY3gucDJPAbmm1PRYztqHOUfbpF0k
         03gN08m2HeCOTHCYxm7JfJX/Xp8IOl7+14dXJLdy0R0jSS9P8fFQDR0w8g0+9wJKCFO2
         cxlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779964475; x=1780569275; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwyK2iKBaG83H9dCys2/f5Kyd4VqFe+uWfRFoUE7Dfs=;
        b=W8IziIZXIX+cS6GFVSA229rOGLCOOhbXRvQAj0SlqyqY1F+SXpeacrJQhI2T6xFYmP
         2u4ZgTP/qHe23wWHJwOp/VTtIyNTXmuDAaMWdchrKSF1QFgm2SAXyMotgCbFiVwcGwx+
         0FXOm3BgUFQjWPgB2jdiHVyrGbJFrF+Bg8uf9ij4ob0LIlZ5pCxNajvs5nPKnWGLRllR
         3seOIf3/1y5hkv6aWVY+MFyB4BezyKupkEvK0CfvhhoCg+Q05Yi9sTs/8yKJRyDrWMLq
         Hf4R8eGokOzbzyDt/4ove3eT/sKELjNccecg+o9/W9besjv3E4MtJfGsa0ToXmywVxyL
         Gbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964475; x=1780569275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwyK2iKBaG83H9dCys2/f5Kyd4VqFe+uWfRFoUE7Dfs=;
        b=pnFWlzKe0mq9Ho3BRTwW02U0NWl1w2ErU0enOxjCjFVJ3spVrWlcmZxhDUADfR8C0/
         Zxd74+JKJJERXFSdWZTfZ6F+cYR44jOEhZsf2QCyJiWYHWWUA3k5uyHyI3q2oIntz6Ne
         GSuZ+HrcY7knffubKKKCfiBe3UIVIjh4fR9NOAipSSH5pt/bvP+clFkwjlmKpp7yE+2T
         OFg2rjXJ1r8lwsAnIUCiXKbb1IeHtEnod8/uO+mwpA3waJPRtfr5EsGPsvA5kx9S3W60
         R87hh/v4zJU2QxEynY//+1XYAik0xm6bRa1PVJkggbgps6pHYCfMIzW1sHRf/t2nhX4D
         eKeA==
X-Gm-Message-State: AOJu0Yx6JgOii9smL09C3YAoA+9wIEnrji8L3c9TAoTIA/LP8Eq4vciq
	docPLAIbkKY9W7mGpJ9dltx74pfW7LojDetdrUWWz+Ypzdx5SVCH0ctinjJBO8xfMYdLFQb5KYC
	VPQ7Ze37+DOCX5daf4zj4neLstI1G1TU=
X-Gm-Gg: Acq92OH+5Gqs3cGc7j9IXI9Ukqb12nvSHH9mRYNcw6bDsL5GjRunXjAexCw015mAYWV
	akwbtAeyxaL7ASi2MDqORy345ZKstRwasB5sHzaAExkGhz6w1oRigLgGjAako65K8/lTbhcb5tt
	RLYVRUWukvXeGjemrYeWSAZEbxQhgW+U24jYnKoVBXEF9JdLJViEBF9eeyI54vsRO1kfQf76UhL
	4BsL7PUoxDc5TzfLCFjJtzw8NeICLKTcfyKA5Zm3xvc/hYnEWyfFYVyTMQNux0CSslbUqBR2kEx
	bSukcVx8LJ8xyyG724zGPUu8iM2xpQY=
X-Received: by 2002:a05:6870:248f:b0:439:bf59:554a with SMTP id
 586e51a60fabf-43c6c8ca232mr367070fac.13.1779964475249; Thu, 28 May 2026
 03:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260528004753.1193-1-qili00001@gmail.com>
In-Reply-To: <20260528004753.1193-1-qili00001@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 28 May 2026 22:34:24 +1200
X-Gm-Features: AVHnY4KYHQor0fQKx4xzqNv8jQptxfOHDNCT4K2ylE3asuhc1YBx6ejarywOdLA
Message-ID: <CADySD0F407xG7b-9=B0rry3P=tFjpkFM8TJrx22rOmPt2hETnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libuio: fix FILE descriptor leak
To: qili00001@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 10:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127273

On Thu, May 28, 2026 at 5:13=E2=80=AFPM Qliangw via lists.openembedded.org
<qili00001=3Dgmail.com@lists.openembedded.org> wrote:
>
> The function uio_line_from_file() fails to close the FILE pointer
> when fgets() returns NULL, causing a file descriptor leak.
>
> This can be triggered when reading from /sys files that return
> empty content, leading to resource exhaustion over time.
>
> Fix this by using goto-based error handling to ensure fclose()
> is called on all exit paths.
>
> Signed-off-by: Qliangw <qili00001@gmail.com>
> ---
>  ...ix-fclose-leak-in-uio_line_from_file.patch | 31 +++++++++++++++++++
>  .../libuio/libuio_0.2.1.bbappend              |  3 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-lea=
k-in-uio_line_from_file.patch
>  create mode 100644 meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend
>
> diff --git a/meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-ui=
o_line_from_file.patch b/meta-oe/recipes-extended/libuio/libuio/fix-fclose-=
leak-in-uio_line_from_file.patch
> new file mode 100644
> index 0000000000..b5c984c23d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_=
from_file.patch
> @@ -0,0 +1,31 @@
> +From: Qliangw <qili00001@gmail.com>
> +Subject: [PATCH] Fix FILE descriptor leak in uio_line_from_file()
> +
> +The function uio_line_from_file() fails to close the FILE pointer
> +when fgets() returns NULL, causing a file descriptor leak.
> +
> +Upstream-Status: Pending

As per[1], this status is an exception. Please include valid
justification for it.

> +Signed-off-by: Qliangw <qili00001@gmail.com>
> +
> +--- a/src/uio_line_from_file.c
> ++++ b/src/uio_line_from_file.c
> +@@ -28,14 +28,17 @@
> + {
> +       char *s;
> +       int i;
> ++      int ret =3D 0;
> +       memset(linebuf, 0, UIO_MAX_NAME_SIZE);
> +       FILE* file =3D fopen(filename,"r");
> +       if (!file) return -1;
> +       s =3D fgets(linebuf,UIO_MAX_NAME_SIZE,file);
> +-      if (!s) return -2;
> ++      if (!s) { ret =3D -2; goto out; }
> +       for (i=3D0; (*s)&&(i<UIO_MAX_NAME_SIZE); i++) {
> +               if (*s =3D=3D '\n') *s =3D 0;
> +               s++;
> +       }
> +-      return 0;
> ++out:
> ++      fclose(file);
> ++      return ret;
> + }
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend b/meta=
-oe/recipes-extended/libuio/libuio_0.2.1.bbappend

No need to add bbappend file, simply update SRC_URI in libuio_0.2.1bb
recipe file

> new file mode 100644
> index 0000000000..d0e0dbb9a8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bbappend
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI +=3D "file://fix-fclose-leak-in-uio_line_from_file.patch"
> --
> 2.53.0.windows.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127271): https://lists.openembedded.org/g/openembedde=
d-devel/message/127271
> Mute This Topic: https://lists.openembedded.org/mt/119525599/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

