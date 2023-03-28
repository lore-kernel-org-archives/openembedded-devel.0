Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E92C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 16:10:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.428.1680019834478767582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 09:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4H/Rmqh;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t4so7569559wra.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680019833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CuVCIPMeh484Qb4Rka7RSc2vXEZa96+VYuGmu7jmGHY=;
        b=S4H/Rmqhtu9Mhnw6foQL7MD0t8rTdCGpCtC7kSTHMpu9jokr3fpSF1Ul6707Rn6rgS
         KfTPu/Fu9ueHeoPJn3vXU1OK9pnbVa6t+N4c4b3J1S9LM7PX+wigJbDSN9Wjn0vuEDWn
         5ykc8hquuxoU0CgoBLjYzZYb1KOlp7xWyVJ2YcZ0iU2TqJ6l7ZhobznWb52/K4KpiW/4
         FFYV8/wBgZVhEeA6FTt7XMbwt/hEW297ysDyuv0INIf5OVfXdNq2F4xtqIoS1hbOHWj+
         zAjAw0dY6f7lGGzDnV4IP7ae7KKWqop/Iuiyk8lgBB2Koce+MrfQv/QGdaWVx0cf4rOi
         mVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuVCIPMeh484Qb4Rka7RSc2vXEZa96+VYuGmu7jmGHY=;
        b=LLkQgCZHm+o+TbBMXMJD+IEbQrvHT9NhiZhvCf0Wl8+vC0db2nzi7V9GUFZox3xank
         vxeakxQyU3MtGi7TUM5iV3GsK0rsqZubBxzppgZLuXUeff/+Z9+Pi4Gho3HDNP5KKCae
         XdshL5VOqzdDMD/dxY25qhuuY7htfNGYJHiNiakc1ykeCEaCxgyZWhs5B/Ja7pokZ3gi
         lsOYfhGEcTTBUS0eXf9WvMS6AUhFRbEdWnL38CjBU2dWtv+FbQKIpMWtsluT1WrxKrFD
         jkw5YX3Lm501vnzDONj3X/osCe+fmnhKoBy7SV7xKtccLJSrb71yeDAvbwamoCAgJgyf
         r+Vw==
X-Gm-Message-State: AAQBX9fQMKX+y9VGlAKO+FUTMkD/vcuNo2nZpCki50WuVCjmi5fxqMr0
	XbDRJpBZkKYIrycJMJpLvfJATKlsV/ZQvhGKA8M=
X-Google-Smtp-Source: AKy350Z2Arwf2DsJ8yNKVoGGaFmOL2P9lZRODSVIqNbDC4H4UGYYp163kCTLujJ6/pzH4FmDIeGkFwBnxKKlARl3JEY=
X-Received: by 2002:adf:efc7:0:b0:2d6:6af:4893 with SMTP id
 i7-20020adfefc7000000b002d606af4893mr2684053wrp.1.1680019832857; Tue, 28 Mar
 2023 09:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230328064802.42713-1-cvubrugier@fastmail.fm>
 <CA+chaQeNc-6bhkZX=G6ukdP=KQGSttyxm=3xO8S9WWDyigHN_w@mail.gmail.com> <8fb1af8b-82bc-4d17-995b-d331a7876c5d@app.fastmail.com>
In-Reply-To: <8fb1af8b-82bc-4d17-995b-d331a7876c5d@app.fastmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Mar 2023 18:10:19 +0200
Message-ID: <CA+chaQe-x9ro+o5gsXgJdgMLY7mzrKcBomhhFqGCcHRRK1Q=qg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/2] exfatprogs: add new recipe
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: openembedded-devel@lists.openembedded.org, 
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Content-Type: multipart/alternative; boundary="0000000000005a6c7d05f7f81998"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 16:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101807

--0000000000005a6c7d05f7f81998
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 3:25=E2=80=AFPM Christophe Vu-Brugier <
cvubrugier@fastmail.fm> wrote:

> While exfatprogs provides the same tools as exfat-utils, there are a few
> differences.
>  1. In exfat-utils, `mkfs.exfat` is a symlink to `mkexfatfs` ; exfatprogs
> does not provide `mkexfatfs`.
>  2. Some options have different names. For instance, exfat-utils uses "-n=
"
> to set the volume label whereas exfatprogs uses "-L" (like e2fsprogs,
> xfsprogs).
>
> How do we convey the message that "exfatprogs replaces exfat-utils but is
> not 100% compatible"?
>
> Also, I believe that exfatprogs is better than exfat-utils.
> For instance, exfatprogs correctly format drives whose sector size is 409=
6
> bytes whereas exfat-utils does not.
>

In 2/2 you've removed exfat-utils so users of exfat-utils will have to deal
with this one way or another.

Otherwise existing images will stay "stuck" with some old version of
exfat-utils and package manager won't "update" them to exfatprogs.

So it might be tricky, but if you're confident enough to remove the recipe
and to set RREPLACES/RCONFLICTS in package, then I think RPROVIDES doesn't
make it more dangerous :) - probably less, because on target update on
older image will end with the same exfatprogs as freshly baked image.

Regards,

--0000000000005a6c7d05f7f81998
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 28, 2023 at 3:25=E2=80=AFPM C=
hristophe Vu-Brugier &lt;<a href=3D"mailto:cvubrugier@fastmail.fm">cvubrugi=
er@fastmail.fm</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg38044018957422936=
56"><u></u><div><div>While exfatprogs provides the same tools as exfat-util=
s, there are a few differences.<br></div><div id=3D"m_3804401895742293656si=
g22428721"><div><div id=3D"m_3804401895742293656sig22428721"><div>=C2=A01. =
In exfat-utils, `mkfs.exfat` is a symlink to `mkexfatfs` ; exfatprogs does =
not provide `mkexfatfs`.<br></div><div>=C2=A02. Some options have different=
 names. For instance, exfat-utils uses &quot;-n&quot; to set the volume lab=
el whereas exfatprogs uses &quot;-L&quot; (like e2fsprogs, xfsprogs).<br></=
div><div><br></div><div>How do we convey the message that &quot;exfatprogs =
replaces exfat-utils but is not 100% compatible&quot;?<br></div><div><br></=
div><div>Also, I believe that exfatprogs is better than exfat-utils.<br></d=
iv><div>For instance, exfatprogs correctly format drives whose sector size =
is 4096 bytes whereas exfat-utils does not.</div></div></div></div></div></=
div></blockquote><div><br></div><div>In 2/2 you&#39;ve removed=C2=A0exfat-u=
tils so users of exfat-utils will have to deal with this one way or another=
.</div><div><br></div><div>Otherwise existing images will stay &quot;stuck&=
quot; with some old version of exfat-utils and package manager won&#39;t &q=
uot;update&quot; them to exfatprogs.</div><div><br></div><div>So it might b=
e tricky, but if you&#39;re confident enough to remove the recipe and to se=
t RREPLACES/RCONFLICTS in package, then I think RPROVIDES doesn&#39;t make =
it more dangerous :) - probably less, because on target update on older ima=
ge will end with the same exfatprogs as freshly baked image.</div><div><br>=
</div><div>Regards,</div></div></div>

--0000000000005a6c7d05f7f81998--

