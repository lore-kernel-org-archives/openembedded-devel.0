Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697E1E83845
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 23:29:22 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1136.1771284556122975798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 15:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HgZhsAFb;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2baa098ffc6so2967608eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 15:29:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771284555; cv=none;
        d=google.com; s=arc-20240605;
        b=eecJqJXo3bfgxSJBVxHD0NSD1i/WZSkN2JqRnhVG1oqr1VdoXZuLsH5vE0VqlPqqXu
         TFxtnDrEe0wks+9PHNvzamNFFb8aTnjUSM2uIDHslC9PSAu2dDVGak6/Z5l4HTL3xqof
         /vn0EgKNEF2VHd9Id451OJLYGV61+ikOZuxeU0gyh2PoShKgdf+jFACEgYBkmas2qoSm
         218cveGTrj0fmqGTxgm1XILtsdQncY0k6qlK8QpqRHvURoPc5wOrB7+43eXEE5qBytA2
         X9YuhHoLAkLvMFdJ5Mpp4aOuGOtKhVrRMAB5ZYo2R1q91Tom20zPEWOymaJSj55P7GU4
         lYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vRsWPS/Szd/kUmkCf5YK+v5RdEgT9dh0VJWaC67QGKM=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=I3yd2imCuYtshi5e/ZydLsp8j87kda4T6moFlSq25MMqIWEU8dx0zH2LZNV8K00Xsi
         P1C3MM3B3MpofGHxfj5SUIILoe4Kn1jBrduioEtuGvTQVo465vkqG8hWvVz6UOhw2ogJ
         iw65kqOr21NYre3cI3c9G7qdvPWA23v9E/ZA7xGHb3N9LxSGApG+ZnAOXJ5PozmEnjrD
         OyLqjyNamO1Xe0Bfb+v18PicDmZW7kDr5WpE09fajEMxf9i8Kqg50sTPxcj4YPuxwv/Z
         eSGXIYICl7Qxv36GGYD0rT4E0qduuAAB4fpu3Dt/9S9BYDiJ2JQB755tVPuRFnDMxBIn
         XCjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771284555; x=1771889355; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vRsWPS/Szd/kUmkCf5YK+v5RdEgT9dh0VJWaC67QGKM=;
        b=HgZhsAFbNsncdaguCASE89/uBQEKAm3HJr+yk8vIswb8XfmYmriX/JPWddDYg1TH2/
         7RvUV2yCwbgQfceH9IaqfdaW69s4Uprg8Bmnj1Ehb6JDxxXOwnR9iH6np+1J8fxIqRAv
         7o0OLN0mMVmLLztmcXexLAPDl4gUWYAeXpvsRyhSCxxJv/SNg8Bw+Aj4TKK4tmVZ7yhk
         owuP5zAl7Rt4iey1zWFRIYCBujTsPjFWfnJwKRmdLCpHa3IB8VQq6GoCZQDxHAnFM0P6
         Y+Y4abUmCmCOSPqj/IsEly058CPB67+ZtR2wc0Nr0KMgCAhgCTyRrUSxscQ9cBrpVg5h
         QZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771284555; x=1771889355;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRsWPS/Szd/kUmkCf5YK+v5RdEgT9dh0VJWaC67QGKM=;
        b=Qjw2t9rg8jZJPCFAJpV15UYX7fGvjTHbhuW51BGr9brJRPL6m9ShhB1dsPhzaoE6tA
         fM99Q4RQfinO+MdDQAP34VWlJb3Tgv3oK1Uad0MC3S/2NCQNWAFSBzh6mVFF9DzHKTvH
         9VGh4qzv1M4mR8AW2GCBRyxr8Gt4E55lcpwNeESJJQFXJMeMaPcQv7QJrwvR5oe9HzaB
         Mj7MFiJ4N8wQmw8wQ7yWWIyJ9QWINCvkcnhxTyCQeYcn5S4MQlBthCNJVOA4D1QraVJA
         vMWBm3jTEMMGBSyCL+kFHMkeSMOIbAhczFGNtmV2wjdhl5C9INosRwgGbxAs5VAv6j0P
         SLhw==
X-Gm-Message-State: AOJu0Yykm3SPu1FG2lqqUIUV19f2VRAu+xydyHOb8pHSG1o+zUiHn4BS
	BPCczniL8BgT7uAfutcgrqf60rM/rJH0taOSfmbbpTiBV5gTPxBGOug5WtJJRPXgjcoegF9avNI
	7hlS2ISfZ7YmT7INEALhIsSeWDU8wmMlOwhlF
X-Gm-Gg: AZuq6aK7keyc4dVGEEW9GdkbwGhD0bqyd4Xs4V57Zi7pFL98Pm/lmwJDwn629r93MOL
	MZprzy1DM8l5gwAOaRasQsYKrnQ1x7YskU/dGs65VVFW9NLS7Am5aN255en8PK5f9fAfP5jInJZ
	yWUONxfpjJDrW40aDzKfmyBzQ5U8RK/Tp00wINVdaSSfk4vHtsIe5J9jJIf+eZBa6bcirhc/2ft
	m/9dHpykdT+Nlsr2N1spAlfcsCVw9dGCtZMrvU2AMNAIWypTzUDhy/9KpMltmbX9z0/+NFjOR25
	gLw/foM2N0482hxyb0AUunjdSQuFxlvFnDKCSjfgFAC7dXqMNl/wCsVnXZdh5oW4FytgLRTBTE5
	KUZIl
X-Received: by 2002:a05:693c:3742:b0:2ba:7783:d1d4 with SMTP id
 5a478bee46e88-2baba010c6fmr4385803eec.8.1771284555267; Mon, 16 Feb 2026
 15:29:15 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 16 Feb 2026 20:29:03 -0300
X-Gm-Features: AaiRm50ZsU8PtxNnWuf123wrKdjl0yhYThF90rjKNhtoAAp0mtZ8ds6WlauiBZs
Message-ID: <CAK5yBb8VLJBkxTY6x0ypsSxZVALHT=kOwSH+cKc5rPL64cLYzA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b682ce064af952e6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 23:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124432

--000000000000b682ce064af952e6
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
team) are therefore going to start reporting out the currently 462
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

--000000000000b682ce064af952e6
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
herefore going to start reporting out the currently 462 unassigned or newco=
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

--000000000000b682ce064af952e6--

