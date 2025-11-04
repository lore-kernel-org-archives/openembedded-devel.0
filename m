Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC500CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12344.1762238527966829749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 22:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lm+eYBj3;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2947d345949so46015935ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 22:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762238527; x=1762843327; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p78zV0SWA36mQwndRkpkuCBlgIleC6Tur5SIBdFWxV4=;
        b=lm+eYBj3INc/o3zjAraPXkOWX1qie3g6K9zUKWUgMdSNqAXTD3Jse67cvVbAh617gd
         Paa4fSohb0HGlPaLv2yE3lTsLp14bnDb2Xl+L4ao1bqfK2pHjU0Fri3FhnBjdw4vo4hU
         lI+5UJSPvDjG+82r+06CGPpkgZ/9WohilgniHz2+UyC4bFecwG2U8PhFLkFX7+EVT/VP
         mVSdKn3dGihD7TE1tnJXhpxLqu17I35HrMEmR39oc1Sy3lGjBvfGfUO76X9iEW0sj4cF
         EWWLzAInmCJBsaq/qHVeRBcf6LCOtDqoIzlWCXsrUaTQQXfzc1Poe1Y691Q5u5qQUxoH
         LhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238527; x=1762843327;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p78zV0SWA36mQwndRkpkuCBlgIleC6Tur5SIBdFWxV4=;
        b=FuxAfvVBgkxQmk0FyRmOxPTi7urMhh8Q6/VRi56Aflq4m2fUZBKibleWngLUzqWRM2
         /N/YvVAcXfzfqbA7HXhxFkwdkO+H80ailBiWWneq++BA+dIPF1KidsfudRBUq5g+4FLu
         N7SpIK09XUvQUmQDa1WIa7WXubcfTXkgvv4KzOppTMJjNA+0+UKdaCqse2dlTSH2uoF5
         eYWKg72zZyYAZKhfkMk1frsdprjwNQwCNaUqdS8JJfx/sVo/WfvNjrfBeuCgnZpLK1L3
         Z5umEZDZNM2DD1FeW6iQUA9MTx/4K3bh+ZS0ahg2fssEJQTJt2m1UOWE+ZgHA4tvogxA
         N4fw==
X-Gm-Message-State: AOJu0YzVVaUVZGt2zHCM5Ji01IIcecURyt0bdHt8HFHHkHZ9f7WE2cY8
	L8k1zS6idlf4+i6G3qDH/8XbylNXfyTdvqTR42vQ7c3D/tQy3t5VCqlkbYmfGkK9rVyRB6ciXTY
	/UDKc0f0YudoDtjV0cK8G8K4mbKRz059vmThc
X-Gm-Gg: ASbGncuRVxEOeAOZY6+luf4nKqYBHokLAwhSex50oIhplWScTdhSgiEUYh17fiODvNL
	sUg9ReeuNpNksT9eAzwiEIh92oPoaL5SI/jxRjE1okD4ln2ObRSfklTMRaMJbochDOKe0vDRQQD
	n4xkEUNBOHDlmztLvUZCz40rL6YossGFPzbycg022S3COJt1BIUOZgpTK0gg/BKO0g5UoLyfx6N
	iPOsdgdTHf2prgSiuTvGDwiGfylx3k7z/PgPDceW5Vj9qK3Oa7UBIYFMqIWVvubqH13tPu32OUM
	gBdCUQEF1KCjpwKTXiLA0UaZq6mnGodT6h+TqfC+gUTdW0yyH0xG/9SmCHmse0tE171NCGO6Idq
	9W84=
X-Google-Smtp-Source: AGHT+IFdeCWjfR1Y7jwioghem9IyK+5KlXGZSNSgiKNaqgNAvfQ/labpYjfl5Q/k0aPoMd5d6U28cIblIZF4IoceMfs=
X-Received: by 2002:a17:902:d2cd:b0:295:8dbb:b3cc with SMTP id
 d9443c01a7336-2958dbbb68emr94010155ad.42.1762238526999; Mon, 03 Nov 2025
 22:42:06 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 3 Nov 2025 23:41:54 -0700
X-Gm-Features: AWmQ_bmuyv5_xBza2wy9AMSbedSgb6YyKPovzk8Q1k8szpkcbTxwXksd4yggC3o
Message-ID: <CAK5yBb87iy-bPaECisVaAVhBxS5VwtMP_r9myfNvayFaA4WyWQ@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000006952cd0642bf2161"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 06:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121288

--0000000000006952cd0642bf2161
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
team) are therefore going to start reporting out the currently 468
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

--0000000000006952cd0642bf2161
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
herefore going to start reporting out the currently 468 unassigned or newco=
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

--0000000000006952cd0642bf2161--

