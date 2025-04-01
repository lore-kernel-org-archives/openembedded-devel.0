Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DADC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 05:17:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.12307.1743484665641202170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 22:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R5Jgi9FE;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30549dacd53so2797414a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 22:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743484665; x=1744089465; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AH4doq90XqRCHSjin56GhfJgK6GZu8zgMIR9uqG8N3M=;
        b=R5Jgi9FEp7qtH1izcDKXZyGytYxX7iY69X92SiLjYZq0w3cDVC69fXBolCmgfQAjaI
         VpWpXfr/EV8b5XvJ3AMFnqLsIN4LmFCeMyQUXU+Lu6YxuLiv11YtL82M6ZDMSHfY4yIY
         S2me6gJsCH/DWVWAlA/UY154LH3Hh5gWwujQQHdEjH5dLNWIlUokQmZu51G1+0gMWyuM
         eeGEJgOKZqlAz/ygeyMDs9MtxPoLlnyHEikBt0thU2VTonanwcegeabsw/rVnCfmeW+9
         UqB+H1MBkN/1T8WiMHJNG8BVVgcOuJnc9DXv3QfCfDB5AiNoORPQm7H4OmKPOFzt/AEw
         ynaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484665; x=1744089465;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH4doq90XqRCHSjin56GhfJgK6GZu8zgMIR9uqG8N3M=;
        b=iJN/w6i+/TURQgmz140RKZq/bs3f3dD/rQ+r9etRs7GRFHZhnbrp1dK8dY47iIYhh4
         02NZyfnOBGDhC9cUnzCsQ0QMenfQLKXVU4QGr7y8N71OmIDVckFYPhmzuwWUfA5bbFNe
         yLiSH4IeTE2+BMCR/aN+bDzqx0q9cMQ47uFFJk+PwekOniaoUJQJmKsYlbdVRex/n3QL
         k9CxLIYjoWdBNXwk17Dd+2n3BgQ22x+F4erYY1ANi7j4IzRgMR5fiuJaBsaVR3tgVAy0
         p7QowwfBsxQEi7fv45G0lMKchSMbg5ZPXMDw4oC7oFd86BdTyJCszfd8+Xk4ppQfdm9B
         SumA==
X-Gm-Message-State: AOJu0YySHHK2tmrq+hYa9kydJaRNEn2Zs10cjZ6fKDlX8Hh6EBj23G/V
	Ynzwh7CWCYQGwbsoUjBoMOvJ0q5gFmr5f91yKlah8HE2GIGaQnPnpHQbVoPaHVF4lcZdh4aRncU
	K2VJ7os9G9N2XIErEI55oXOLD9Y2gH+DVJhY=
X-Gm-Gg: ASbGncu+5QnE+uY9Y3X5eBqqAXS530BvCblxYUTGlJfMTfle8jn7WbulFf42+Ft/AV/
	j1UTnE6G/qeryIu07zDARebyJ1iLKtzag4KFES6E8TrInKe2Ft0gdk//HGlrE2MNwPuiLXiXQst
	8AwzEbhZUAkQStPc3OegTQ3idgbB98Uk5RByTsiWSIkvhXTF7YkiVQp4UZog82npmW8PJPuA==
X-Google-Smtp-Source: AGHT+IEjQ1BjH9zvyZI556D9uYliyJvxYmvkjjBNN7xFh89d0hYP4KDxulGiiGBlXbdzXsVpdVF0HxwGLmtEesj9p1A=
X-Received: by 2002:a17:90b:5252:b0:2fe:93be:7c9d with SMTP id
 98e67ed59e1d1-3053189a55dmr18782112a91.7.1743484664541; Mon, 31 Mar 2025
 22:17:44 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 31 Mar 2025 22:17:17 -0700
X-Gm-Features: AQ5f1JrdIWsGwPe2gkQGRQmF97Xqac28yKST52yUdfIC4iD2CSieHy48AC40AKA
Message-ID: <CAK5yBb9oJLH06=tSCnmjL=_=GH7xWgY6AXTxWHvqU6Ys+FWT+Q@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000019f9350631b0a8bd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 05:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116461

--00000000000019f9350631b0a8bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

The triage team is starting to try and collect up and classify bugs which a
newcomer to the project would be able to work on in a way which means
people can find them. They're being listed on the triage page under the
appropriate heading:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs Also please
review:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded and
how to create a bugzilla account at:
https://bugzilla.yoctoproject.org/createaccount.cgi

The idea is these bugs should be straight forward for a person to help work
on who doesn't have deep experience with the project. If anyone can help,
please take ownership of the bug and send patches! If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.

Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 440
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.2=E2=80=9D, =E2=80=9C5.3", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.2" and then =E2=80=9C5.3=E2=80=9D.

Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account). The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000019f9350631b0a8bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:11pt;font-family:Calibri,Arial">A=
ll,<br><br>The triage team is starting to try and collect up and classify b=
ugs which a newcomer to the project would be able to work on in a way which=
 means people can find them. They&#39;re being listed on the triage page un=
der the appropriate heading: <a href=3D"https://wiki.yoctoproject.org/wiki/=
Bug_Triage#Newcomer_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triage#New=
comer_Bugs</a>  Also please review: <a href=3D"https://www.openembedded.org=
/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/w=
iki/How_to_submit_a_patch_to_OpenEmbedded</a> and how to create a bugzilla =
account at: <a href=3D"https://bugzilla.yoctoproject.org/createaccount.cgi"=
>https://bugzilla.yoctoproject.org/createaccount.cgi</a><br><br>The idea is=
 these bugs should be straight forward for a person to help work on who doe=
sn&#39;t have deep experience with the project.  If anyone can help, please=
 take ownership of the bug and send patches!  If anyone needs help/advice t=
here are people on irc who can likely do so, or some of the more experience=
d contributors will likely be happy to help too.<br><br>Also, the triage te=
am meets weekly and does its best to handle the bugs reported into the Bugz=
illa. The number of people attending that meeting has fallen, as have the n=
umber of people available to help fix bugs. One of the things we hear users=
 report is they don&#39;t know how to help. We (the triage team) are theref=
ore going to start reporting out the currently 440 unassigned or newcomer b=
ugs.<br><br>We&#39;re hoping people may be able to spare some time now and =
again to help out with these.  Bugs are split into two types, &quot;true bu=
gs&quot; where things don&#39;t work as they should and &quot;enhancements&=
quot; which are features we&#39;d want to add to the system.  There are als=
o roughly four different &quot;priority&quot; classes right now, =E2=80=9C5=
.2=E2=80=9D, =E2=80=9C5.3&quot;, &quot;5.99&quot; and &quot;Future&quot;, t=
he more pressing/urgent issues being in &quot;5.2&quot; and then =E2=80=9C5=
.3=E2=80=9D.<br><br></span><div><span style=3D"font-family:Calibri,Arial;fo=
nt-size:11pt">Please review this link and if a bug is something you would b=
e able to help with either take ownership of the bug, or send me (<a href=
=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an e-mail =
with the bug number you would like and I will assign it to you (please make=
 sure you have a Bugzilla account).  The list is at: <a href=3D"https://wik=
i.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_Bugs">htt=
ps://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_B=
ugs</a></span></div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNor=
mal" style=3D"background-image:initial;background-position:initial;backgrou=
nd-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-ser=
if">Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>

--00000000000019f9350631b0a8bd--

