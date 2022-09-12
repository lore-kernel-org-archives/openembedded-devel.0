Return-Path: <venkattalluri5559@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA87DC6FA8B
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 06:50:57 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.4671.1662965455359336409
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bjzjEUJQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: venkattalluri5559@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id z18so5492808qts.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=tM8BuIfMzRSW4/364uUcJfp6cHp/1WPTc9Xyx4Z3hGY=;
        b=bjzjEUJQfo+5PysCt/1PE/3WTv9hL8yaE2AtN7cCZAOGRX8PhQW8ECHmgp0aZFZh9V
         G3hf8mADkeELD5pHt95Y/IlVWccIgPpVfzx9aJJHyeQfEWbsE2XRhbxcujptxeAbIElY
         w+f5Pmlai+42lPHM6cmeLiXjkW1Zdhfb7R+wnhsMNGlpYt8+ekwRDDa/qj8Mn4GWyBHO
         y3RIT3bVpFahmj3O+QZFQnaCyLipLx3TeaffZZCPo6//YTQ7Vl3BPO7YOsfah85GsZXG
         /QjuzSoS6Z4EJo0muXE2XvLZ5O7XZfuymi1tTOwKKQTd+faTKWbSZcVvMxIHa6dS8VHC
         Qzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tM8BuIfMzRSW4/364uUcJfp6cHp/1WPTc9Xyx4Z3hGY=;
        b=MUA3jEkAsoNxomsC6bFnGJFVQGrM9vMzhsSiJR7CXbCX3f8tZ5R2D0PKuQD0Kv3hoO
         ScEQZcRNDUoXYHgE+c3gV5SF4Cy2nJAB161/3uTLZHQ+DlSvR2ihnTUz52ZhuRw4IbK8
         eSO+uLvpVhnWegtVzmPy7eZswmnqHJyTmOkiHcGTKoUHQjZI1P44eD0dV1TmI7hmCp8I
         2TLwwakBkSnEKwGoZ7S79EXOCGduwzdAiprTXKkNremvHx+cXRRLjKA5NihWn5oUiqa8
         QR7VBVAa4/pcsbAAelpvhyT8KoBHq3EKyDjVTFj/ccQmTWAsi3MgrG4Xa0PYX9V0mBud
         Fy1Q==
X-Gm-Message-State: ACgBeo2YaJ667RNsw94DRloAIvda/cMt/7neXYRP19EIxPw+3ALYQAo/
	7apMx89mboQEIobjvfPc8CnX0PoEn0+8I5+Mosb+lFJSzU8=
X-Google-Smtp-Source: 
 AA6agR43aTbIIXQlIOLQlGJwfveHOkpWVMSCPFdPZFI/ZSvIp4k1SYAg5y0pHKvSuwmzvdUGMlHRynm6Ql4zvnIqoug=
X-Received: by 2002:ac8:5fc7:0:b0:35b:ad1a:a091 with SMTP id
 k7-20020ac85fc7000000b0035bad1aa091mr6705907qta.616.1662965454228; Sun, 11
 Sep 2022 23:50:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABbzySb9LgeM9Coy3UpFekmGBnj6JCZbyf7-L2p-0vBhJ36R4Q@mail.gmail.com>
In-Reply-To: 
 <CABbzySb9LgeM9Coy3UpFekmGBnj6JCZbyf7-L2p-0vBhJ36R4Q@mail.gmail.com>
From: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Date: Mon, 12 Sep 2022 12:20:43 +0530
Message-ID: 
 <CABbzySbMx6rRQksdds+4wHkwOu3Y-Uyr0iJm0HxdacoQTc-RaA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002c515005e87551e9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 06:50:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98750

--0000000000002c515005e87551e9
Content-Type: text/plain; charset="UTF-8"

I've followed below link and updated sysbench_1.0.20.bb file on QCS610
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg77365.html

On Mon, Sep 12, 2022 at 12:19 PM venkatakoteswararao talluri <
venkattalluri5559@gmail.com> wrote:

> Hi All,
>
> I'm trying to build sysbench_1.0.20.bb on QCS610 codebase but I'm getting
> following error so can you please help me to solve this issue.
> Image:qti-multimedia-image
> Target:qcs610-odk-64
>
> Error log:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'luajit' (but
> /var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/
> qti-multimedia-image.bb RDEPENDS on or otherwise requires it)
> luajit was skipped: incompatible with host aarch64-oe-linux (not in
> COMPATIBLE_HOST)
> NOTE: Runtime target 'luajit' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['luajit']
> ERROR: Required build target 'qti-multimedia-image' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['qti-multimedia-image',
> 'luajit']
>
>
> Please find the attached sysbench_1.0.20.bb file.
>
>
> Thanks,
>
> Venkata Talluri
>

--0000000000002c515005e87551e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve followed below link and updated <a href=3D"h=
ttp://sysbench_1.0.20.bb">sysbench_1.0.20.bb</a> file on QCS610</div><div><=
a href=3D"https://www.mail-archive.com/openembedded-devel@lists.openembedde=
d.org/msg77365.html">https://www.mail-archive.com/openembedded-devel@lists.=
openembedded.org/msg77365.html</a></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 12, 2022 at 12:19 PM ve=
nkatakoteswararao talluri &lt;<a href=3D"mailto:venkattalluri5559@gmail.com=
">venkattalluri5559@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr">Hi All,<br><br>I&#39;m trying=
 to build <a href=3D"http://sysbench_1.0.20.bb" target=3D"_blank">sysbench_=
1.0.20.bb</a> on QCS610 codebase but I&#39;m getting following error so can=
 you please help me to solve this issue.<br>Image:qti-multimedia-image<br>T=
arget:qcs610-odk-64<br><br>Error log:<br><br>NOTE: Resolving any missing ta=
sk queue dependencies<br>ERROR: Nothing RPROVIDES &#39;luajit&#39; (but /va=
r/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_s=
tandard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/<a href=3D"=
http://qti-multimedia-image.bb" target=3D"_blank">qti-multimedia-image.bb</=
a> RDEPENDS on or otherwise requires it)<br>luajit was skipped: incompatibl=
e with host aarch64-oe-linux (not in COMPATIBLE_HOST)<br>NOTE: Runtime targ=
et &#39;luajit&#39; is unbuildable, removing...<br>Missing or unbuildable d=
ependency chain was: [&#39;luajit&#39;]<br>ERROR: Required build target &#3=
9;qti-multimedia-image&#39; has no buildable providers.<br>Missing or unbui=
ldable dependency chain was: [&#39;qti-multimedia-image&#39;, &#39;luajit&#=
39;]<br><br><br>Please find the attached <a href=3D"http://sysbench_1.0.20.=
bb" target=3D"_blank">sysbench_1.0.20.bb</a> file.<br><br><br>Thanks,<br><b=
r>Venkata Talluri<br></div>
</blockquote></div>

--0000000000002c515005e87551e9--

