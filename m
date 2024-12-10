Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6999E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 05:20:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.3456.1733808016536410583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 21:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9DbO8Tx;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so2901590a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 21:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733808016; x=1734412816; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qlYHW3DWAwkcVDdYIITwrvBRzBAcltAo2bnuyaeQFO4=;
        b=R9DbO8Tx1WwlTXxwAQAlNfd8rQzCcan5mf/ZFnda+Lfol019uG/FXIeVFOksQdFCtz
         IKs1a57kFqIWsWBiwKTgeorbl0C3sU8xyUKCPioh3UMnNEKHw+4vbxY9icOyvHcYNWFY
         CyMR78/B0pqdmHwbdANTCRLGVI2GCkNEDfiDN9k3QsXRk4C5JJlDkK+HsqJjd1+TsXmW
         /yc6ptHNVhqEll6ngCD+HSCTJ+Sb8nLSJKPto7f+fTRn3Clpc2eWI9hjAQOJbAWZUJr7
         YFgqra3BIhwzN9KbbRoZ8R0axmvf6hKEyubvQpt2SqICQ5Q2yINvBWrJeNldldYCd5fe
         tMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733808016; x=1734412816;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlYHW3DWAwkcVDdYIITwrvBRzBAcltAo2bnuyaeQFO4=;
        b=amLG4khxis6CPNwO2QMZRBSMKJVQVU5RNKdQwa8o2cxJz0M9hVm9+kadr3Sv7IYtZv
         WoHGA9lWm/hMsPYuZSELoY4fCfnw903YuN0vYbpnTXVl7t7+5OBphHtPqvXPo96p7X0a
         TBBjRWua+XXoX4Tddldm6DRPm7VMiypV9Gc4si9Pbh3OmXckK28MZ3H03FJrhtjZBGC2
         pPnmDcoZRn4pCUmC0hPHZhxzFTOM2Ew/15faMgziXCFh+cZ5JyvpRpDz9zbWCU/2VYhw
         tag2DWoXGHNXk4dOwlYmd5U4SRU6tmcWil0rK76/yG13kxu4LpcXSjy2EvQdZiSi+9My
         uAvA==
X-Gm-Message-State: AOJu0YymlTPi+xrPAh+2rqo03VM8DGQxQWIxehlo3GScbnpOe1fqQ37g
	c1cFau9EYdyni3svwIw8kBSCKk2rSDOn5xfgYZ3f/4PlSaiPkRMrxhSgI1QlGtsud0ZxcRSxdQO
	N1SpRSQx1GoWmfxJyvzLQBwYS8DpkwZJksqE=
X-Gm-Gg: ASbGncs2gw/j/QHUmQg9zAExshE6VN2LQZU1U5JmwjWOv0wCO9NhAQq/9pTEnsrleVf
	2X//zq2c4NO4jAK1nG13CuIvUZN+FsEdqQbJctLeHQGSo+PBtiIp9RGralczg/H+6yjfkJw==
X-Google-Smtp-Source: AGHT+IEmgDkAaUw2tBUwqzBz0LAAn58WeVHtMGisAGiP3mepvxGoLSbl3jTeuXUhQZY15Lg7k/QEVDD0LZVtKMaGHHQ=
X-Received: by 2002:a17:90a:e7c3:b0:2ea:9ccb:d1f4 with SMTP id
 98e67ed59e1d1-2efcef27dbcmr5399377a91.0.1733808015612; Mon, 09 Dec 2024
 21:20:15 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 9 Dec 2024 22:20:04 -0700
Message-ID: <CAK5yBb_e1ok6isj+zYyGYGu9LbPV0T7Dj-dysVvMpMXYQ8gLJA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e121930628e3a2df"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 05:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114259

--000000000000e121930628e3a2df
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
team) are therefore going to start reporting out the currently 419 unassign=
ed
or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.2=E2=80=9D, =E2=80=9C5.3", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.2" and then =E2=80=9C5.3=E2=80=9D.

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

--000000000000e121930628e3a2df
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
herefore going to start reporting out the currently 419</span><span style=
=3D"font-family:Calibri,Arial;font-size:11pt">=C2=A0unassigned or newcomer =
bugs.</span></div><div><span style=3D"font-size:11pt;font-family:Calibri,Ar=
ial"><br>We&#39;re hoping people may be able to spare some time now and aga=
in to help out with these.  Bugs are split into two types, &quot;true bugs&=
quot; where things don&#39;t work as they should and &quot;enhancements&quo=
t; which are features we&#39;d want to add to the system.  There are also r=
oughly four different &quot;priority&quot; classes right now, =E2=80=9C5.2=
=E2=80=9D, =E2=80=9C5.3&quot;, &quot;5.99&quot; and &quot;Future&quot;, the=
 more pressing/urgent issues being in &quot;5.2&quot; and then =E2=80=9C5.3=
=E2=80=9D.<br><br>Please review this link and if a bug is something you wou=
ld be able to help with either take ownership of the bug, or send me (<a hr=
ef=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an e-mai=
l with the bug number you would like and I will assign it to you (please ma=
ke sure you have a Bugzilla account).  The list is at: <a href=3D"https://w=
iki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_Bugs">h=
ttps://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer=
_Bugs</a></span></div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
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

--000000000000e121930628e3a2df--

