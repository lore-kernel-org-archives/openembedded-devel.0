Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A55C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 05:35:10 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.15542.1716874490436837713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 22:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hDccg87f;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6341cf2c99so19205166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716874488; x=1717479288; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=122Whs6K+QV6uUk8TRx08YJaze322VHEEAonvH3ElEw=;
        b=hDccg87fIEVKGTW+NS79Yx5uriSZ7BZ/mz5LxzQIQ/+tizlJW7PIJsnVq0ezmDDYvc
         tCccD8NLX4aBWRCx9DlB4DCRiop+w8ZkeVWxT4zeHIA71cur0EK0G3zmNycrtJH1JADB
         e7TFzVNACqJA7hiaKR4t8bsPoTJXtQMs40DqRPU0JB6Y9a7FjyPtaexk8yx7lGzm/gN7
         VGm9F2Oe9wHB4hA3NflYjhI1MCEPINp8AZEErv/A0Q+XCqmyN52uhVMti0oSo3DbgVmy
         rFxM3Z8S3HV8SOBfZfk6our6KhKfzuRS8j/9AQeG9Xl78HipEItX8oBRIEJ3hET0i+C2
         pNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716874488; x=1717479288;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=122Whs6K+QV6uUk8TRx08YJaze322VHEEAonvH3ElEw=;
        b=njGmcPZ1LcbcatcydkTcUtMJAQdg3qnxT7jsw6YjKw7bzzMTkQhWgAwz1WyPZhNM6b
         xhPI+xPFm2sAytwJm5mtzMXgiR6oZksdiXtevQrtY8YcK455oCRa3l6OJ1AXnqdYWi/M
         5RFjNLZRSa6rq75U5bqwLnSaW+pE749jmYJQZRMINvJlE+K9CLS4072i1rLJu1ITyz+d
         BeyHYusmqVqg7WqF/vWElelaVf297aIDCg7l0mTNDFpmz45GqWcp9wT94f5TpqdbfKHs
         GERi7BCbcxS+OXt+TnKLR+tUsJL+B6Rhp6mQl3CGyabHI7gSbT98Onr218Z1MHsCPHr9
         mhWA==
X-Gm-Message-State: AOJu0YzouwPErk00Qa5DyJs1/oaYwx91zRWIkWyoz6LhEWXilR9uPS3e
	EdMn7MnNsOo//0x/sg6UzkIobfopgb61eh4wEizD7ilWVQhOigNxY5F/VXloep9xuvLtr64jaPs
	nn8a9SWpER0hkp0wWcSaAN2vKQnFHf/az
X-Google-Smtp-Source: AGHT+IGOhwU+wnhk1n0pvTBPiNpnMYhkk3Ao355MLeYWO2HY8e/ucwI7Pdny17+6le6nKgZTzicSFhk0pwe/k4gqLtw=
X-Received: by 2002:a17:906:34c4:b0:a5d:1079:ae43 with SMTP id
 a640c23a62f3a-a62646cff2bmr665768066b.46.1716874488348; Mon, 27 May 2024
 22:34:48 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 27 May 2024 22:34:37 -0700
Message-ID: <CAK5yBb9M-C7U9_H5-UU=Zj=h18UQgkX+9idCjxHpVma2eAU9tg@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000000886606197cfe71"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 05:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110577

--00000000000000886606197cfe71
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
team) are therefore going to start reporting out the currently 424
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

--00000000000000886606197cfe71
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
ore going to start reporting out the currently 424 unassigned or newcomer b=
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

--00000000000000886606197cfe71--

