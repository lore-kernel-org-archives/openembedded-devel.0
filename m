Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469D2CD042A
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 02:42:35 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82017.1767667353698559068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 18:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9ZXFjEQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c227206e6dcso479956a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767667353; x=1768272153; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RbExfWABu+zL4Qlaeu2/Vm+y/WLyg7IMjdqMc1xTm6M=;
        b=l9ZXFjEQu5f3gV+FiUgguGDGfdeeU5MGC5m23U6IQodbs31EK9wY3BnJOy9TVpQR/R
         L+XBOv20NWRMMR0UJV1o7++2RiRr6O/fPwA7HqyonDTE4ST+RqdoQFoovjYOs+daLsIs
         xe/0q3VTWSuHM9oIu5+6Mr1tMpUqFiX4fgrMtwNmm40h7SawG7zoUQCftocoXFQLg7C7
         BaG/ZqFqRBXewbLW5L9U5TgQZalBMkCmDjJg9m/do5TDPsYIa3GHuCI2lPkFdDQY2twe
         1Nhh6l25lsj+Uy1qki/HHwXec8osB1KybUgZjzs/m62ptJKcFgMLKJYrWrBoPNeXjtqS
         T9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667353; x=1768272153;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbExfWABu+zL4Qlaeu2/Vm+y/WLyg7IMjdqMc1xTm6M=;
        b=gFG7qFRG1DpQgEzXv/IXvC2oTfRABQ4Z/qC0s6Q+zkTgXfMLUwMqupwyG7gVoJ0Q/r
         dC7W1O126HnzwRZgyD0p5PPgq8wfDsZVeGp2Oe6tBZdmqWpKtZwkJSNtOlZzRljZ1FT5
         y7B+Tq3S84K0q4CD0CXlmlg86fegJxVcO0UDZxDl0l8eiUD9MtyWOHtimH8JEhQPi4dn
         LK1/pg3ljuLGrNwNXFT1qNMOOPX2tQIvO7w9ZSc+JWmfpui9KGY63x1zuIPsQ2DL0odD
         P50/vmP7J6o5XH/UW9zQ6P074m7TF8k7t8uvw94T2mj3y7rDW77e+cwR5pB1Z2rt8+7O
         JCJg==
X-Gm-Message-State: AOJu0Yxum3L+XYPmZQdBN/A8euwnmFuEbC8EX8vjZ/8HiCXTzkyTZcd9
	BZ7xHszjgUizZIHRqMUOM27uvoON0UtAc6NFfH9EFOAJF6tSnoU901kdO4tjEP2w7kYhmLTSvpW
	CWFtQw4n5kbdgxEkiWfq7yOt8WHGHp9DJuAUl
X-Gm-Gg: AY/fxX6hqsYhdxlvJUeJtcyBUaFG3qZhGu/tZLSRD8wWp+DpEDYlDw2+9ZAg2K9sQ/M
	25EkcnLtKBzW/mewdkjdXnZdLUW969S6J5v3xEyBWRxyOS+ZfzUw9W8JYJdQq/UlybmA4Hu1TVp
	f44RIHiSfeFWN5LUVXq+rAIGEhtb8NOQUdXBShY8geMLb1klcH4bDeRE2YOxa/JX8vVgP5MSnmN
	9eFWKDCkBG/dlD6BvJDbzfVjjMmiKLn0OADP7c49OuuJyRLzkpglE4Ju0IVvW4DKOXelfMABcEY
	mXaxLGYTb8pm53/u1UgzC0Z6qh4Q6WrDjYCWoJjamGPzJ3+A3pSaUjMbwwZ7V1bBa5ueKbBub7B
	35rHf06CxBZMV8KHqozO3clnWNw==
X-Google-Smtp-Source: AGHT+IHQ9HJh+Mve1js8EQxhwccJjSSWzEfXMpaDTJUN+6wx3a9DXDwkr5hInZC4KDj/uliqiajdv+5JOA19UMQ8Xy4=
X-Received: by 2002:a05:7300:2713:b0:2b0:542a:227d with SMTP id
 5a478bee46e88-2b16f861347mr860410eec.2.1767667352791; Mon, 05 Jan 2026
 18:42:32 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 5 Jan 2026 19:42:20 -0700
X-Gm-Features: AQt7F2pYHqGNsKSqVhmwGEPcBxgptCZOF3nCDfDEoskzHykJ6UvAqAT-od1UqeQ
Message-ID: <CAK5yBb9yfKvsXK4279NWJtiHXBB+q7ZoPzwwko78A=zLuiKPyA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a4f1e20647af2002"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 02:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123161

--000000000000a4f1e20647af2002
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
team) are therefore going to start reporting out the currently 477
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

--000000000000a4f1e20647af2002
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
herefore going to start reporting out the currently 477 unassigned or newco=
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

--000000000000a4f1e20647af2002--

