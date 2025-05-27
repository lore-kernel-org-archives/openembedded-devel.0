Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C29CC5AD49
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:51:57 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.45489.1748328707682144989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 23:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2lmKjAt;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so2738901a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 23:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748328707; x=1748933507; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AbgOdsCxSMZV3n7RYf1ZEpCxk0LH85UA6QpWxJLUSWU=;
        b=S2lmKjAt8Gn9OhBQEwCrmH7PJqd7DaXY44NaHIgUhGFXUu5b9UMSf7fhBaH7MHbCEN
         +2FHpM3dOlq/askdmwomsswYNvkyOXbCyK6pFG6oFRlTbs7n7/nbsH6ji2umAS7saR1n
         NCofczNVJGQNTuHNRhit+7vFjJessK6XCNlHq5QTUsJ9FJLHXdOrSc5jI7H+SfgWp1pY
         9Di+UR3Hc0u9+jdb6KL4ElTwcRKSOXffph4YdFL8TOCnr8lVZkDAV+PGOT9VzPjEKE/l
         L9kgiwJB3LRJ9wpjId/9a/VJMxuVb9f3BEwbMt2UwQ5rD1+Wi4yM2JCiNm0/WKEXBcBJ
         z++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328707; x=1748933507;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbgOdsCxSMZV3n7RYf1ZEpCxk0LH85UA6QpWxJLUSWU=;
        b=GJSzjEpquWMB8V01+gqpQMCqVDlEN1dVNNrWQIdO+i8d0y1mbsZm66OPqHvauhOdUC
         r6dS3b1jed3CkTGVK0RpYlfb2835QbQdMj+kR3/1BCG6Dtb5LEQsWYfwrrPh+anG21A8
         Od8PWVrXHwx7sdzZ8vWKxodD/4rxJ2vg4Di0OUwA2eMfVkN7BOq7H3uGTwmDPw7IkVFe
         vcAp+34FjlbIMMjlgmme3FVSYH0NpxQlecV9/Q3qK4xqz4JEUX3wNSI4i04QpXIsb6lO
         dYmrMnG/WLPQhyG1bG2Plz69jb6C+/utEVw6ef6EsI88RzTk7nvezoKpa0SVItiPiGLL
         6E0A==
X-Gm-Message-State: AOJu0Yzm+zl9yNGUZxxqUzCNls/VLxyGKOfhOrvL90ugvlwbUt6L4sgD
	6+c5F3vWZUnzhPkxzC1DUWhj+zdBIpSVOFveFiwdipIS4gUghas5CJf3G/rQZ4c1VVsXk8unwrX
	z2SFV2F6pyAR7UG5G1Guy2m8He2fOpncYTEt3
X-Gm-Gg: ASbGncsq9iUWJl8E+cc4lfMLK8T+YprNiQxSHBSQUlO0cJjF2DvCkq4XkOd5G0/iZEO
	bfJudre7T1ec4mYld7+taobPAho0qjZVBBbcCRF7lw34oyRyqqrJr+pxEntSRH7XtNPqB931krs
	dPVLyxs2oYSbn1Fvg92WP1cMkFge6fXKCCUJDQHuv8DweojQg11LoYpAOuJe20y3OFYXuTY78q1
	eGu
X-Google-Smtp-Source: AGHT+IFLkX+FgEew8EYo0ycs1hNRwEj0NnQbj06HNPDh0XNsPsg/nDVPdobG40+lEDlSvOShkBXx7mL5+vf1GW+k44o=
X-Received: by 2002:a17:90b:4c8c:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-3110aab1d18mr17251182a91.4.1748328706765; Mon, 26 May 2025
 23:51:46 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 26 May 2025 23:51:36 -0700
X-Gm-Features: AX0GCFsH30nveK8hdZyxjiHtmxZKPO7rJNtKum4fp_0SBTRKjRGTa5llt966JjI
Message-ID: <CAK5yBb8gSsqRFvYMUFa_LVifmV-sA7A=+8T9vEkTOnF1p8CFDg@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008479160636187f15"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 06:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117632

--0000000000008479160636187f15
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
team) are therefore going to start reporting out the currently 4447
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

--0000000000008479160636187f15
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
herefore going to start reporting out the currently 4447 unassigned or newc=
omer bugs.<br><br>We&#39;re hoping people may be able to spare some time no=
w and again to help out with these.  Bugs are split into two types, &quot;t=
rue bugs&quot; where things don&#39;t work as they should and &quot;enhance=
ments&quot; which are features we&#39;d want to add to the system.  There a=
re also roughly four different &quot;priority&quot; classes right now, =E2=
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

--0000000000008479160636187f15--

