Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.4143.1627013174706471336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 21:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ykkis99+;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j17-20020a17090aeb11b029017613554465so2081617pjz.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jul 2021 21:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DRvPEMlOSTj4LE0+M20JjSQQLC44gni8Ct682k7tn0E=;
        b=Ykkis99+vvTTGPIDRhkkzhjL00wbzUQLUfTdAegDACh7ELGfoT1n35GjH1pyDYj95m
         Zqi3fqNz53+p7ZJ/JEVpPSUCNUnRmB1ryWCGBj1kHYQ5oEARh++uUImwhzuKlnjWdNtb
         rkTz41G6QDyOs2U3GAhxDOKfK6N42O5aBWTSbc1cSAmmqmOYiswB+7aPEOVTerE2Xvtd
         gb1TV1yEEvh2JQbpQmWkHJ4OPGl5cOnNLUEUoDCaPRXiWAUfhS/9iPgoW7R8Dw1c5FGA
         H6rPaXvty6h9R0DpF02O2fsZUNcHIJ4mPdohBPiHY/DRX+clJNFi2vTVNnncTP11HxfR
         wn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRvPEMlOSTj4LE0+M20JjSQQLC44gni8Ct682k7tn0E=;
        b=n+ZUKsnNNtfBwAM+lyBgvy16URjkFwCT9efGLJyuqRPfHuIbPJN9AwVXzGK187KvUL
         0np8rqWMOgh9DrJp/6jU9/UeGFijdT4oxKeYFIBvnowSuRBv1O76ri11Vp3OpzOKy1R7
         qKG7AsXbq9+CGnh6QvDF/zwH4tMHupEassFLW4RcaModzstL4YiVdrz/WCFKDmf09UJZ
         nFdtyi8ueuQ2icRh2GX80k4yB6Fd1tA5eFsvR9+z2XMQNL7o6bh61rYBQFBuSf5g1iW8
         6NW4HMxEyu5T0PMiBM+CV5EGyTItBiu01Pkk/3NfDII/ShsAltzxRf40J5orxJ9P2Qmq
         ptWA==
X-Gm-Message-State: AOAM532jwkQEXUzq2gGpdAOiucLYVJ3fUBtnNHw1XwSV+KglF9M3bqy3
	wcPnDmsLreBuBjiIN1z8v0SdQZjAsQJRaZjvbHQ=
X-Google-Smtp-Source: ABdhPJy+Y+lRg8VFRx4m5HFdlJd3nfySOuNtN0/swb54cTZS1A4J9G5foNUmqSdtYRoKuq/hktQ87ZEz4vyToszB4ZY=
X-Received: by 2002:aa7:88d3:0:b029:32b:75d0:fa92 with SMTP id
 k19-20020aa788d30000b029032b75d0fa92mr2655009pff.23.1627013174170; Thu, 22
 Jul 2021 21:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626055148.git.jatedev@gmail.com> <a7901ba7-29c6-507b-3cc4-2be2fc8e1016@gmail.com>
 <CAPphmgaRX7dsRywafByOQzLQqppfOSGXfkk7ujQtm1Wvg5=2uw@mail.gmail.com>
In-Reply-To: <CAPphmgaRX7dsRywafByOQzLQqppfOSGXfkk7ujQtm1Wvg5=2uw@mail.gmail.com>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Fri, 23 Jul 2021 00:06:02 -0400
Message-ID: <CAPphmgaouZNfvSJ_R0e4QpyuoTk0nGp=6fbDfPucQFVzy_MO0A@mail.gmail.com>
Subject: Re: [meta-networking][dunfell][PATCH 0/2] ufw: Backport 0.36, update module RRECOMMENDS
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a95b205c7c2861b"

--0000000000004a95b205c7c2861b
Content-Type: text/plain; charset="UTF-8"

I am withdrawing this. A patch for the version in dunfell will be
forthcoming.

- Jate S.


On Mon, Jul 12, 2021 at 12:03 PM Jate Sujjavanich <jatedev@gmail.com> wrote:

> Ufw version 0.34 does not work with the python 3 within dunfell, so I
> backported 0.36 running its self tests successfully.
>
> I have now found the stable release and LTS guidance on the yocto project
> wiki. Let me know if this is appropriate for the dunfell branch.
>
> - Jate S.
>
> On Mon, Jul 12, 2021 at 9:44 AM akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 7/11/21 7:08 PM, Jate Sujjavanich wrote:
>> > Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for
>> > linux-yocto 5.4 in dunfell poky.
>> This update, is it bug fix only ?
>>
>> -armin
>> >
>> > The following changes since commit
>> c38d2a74f762a792046f3d3c377827b08aade513:
>> >
>> >   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
>> -0700)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://github.com/jatedev/meta-openembedded pr-dunfell-ufw-0.36
>> >   https://github.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36
>> >
>> > Jate Sujjavanich (2):
>> >   ufw: bump version to 0.36 and add services
>> >   ufw: update RRECOMMENDS for linux-yocto 5.4
>> >
>> >  .../ufw/ufw/0001-optimize-boot.patch          |  37 ++++--
>> >  ...option-to-specify-iptables-location.patch} |  41 +++---
>> >  .../ufw/ufw/0002-lp1044361.patch              | 118 ------------------
>> >  .../ufw/ufw/0003-fix-typeerror-on-error.patch |  20 ---
>> >  .../0003-only-make-one-reference-to-env.patch |  73 +++++++++++
>> >  .../ufw/ufw/0004-lp1039729.patch              |  40 ------
>> >  .../ufw/ufw/0005-lp1191197.patch              |  32 -----
>> >  ...setup-only-make-one-reference-to-env.patch |  77 ------------
>> >  .../recipes-connectivity/ufw/ufw_0.33.bb      |  59 ---------
>> >  .../recipes-connectivity/ufw/ufw_0.36.bb      |  90 +++++++++++++
>> >  10 files changed, 209 insertions(+), 378 deletions(-)
>> >  rename
>> meta-networking/recipes-connectivity/ufw/ufw/{setup-add-an-option-to-specify-iptables-location.patch
>> => 0002-add-an-option-to-specify-iptables-location.patch} (87%)
>> >  delete mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
>> >  delete mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
>> >  create mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
>> >  delete mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
>> >  delete mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
>> >  delete mode 100644
>> meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
>> >  delete mode 100644 meta-networking/recipes-connectivity/ufw/
>> ufw_0.33.bb
>> >  create mode 100644 meta-networking/recipes-connectivity/ufw/
>> ufw_0.36.bb
>> >
>>
>>

--0000000000004a95b205c7c2861b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am withdrawing this. A patch for the version in dun=
fell will be forthcoming.</div><div><br></div><div>- Jate S.<br></div><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Jul 12, 2021 at 12:03 PM Jate Sujjavanich &lt;<a href=3D"mailto:jate=
dev@gmail.com">jatedev@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Ufw version 0.34 doe=
s not work with the python 3 within dunfell, so I backported 0.36 running i=
ts self tests successfully.</div><div><br></div><div>I have now found the s=
table release and LTS guidance on the yocto project wiki. Let me know if th=
is is appropriate for the dunfell branch.</div><div><br></div><div>- Jate S=
.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Jul 12, 2021 at 9:44 AM akuster808 &lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/11/21 7:08 PM, Jate Sujjavanich wrote:<br>
&gt; Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for<=
br>
&gt; linux-yocto 5.4 in dunfell poky.<br>
This update, is it bug fix only ?<br>
<br>
-armin<br>
&gt;<br>
&gt; The following changes since commit c38d2a74f762a792046f3d3c377827b08aa=
de513:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-=
29 11:41:45 -0700)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://github.com/jatedev/meta-openembedd=
ed" rel=3D"noreferrer" target=3D"_blank">github.com/jatedev/meta-openembedd=
ed</a> pr-dunfell-ufw-0.36<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/jatedev/meta-openembedded/tr=
ee/pr-dunfell-ufw-0.36" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36</a><br>
&gt;<br>
&gt; Jate Sujjavanich (2):<br>
&gt;=C2=A0 =C2=A0ufw: bump version to 0.36 and add services<br>
&gt;=C2=A0 =C2=A0ufw: update RRECOMMENDS for linux-yocto 5.4<br>
&gt;<br>
&gt;=C2=A0 .../ufw/ufw/0001-optimize-boot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 37 ++++--<br>
&gt;=C2=A0 ...option-to-specify-iptables-location.patch} |=C2=A0 41 +++---<=
br>
&gt;=C2=A0 .../ufw/ufw/0002-lp1044361.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 118 ------------------<br>
&gt;=C2=A0 .../ufw/ufw/0003-fix-typeerror-on-error.patch |=C2=A0 20 ---<br>
&gt;=C2=A0 .../0003-only-make-one-reference-to-env.patch |=C2=A0 73 +++++++=
++++<br>
&gt;=C2=A0 .../ufw/ufw/0004-lp1039729.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 40 ------<br>
&gt;=C2=A0 .../ufw/ufw/0005-lp1191197.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 32 -----<br>
&gt;=C2=A0 ...setup-only-make-one-reference-to-env.patch |=C2=A0 77 -------=
-----<br>
&gt;=C2=A0 .../recipes-connectivity/ufw/<a href=3D"http://ufw_0.33.bb" rel=
=3D"noreferrer" target=3D"_blank">ufw_0.33.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 59 ---------<br>
&gt;=C2=A0 .../recipes-connectivity/ufw/<a href=3D"http://ufw_0.36.bb" rel=
=3D"noreferrer" target=3D"_blank">ufw_0.36.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 90 +++++++++++++<br>
&gt;=C2=A0 10 files changed, 209 insertions(+), 378 deletions(-)<br>
&gt;=C2=A0 rename meta-networking/recipes-connectivity/ufw/ufw/{setup-add-a=
n-option-to-specify-iptables-location.patch =3D&gt; 0002-add-an-option-to-s=
pecify-iptables-location.patch} (87%)<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0002-lp1044361.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0003-fix-typeerror-on-error.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0003-only-make-one-reference-to-env.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0004-lp1039729.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
0005-lp1191197.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/=
setup-only-make-one-reference-to-env.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/ufw/<a h=
ref=3D"http://ufw_0.33.bb" rel=3D"noreferrer" target=3D"_blank">ufw_0.33.bb=
</a><br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/ufw/<a h=
ref=3D"http://ufw_0.36.bb" rel=3D"noreferrer" target=3D"_blank">ufw_0.36.bb=
</a><br>
&gt;<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000004a95b205c7c2861b--
