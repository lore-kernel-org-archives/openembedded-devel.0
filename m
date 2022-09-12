Return-Path: <venkattalluri5559@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C96ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 10:20:39 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.5800.1662978038133598975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 03:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LqXc2ZIU;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: venkattalluri5559@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id c19so3710449qkm.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Mpe1Qd9wkWmzeARfGDdUv2/KPZMJlc7LYMFgWF62vKk=;
        b=LqXc2ZIUHcpFYwRWiPPeGC4yVf0pEBkCS2ftAvJJRml79n+3mRVZMLVIrRVDmGBcAg
         1eANLBv21oSYmjt1nTqRVT990fzvakZuicLlCnwW0aqdmhkUDb98ZPRCtQvxP9gORpbH
         gQY9Wbv2risNoATP8E30C46OTOR704l2RU8wt4JTSjLmJDtWJtR3i1cC9YOoKf07YdoB
         FrV9w3iLd7yOvxDLAy+j38bVa13+TaeJC0639lfl7dhWPWUUuggNYOavlaH9c67KKU0f
         iDF57GimYj3EIfR+VMFrH29IjhoD/ympQ8QSXnx+ccTr1+gXLCF0VyzIpLi6NVdcczP4
         tvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Mpe1Qd9wkWmzeARfGDdUv2/KPZMJlc7LYMFgWF62vKk=;
        b=msoiDSd4jvLWMkK87RxwutNpluH2EksyRqZzIPF+3KX3btHaf1a5Gc241hee0MooSN
         8RqYj2pdvMMps1N+EMBgqk09VJPOzTeaUuDuHFcJY7sYtTXNFl2IVipWjjqS0ewVG5DO
         owikaT6HDHEjuw7nGzR2x99RtKdB7dKyTvKau5BWAV55iQevDeU7OHpjbrvfEcaxGofW
         Cw0NGTfQ3A45xh0RZDmS+vWb+fJ41mKaIFvYP76CHfDQj+dfW9NfcRdPTzGKdXOFGglw
         cSViqWeJB4KB2kN+QLyuZQioYXWFO9l81Rcn/0Z7P0eycGtNsfo/7DCixDMMw6k+KXwU
         m0pg==
X-Gm-Message-State: ACgBeo3nSjZ2Bwya972b9ZmGwI6qMcL2uqrmZwAI4xiHOy5cIR/8zqIS
	KCmtkZbkSZpP4ESKPbU56Bb7NBM0cCdpVQQvhdU=
X-Google-Smtp-Source: 
 AA6agR7gsatQHM023t/G8S0tSAvNpdQU5HBz/Ot3Q5qLNIpM4Ad2sVqMN1AQmyU1AXm0W77YjINVBZ193MA+AEW7+dY=
X-Received: by 2002:a05:620a:2a12:b0:6bb:b3af:780e with SMTP id
 o18-20020a05620a2a1200b006bbb3af780emr18909977qkp.460.1662978037094; Mon, 12
 Sep 2022 03:20:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABbzySb9LgeM9Coy3UpFekmGBnj6JCZbyf7-L2p-0vBhJ36R4Q@mail.gmail.com>
 <17140A457780EF26.27399@lists.openembedded.org>
In-Reply-To: <17140A457780EF26.27399@lists.openembedded.org>
From: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Date: Mon, 12 Sep 2022 15:50:26 +0530
Message-ID: 
 <CABbzySaJqN1WXeB-LNoC+gKTCyQJD3bmW6-sOKWsFsVn=56_wA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002b9cd805e8783f2b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 10:20:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98751

--0000000000002b9cd805e8783f2b
Content-Type: text/plain; charset="UTF-8"

Hello Khem Raj,
Can you please help to provide feedback on this?


Thanks,
Venkata Talluri

On Mon, Sep 12, 2022 at 12:20 PM venkatakoteswararao talluri via
lists.openembedded.org <venkattalluri5559=gmail.com@lists.openembedded.org>
wrote:

> I've followed below link and updated sysbench_1.0.20.bb file on QCS610
>
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg77365.html
>
> On Mon, Sep 12, 2022 at 12:19 PM venkatakoteswararao talluri <
> venkattalluri5559@gmail.com> wrote:
>
>> Hi All,
>>
>> I'm trying to build sysbench_1.0.20.bb on QCS610 codebase but I'm
>> getting following error so can you please help me to solve this issue.
>> Image:qti-multimedia-image
>> Target:qcs610-odk-64
>>
>> Error log:
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing RPROVIDES 'luajit' (but
>> /var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/
>> qti-multimedia-image.bb RDEPENDS on or otherwise requires it)
>> luajit was skipped: incompatible with host aarch64-oe-linux (not in
>> COMPATIBLE_HOST)
>> NOTE: Runtime target 'luajit' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['luajit']
>> ERROR: Required build target 'qti-multimedia-image' has no buildable
>> providers.
>> Missing or unbuildable dependency chain was: ['qti-multimedia-image',
>> 'luajit']
>>
>>
>> Please find the attached sysbench_1.0.20.bb file.
>>
>>
>> Thanks,
>>
>> Venkata Talluri
>>
>
> --
> Venkata Talluri
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98750):
> https://lists.openembedded.org/g/openembedded-devel/message/98750
> Mute This Topic: https://lists.openembedded.org/mt/93627594/7150353
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> venkattalluri5559@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002b9cd805e8783f2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Khem Raj, <br></div><div>Can you please help to=
 provide feedback on this?</div><div><br></div><div><br></div><div>Thanks,<=
/div><div>Venkata Talluri<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 12, 2022 at 12:20 PM venkata=
koteswararao talluri via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;venkattalluri5559=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I=
&#39;ve followed below link and updated <a href=3D"http://sysbench_1.0.20.b=
b" target=3D"_blank">sysbench_1.0.20.bb</a> file on QCS610</div><div><a hre=
f=3D"https://www.mail-archive.com/openembedded-devel@lists.openembedded.org=
/msg77365.html" target=3D"_blank">https://www.mail-archive.com/openembedded=
-devel@lists.openembedded.org/msg77365.html</a></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 12, 2022=
 at 12:19 PM venkatakoteswararao talluri &lt;<a href=3D"mailto:venkattallur=
i5559@gmail.com" target=3D"_blank">venkattalluri5559@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">Hi All,<br><br>I&#39;m trying to build <a href=3D"http://sysbench_1.0.2=
0.bb" target=3D"_blank">sysbench_1.0.20.bb</a> on QCS610 codebase but I&#39=
;m getting following error so can you please help me to solve this issue.<b=
r>Image:qti-multimedia-image<br>Target:qcs610-odk-64<br><br>Error log:<br><=
br>NOTE: Resolving any missing task queue dependencies<br>ERROR: Nothing RP=
ROVIDES &#39;luajit&#39; (but /var/lib/jenkins/workspace/QCS610_OpenQ_Linux=
_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/re=
cipes-products/images/<a href=3D"http://qti-multimedia-image.bb" target=3D"=
_blank">qti-multimedia-image.bb</a> RDEPENDS on or otherwise requires it)<b=
r>luajit was skipped: incompatible with host aarch64-oe-linux (not in COMPA=
TIBLE_HOST)<br>NOTE: Runtime target &#39;luajit&#39; is unbuildable, removi=
ng...<br>Missing or unbuildable dependency chain was: [&#39;luajit&#39;]<br=
>ERROR: Required build target &#39;qti-multimedia-image&#39; has no buildab=
le providers.<br>Missing or unbuildable dependency chain was: [&#39;qti-mul=
timedia-image&#39;, &#39;luajit&#39;]<br><br><br>Please find the attached <=
a href=3D"http://sysbench_1.0.20.bb" target=3D"_blank">sysbench_1.0.20.bb</=
a> file.<br><br><br>Thanks,<br><br>Venkata Talluri<br></div>
</blockquote></div>
<br>-- <br>Venkata Talluri
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98750): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98750" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98750</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93627594/7150=
353" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93627594/7150353</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:venkattalluri5559@gmail.=
com" target=3D"_blank">venkattalluri5559@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002b9cd805e8783f2b--

