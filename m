Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F28CC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 23:51:24 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.2888.1710805877035288564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 16:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j8h+s03q;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46ba1a05e0so225051166b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710805875; x=1711410675; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I6/W2jTXsU3l3GHjMXRan5jQpXLmRwW8j4Ue9MWgCIk=;
        b=j8h+s03qz63zufeFdS6HZpPIsHt+L65uLvUT/CMYM+FYlG2F50mRkfUz2AgP5oiZlB
         KmCjav0rqmMH3LjC0aSp3qDcSiwJ+Uhk5mk0YuMhaidMKrrq6661u0CgM6lXWqlck6PV
         Llrpy7cMCSxrmew9/oOV3VYXZKJVZgxRPLGOzQoOsDWQ+uHb+LdXTLM5xdIwHqcyPiQS
         I0rSedDPWSt1gYSrVK59kGH4pVh1WgjbjbEW+ICzy8x1T6MPze7O9T+/QtgM66q3vM03
         J365VzSHzcaXvEuEzg8M6p0dRTVueA1uQYEONvUMV9fpiI0Lycm5XAGFdd7aWsgeAIjh
         jD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710805875; x=1711410675;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6/W2jTXsU3l3GHjMXRan5jQpXLmRwW8j4Ue9MWgCIk=;
        b=P+Gb9v1wtNci0RnLSBwn4nrVGqvUcy0hUVNBxj55XLG/MRm6vsqbDmlW960MyQAxhn
         VIbYMmOOawpQc7dlAqVPzRVCtoPUqbUzboGLlGUAGmHArjn8Dj/zGyG4RNKrSxScDJ2T
         NL9RcVwIDRAD+EkcbqPUZqOkiBjvLYPUTxDMs6d/8CWNIQnJqilyTdPBhFMRKtCUpvOi
         wMlszXH9HW1Ye3RQzxlRRLY1BvEiGHDGrbwqgzJV4AX+Ey7UypxTtUsmmeakA0BCmLzT
         Yf13ZMw7r3ty/iDKJi62d7xCotM8TIomCRGI28MxINxKjZGWZXfhP2f1tl9O+FZ3WLAK
         EVkg==
X-Gm-Message-State: AOJu0Yzac5yw6a8f02p3rfifG9dokhF0wYui6nxJ1wjCusdSvjD8UofD
	hzlPH3sjW/xPbmN08Pa3inSbNUA6NlBOIJDlqbztlIF0DFoRWpuyWq5hkMwk4feX3hlrHY/Jp6r
	zZWRZMwasZc9j/F0zZB5ylF7IOYRXx29DlNM=
X-Google-Smtp-Source: AGHT+IGnoc4iRiRXMTkegDPSI6vQWkWwmtKMttcEeKyM6ZlV15ptD4HxkPLNTKSc0ZDNLIYfZI1eADVImNMBpWWhwQs=
X-Received: by 2002:a17:906:3589:b0:a46:ba8f:bcd4 with SMTP id
 o9-20020a170906358900b00a46ba8fbcd4mr492872ejb.46.1710805874967; Mon, 18 Mar
 2024 16:51:14 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 18 Mar 2024 16:51:04 -0700
Message-ID: <CAK5yBb-QbKsXdVdv0DU1W8tUbjLArCyG_5Z02s4OaeF+Z2i4jA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000750bed0613f80813"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 23:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109417

--000000000000750bed0613f80813
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
team) are therefore going to start reporting out the currently 411
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.0=E2=80=9D, =E2=80=9C5.1=E2=80=9D, "5.99" and=
 "Future", the more
pressing/urgent issues being in "5.0" and then =E2=80=9C5.1=E2=80=9D.

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

--000000000000750bed0613f80813
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
ore going to start reporting out the currently 411 unassigned or newcomer b=
ugs.<br><br>We&#39;re hoping people may be able to spare some time now and =
again to help out with these.  Bugs are split into two types, &quot;true bu=
gs&quot; where things don&#39;t work as they should and &quot;enhancements&=
quot; which are features we&#39;d want to add to the system.  There are als=
o roughly four different &quot;priority&quot; classes right now, =E2=80=9C5=
.0=E2=80=9D, =E2=80=9C5.1=E2=80=9D, &quot;5.99&quot; and &quot;Future&quot;=
, the more pressing/urgent issues being in &quot;5.0&quot; and then =E2=80=
=9C5.1=E2=80=9D.<br><br>Please review this link and if a bug is something y=
ou would be able to help with either take ownership of the bug, or send me =
(<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an=
 e-mail with the bug number you would like and I will assign it to you (ple=
ase make sure you have a Bugzilla account).  The list is at: <a href=3D"htt=
ps://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_B=
ugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Ne=
wcomer_Bugs</a></span><br><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"=
MsoNormal" style=3D"background-image:initial;background-position:initial;ba=
ckground-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sa=
ns-serif">Thanks,<span></span></span></p>

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

--000000000000750bed0613f80813--

