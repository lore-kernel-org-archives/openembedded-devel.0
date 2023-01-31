Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16528C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 18:54:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2650.1675191239498254069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 10:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ciEIkYFd;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso5216318wms.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 10:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2MjuZdlC6zLTHF63x2F037+ip92nVFvdb6YIp/hs14=;
        b=ciEIkYFdPfYDQyEzyo4GRiW/34cJj1mw3jKlBN/NQpEkxwnvEQWFGGrhAWrAU+LusE
         gL8Mq+bdztrFH3YHxDUkU2mDfHtZza8BehAxlxdKF0tLsBX5J1i86jH85b/hEbWGwtnd
         BRUBr63GC4y5aUOkSlgAHoObKdD8xOHQnd2MjppYYfv1XNr7hDmrURPS/Pztopy2xFPs
         n/Wxf+tEguI7ZTfGsSmYQLcQeDZ7xIO8k3t/aJ8LwMDc3cTZ9TmqWBjVfusUBFpHMmWl
         Fuqq6E5uejUNiqfsfxwnx9xxTupMbO8KxAWEgv4B2yeElFkgqo/SX00OGRYXVgyhLQbR
         1gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2MjuZdlC6zLTHF63x2F037+ip92nVFvdb6YIp/hs14=;
        b=WcMb1sG+XPDAPZ8xjMKrIpSvXzH5nSHBlHKC/kKKvbdqdXP28Uyp08z7s6JwsLpNgX
         G5bddisbIWhc1YVpXzg/vKZ1KFFklIy4SYtbZswoQv6n74i/bkFykGR9Rk6PimKpX9t9
         EWMjAsDa6qxZ3MekrWI+w2xqiUTXc7enBvgfVnfbkBi48wIu+M2d0kjXma9cyXIso1uD
         W+66C9eZwnDUMtYZmErIx/QQFWY7cA8nXWaKn1qmzizgfM+0X2I6m3jsnV0dYsTqjZFy
         zx8hidMQy5pBCc5LGoSUtAmeqzMskxVVWA7dhHNEPj/XAA+TO21bHbp1kp65ECc0Tc09
         aWhA==
X-Gm-Message-State: AFqh2krIMIVWXt0CcsEBJsll8yxLA1K2bIO6EWxe3lebU+EfPNFW5Ynu
	yh44M9MARuoP8RKBkhD1PQEwHsXgL8oL9HtIvqE=
X-Google-Smtp-Source: AMrXdXv8RB8OX1neqklLNorpfQmLLVSJQiSU1v72jgO80Dq4kCMH4lw540Mpo0/uVk+tFllZLlM1k4C9jfk1v7KGjU8=
X-Received: by 2002:a05:600c:5405:b0:3d0:50c4:432c with SMTP id
 he5-20020a05600c540500b003d050c4432cmr3083770wmb.67.1675191237705; Tue, 31
 Jan 2023 10:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20230131170848.367522-1-f_l_k@t-online.de> <20230131170848.367522-2-f_l_k@t-online.de>
 <CAMKF1soE_5+D+cg0zZRLUnB2fNqQaPu7mH4G_WYgdu4izGxN2g@mail.gmail.com> <6H5DPR.NKQBKFK7B6GJ2@t-online.de>
In-Reply-To: <6H5DPR.NKQBKFK7B6GJ2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Jan 2023 19:53:45 +0100
Message-ID: <CA+chaQevn5APTRFUKY-cR92siPkxnCpRxQxS8Vvz0+9Td5Ah6A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] system-config-printer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a7829e05f393da1d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100885

--000000000000a7829e05f393da1d
Content-Type: text/plain; charset="UTF-8"

Doesn't python3-core in RDEPENDS:${PN} resolve that?

On Tue, Jan 31, 2023 at 7:46 PM Markus Volk <f_l_k@t-online.de> wrote:

> Am Di, 31. Jan 2023 um 09:56:29 -0800 schrieb Khem Raj <raj.khem@gmail.com
> >:
>
> maybe change this to #!/usr/bin/env python3
>
>
> But that would be about 50 files in which the shebang would have to be
> changed. They are all '#!/usr/bin/python3'.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100884):
> https://lists.openembedded.org/g/openembedded-devel/message/100884
> Mute This Topic: https://lists.openembedded.org/mt/96656636/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a7829e05f393da1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t python3-core in RDEPENDS:${PN} resolve that?</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Jan 31, 2023 at 7:46 PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onl=
ine.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div id=3D"m_-2265571364468180247geary-body" dir=
=3D"auto">Am Di, 31. Jan 2023 um 09:56:29 -0800 schrieb Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;:<br><blockquote type=3D"cite"><div style=3D"white-space:break-spaces">may=
be change this to

#!/usr/bin/env python3</div></blockquote><div><br></div><div>But that would=
 be about 50 files in which the shebang would have to be changed. They are =
all &#39;#!/usr/bin/python3&#39;.</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100884): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100884" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100884</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96656636/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96656636/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a7829e05f393da1d--

