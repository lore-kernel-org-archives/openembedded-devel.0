Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12772C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 15:33:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.8373.1643383998477125384
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 07:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LbtAINbY;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id w8so5826150qkw.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JngjYpUUNyY0bAWWIZoa2uLxZR63WgA9C8jmRodSCI=;
        b=LbtAINbY9MzeKWijohOBrGc0KFSEqPxOEZKu0/5nsZey4iTvTYCwL31Wa09I4JLFk2
         SJi3Y3HMKnTY58sCP2xVPvFfzqGFK/NhOxGxV2Ml64QY0+QM8T+KuGAQND4cCR6dLCeh
         x8SsLnMP/4Do/AmX9Ymq60gMxYxzuPR5zCTQ6ksU0LyCI3b0tn0xdi7uEfVmETATcB71
         Mhttsf/ZWPeAIpICDY2WryzSRYfDgIv5l4OjK6gxofb2T0UofR+MdIsjtPg8NgP2doUG
         ftVEk86CSG13M0DdkBG4TVx5NxWMhameJBKCb4Dw1h3qq8KS69vKk+z/2xb4xLtKsLe+
         McPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JngjYpUUNyY0bAWWIZoa2uLxZR63WgA9C8jmRodSCI=;
        b=rc0uw3x+CYudptgA0m5lUqlFTwG4FPpegUMqnMuSeMoLM+Po2/NFtOarc5c0ewXg9y
         MWt4nlDkN+LuecattqV4AGmQSYWFFOd4wMjwAJ7LoOKR48SFo9yB+Mg78KEwgGAYAXAd
         Nt1ph+1QAOCRh+/w7Y8TzvP+8GrAWOeFqNLiaWux5hIqA6Se8P5oOG6PdmHuZcM0jjYZ
         LYjltX0621cN8eKDWOXUH3PNEVOny5s5RfRa8AfTXYlunF78Au+wulNbG7RwwHq2D3nO
         LGiYpAbyYCXacZiQXF+aZDPqTcEVwMEc41O2oka2JrhQ1eEPA8G/zQ342TjOe2E4RWEE
         iDFQ==
X-Gm-Message-State: AOAM531WlMzyin3/lKLoXT6xnhkF2oFjyFWJMgg3B14vse5bMO4rJA+J
	Tvw4wDmtnBl8RZOJY/hkw5CNlIFK/T+vOEvActo=
X-Google-Smtp-Source: 
 ABdhPJy6gcddhXuYlB6q6CHCaZO7CFKvScnZOwuQRTuxY5CwP/UcwPX3XoiQBXFPKpGjR41TQR6GJnkQWr8ZRAT/GAw=
X-Received: by 2002:a37:63cf:: with SMTP id x198mr6252903qkb.72.1643383997469;
 Fri, 28 Jan 2022 07:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20220127230607.35740-1-festevam@gmail.com>
 <d204889ebaf04514b6ec2863a5104052@axis.com>
 <CAOMZO5DmubmJmVgTwVdkVBOc8h7+Ep7C2n0eRSKbhDMj9TimTA@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5DmubmJmVgTwVdkVBOc8h7+Ep7C2n0eRSKbhDMj9TimTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2022 07:33:06 -0800
Message-ID: 
 <CAMKF1sr+tUripPnYtWz+2xcwAqJq4QMYYkE82nobkw8i=N3bHg@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "hs@denx.de" <hs@denx.de>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Content-Type: multipart/alternative; boundary="0000000000006629a405d6a6272d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 15:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95148

--0000000000006629a405d6a6272d
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 28, 2022 at 2:28 AM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Peter,
>
> On Fri, Jan 28, 2022 at 1:48 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>
> > > +TARGET_CC_ARCH += "${LDFLAGS}"
> >
> > You forgot to remove the TAGET_CC_ARCH line.
>
> If I remove this line, the following error happens:
>
> ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA Issue: File
> /usr/bin/rtc-sync in package rtc-tools doesn't have GNU_HASH (didn't
> pass LDFLAGS?)
> File /usr/bin/rtc in package rtc-tools doesn't have GNU_HASH (didn't
> pass LDFLAGS?)
> File /usr/bin/rtc-range in package rtc-tools doesn't have GNU_HASH
> (didn't pass LDFLAGS?) [ldflags]
> ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
>
> Any suggestions as to how this should be fixed?


I already suggested in earlier email to add LDFLAGS in makefile rules

>
>
> Thanks
>

--0000000000006629a405d6a6272d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 28, 2022 at 2:28 AM Fabio Estevam &lt;<a href=
=3D"mailto:festevam@gmail.com">festevam@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi Peter,<br>
<br>
On Fri, Jan 28, 2022 at 1:48 AM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<br>
<br>
&gt; &gt; +TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt;<br>
&gt; You forgot to remove the TAGET_CC_ARCH line.<br>
<br>
If I remove this line, the following error happens:<br>
<br>
ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA Issue: File<br>
/usr/bin/rtc-sync in package rtc-tools doesn&#39;t have GNU_HASH (didn&#39;=
t<br>
pass LDFLAGS?)<br>
File /usr/bin/rtc in package rtc-tools doesn&#39;t have GNU_HASH (didn&#39;=
t<br>
pass LDFLAGS?)<br>
File /usr/bin/rtc-range in package rtc-tools doesn&#39;t have GNU_HASH<br>
(didn&#39;t pass LDFLAGS?) [ldflags]<br>
ERROR: rtc-tools-1.0.0-r0 do_package_qa: QA run found fatal errors.<br>
Please consider fixing them.<br>
<br>
Any suggestions as to how this should be fixed?</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I already suggested in earlier email to add =
LDFLAGS in makefile rules=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"=
auto"><br>
<br>
Thanks<br>
</blockquote></div></div>

--0000000000006629a405d6a6272d--

