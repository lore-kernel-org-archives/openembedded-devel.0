Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E401CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:19:54 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.14707.1757427593412483838
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chv1+7Qu;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so3639278a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757427592; x=1758032392; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6n6XR52BJ2r08Qp1rlDP1HLzXMxonu8NjZur74A0K64=;
        b=chv1+7QucWFVnXdQlp9ITm+2zJHTipM5wdXQWiHpE2ImIVIU81pKcrGfpx7aWR6JEc
         BbEyyzOs6GupXEuTc4lDem9ecIvZikg6rwaZesYE66mxnaq+sbyeQqRHO/9cUkPnw+eC
         2r9wTSWE1f8JPcG9zR+7gpljKzej+2xGjigZvC+aL1cwir/YSCuta22msgBYhTsm4HXr
         lY2UJrix3Iv4aflr0gWVKOXXxBuQ2GmUO5Pv+qBmRvQv1iMxb1IAXSJeH83fpPJ6JDf2
         msb7JQnZnHsf3zEPTGk+Qnb8A+0urzg2CrsKX2uC8vS9H4W8hnFy7+7eugzLh3UKX58x
         kQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757427592; x=1758032392;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6n6XR52BJ2r08Qp1rlDP1HLzXMxonu8NjZur74A0K64=;
        b=TJeGhXh6/VVXriSzpbWUITGmraLKzPpCrbqdquwvzjgNRgWL5UWj1RVfYH3ABDa65E
         QeCtbJaWvBGaDihVST5Ly8wxsW3uF7WlOgGKnBGf0RN/oNOB8l+7xH+d8/bsMFrU79eJ
         Ji/7S36gURFNKbQ6+vSGfuQWYgvxb2QcVLmeugL9QbnRXv4Z1gPIq2XwPsfuHTjkbpxV
         4TorECnXaoOcc8iEL3iSd29SG5Ms5rdbQJkQQYSEMpe3kYXdhwvdSyH8dsilbAIJwZD5
         Bz3/yvrxJUTSjjXF0E+g0BXLt64KmwKc7T00+rx9WfUQ3xbBTGl5szD18+N4CFaYBey7
         wvlA==
X-Gm-Message-State: AOJu0YwN8ouP6qyMCYyUdUANTF02Ju7/jLLq1D6icGEVt7Wqh0W0BS3P
	7Qsgn1Qh+zIMnCiMlem1gUblXqKXOjr/Ia9/fbkLQC1Vz6RN9W7SNTGwze7RwuF3GYC7YITz/Q1
	19E1kWgS8UPMqqCeh5tk8DxO+go+WfpTw1B2l
X-Gm-Gg: ASbGncsxUw4UqoqqPUSZ1Rl2fREdgrzKKiORCNRCztsTiudjYvcXcEI4h87aq2YdfQI
	NF70ne5YV+Ijvb3DvgSRM8pqdoVOpFEle2BZDCA7olbJwsGAwd7rPeXxkMrO22GucfQfKVs2vuW
	AqZKhi8gXt8wxb5OfB/XLK4sJ3B9zyFaJXqyybXa9BqVKElVJPdpYfdsO9C71wa8n0IuZNPql2N
	ZjvafrWuhSLxsJD065W6Rpvbfj1q7MtXoLTvQ00uKl6FNkP2i0SKFjyB/anAxk+CK8fdyjZLbQP
	VbAqT9O0bIeZgyU=
X-Google-Smtp-Source: AGHT+IGdgA2Hmx2sogHR7zvbsGwiny406nB7dQY5WTRs3ak5nRC4tImkTM4fjh3V9ccdQcvxlYSfDec0GjapW6HWN80=
X-Received: by 2002:a17:902:cf04:b0:250:1ba5:b207 with SMTP id
 d9443c01a7336-25175f6e7c9mr172129985ad.59.1757427592378; Tue, 09 Sep 2025
 07:19:52 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 9 Sep 2025 07:19:40 -0700
X-Gm-Features: AS18NWCwHhJdGcYFiRkLDJ-LhhmgbxQehQPZp8U6jTVxis4-MdXbgTxW9NXLuIo
Message-ID: <CAK5yBb_hi0hjCW6nQy=ymQR4+x_7BquRwdGwWQ4OLs+EFY=V_g@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000005cbd39063e5eff68"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 14:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119343

--0000000000005cbd39063e5eff68
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
team) are therefore going to start reporting out the currently 467
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

--0000000000005cbd39063e5eff68
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
herefore going to start reporting out the currently 467 unassigned or newco=
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

--0000000000005cbd39063e5eff68--

