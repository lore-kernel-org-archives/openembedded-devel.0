Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49293C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 14:31:44 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.13086.1635258703248328943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 07:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HCC33gD8;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id h193so14330608pgc.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydHyhkTLCATNbiH42giUVUjYqsTbv7YEJ0P4oVT/YbU=;
        b=HCC33gD8YUux/AEWx68nsFKabUGN5+Q4q1tOFKgjLF/eWUs4QQbg90XTLfeUb+VJaE
         3CdkzkGbQSDNAxICQI0gRy9cV/HLY4NWiG+zwMFTlgr8kiJhfWFaw7Am6Z7VjTMUn8xY
         KjCsr/GAdUhf1yPxIDwE+gVzUafUBL+kj98L8NxsF5+Wp9qvR4YW/QmPnIgy2Y+sjSzI
         TNlNQ+2usnpRvn5U6+4/bK418NZtihauGHCZ27R/3xPkQsmqJN6TP9aKYUgrOW25+P5O
         gDuKMA9VTwnA/kd2KeswhYpIJdz8dmzP06KJCCRj9L0PXMom1k3zzJfT+kph4LHRjnHD
         AmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydHyhkTLCATNbiH42giUVUjYqsTbv7YEJ0P4oVT/YbU=;
        b=qeOPihFAX2s6RKU38VszUntY00rD1cXWCY4xZnvBC3bPh7nKaxx8I/3DeFpqbZmKEb
         dz5mYAIk474S9AMLL4PR1DWend7UJkxuogNXZLxtnVkUFZr3GnvHv/9so42AlWNl0DZB
         h/3qHI68tb1MzZ5kuYXH8RWRsSdcjYHaRmwUUCLV3IbS3J8TNPCalsI4mkhHw3ExdAzD
         qFFPeXrmRXIJiH7A8lCUvLfDBHIcrg2KUpc1dnsOgFIn6jU4aMBvLBM74wEmb4FypFjN
         xIJdudqfH49xvGjIg8kiknyFlUGR4/8dpHzCJThA7/lvJJrpXB6W5o+CeQvsAOwZI11r
         BEbw==
X-Gm-Message-State: AOAM530Mw01HJq2OfHaA+XJtquKV/zEQeIuOx3rO+cTeYlrbgrQkzAtK
	gi5SVfIX8iE5K3oHekmMFmJtBxso8C5STk0AlDc=
X-Google-Smtp-Source: 
 ABdhPJzpjkNySPszsqBAy84KH66aLfJNTK2WTdPV4Rh2CN2mZIOAvWkkWS0qmW08dQHO3fHAjJ3VeAKc4CG0R6QMh/E=
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr25444376pfl.82.1635258702627; Tue, 26
 Oct 2021 07:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <ef2aa568c54d428f862ceb1fac8ce2de@irdinc.com>
 <6712b33df1ac4d8886b90e4cb97a3714@irdinc.com>
 <CAN+SogJvp1mung7N=n7rLwXfUzkw=ybKCgs5FYG8e58q2dZUpA@mail.gmail.com>
In-Reply-To: 
 <CAN+SogJvp1mung7N=n7rLwXfUzkw=ybKCgs5FYG8e58q2dZUpA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 16:31:31 +0200
Message-ID: 
 <CA+chaQeGhWAUTFWrO6xnSqSn5W=pE-JLwNEZ_yHounq2y6haGw@mail.gmail.com>
Subject: Re: [oe] node 12 on dunfell memory leaks
To: David Turgeon <david.turgeon@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000016088f05cf425698"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 14:31:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93598

--00000000000016088f05cf425698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Is there any reason why dunfell would be stuck at node 12 even though
it=E2=80=99s unsupported by node?

node 12 EOL is 2022-04-30 according to https://nodejs.org/en/about/releases=
/

only security fixes and small bugfix releases are normally backported to
stable branches, upgrading node from 12 to 14 is very far from it.

If you need different version, then backport it in different layer. There
was also https://github.com/imyller/meta-nodejs which provided multiple
version, but this layer wasn't updated for very long time.

On Tue, Oct 26, 2021 at 3:44 PM David Turgeon <david.turgeon@gmail.com>
wrote:

> I=E2=80=99ve noticed issues with node 12 on dunfell memory leaking.  I go=
t around
> the problem by using a node 14 prebuild which caused the memory leak to g=
o
> away.
>
> It would be nice to use a shared library though and customize node as
> yocto currently does for other versions and since node12 has problems wit=
h
> memory leaks anyway it would be nice to upgrade it to
> node 14.  I=E2=80=99ll continue to look into why I=E2=80=99m having issue=
s building node
> 14 by porting the changes.  Currently the issue isn=E2=80=99t very descri=
ptive to
> me=E2=80=A6
> rdepends upon non-existent task do_package_write_ipk
>
> Is there any reason why dunfell would be stuck at node 12 even though it=
=E2=80=99s
> unsupported by node?
>
> ---------- Forwarded message ---------
> From: Dave Turgeon <Dave.Turgeon@irdinc.com>
> Date: Mon., Oct. 25, 2021, 1:10 p.m.
> Subject: FW: node 12 on dunfell memory leaks
> To: david.turgeon@gmail.com <david.turgeon@gmail.com>
>
>
>
>
>
>
> *Dave Turgeon*
>
> *Embedded Software Developer*
>
> IRD (International Road Dynamics)
>
> Ph: (306) 653-9653
>
>
>
> This E-mail message (including attachments, if any) is intended for the
> use of the individual or entity to which it is addressed and may contain
> information that is privileged, proprietary, confidential and exempt from
> disclosure. If you are not the intended recipient, you are notified that
> any dissemination, distribution or copying of this communication is
> strictly prohibited. If you have received this communication in error,
> please notify the sender and erase this E-mail message immediately.
>
>
>
> *From:* Dave Turgeon
> *Sent:* October 25, 2021 1:10 PM
> *To:* 'openembedded-devel@lists.openembedded.org' <
> openembedded-devel@lists.openembedded.org>
> *Subject:* node 12 on dunfell memory leaks
>
>
>
> I=E2=80=99ve noticed issues with node 12 on dunfell memory leaking.  I go=
t around
> the problem by using a node 14 prebuild which caused the memory leak to g=
o
> away.
>
> It would be nice to use a shared library though and customize node as
> yocto currently does for other versions and since node12 has problems wit=
h
> memory leaks anyway it would be nice to upgrade it to
> node 14.  I=E2=80=99ll continue to look into why I=E2=80=99m having issue=
s building node
> 14 by porting the changes.  Currently the issue isn=E2=80=99t very descri=
ptive to
> me=E2=80=A6
> rdepends upon non-existent task do_package_write_ipk
>
> Is there any reason why dunfell would be stuck at node 12 even though it=
=E2=80=99s
> unsupported by node?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93596):
> https://lists.openembedded.org/g/openembedded-devel/message/93596
> Mute This Topic: https://lists.openembedded.org/mt/86602800/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000016088f05cf425698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-family:sans-serif;font-size:=
12.8px">Is there any reason why dunfell would be stuck at node 12 even thou=
gh it=E2=80=99s unsupported by node?</span><div><span style=3D"font-family:=
sans-serif;font-size:12.8px"><br></span></div><div><font face=3D"sans-serif=
"><span style=3D"font-size:12.8px">node 12 EOL is=C2=A0</span></font>2022-0=
4-30 according to<font face=3D"sans-serif"><span style=3D"font-size:12.8px"=
>=C2=A0</span></font><a href=3D"https://nodejs.org/en/about/releases/">http=
s://nodejs.org/en/about/releases/</a></div><div><br></div><div>only securit=
y fixes and small bugfix releases are normally backported to stable branche=
s, upgrading node from 12 to 14 is very far from it.</div><div><br></div><d=
iv>If you need different version, then backport it in different layer. Ther=
e was also=C2=A0<a href=3D"https://github.com/imyller/meta-nodejs">https://=
github.com/imyller/meta-nodejs</a> which provided multiple version, but thi=
s layer wasn&#39;t updated for very long time.</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at=
 3:44 PM David Turgeon &lt;<a href=3D"mailto:david.turgeon@gmail.com">david=
.turgeon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"auto"><span style=3D"font-family:sans-serif;f=
ont-size:12.8px">I=E2=80=99ve noticed issues with node 12 on dunfell memory=
 leaking.=C2=A0 I got around the problem by using a node 14 prebuild which =
caused the memory leak to go away.</span><br style=3D"font-family:sans-seri=
f;font-size:12.8px"><br style=3D"font-family:sans-serif;font-size:12.8px"><=
span style=3D"font-family:sans-serif;font-size:12.8px">It would be nice to =
use a shared library though and customize node as yocto currently does for =
other versions and since node12 has problems with memory leaks anyway it wo=
uld be nice to upgrade it to</span><br style=3D"font-family:sans-serif;font=
-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">node =
14.=C2=A0 I=E2=80=99ll continue to look into why I=E2=80=99m having issues =
building node 14 by porting the changes.=C2=A0 Currently the issue isn=E2=
=80=99t very descriptive to me=E2=80=A6</span><br style=3D"font-family:sans=
-serif;font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12=
.8px">rdepends upon non-existent task do_package_write_ipk</span><br style=
=3D"font-family:sans-serif;font-size:12.8px"><br style=3D"font-family:sans-=
serif;font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.=
8px">Is there any reason why dunfell would be stuck at node 12 even though =
it=E2=80=99s unsupported by node?</span></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ------=
---<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Dave Turgeon</=
strong> <span dir=3D"auto">&lt;<a href=3D"mailto:Dave.Turgeon@irdinc.com" t=
arget=3D"_blank">Dave.Turgeon@irdinc.com</a>&gt;</span><br>Date: Mon., Oct.=
 25, 2021, 1:10 p.m.<br>Subject: FW: node 12 on dunfell memory leaks<br>To:=
 <a href=3D"mailto:david.turgeon@gmail.com" target=3D"_blank">david.turgeon=
@gmail.com</a> &lt;<a href=3D"mailto:david.turgeon@gmail.com" target=3D"_bl=
ank">david.turgeon@gmail.com</a>&gt;<br></div><br><br>





<div lang=3D"EN-CA">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><b><i><span style=3D"font-size:14pt;font-family:Gara=
mond,serif;color:rgb(0,112,192)">Dave Turgeon</span></i></b><b><i><span sty=
le=3D"font-size:14pt;font-family:Garamond,serif;color:rgb(0,112,192)"><u></=
u><u></u></span></i></b></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:12pt;font-family:&quot;T=
imes New Roman&quot;,serif;color:rgb(0,112,192)">Embedded Software Develope=
r<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:&quot;Time=
s New Roman&quot;,serif;color:rgb(74,68,42)">IRD (International Road Dynami=
cs)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:&quot;Time=
s New Roman&quot;,serif;color:rgb(74,68,42)">Ph: (306) 653-9653<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:&quot;Time=
s New Roman&quot;,serif;color:rgb(74,68,42)"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:7.5pt;font-f=
amily:Arial,sans-serif;color:rgb(95,73,122)">This E-mail message (including=
 attachments, if any) is intended for the use of the individual or entity t=
o which it is addressed
 and may contain information that is privileged, proprietary, confidential =
and exempt from disclosure. If you are not the intended recipient, you are =
notified that any dissemination, distribution or copying of this communicat=
ion is strictly prohibited. If you
 have received this communication in error, please notify the sender and er=
ase this E-mail message immediately.</span><span><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Dave Turgeon
<br>
<b>Sent:</b> October 25, 2021 1:10 PM<br>
<b>To:</b> &#39;<a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a>&#39; &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a>&gt;<br>
<b>Subject:</b> node 12 on dunfell memory leaks<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">I=
=E2=80=99ve noticed issues with node 12 on dunfell memory leaking.=C2=A0 I =
got around the problem by using a node 14 prebuild which caused the memory =
leak to go away.<br>
<br>
It would be nice to use a shared library though and customize node as yocto=
 currently does for other versions and since node12 has problems with memor=
y leaks anyway it would be nice to upgrade it to<br>
node 14.=C2=A0 I=E2=80=99ll continue to look into why I=E2=80=99m having is=
sues building node 14 by porting the changes.=C2=A0 Currently the issue isn=
=E2=80=99t very descriptive to me=E2=80=A6<br>
rdepends upon non-existent task do_package_write_ipk<br>
<br>
Is there any reason why dunfell would be stuck at node 12 even though it=E2=
=80=99s unsupported by node?<u></u><u></u></span></p>
</div>
</div>

</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93596): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93596" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93596</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86602800/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86602800/3617156</a><br>
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

--00000000000016088f05cf425698--

