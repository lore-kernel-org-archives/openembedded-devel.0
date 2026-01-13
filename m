Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD13D29DD4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:17:49 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53226.1768285061691571055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czFiBqCG;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-121a0bcd364so8065984c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768285061; x=1768889861; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5wSon3bV7cJY1ZfuwNn3Gk3Aa/c+iLW/uH6AuuzGhQ=;
        b=czFiBqCGPMcQzW6FagD9HydDF1HedyVc8rw/cELvud9w+/ZXaT8iI3iRguk0HKjDhf
         8Nw6PnJ3Cy1oJDtXpTILQdZJzjy4pVCcyKBnvC+BqyDgCgMF9hZb3FpJGxBt5AzDrWNF
         xpasuVglU/NwIaem88xD52eUZqweD+qlLJIsgS00J6xV+elkQdwiJk4AKx4YsLObYzCf
         wlc1PNCE1pFi4Z887WN82iD869FPFTiVuY4uA5wyLtt0ZJ33l51bW8sHLqJ9asXV5nnf
         rwD6nhoz9obEDNGNS06lraLKyJFdSaZfbrVK1wxnlUX6KapfWn3foILsu74ut99qghsM
         d4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285061; x=1768889861;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5wSon3bV7cJY1ZfuwNn3Gk3Aa/c+iLW/uH6AuuzGhQ=;
        b=hNnBVZAHK+5D0AZvcsRBjFVK2W/P6kak2Kkm/a3o0Yb8/IAZT9huslLUWUlNKmg49p
         TO1BL7qdrwmk1w3EwHNyPY5wJX4Pu5LLxHn9ybs8otHi4HLYsnTxQL2cnwGsIvn8orQn
         MZ+wtQaufCtzSNYGIzuLi6UAvaACJxG7ClK1+uKTLxf5mndxxeNDUReXxNMbJhxZeV0o
         LArXVAaFw4ee+tVc0zuCuwZMySm0XNnxVgk0CG68w3JortKnqqO9lEUb9xhsE3JanR2I
         gziXtYOCmzgUSAY4BzKhVM4t3Mc7caIT6HIqy9jjbpB9GtOWYtV+lIaeGY9Y/TqYW2UD
         5COg==
X-Gm-Message-State: AOJu0YzWfYotnA4H0JAu0s1YvNeZO7SlFdmBz9yOpNOP7iEgjst+Dlau
	cigg0TnxfvadXjfDbIJspKrTHvAI4yp77p8B41Zw1RAnhf0+YeZ9TlgmcItSKzhbRkvO7pYzq30
	+cqelozXfOAz7Y7SyFQd2g7i2CDy2Oqx8Q7FM
X-Gm-Gg: AY/fxX6gTCryrt2ps6EGVn4Hb2RQGZOHBN5ZADqu2s0RTVt6Um+A9VwAI878/FB66io
	OszwNidQ39ZFIlXCfUBZi4WpYzgWvcRTGlc5ZkFosxxXj5bYSP32/Dr48lmJcgRNsM6sEh/lMAW
	Tj6smiHDgBlEAyeBlA97iLyUO8q2fxT707LTEH7UZUtP/y7C7SllSd5UQKIgTfL8DOXcKxVxBEi
	6MiNzqyNVm3gADMYIrhyGktIJCckTxa28cLtN5Oi6GLb0gSZozjYz60O10xMcVjZlYYlxCmuH+m
	J8RdcuB+1MSJECbS7tpxu2y8jktoWc061SkubRq6+OeIIhoI+kGozZxYakNIlTLFiixjStWWAMq
	Uarz1vMEvelHbkFk=
X-Google-Smtp-Source: AGHT+IGPJMYSyhPVY8IvLvAADm5CdlZLw37dl0joFKsJ743mCEGIT0gDe3W+398JcHnvPdvTjNkxmk1SDTtm5CNSaOw=
X-Received: by 2002:a05:7022:220c:b0:121:a063:66d2 with SMTP id
 a92af1059eb24-121f8b7c07emr18309240c88.31.1768285060775; Mon, 12 Jan 2026
 22:17:40 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 12 Jan 2026 23:17:31 -0700
X-Gm-Features: AZwV_QhlL88ch3liWg90RaFf_0gxLm4b1A9RVilSoADwCUpK1RRw71Q9uBeermM
Message-ID: <CAK5yBb-kyYaUXWBLXRon3bY-f=oCjV7NrcP4-yEqKvNxxG_anA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e8c3b506483ef25d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123394

--000000000000e8c3b506483ef25d
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
team) are therefore going to start reporting out the currently 471
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.3=E2=80=9D, =E2=80=9C6.0", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.3" and then =E2=80=9C6.0=E2=80=9D.

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

--000000000000e8c3b506483ef25d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-size:11pt;font-family:Calibri,Ari=
al">All,<br><br>The triage team is starting to try and collect up and class=
ify bugs which a newcomer to the project would be able to work on in a way =
which means people can find them. They&#39;re being listed on the triage pa=
ge under the appropriate heading: <a href=3D"https://wiki.yoctoproject.org/=
wiki/Bug_Triage#Newcomer_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triag=
e#Newcomer_Bugs</a>  Also please review: <a href=3D"https://www.openembedde=
d.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.=
org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a> and how to create a bugz=
illa account at: <a href=3D"https://bugzilla.yoctoproject.org/createaccount=
.cgi">https://bugzilla.yoctoproject.org/createaccount.cgi</a><br><br>The id=
ea is these bugs should be straight forward for a person to help work on wh=
o doesn&#39;t have deep experience with the project.  If anyone can help, p=
lease take ownership of the bug and send patches!  If anyone needs help/adv=
ice there are people on irc who can likely do so, or some of the more exper=
ienced contributors will likely be happy to help too.<br><br>Also, the tria=
ge team meets weekly and does its best to handle the bugs reported into the=
 Bugzilla. The number of people attending that meeting has fallen, as have =
the number of people available to help fix bugs. One of the things we hear =
users report is they don&#39;t know how to help. We (the triage team) are t=
herefore going to start reporting out the currently 471 unassigned or newco=
mer bugs.<br><br>We&#39;re hoping people may be able to spare some time now=
 and again to help out with these.  Bugs are split into two types, &quot;tr=
ue bugs&quot; where things don&#39;t work as they should and &quot;enhancem=
ents&quot; which are features we&#39;d want to add to the system.  There ar=
e also roughly four different &quot;priority&quot; classes right now, =E2=
=80=9C5.3=E2=80=9D, =E2=80=9C6.0&quot;, &quot;5.99&quot; and &quot;Future&q=
uot;, the more pressing/urgent issues being in &quot;5.3&quot; and then =E2=
=80=9C6.0=E2=80=9D.<br><br>Please review this link and if a bug is somethin=
g you would be able to help with either take ownership of the bug, or send =
me (<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>)=
 an e-mail with the bug number you would like and I will assign it to you (=
please make sure you have a Bugzilla account).  The list is at: <a href=3D"=
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or=
_Newcomer_Bugs</a></span></div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p clas=
s=3D"MsoNormal" style=3D"background-image:initial;background-position:initi=
al;background-repeat:initial"><span style=3D"font-size:12pt;font-family:Ari=
al,sans-serif">Thanks,<span></span></span></p>

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

--000000000000e8c3b506483ef25d--

