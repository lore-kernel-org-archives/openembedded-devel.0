Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9EBCEE333
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:05:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.604.1763481932463201668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ci7T1xPn;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso3331053a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 08:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481932; x=1764086732; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DIR3xyp5HRxHw5F/aQLqYJYoVPZ0Dn7Kbmi2ESCV3ps=;
        b=Ci7T1xPnLDbNF6Uo96KB3+7c6/mH722R1jNTJRx5MoVLW3ww6vFkG7KcxQYmpT4Nxy
         NJy8zh4d3DeKOWJ0eMBqaf5kQtK/NEWc/ht4Bc6T1zHQIdJ9nRUhFMJAE/XUnDJNbsma
         qnCPiwWxfdS/iZ2xflc5PenxIoLjy2pr/4BNyHS7a1bfBmD1vlXIS4F/KhoS0oVRPG/o
         YAMyQ1/KaqoOlCi3ITTGHeZYuzaji+wUd/WH1GR74AzDCyHd+1gJo2XYm/4YWWRH0NW9
         mSxkC2UoeFmccB/LHYACODztLJdxWWx6eqH1t3LidIIaDJR7B4RS45BOwGvzIhApOiZJ
         whpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481932; x=1764086732;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIR3xyp5HRxHw5F/aQLqYJYoVPZ0Dn7Kbmi2ESCV3ps=;
        b=W1zyY2ee2WmqHhL2BVu4oeeWlg9Yj8f6g2YoGAV0YzcECA9Lzt1Wcb3vCBSg6uYvSZ
         jQmg7wCXTDQqM41klSlPanwV72REjfGyonsQklBr1OgB6eRzumE3iES+tJWR5eDOUzoG
         0jQcJtsorLSKIiZGzE/DFpaJPOp8nNg0KzRuyccNFfrn8SCnaAQrpq4qpOzkTU1CjauI
         tmjd/30Ss3776pnp6FY+hQWfymqqWUzG/LxzEaRcdWXNGbgVD2ssvTqQM/2RlOV4JTBG
         ts32LftTE0WYJZlMBizTPKya5VJeOULfK0kOmHXfboCTlOCHzRgnoZu//ziUWbVSTxBO
         /Giw==
X-Gm-Message-State: AOJu0YwF8CZsnfhZttL59xMlrK6x95IPHpYdtLLiSkcHch34VeoFsnw9
	vbyba5285KEwFDoH3+mxqmSjS17rCpaq+fMC78RC6sN5/BKCYZoBOjuCkCTTdkDyr0j48w/2dDH
	pALiYiSRItSqRYh5WQ63d0AmRi3B+U42s792E
X-Gm-Gg: ASbGnct5Pjacvk2+xlFGM0YHzqN8abuJgbO9oulyD0u/uZAPfSowH0Ury69w75tu6GM
	kdZ//vafL5ylJ6Bhcsz+lVXV7zfsJ1QY73Z9x/qvdsk12F7eM0MfnCHtpbhWwLIOMBoO/1Q7+Ec
	cwJDcu+LHKNo9/qk2YNlrXocWJh/ibAkMxd9q804DXymB9aEGooUlDhrUYDgyo57/0SrP1t6DNL
	Wtu1SQl2X3zn5ngniXTEBKyNOwUinNLDtKt39mN4MOl8do9oS0YIGnBZ3kLOD7dVZQKg6fJs3tA
	syF0YG3lZC+DuaWLJrSq0yb9GLGZjmR+H46j2HVWVohqf66B/8ReQZ9+V15Imn7sWOWR5G3FTbr
	jcLbNiCYvXa9sIjk=
X-Google-Smtp-Source: AGHT+IGaT90iBmhPuQc2drq7d6IXizxhhBeJm+qc3hge8tAO7iGAAjax4Q/whaKdc29n0CZmgtM6QnZaJ+qh/rEvE2s=
X-Received: by 2002:a05:7300:c38f:b0:2a4:7d0a:6351 with SMTP id
 5a478bee46e88-2a4abaebc59mr5584286eec.16.1763481931412; Tue, 18 Nov 2025
 08:05:31 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 18 Nov 2025 09:05:19 -0700
X-Gm-Features: AWmQ_blGES4Ma0fClsLvHQXW5ctCZVJiTCSe8NI_cVhQvYgETcUERCEVx_fFRKc
Message-ID: <CAK5yBb-xUF-+Av5wZgfErwCavLpJ1wd27BD5dgQ9Py7_2wC=8g@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000016faac0643e0a237"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 16:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121862

--00000000000016faac0643e0a237
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
team) are therefore going to start reporting out the currently 465
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

--00000000000016faac0643e0a237
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
herefore going to start reporting out the currently 465 unassigned or newco=
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

--00000000000016faac0643e0a237--

