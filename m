Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF07C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 07:44:11 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web10.9026.1635234250618290727
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JYr7ICRt;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id f4so27388238uad.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjLKj6+ttbYLaZMyf3rUq/tWDTGGFFRSiC9D+amXaOU=;
        b=JYr7ICRtik+j3EtCw7NwdXRyEaECmLQVLGHuH3TN8ypXwDxXhecmKP0ijh/cdsvsWJ
         zEsoD0bnousoYw5AQmWn8G/SlGLTNtoPKAjOttoG5wPA8B1svSbJWhfY/eeKiHccUjGJ
         T1ox+fjD5dAftbVCqgSOPBamTzyIdT6pZCIiJZWTvr5wfyX/yyY/sAniRuNgEGMusedx
         Bul2VFA4WJzkS/P/gCOv+ljuWoJ7erI//WMqSk77/OnYWS4nb9QhWpsU+QBxFYa5FLRq
         zVJjL8pAa5ZgJdp6AmumIHNkGZTzMOF+lIPBgwoue2SQXyQaUjFQrJzrgbm9VIPGXX2W
         htfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjLKj6+ttbYLaZMyf3rUq/tWDTGGFFRSiC9D+amXaOU=;
        b=jikmPA6xLAfcTZeH/xuKmo+igIjy4FcCiozajOv9puODAabSJUQD7lE2e7A/Sw9a0W
         GuFnl3N9/WeFA7UmqN4GHI/LXL/Jzk0KffiW6afquTelSNthF3n4h1i8SpW/Y01mwxdm
         RJ+n9+qDgPU071PfwRWjrvvdu163nm2B85qm+ep7zw3TF/qQFNsW1EqPqT1IgW6Iefr1
         GPYFUM3CPjlA/BoOq4/E4KmbX7GzQuQIBb8lLyRRXa1q6fnqQ5ovWHdK+g7x7z1/lHWZ
         FwuWAqMCH2TyCW1+z4fY/CV6HUiKLDFfRI0dcVt+i0dlZtpdoeL8AnXDdSwCUMq6YC9P
         afWg==
X-Gm-Message-State: AOAM531y7+b7zYz3WVGWcXfRMq5qAvTmqJiYYeNpwR3txUfgukpNMbzo
	bHQZnYlpxgZOcBBnAXq3GoOb13nKE8lEOHasZIk=
X-Google-Smtp-Source: 
 ABdhPJxjkezvUvmy05TRj8VZuYtxFQjFIGKfB+bIOUrmQom/EljsclzlLD+kMhF4FBBWWuu3h7Usw7FNoQv4PN9Udzg=
X-Received: by 2002:a05:6130:30a:: with SMTP id
 ay10mr13272848uab.93.1635234249758;
 Tue, 26 Oct 2021 00:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-6-alex@linutronix.de>
 <CALbNGRQKOSPK55jDHOVON3ct+dCgAN0j8D-EJ=Oayf0qHepJZQ@mail.gmail.com>
 <CAMKF1soHevhCSrKZM6qifuVHkAZ_CDmNkqpkDndRqB4GoygG_A@mail.gmail.com>
 <CANNYZj_j5Jm4GK8y-YB4J7Dgcwy10skHt1ba0v=XyBpLB-i09A@mail.gmail.com>
 <CAMKF1spN9551JXDzDdumeQzRovNVXTJ+w3Z1mW_G252we46zWQ@mail.gmail.com>
 <CALbNGRSE348L4+rGuMs+p_MVbWnWsbTt=yi2GTR4q8UNrV8poQ@mail.gmail.com>
In-Reply-To: 
 <CALbNGRSE348L4+rGuMs+p_MVbWnWsbTt=yi2GTR4q8UNrV8poQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 09:43:58 +0200
Message-ID: 
 <CANNYZj8v=PBYb=mhaf+vcaiK0TZUksO1NtctdHkV-yixGQB00Q@mail.gmail.com>
Subject: Re: [PATCH 06/24] mozjs: update 60.9.0 -> 91.1.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>,
	Hongxu Jia <hongxu.jia@windriver.com>, Lei Maohui <leimaohui@cn.fujitsu.com>,
	Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
 Mingli Yu <Mingli.Yu@windriver.com>,
	Ricardo Salveti <ricardo@foundries.io>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000094d94a05cf3ca419"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 07:44:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93585

--00000000000094d94a05cf3ca419
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Oct 2021 at 07:37, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> As long as nobody comes up with a solution, kick out meta-gnome from
> world. In the long run I think we need multiple versions of mozjs as
> others do. This was on my list but I am still not convinced that
> efforts here are a just waste of time.
>

There are efforts to replace sato with phosh in core, so keeping meta-gnome
in reasonable shape would be much appreciated.
https://github.com/moto-timo/meta-phosh/tree/timo/phosh-0.13.1

Alex

--00000000000094d94a05cf3ca419
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 26 Oct 2021 at 07:37, Andreas M=C3=BCller &lt;<a href=3D"mai=
lto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">As long as nobody comes=
 up with a solution, kick out meta-gnome from<br>
world. In the long run I think we need multiple versions of mozjs as<br>
others do. This was on my list but I am still not convinced that<br>
efforts here are a just waste of time.<br></blockquote></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">There are efforts to repl=
ace sato with phosh in core, so keeping meta-gnome in reasonable shape woul=
d be much appreciated.</div><div class=3D"gmail_quote"><a href=3D"https://g=
ithub.com/moto-timo/meta-phosh/tree/timo/phosh-0.13.1">https://github.com/m=
oto-timo/meta-phosh/tree/timo/phosh-0.13.1</a></div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000094d94a05cf3ca419--

