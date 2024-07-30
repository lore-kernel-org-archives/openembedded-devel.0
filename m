Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FBCC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 05:11:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.11457.1722316313108727649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 22:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuNqcOpy;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7b396521ff6so62793a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 22:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722316312; x=1722921112; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YL1gtsccwD2pAdkSE3VC09mXPpgCcK1gzyt4Ey86lcg=;
        b=SuNqcOpyqxSxQeCJ8oA1oTb6SOdPZ/OlCp6llfTHREwpiOjFHE6zNXtVe47RDcgXnP
         WqkWvRaA4hwgql+ZNOokkQxdEGcOoMLzUDzJx9tXbR56K/PeC/wPiz/zKe5zjw7Qefd4
         J+Zxwd5Gcv8NzFUvzZrdsAc3p4Y+Pqaew/spiRqR1XmzoozDR9ka5bJKeLtlmN03UDXP
         gqHRzLwbVUOo90ihOi5kwUz/pD/y9p3xJe/FxZ8M+ntUU3+Ci1qbiWHQAviAsYXiE+r5
         ErTWSqOYo656txyRfRS3m0VrhdAATEnzGRwFNu1Bw1z66uw7aYYpGND86wFEN+ZId+bb
         ul5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722316312; x=1722921112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL1gtsccwD2pAdkSE3VC09mXPpgCcK1gzyt4Ey86lcg=;
        b=U9Bz9CgE7JC7rBG0pofzTikEN/sPtls0/pj07ehEyM2UDYewTvyJt8y+syHvfdSYKl
         OgTzyTjRDpt/ZSj54cEw9YKJYPwVrbEsFu0X0NxX7TR2E7C1iXRXfU6jMgbW5rVoXhsW
         HxyqIG9EwmdhlhoOmly/Sm1ms6WeAeVRkpLPmxAw7DsZfEuFlkVmLKM0XCEsVkETypaF
         xl4cjQLcdiRZ+6a0Kl824Fp9X4mOJHFWoidb22r0zI/71NVzzMF9JjSQnKYKSBzChK2g
         plC5e046RZKVuULIyzy7WY0Qpz4VPIOpNhcvZv7hytyukOzwR0tBxnIw1Q0Ky/+yn5v4
         Lm7g==
X-Gm-Message-State: AOJu0YwNHUlCKuUG8NM7B6FBPiFvIliqif2Wm3R/NosS9/Pl3pPsu9yc
	CHX3NTJKzgn/PLO+6vu3wUBYQAfUo1eGhFPs34PaypKNHkkUZ/kOZdMm5Z7QFJHe3JtSTIv/Z5C
	f3op9fSvbr8ft8iaazgTD63wnhVurq5kB
X-Google-Smtp-Source: AGHT+IHwF5QZ0T9Aw5S2Z5CRakRv+/ABf43iIhD6YRzdhiv5hd6BL5HqskdeSGIwlszjOT/nzgcNQfY19EeWsGu1e8s=
X-Received: by 2002:a05:6a20:a121:b0:1c0:bf35:ef61 with SMTP id
 adf61e73a8af0-1c4a117805fmr13391942637.2.1722316311975; Mon, 29 Jul 2024
 22:11:51 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 29 Jul 2024 22:11:40 -0700
Message-ID: <CAK5yBb_W2aqMpqe97GSh1UPJtAAqD6xH9vX5bLNnTbFcdQVpug@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f7610b061e7003e6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 05:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111476

--000000000000f7610b061e7003e6
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
team) are therefore going to start reporting out the currently 408
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.1=E2=80=9D, =E2=80=9C5.2", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.1" and then =E2=80=9C5.2=E2=80=9D.

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

--000000000000f7610b061e7003e6
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
ore going to start reporting out the currently 408 unassigned or newcomer b=
ugs.<br><br>We&#39;re hoping people may be able to spare some time now and =
again to help out with these.  Bugs are split into two types, &quot;true bu=
gs&quot; where things don&#39;t work as they should and &quot;enhancements&=
quot; which are features we&#39;d want to add to the system.  There are als=
o roughly four different &quot;priority&quot; classes right now, =E2=80=9C5=
.1=E2=80=9D, =E2=80=9C5.2&quot;, &quot;5.99&quot; and &quot;Future&quot;, t=
he more pressing/urgent issues being in &quot;5.1&quot; and then =E2=80=9C5=
.2=E2=80=9D.<br><br>Please review this link and if a bug is something you w=
ould be able to help with either take ownership of the bug, or send me (<a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an e-m=
ail with the bug number you would like and I will assign it to you (please =
make sure you have a Bugzilla account).  The list is at: <a href=3D"https:/=
/wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_Bugs"=
>https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcom=
er_Bugs</a></span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoN=
ormal" style=3D"background-image:initial;background-position:initial;backgr=
ound-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-s=
erif">Thanks,<span></span></span></p>

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

--000000000000f7610b061e7003e6--

