Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8298CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 03:42:40 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5718.1727149354043793123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 20:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qi5L5UgG;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71afb729f24so258134b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 20:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727149353; x=1727754153; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sYSqg5ITvwFhJh5uwSXWFnKzREPJZP9NAGvWspbS25o=;
        b=Qi5L5UgGinggZk5kYrsnsDrQTrodV/HGh8iqp1gQBTSUX1kRVnOoXhKV6efYnZZzlD
         jN0i1p8X+nYDwP7O8yIcnSOMEyoRSVcOt3J6nSlAKW0T7880BN6slDTaOq+Fpn4q1dEt
         kus71r81xXlYthVn/4cd/5b6xDrVFwlKZEqPpvm/tJzOg7MTmifhNXRBD+qfPqaddpxL
         n1O7SsGrh4HZrAlQGftZfFtOvwS9YX035RenKR7wHst+BavRp8PcDmb4F+KsPhnPJ2Fi
         wUP6nFBhJF2SWD0/esCgg3V51upF2uOEMF6WuSqRQXyrVapXBnQ1UEfchzVuKUeNYjMl
         aoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727149353; x=1727754153;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYSqg5ITvwFhJh5uwSXWFnKzREPJZP9NAGvWspbS25o=;
        b=CpOFCMCukFnAS0aMHa5WhLHV/2rgVYTbe8IRL480SsTngHZPSCBBOV5uyMs/DZRjYD
         xqmOySNrA1vBY01PlzUxrKBPyKaF+X0gCho/b8QEUorLNt+tSmqyW3xzyjiBlzqGCEeO
         z2MjTOXrGP6JO38rsCbe7721mCtGRpsi5CsMS7irNdKzISibC1+fKuL2k2P6R66n0h7T
         KNQW4C0AgFYF/sfu2Es9i6n8c4nftURwuAUWj8jQHBmBgIWoAg28MQgR/jH6VI80vdd0
         5uLqvvv+SHx3BFHvzk4RunUY9/NtEa/Vpi1RXJ/Y5bq1Hh3/I1MTtsb2aKK8iSjItBVL
         fypw==
X-Gm-Message-State: AOJu0YwR4Jht9LsWayKPtbaGfJ4D7OjgWMJGSikKC+YuM1WiiLzptj+D
	mmqdB8LwqgzwVzNrb+REWna5HD+XyQIuYFvudMUl3nYtE9uVWnJD0zN3wXhzBF6lkcGPsvpVjic
	ZvuBaGclrwQYd+mDqufv4YJXOU714NpVy
X-Google-Smtp-Source: AGHT+IGsOM+gNnwrqmTk0EKMQxr1PiE/V69FFQCufNsVMBOutAhWwwvTBZEpLXQw0iaty1O/bACkWKVjUAsZwgm/bM0=
X-Received: by 2002:a05:6a00:2e15:b0:714:2482:ab3c with SMTP id
 d2e1a72fcca58-7199cd79277mr20657876b3a.7.1727149353092; Mon, 23 Sep 2024
 20:42:33 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 23 Sep 2024 20:42:21 -0700
Message-ID: <CAK5yBb9C1MhmWRpG-Am1-JnuDmnhG=rCGQ5kHwGFeNyLGtq9uA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000aa4f730622d54b6b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 03:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112466

--000000000000aa4f730622d54b6b
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
team) are therefore going to start reporting out the currently 410
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

--000000000000aa4f730622d54b6b
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
ore going to start reporting out the currently 410 unassigned or newcomer b=
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

--000000000000aa4f730622d54b6b--

