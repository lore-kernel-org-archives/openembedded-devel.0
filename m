Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6202DFB5187
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 02:50:45 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71228.1775530237326851335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 19:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B7XoeKzl;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732e6a123so2330910c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775530236; cv=none;
        d=google.com; s=arc-20240605;
        b=U9QLRcwgvt+G72sHBCHCKvk6Uxw3vG3epDUimQ5dUsvPTratEmKUlllND3Yp5RUpgY
         n+1j1QGIjiJHyqi1njoMowFLweSWysnfR4iWZd/O/z2ohuHh9M6YBfzpLEwjmM5oepp4
         FaGnaV0nYROiwnXwYDAnaCP/KUIS9EzCNcjef6V9Dcayj4FpJToUcq9XOww1xE06A3Fk
         aDWtas3FQaBTC5O7MFt7QYuVD6il985T7wO2c5YQSwWRWA0a0lksMsqGVGaIYUfTrqhU
         CIl9SMq722LPPjf08f44vOYOWOhMzULJpUS32f0XuFM49Qx+J7H+KajIJFMbggpb4lEk
         p8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qOaHtKVocrC0q59dfApOVWaVmdslsS+hGVzkGn+UZzU=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=bgPbtSBY+Xc4UB3/Nkf7kIEj9hkYXBEGquskduI8GrMdbDlp/lQnHDtaQ+K+clVzhz
         pbeAhiTwEzSfr1JrvwtZQvc0uqqrDVlgb4bHqnouz1oNuRbizSIOrQKCqKHzmlmu1SeA
         hoFhgCMaExgKrl6KdDToGevIhGQ7I4ll2bkEGOpij45F1M2JfWuI9M03AgfkMZDC5+Ef
         RdVJlYMoAE2Nubc+xHQ2aMLNLqiVyUIzAJzo3htScJ6iuVR3FcYuN4UOoCPUlxijTbgB
         2tZDZl2ILADzX8FMcbaYQweSuvkYWGyCiIFE55dmfAqKdwmUPZlF3d50IZA7H0qu5hXb
         duzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775530236; x=1776135036; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qOaHtKVocrC0q59dfApOVWaVmdslsS+hGVzkGn+UZzU=;
        b=B7XoeKzl3F41Cces8hsLVFVSHo+xZ1fDpBxahdu7DZecezel9bOiQ9gGXWmgvSufE1
         Ed7tjNQBz6EaNbGg8SqLN4/7Cs+fDuNJQRlhFqyhaqWHziODJSlXcK6AwCe6WtFKx5VF
         MKuuAiQ7Z6EmOvWtWoH1xCrxvjG2fKEOdFXdX6Usre4pyDtWcqlM+Zzp8rLjj4oeAEBp
         al+OOATjfp4tRyxnRRymNeuT/nig39OMNzAPByFC7Tpj2YxRULNdQTBvTsaksB+CQzgo
         CmObSt4gZ6pwovEjaGb9Un+H4eI5fE+SEA3vx2HMtGKdMJydmblSkACOPoS6xeLSW8d7
         hmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775530236; x=1776135036;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOaHtKVocrC0q59dfApOVWaVmdslsS+hGVzkGn+UZzU=;
        b=tOunyqnFoegWs0jM5DZYB0mDQ7oTUR0fPAOTBvsDU5sHOXxtW8ieWvhJZmBL3YQPuC
         7miMNgXoSVCbf6lskIsPA5uyP2Ce7oyXnvsKoziRdUuK07hp8A9ZWTdlrCcBusSbG/uS
         tna1nCY/HaJRYVwkNyP3DBqREwtjYUafDUFXz3ZQxf1ffrdVGsZPRn5ga+V0Ar1p7fD4
         yyjoKV7VjvAET+9qDA6o/dpXSe3ePz+p4agL1Etr+fAL1s2FDklP0IJQ0TpKbXjp4cB5
         /I+PIFLXNf9a7uLQ6Accei2/gHhPq481cOx0d2jxGsvx248EITl9eC3Wwpcq+kloKneg
         SB3g==
X-Gm-Message-State: AOJu0YzVfznOhPdQrkaN0uYF4YKdctKZ7We4qA4VERSN3SEKLrejM74A
	u8vWqdMkJLC2HnPIrtCA39d8PTMGhBFO7/XyczkiMBWhwiyTMi1UPRip+OGx9QWqUjCdqSdEDQK
	kT+GjphuDSGKckcKUJ/BYB5vkUq68lMRegRrk
X-Gm-Gg: AeBDiet/QgmrY5df4pkGLkgpfaI3UhlQ3vaSraHjqFuG4PoY9jmZiWC5tClTiz5t/nN
	RyZxZnStwUvfNiCYrwDg38pYsqP9oA5OlCZu74zNSI5I9cuyNVjFSBDUOimhsqKQHrTu8q0o1mq
	YwcS+HXE2DOP1tNxnVjija0J/k4KpsTA/eEEGRRjHptnT0A7MIN8cWHUpEfXDv6U4/6e/0GVN/e
	RPdUjrIpRgwcrncAAQqgmYsbCojIHY+ucGN5/bbcMcevjlcni7rT3SOyd0TCkJW+yYsAy/pTeog
	La0nWdq8saPLpHPCJyp9c/4iaAacNBb/G6t+Ja4KPuRk5Yxq0ii80VFTyJqAxCKSZqTJfGO7l6e
	gv8yzoPiV7kjbYkOrlPrmT4MrwgQ=
X-Received: by 2002:a05:7300:e207:b0:2ca:8099:ffc0 with SMTP id
 5a478bee46e88-2cbf97f5e68mr8009865eec.7.1775530236026; Mon, 06 Apr 2026
 19:50:36 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 6 Apr 2026 19:50:24 -0700
X-Gm-Features: AQROBzA32I_ZD9bS7FHw_8m9FVCYtaEpeoNR2-A6Xf8_posowLU8TB9-mYTWCNA
Message-ID: <CAK5yBb8t-LwdyWQnXELLMBUWKD+ZxkMkb1xTde-3qDZkSqNK0Q@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000001a461064ed5d9eb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126071

--00000000000001a461064ed5d9eb
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
team) are therefore going to start reporting out the currently 442
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

--00000000000001a461064ed5d9eb
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
herefore going to start reporting out the currently 442 unassigned or newco=
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

--00000000000001a461064ed5d9eb--

