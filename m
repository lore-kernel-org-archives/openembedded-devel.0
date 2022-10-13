Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD95CC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 06:33:50 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web08.4570.1665642824635232310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 23:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I1ObM/1d;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id i25-20020a4a8d99000000b0047fa712fc6dso723407ook.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7utTo7TcTHvjWOmmmX3nkohNr418s5KSSY+3TsB2pE=;
        b=I1ObM/1dUr9Evh/H92XumS8vfEU0JGj54TofJA2XN4bX7SOp0mYrrQ4EMfLPl10BRF
         HR+7/PmbBlc3ZbA3JvLZcPYE6oYU9Fzz8251IXsWEhZPaRICLkxEgOMWnEhLCYdqck50
         /s+JpxuLsroHLUhfJlQ753mTMj5i60gr+WCUDTXJgSamWUGS8KmMR4tc7DG3GVMcRtQa
         Swv84TI3zunr8xzwGkz9fRt5OQh0sNHViGL3FGg1y4V7SeDi730ljW4Ty5qAZXoj5o92
         It9poOVmtRNv49FO03nGKk9K5bUVZvdYRLdfV5kukYdDz9NbvXZtcdnNinkswiF+LgfX
         P2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7utTo7TcTHvjWOmmmX3nkohNr418s5KSSY+3TsB2pE=;
        b=jZ1m4Pc8/yjJci3Ds/R1Q2AyYUWA0nmgGQk5laB8nppjNEAHsf3A1U33vTP5fk6IoB
         U+k0qvRMqyJqkaYwd/xCuz8d0iYPieLNE5DuTJpM7wS20WAPIlrxN3DzMT6pGmCi8Kf7
         l/+iApExHhNyoOt7M6cxjaNu4e+II9cjtqM5Wb9lgAbgXoJJpZLaS3TBPL6PokbPr1+b
         +qa588CnPQVoMoZXRwCxhf9NmYZJGs0AuyIX1zojA+rIhqjv5bEuWygiW/ff2Ic16jni
         G4C1xS+G29XiUlvsLhRq/i6zekz/uX7Nz+YAI/vJAE4UDtDV3O7wIsWd3yzqVLDwA1od
         f2cA==
X-Gm-Message-State: ACrzQf33NpKga3a6UyaTuYVtD/MVJEhg8nU4T8FAH7EJ6g30Xt/aTFHb
	90/J1lg6aRWPyp4lfHbHh4PKjY4nhtWtoa/QCCk=
X-Google-Smtp-Source: AMsMyM5eTosTi33wBJlJC6UNWLlxYmmmCnmld5h7mFCyxrIjuO9VU1tCLP+kK1RJcI9DEIjy+eQeWFUw41Y8XAvIgkY=
X-Received: by 2002:a9d:74c6:0:b0:661:c309:f0cf with SMTP id
 a6-20020a9d74c6000000b00661c309f0cfmr2035271otl.55.1665642823427; Wed, 12 Oct
 2022 23:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com> <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 23:33:32 -0700
Message-ID: <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461
To: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d02e4f05eae4b0e3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 06:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99156

--000000000000d02e4f05eae4b0e3
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 12, 2022 at 10:59 PM Polampalli, Archana <
Archana.Polampalli@windriver.com> wrote:

> Hi Khem Raj,
>
> I Have seen the link, issue is in Open.
>
> Could you please confirm open embedded is going to provide the fix.
>

If someone in community signs up for it then yes


> Regards,
> Archana
>
>
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, October 13, 2022 4:00 AM
> *To:* Polampalli, Archana <Archana.Polampalli@windriver.com>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] Security Advisory - yasm - CVE-2021-33461
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana
> <archana.polampalli@windriver.com> wrote:
> >
> > HI,
> >
> > Could you please confirm is there any security fix providing for
> CVE-2021-33461.
>
> seems to be open https://github.com/yasm/yasm/issues/161
>
> >
> >
> > Regards,
> > Archana
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#99147):
> https://lists.openembedded.org/g/openembedded-devel/message/99147
> > Mute This Topic: https://lists.openembedded.org/mt/94286070/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000d02e4f05eae4b0e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 12, 2022 at 10:59 PM Polampalli, Archana &lt;<a=
 href=3D"mailto:Archana.Polampalli@windriver.com">Archana.Polampalli@windri=
ver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Khem Raj,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I Have seen the link, issue is in Open.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Could you please confirm open embedded is going to provide the fix.</div></=
div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If someone i=
n community signs up for it then yes=C2=A0</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><div dir=3D"ltr"><div style=3D"font-family:Calibri,Arial,=
Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)" dir=3D"auto"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Archana</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_6502403113604084503appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_6502403113604084503divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" style=3D"f=
ont-family:Calibri,sans-serif">raj.khem@gmail.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Thursday, October 13,=
 2022 4:00 AM<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Polampalli, Archana &lt=
;<a href=3D"mailto:Archana.Polampalli@windriver.com" target=3D"_blank" styl=
e=3D"font-family:Calibri,sans-serif">Archana.Polampalli@windriver.com</a>&g=
t;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-devel@lists.openembedded.org" target=3D"_blank" style=3D"font-famil=
y:Calibri,sans-serif">openembedded-devel@lists.openembedded.org</a> &lt;<a =
href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank"=
 style=3D"font-family:Calibri,sans-serif">openembedded-devel@lists.openembe=
dded.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [oe] Security =
Advisory - yasm - CVE-2021-33461</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"font-size:1=
1pt">
<div>[Please note: This e-mail is from an EXTERNAL e-mail address]</div></s=
pan></font></div></div><div dir=3D"ltr"><div><font size=3D"2" style=3D"colo=
r:rgb(0,0,0)"><span style=3D"font-size:11pt"><div><br>
<br>
On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana<br>
&lt;<a href=3D"mailto:archana.polampalli@windriver.com" target=3D"_blank">a=
rchana.polampalli@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; HI,<br>
&gt;<br>
&gt; Could you please confirm is there any security fix providing for CVE-2=
021-33461.<br>
<br>
seems to be open <a href=3D"https://github.com/yasm/yasm/issues/161" target=
=3D"_blank">https://github.com/yasm/yasm/issues/161</a><br>
<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Archana<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#99147): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/99147" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/99147</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94286070=
/1997914" target=3D"_blank">https://lists.openembedded.org/mt/94286070/1997=
914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--000000000000d02e4f05eae4b0e3--

