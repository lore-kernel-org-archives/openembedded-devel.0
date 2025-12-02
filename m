Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BEFD116F9
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:57:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.524.1764691054319670282
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYuIB22D;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ba2450aba80so3150321a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764691053; x=1765295853; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtuxJQzqFmGF9DGv3rJXOIs31i3zrHzZTASgHQN02Wk=;
        b=dYuIB22DkWZe/HTJ1hwsdhPlgT6BkhZRS+81tuYIpUCqbKu1bzm/j8lUJK8h2cNONp
         Pemr/x3NnQ1kc60FF7/s4h7CfoEDWSs/Fg4QauvVlK5rBBz7vwKNYGOEfYHAxY1za78/
         xjtzYGX6cU6b7kcXdHkTeOjzglvvxWYIiHyTEtuajAiolHrQJbfA+NfUuyKUXVR61RBg
         gT+mLyBsJTMmgow6Z+wXOMVzKqqvDjNXq6I7EPTcmuR6TrCoUiXsNoAxkUb7SUcw8ymI
         CwWEDHCRrRTynScz2VkYOG5kN/d26Qp71Wl5MX5r1QS+DiyMv+wilS08htcDt3nP6bba
         JpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691053; x=1765295853;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtuxJQzqFmGF9DGv3rJXOIs31i3zrHzZTASgHQN02Wk=;
        b=aI27aQMfc55edHXtY5+rRJi9vS9l3K1ntnL4cG7Kq9tErz3tbjCQbSdjhb7ktMPZIq
         GNxyPM7o+o9vy6YSoFisUcluSpJ4C9fcdTnl92cuI92TjO7lqXmZf96ZguVh8Rx+E1Nt
         tArj+8VFQesPJxNCEZ/hKK6miNPMxRWzXaSdvL5uHqV/Ff7406J52C7LmQY+K5v+hzvt
         k2oGNu90eIyAW8V4gwPGtZSJH644jcOK5Xea3rjVtvQ/ZE5TOY7w1kndFnUnXIPy54zg
         cfUwzIAGYdHsbZOSNay6GGB5hnIaDEBkCdF6DxuTXBULayZ9sW24LtSP0SS7qTIyHp6V
         RanQ==
X-Gm-Message-State: AOJu0YwdDKbCbNuD5HuQBXpNUJFX3qBmEMegHAwI1n9KCLG0joqB0l8M
	21ntaDJGSWqk+4atlPdc2TLQQMCcl87G/31oW/DXzbA02S6WpQ1snJzZMkymbUr3Uus1BcMpDlB
	Jdgxc/EJnzP1/lMJOEC4owF0YGliI48kRjiv9
X-Gm-Gg: ASbGncuoNrFYksYFmijpxTGuLzVfPiPDcv6XqtZw4O2WsPo6RhvrqOlsaPRG3c2jakY
	a0ZBKWX90d/z5bNzU+3y26Q0hZjjxJlnkorIWQzt+bdupKljaNefUKMInvf37MIagQk9x+88Ayc
	ueMYwb/wrk4w2mKw+QlLU6XIAjhvXwP92GmvsGLomruOL9SL77dNLSe8EbiNmwf8tnjDVujwNX1
	PLn6AWte6k+Kwu+iZlyU64W9rQOuF3iu0F5p9lLeGKdPE+CtilQgAtnms8eU0HgZVLn3aG8+O3a
	Vsv7d3Mzd2ky06txUxvBpXClYpCqWVDJO1nths5fYPRU8lToiYk18LjbhOR/23EHyD8cSOXAYS5
	iJrFODMF4XHWrLUk=
X-Google-Smtp-Source: AGHT+IEWfSAWtIVXcjkAdqzEdySgHJb6T2/kHOr0REU1JqOCfzRIq/iGA7FRyFTs+FpHEq9BPlSjmoxlslVgwEo9LhM=
X-Received: by 2002:a05:7301:e25:b0:2a4:5657:3f8b with SMTP id
 5a478bee46e88-2a94174db20mr20984102eec.22.1764691053277; Tue, 02 Dec 2025
 07:57:33 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 2 Dec 2025 08:57:22 -0700
X-Gm-Features: AWmQ_blEUbmEUwa7o2hYZtRbGKNDR6lijTDmVhRoGd_Xn1Ldh83yKA693GJH2t0
Message-ID: <CAK5yBb9_pAmeoZXQX1-oLoFAONenHRFj5HK6oDqu6FoRariJ4g@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000005e75f20644fa2779"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 15:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122264

--0000000000005e75f20644fa2779
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

--0000000000005e75f20644fa2779
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

--0000000000005e75f20644fa2779--

