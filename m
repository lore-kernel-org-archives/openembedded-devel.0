Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DEC83F1B
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 01:43:57 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.8417.1693273432182830276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 18:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DGW7IQ4W;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99bcf2de59cso505551366b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 18:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693273430; x=1693878230;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=79xLu3ECsKatbuLQ9NDVLNKDtpji4F6lu+n2Whi5FM8=;
        b=DGW7IQ4Ww1G4pIFEsZJ1FOqheplaZ8ojFI01plUSLRmnYNG5+fN1IzRxWgPD7gkWIt
         NlvwH20iRz/Gs+nLY2mFK+nBsoHaGcvqhZxgZwytQVMz7nM1spvh4XIEZOB0VFcDW/gr
         oYGHdQEXnz0+5AMI4yxpQv5V6ZnptE3f+bIwEQnes/uZNhMDQ1zXQzP2lOyn7yBrwpC3
         qs8bE4XZ3sMBWOm/tXJ5YpMhKCJcrzGZejTFB0r7PhWynGf5+rvfM1HAmiR7hw+W7Blv
         TJi+Da/rtvaJe/z33/X9vZdMbFpex09mKSif23rHUl4TY3HAV0kQ9si9KBZwx5tWuroc
         xXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693273430; x=1693878230;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79xLu3ECsKatbuLQ9NDVLNKDtpji4F6lu+n2Whi5FM8=;
        b=glm4UTYgr2gACjsV9mK/C7gXi8/Agc7EOe8OvBEkJCwZCgOEDSMf9OVJD1ggqsxwnW
         +uaczz7U8eELVse8wwSKIggE4zRpWdTHCWj8MEJM1PoGz4yijQVQB2K8Ov5PdjkX1YcL
         RJuesRusTdHX7e2grefkUbyq/yEVd+q9+SJlIdSb5bM3mF3udpQtTEdZnHeumBO1Rvea
         pMJ8xNnlKVWjH3Ob/Q6NRjAmWTJCbTUxRHpyjeD+xKa/Lczx+qi26RpxXyP8vAQQ9n/0
         kMDnYibt2JIxPE5bEBL93HkeS5rxToubj6ilzIuYFnBjU990VdxD7IjZj5bkPX/5oIkF
         hzmQ==
X-Gm-Message-State: AOJu0YxuHqwojXLDoOSCKeRYqlHJkQ06MYvSNg8vlQj2OXDivFmLKAnS
	2O/xsQRG8lmEQPUoiuIDDx8AFD8V6y3RtNWEPHEc19IrRM0MFg==
X-Google-Smtp-Source: AGHT+IEerK7y5LwkLQ/r9LEzvidrUmPfCg2ez4eZgXNZopJoDOdJx/EkNprhqsA+UMWLP6pgvB26ditNUiT+T859+RU=
X-Received: by 2002:a17:906:74d7:b0:9a1:da9a:f1c5 with SMTP id
 z23-20020a17090674d700b009a1da9af1c5mr12444272ejl.45.1693273430058; Mon, 28
 Aug 2023 18:43:50 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 28 Aug 2023 18:43:39 -0700
Message-ID: <CAK5yBb_ozcr1Ms1zAdEYK1DmTatsyr0xOEk+XswwdS0kJpA5vw@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000004e6afd060405f15e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 01:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104636

--0000000000004e6afd060405f15e
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
team) are therefore going to start reporting out the currently 419
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C4.3=E2=80=9D, =E2=80=9C4.4=E2=80=9D, "4.99" and=
 "Future", the more
pressing/urgent issues being in "4.3" and then =E2=80=9C4.4=E2=80=9D.

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

--0000000000004e6afd060405f15e
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
ore going to start reporting out the currently 419 unassigned or newcomer b=
ugs.<br><br>We&#39;re hoping people may be able to spare some time now and =
again to help out with these.  Bugs are split into two types, &quot;true bu=
gs&quot; where things don&#39;t work as they should and &quot;enhancements&=
quot; which are features we&#39;d want to add to the system.  There are als=
o roughly four different &quot;priority&quot; classes right now,  =E2=80=9C=
4.3=E2=80=9D, =E2=80=9C4.4=E2=80=9D, &quot;4.99&quot; and &quot;Future&quot=
;, the more pressing/urgent issues being in &quot;4.3&quot; and then =E2=80=
=9C4.4=E2=80=9D.<br><br>Please review this link and if a bug is something y=
ou would be able to help with either take ownership of the bug, or send me =
(<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an=
 e-mail with the bug number you would like and I will assign it to you (ple=
ase make sure you have a Bugzilla account).  The list is at: <a href=3D"htt=
ps://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_B=
ugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Ne=
wcomer_Bugs</a></span><br clear=3D"all"><span class=3D"gmail_signature_pref=
ix"> </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNorma=
l" style=3D"background-image:initial;background-position:initial;background=
-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-serif=
">Thanks,<span></span></span></p>

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
u></p><p class=3D"MsoNormal" style=3D"background-image:initial;background-p=
osition:initial;background-repeat:initial"><u><span lang=3D"FR" style=3D"fo=
nt-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:blue"><br></s=
pan></u></p></div></div></div></div>

--0000000000004e6afd060405f15e--

